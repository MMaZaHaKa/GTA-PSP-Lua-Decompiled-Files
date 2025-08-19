require "gta"
require "mainloop"
require "spawn"
require "PowerUps"
require "Pickups"
require "CutscenePlayer"

SixtySeconds = StateMachine{"StateInit"}
SS_ServerLogic = Script{}
SS_MessageDisplay = Script{}
PowerUpTimer = PowerupTimer()
hornDebounce = false
testSpawnPoint = 1
NumCarsInList = 2
CarsToCollect = {car.esperanto, car.stinger, car.banshee}
EVENTMASK_NONE = 16777215
EVENTMASK_TYPE = 255 * 256 * 256
EVENTMASK_PARAM1 = 255 * 256
EVENTMASK_PARAM2 = 255
EVENTSHIFT_TYPE = 16
EVENTSHIFT_PARAM1 = 8
EVENTSHIFT_PARAM2 = 0
EVENT_ASSIGNED_GARAGE = 1
EVENT_CLIENT_HAS_COLLECTED_CAR = 2
EVENT_GAME_FINISHED = 3
EVENT_UNASSIGNED_GARAGE = 4
EVENT_GARAGE_STATE_CHANGE = 5
EVENT_HIDE_GARAGE = 6
EVENT_SHOW_GARAGE = 7

function SixtySeconds:StateInit()
    while not IsServer() and PlayerId() == 0 do 
        Wait(100)
    end
    self:InitGameData()
    local players = AllPlayers()
    local connected_players = table.getn(players)
    local iterations = 0
    while connected_players ~= GetExpectedNumberOfPlayers() and (iterations < 20) do
        print(
            "60 Seconds is sat on its ass waiting for " ..
            GetExpectedNumberOfPlayers() ..
            " players, at the minute is has " ..
            connected_players .. " players"
        )
        players = AllPlayers()
        connected_players = table.getn(players)
        Wait(500)
        iterations = iterations + 1
    end
    
    GenerateAmbients(false)
    print("Creating pickup manager")
    self.mypickups = PickupMgr()
    self.mypickups:CreatePickups()
    self.carsCaptured = 0
    self.carsDestroyed = 0
    self.carsToBeDeleted = {}
    print("Done creating pickup manager")
    local player = Player()
    local players = AllPlayers()
    self.Garages = {}
    self.GarageState = {}

    for i = 1, table.getn(self.GarageSpawnPoints), 1 do
        print("Creating Garage " .. i)
        self.Garages[i] = CreateGarage(self.GarageSpawnPoints[i][1], self.GarageSpawnPoints[i][2])
        print("self.Garages[" .. i .. "] = " .. self.Garages[i])
        self.GarageState[i] = 1
    end

    UseSuperBrakeOnPause(false)
    
    if IsServer() then
        self:CreateServerObjects()
        print("Got out of create server objects.")
    end
    if nil == 10 then
        print("WASASASASA2!")
    end
    self.MyGarage = nil
    self.MyGarageBlip = nil
    self.gameFinished = false
    self.lastCarHealth = 0
    self.totalCarsCollected = 0
    self.playerscores = {}
    self.carsCollected = {}
    self.targetWasInGarage = false
    self.wasDrivingCar = false

    if IsServer() then
        print("Strarting server logic")  -- Spelling is hard
        self.SS_ServerLogic = SS_ServerLogic()
        self.SS_ServerLogic:Start()
        if UsePowerups() then
            PowerUpTimer:Start()
            if DoesPowerupExist() < 2 then
                print("Respawning a power up at change sides")
                PowerUpTimer:CreateAPowerUp()
            end
            if DoesPowerupExist() < 2 then
                print("Respawning another power up at change sides")
                PowerUpTimer:CreateAPowerUp()
            end
        end
    end

    for _, player in pairs(players) do
        player:SetRadarBlipShortRange(true)
    end

    print("***** ID: " .. PlayerId() .. " Spawn: " .. InitialSpawnPoint(PlayerId()))
    self:DoSpawn(InitialSpawnPoint(PlayerId()))
    RenderHudExtras(false)
    if not NoFuckingCutscene() then
        main.scores:Hide(true)
        Wait(0)
        while SyncCutScene() == false do
            Wait(5)
        end
        RunScriptedCutscene()
        Wait(0)
        while ProcessScriptedCutscene() do
            Wait(0)
        end
        main.scores:Hide(false)
    else
        Wait(20)
        ClearSplashScreen()
    end

    GenerateAmbients(true)
    RenderHudExtras(true)
    UpdateGameTime(true)
    self.MessageDisplayQueue = {}
    self.SS_MessageDisplay = SS_MessageDisplay()
    self.SS_MessageDisplay:Start()
    print("printing Now Get Cars message")
    self:DisplayMessage("^T^MPWLNGC", 2000)

    return "StateRunning"
end

function SS_ServerLogic:Run()
    while 1 do
        main.game:DoServerLogic()
        main.game:UpdateRadar()
        Wait(10)
    end
end

function SixtySeconds:StateRunning()
    local player = Player()
    RenderHudExtras(false)
    if self.gameFinished then
        self.state = "StateGameWon"
    end
    RenderHudExtras(true)
    if not player:IsPlaying() then
        if self.MyGarage then
            SetPlayersVehicleForGarage(self.Garages[self.MyGarage])
            self.MyGarage = nil
        end
        DoWasted()
        self:DoSpawn()
    end

    if IsPlayerPressingHorn(player) then
        if not hornDebounce then
            print("Horntest on")
        end
    end

    if not IsPlayerPressingHorn(player) then
        hornDebounce = false
    end

    self:DoClientLogic()
    collectgarbage()
end

function SixtySeconds:CleanUp()
    if self.SS_ServerLogic then
        self.SS_ServerLogic:Stop()
    end
    self.mytimer:Stop()
    self.mypickups:Cleanup()
    RestoreCamera(0, newplayer)
    collectgarbage()
    RenderHudExtras(false)
end

function SixtySeconds:DoServerLogic()
    for i, target in ipairs(self.targetCars) do
        if VehicleIsDrivenByPlayer(target.Vehicle) and VehicleIsDrivenByPlayer(target.Vehicle) ~= target.HasDriver then
            print("Target car " .. i .. " now has a driver " .. VehicleGetDriverPlayerId(target.Vehicle))
            SetRadarBlipColour(target.OwnBlip, VehicleGetDriverPlayerColour(target.Vehicle))
            if VehicleIsDrivenByPlayer(target.Vehicle) then
                target.HasDriver = true
                if VehicleGetDriverPlayerId(target.Vehicle) ~= target.LastDriver then
                    if target.HasGarageAssigned then
                        target.HasGarageAssigned = false
                        if target.LastDriver ~= -1 then
                            self:DoSendEvent(EVENT_UNASSIGNED_GARAGE, target.LastDriver, target.Garage)
                        end
                    end
                    if target.LastDriver ~= -1 then
                        Player(target.LastDriver):SetRadarBlipVisibleState(true)
                        SetBlipVisibleForPlayerState(target.OwnBlip, target.LastDriver, true)
                    end
                    target.LastDriver = VehicleGetDriverPlayerId(target.Vehicle)
                    if target.LastDriver ~= -1 then
                        Player(target.LastDriver):SetRadarBlipVisibleState(false)
                        SetBlipVisibleForPlayerState(target.OwnBlip, target.LastDriver, false)
                    end
                    
                    local is_found = false
                    local iterations = 0
                    while not is_found do
                        local garage_index = math.random(1, table.getn(self.GarageSpawnPoints))
                        local is_used = false
                        print("Random garage " .. garage_index .. " being checked")
                        for _, target in pairs(self.targetCars) do
                            print("Cars garage " .. target.Garage .. "\n")
                            if garage_index == target.Garage then
                                print("garage is in use.")
                                is_used = true
                            end
                        end
                        if not is_used or 10 < iterations then
                            target.Garage = garage_index
                            is_found = true
                        end
                        iterations = iterations + 1
                    end
                    
                    if target.GarageBlip then
                        RemoveBlip(target.GarageBlip)
                    end
                    target.HasGarageAssigned = true
                    self:DoSendEvent(EVENT_ASSIGNED_GARAGE, target.LastDriver, target.Garage)
                else
                    if target.LastDriver ~= -1 then
                        Player(target.LastDriver):SetRadarBlipVisibleState(false)
                    end
                    target.HasGarageAssigned = true
                    self:DoSendEvent(EVENT_SHOW_GARAGE, target.LastDriver, target.Garage)
                end
            else
                print("Got to weird if point.")
                target.HasDriver = false
                print("Sending unassign garage message")
                target.HasGarageAssigned = false
                target.Garage = -1
                if target.LastDriver ~= -1 then
                    self:DoSendEvent(EVENT_UNASSIGNED_GARAGE, target.LastDriver, target.Garage)
                end
                if target.LastDriver ~= -1 then
                    Player(target.LastDriver):SetRadarBlipVisibleState(true)
                    SetBlipVisibleForPlayerState(target.OwnBlip, target.LastDriver, true)
                end
                target.LastDriver = -1
            end
        elseif not VehicleIsDrivenByPlayer(target.Vehicle) then
            if target.HasDriver then
                SetRadarBlipColour(target.OwnBlip, 3)
                target.HasDriver = false
                print("Sending hide garage message")
                if target.LastDriver ~= -1 then
                    Player(target.LastDriver):SetRadarBlipVisibleState(true)
                    SetBlipVisibleForPlayerState(target.OwnBlip, target.LastDriver, true)
                end
                self:DoSendEvent(EVENT_HIDE_GARAGE, target.LastDriver, target.Garage)
            end
        end

        if VehicleHealth(target.Vehicle) then
            if VehicleHealth(target.Vehicle) <= 0 or IsVehicleWrecked(target.Vehicle) then
                print("culling car")
                if target.LastDriver ~= -1 then
                    Player(target.LastDriver):SetRadarBlipVisibleState(true)
                    SetBlipVisibleForPlayerState(target.OwnBlip, target.LastDriver, true)
                    print("sending unassign garage message with params " .. target.LastDriver .. target.Garage)
                    self:DoSendEvent(EVENT_UNASSIGNED_GARAGE, target.LastDriver, target.Garage)
                end
                table.insert(self.carsToBeDeleted, target.Vehicle)
                print("Create Car in health cull")
                self:CreateTargetCar(i)
                self.carsDestroyed = self.carsDestroyed + 1
            end
        end
    end
    for i, car in ipairs(self.carsToBeDeleted) do
        if not VehicleIsDrivenByPlayer(car) then
            print("Deleting a car!")
            DeleteVehicle(car)
            table.remove(self.carsToBeDeleted, i)
        end
    end
end

function SixtySeconds:DoClientLogic()
    self:ProcessEvents()
    local player = Player()
    if self.MyGarage then
        if HasGarageAcceptedVehicle(self.Garages[self.MyGarage]) then
            print("Car accepted by garage (local)")
            RemoveBlip(self.MyGarageBlip)
            self.MyGarageBlip = nil
            self.MyGarage = nil
            self:DoSendEvent(EVENT_CLIENT_HAS_COLLECTED_CAR, PlayerId(), self.lastCarHealth / 10)
        end
        
        if DoesGarageContainSSVehicle(self.Garages[self.MyGarage]) then
            if not self.targetWasInGarage then
                self:DisplayMessage("^T^MPWLGOC", 2000)
            end
            self.targetWasInGarage = true
        else
            self.targetWasInGarage = false
        end

        if self.targetWasInGarage then
            if self.wasDrivingCar then
                if not player:Car() then
                    self:DisplayMessage("^T^MPWLLTC", 2000)
                end
            end
        end
    end

    for i, garage in ipairs(self.Garages) do
        if self.GarageState[i] ~= GetGarageState(garage) and IsSSGarageStateChanging(garage) then
            self.GarageState[i] = GetGarageState(garage)
            self:DoSendEvent(EVENT_GARAGE_STATE_CHANGE, i, self.GarageState[i])
        else
            self.GarageState[i] = GetGarageState(garage)
        end
    end

    if player:Car() then
        self.wasDrivingCar = true
        local car = player:Car()
        self.lastCarHealth = VehicleHealth(car)
    else
        self.wasDrivingCar = false
    end
end

function SixtySeconds:ProcessEvents()
    local event_code = -1
    while not IsEventStackEmpty() do
        event_code = GetEvent()
        print("Got event code " .. event_code)
        local ev_type = MaskEventNumber(event_code, EVENTMASK_TYPE, -EVENTSHIFT_TYPE)
        local ev_param1 = MaskEventNumber(event_code, EVENTMASK_PARAM1, -EVENTSHIFT_PARAM1)
        local ev_param2 = MaskEventNumber(event_code, EVENTMASK_PARAM2, -EVENTSHIFT_PARAM2)
        print("Receiving Event " .. ev_type .. " " .. ev_param1 .. " " .. ev_param2)
        local events = {
            [EVENT_ASSIGNED_GARAGE]=self.HandleAssignedGarage,
            [EVENT_CLIENT_HAS_COLLECTED_CAR]=self.HandleClientHasCollectedCar,
            [EVENT_GAME_FINISHED]=self.HandleEventGameFinished,
            [EVENT_UNASSIGNED_GARAGE]=self.HandleUnassignedGarage,
            [EVENT_GARAGE_STATE_CHANGE]=self.HandleGarageStateChange,
            [EVENT_HIDE_GARAGE]=self.HandleHideGarage,
            [EVENT_SHOW_GARAGE]=self.HandleShowGarage
        }
        events[ev_type](self, ev_param1, ev_param2)
    end
end

function SixtySeconds:HandleAssignedGarage(player_id, garage_id)
    local player = Player()
    if player_id == player:PlayerNum() then
        print("I have been assigned a garage of id " .. garage_id)
        if self.MyGarageBlip then
            RemoveBlip(self.MyGarageBlip)
        end
        self.MyGarageBlip = AddBlipForCoord(player, self.GarageSpawnPoints[garage_id][1], 4, pickupicon.carlockup)
        self.MyGarage = garage_id
        SetPlayersVehicleForGarage(self.Garages[self.MyGarage])
        self:DisplayMessage("^T^MPWLDTC", 2000)
    end
    self:Commentate("^S^" .. Player(player_id):Name() .. " ^T^MPWLPAC")
end

function SixtySeconds:HandleUnassignedGarage(player_id, garage_id)
    local player = Player()
    if player_id == player:PlayerNum() then
        if garage_id == self.MyGarage then
            print("I have been unassigned my garage")
            if self.MyGarageBlip then
                RemoveBlip(self.MyGarageBlip)
                self.MyGarageBlip = nil
            end

            if self.MyGarage then
                SetPlayersVehicleForGarage(self.Garages[self.MyGarage])
                self.MyGarage = nil
            end
        end
    end
end

function SixtySeconds:HandleHideGarage(player_id, unused_arg)
    local player = Player()
    if player_id == player:PlayerNum() then
        if self.MyGarageBlip then
            RemoveBlip(self.MyGarageBlip)
            self.MyGarageBlip = nil
        end
    end
end

function SixtySeconds:HandleShowGarage(player_id, garage_id)
    local player = Player()
    if player_id == player:PlayerNum() then
        if self.MyGarageBlip then
            RemoveBlip(self.MyGarageBlip)
        end

        if self.MyGarageBlip == nil and garage_id ~= 0 then
            self.MyGarageBlip = AddBlipForCoord(player, self.GarageSpawnPoints[garage_id][1], 4, pickupicon.carlockup)
        end
    end
end

function SixtySeconds:HandleClientHasCollectedCar(player_id, points)
    if IsServer() then
        print("Server handling client has collected car")
        print("Pre handle carsCaptured = " .. self.carsCaptured)
        self.carsCaptured = self.carsCaptured + 1
        for i, target in ipairs(self.targetCars) do
            if target.LastDriver == player_id then
                print("Post inc cars captured = " .. self.carsCaptured)
                print("Doing server cleanup for collected car")
                RemoveBlip(target.OwnBlip)
                print("Create Target Car in HCHCC")
                self:CreateTargetCar(i)
            end
        end
    end

    local player = Player()
    if player:PlayerNum() == player_id then
        self:Commentate("^T^MPWLCD")
    else
        self:Commentate("^S^" .. Player(player_id):Name() .. " ^T^MPWLDAC")
    end
    
    local score = points * 10
    print("Incrementing score of player " .. player_id .. " by " .. points * 10)
    self.playerscores[Player(player_id)] = self:Score(Player(player_id)) + score
    self.carsCollected[Player(player_id)] = self:Cars(Player(player_id)) + 1
    
    local player = Player()
    if player_id == player:PlayerNum() then
        SetMultiplayerMissionCash(self:Score(Player(player_id)))
    end

    self.totalCarsCollected = self.totalCarsCollected + 1
    if IsServer() then
        if self:Score(Player(player_id)) >= GameScoreLimit() then
            self:DoSendEvent(EVENT_GAME_FINISHED, 0, 0)
        end
    end
end

function SixtySeconds:HandleEventGameFinished(unused_arg1, unused_arg2)
    print("Game finished event recieved")
    self.gameFinished = true
end

function SixtySeconds:HandleGarageStateChange(garage_id, new_state)
    if self.GarageState[garage_id] ~= new_state then
        self.GarageState[garage_id] = new_state
        SetGarageState(self.Garages[garage_id], new_state)
    end
end

function SixtySeconds:CreateServerObjects()
    local players = AllPlayers()
    self.targetCars = {}
    self.carsCreated = 0
    for i = 1, self:NumCarsAvailable(), 1 do
        print("Generating Car " .. i)
        self.targetCars[i] = {}
        self:CreateTargetCar(i)
    end
end

function SixtySeconds:CreateTargetCar(index)
    local players = AllPlayers()
    local car_index = math.random(1, table.getn(CarsToCollect))
    self.carsCreated = self.carsCreated + 1
    if self.carsCreated > table.getn(self.CarSpawnPoints) then
        self.carsCreated = 1
    end

    self.targetCars[index].Vehicle = CreateVehicle(
        CarsToCollect[car_index],
        self.CarSpawnPoints[self.carsCreated][1],
        self.CarSpawnPoints[self.carsCreated][2]
    )
    print(
        "Creating car number " ..
        self.carsCreated .. "at " ..
        self.CarSpawnPoints[self.carsCreated][1][1] .. " " ..
        self.CarSpawnPoints[self.carsCreated][1][2] .. " " ..
        self.CarSpawnPoints[self.carsCreated][1][3]
    )
    self.targetCars[index].LastDriver = -1
    self.targetCars[index].HasDriver = false
    self.targetCars[index].Garage = -1
    if self.targetCars[index].OwnBlip then
        RemoveBlip(self.targetCars[index].OwnBlip)
    end
    self.targetCars[index].OwnBlip = AddBlipForCoord(players, self.CarSpawnPoints[self.carsCreated][1], 3, pickupicon.car)
    self.targetCars[index].GarageBlip = nil
    self.targetCars[index].HasGarageAssigned = false
    print("Trying to add 3d marker for car " .. index)
    VehicleAdd3dMarker(self.targetCars[index].Vehicle)
end

function SixtySeconds:NumCarsAvailable()
    local players = AllPlayers()
    local number_of_players = table.getn(players)
    local result = 0
    local funcs = {}
    funcs[1] = function (unused_arg)
        result = 1
    end
    funcs[2] = function (unused_arg)
        result = 1
    end
    funcs[3] = function (unused_arg)
        result = 2
    end
    funcs[4] = function (unused_arg)
        result = 2
    end
    funcs[5] = function (unused_arg)
        result = 3
    end
    funcs[6] = function (unused_arg)
        result = 3
    end
    funcs[7] = function (unused_arg)
        result = 4
    end
    funcs[8] = function (unused_arg)
        result = 4
    end
    funcs[number_of_players]()
    return result
end

function SixtySeconds:DoSpawn(try_this_point_first)
    if not try_this_point_first then
        try_this_point_first = -1
    end
    local player = Player()
    main.vSpawnPoints = self.PlayerSpawnPoints
    DoSpawn(try_this_point_first)
end

function SixtySeconds:UpdateRadar()
    for _, target in ipairs(self.targetCars) do
        if target.OwnBlip then
            if VehiclePosition(target.Vehicle) then
                UpdateBlipCoord(target.OwnBlip, VehiclePosition(target.Vehicle))
            end
        end
    end
end

function SixtySeconds:DisplayMessage(msg, unused_arg1, unused_arg2)
    self:Commentate("^S^" .. msg)
end

function SS_MessageDisplay:CleanUp()
    print("Message Display CLEANUP")
end

function SS_MessageDisplay:Run()
    local player = Player()
    while 1 do
        if table.getn(main.game.MessageDisplayQueue) > 0 then
            local sprite = TextSprite(player, 240, 130, 1)
            print("PRINTING MESSAGE THROUGH DISPLAY QUEUE")
            local message = table.remove(main.game.MessageDisplayQueue, 1)
            sprite:Scale(0.7)
            sprite:Style(2)
            sprite:Text(message.msg)
            Wait(message.length)
            sprite:Remove()
        end
        Wait(10)
    end
end

function SixtySeconds:Score(player)
    local score = self.playerscores[player]
    if not score then
        score = 0
    end
    return score
end

function SixtySeconds:Cash(player)
    local cash = self.playerscores[player]
    if not cash then
        cash = 0
    end
    return cash
end

function SixtySeconds:Cars(player)
    local cars = self.carsCollected[player]
    if not cars then
        cars = 0
    end
    return cars
end

function SixtySeconds:StateGameWon()
    local player = Player()
    local players = AllPlayers()
    table.sort(players, function (player1, player2)
        return self:Score(player1) > self:Score(player2)
    end)

    if self:Score(players[1]) == self:Score(players[2]) then
        self.winner = nil
    else
        self.winner = players[1]
    end
    local player = Player()
    local match_result = nil
    
    if self.winner then
        if self.winner:PlayerNum() == player:PlayerNum() then
            match_result = 1
        else
            match_result = 2
        end
    else
        if self:Score(player) < self:Score(players[1]) then
            match_result = 2
        else
            match_result = 0
        end
    end

    DisplayFinalWinLoseMessage(match_result, "")
    main.scores:ToggleUpdate(false)
    main.scores:Show(true)
    Wait(12000)
    main.scores:Hide()
    main:EndGame()

    return "StateRunning"
end

function SixtySeconds:DoSendEvent(ev_type, ev_param1, ev_param2)
    print("Sending Event " .. ev_type .. " " .. ev_param1 .. " " .. ev_param2)
    local event = MaskEventNumber(ev_type, EVENTMASK_NONE, EVENTSHIFT_TYPE)     +
                  MaskEventNumber(ev_param1, EVENTMASK_NONE, EVENTSHIFT_PARAM1) +
                  MaskEventNumber(ev_param2, EVENTMASK_NONE, EVENTSHIFT_PARAM2)
    SendEvent(event)
end

function SixtySeconds:Commentate(msg)
    main.commentary:Print(msg)
end

function SixtySeconds:RegisterPlayerKill(killed, killer, is_headshot)
    if killed == killer then
        self:Commentate("^S^" .. killed:Name() .. "^S^ ^T^MPKSELF")
    elseif is_headshot then
        self:Commentate("^S^" .. killer:Name() .. "^S^ ^T^MPK^S^ " .. killed:Name() .. "^S^ ^T^MPKHEAD")
    else
        self:Commentate("^S^" .. killer:Name() .. "^S^ ^T^MPK^S^ " .. killed:Name())
    end

    if IsServer() then
        self:DoSendEvent(EVENT_UNASSIGNED_GARAGE, killed:PlayerNum(), 0)
        for _, target in ipairs(self.targetCars) do
            if target.LastDriver == killed:PlayerNum() then
                print("Removing car garage assignment due to player death")
                target.HasDriver = false
                target.HasGarageAssigned = false
                target.Garage = -1
                target.LastDriver = -1
            end
        end
    end
end

function SixtySeconds:InitGameData()
    GameElapsedMs(0)
    if GameLocation() == 0 then
        self.CarSpawnPoints = {
            {{878.988, -810.9239, 13.9327}, 87.7955},
            {{1201.2374, -796.6064, 13.627}, 318.0812},
            {{1052.9984, -1039.5879, 13.9009}, 72.1745},
            {{1171.3418, -663.0435, 17.8591}, 180.0322},
            {{1160.8433, -448.7596, 21.4234}, 101.5482},
            {{1176.2535, -95.7773, 6.4335}, 353.1978},
            {{1098.791, 44.1015, -1.5353}, 267.3353},
            {{930.5602, -175.236, 3.7986}, 184.1712},
            {{883.0075, -311.7353, 7.6982}, 89.7126},
            {{868.4464, -663.5236, 13.9361}, 244.0882},
            {{1276.1166, -380.2794, 32.6859}, 101.1004},
            {{973.2164, -418.2749, 14.0285}, 181.0763}
        }
        self.GarageSpawnPoints = {
            {{1308.1614, -1153.101, 10.8202}, 270},
            {{1395.106, -890.0828, 10.7833}, 270},
            {{1313.1111, -109.3289, 15.25}, 180},
            {{885.0006, 169.6333, 2.6534}, 90},
            {{891, -988, 4}, 0},
            {{867.0037, -545.9845, 13.9327}, 90},
            {{1339.5814, -254.3652, 48.7}, 90},
            {{979.1169, -58.6563, 6.2836}, 180}
        }
        self.PlayerSpawnPoints = {
            {{1293.8296, -936.3995, 13.9326}, 9.3867},
            {{1037.981, -933.4276, 13.9326}, 307.8666},
            {{826.0873, -848.7362, 14.0352}, 340.377},
            {{1038.0424, -671.6776, 13.9326}, 195.6944},
            {{1203.441, -512.1193, 23.9328}, 57.2714},
            {{843.8878, -507.8421, 13.9326}, 21.4699},
            {{1133.5897, -194.7319, 13.9326}, 149.1851},
            {{1356.6787, -290.317, 48.9329}, 336.6544}
        }
    elseif GameLocation() == 1 then
        self.GarageSpawnPoints = {
            {{453.5533, -1499.5399, 17.6296}, 180},
            {{-58.4792, -1467.2493, 25.1041}, 270},
            {{-121.2447, -1169.6348, 14.8282}, 180},
            {{460.9355, -871.0115, 15.12}, 270},
            {{-58.0512, -462.6176, 15.125}, 90},
            {{178.2466, 196.3456, 10.6633}, 270},
            {{301.9552, -9.6347, 15.1777}, 270},
            {{435.2762, -376.5137, 20.0486}, 180}
        }
        self.CarSpawnPoints = {
            {{228.956, -1212.6545, 19.4197}, 180.8357},
            {{245.1146, -959.3138, 25.042}, 183.1855},
            {{283.0121, -551.8598, 30.4314}, 271.8552},
            {{184.5689, -333.0045, 15.1303}, 90.802},
            {{63.3943, -588.6461, 24.9365}, 356.0547},
            {{342.2017, -118.9139, 20.2104}, 267.2394},
            {{-32.595, -1121.1775, 25.1773}, 111.2841},
            {{527.533, -657.1049, 15.0851}, 349.9874},
            {{73.4697, -351.3455, 15.1416}, 87.4493},
            {{101.4819, -1564.4711, 22.7467}, 87.6272},
            {{259.6042, -789.9781, 26.9062}, 352.1947},
            {{111.6445, -1233.826, 25.1281}, 175.101}
        }
        self.PlayerSpawnPoints = {
            {{238.6437, -200.036, 20.3321}, 223.8856},
            {{-6.669, -397.4051, 15.1281}, 223.8856},
            {{228.513, -618.3199, 24.9751}, 244.0131},
            {{-73.0186, -807.2783, 25.1281}, 328.6864},
            {{57.5291, -952.2739, 25.1281}, 19.7356},
            {{400.3114, -1138.4528, 25.1281}, 243.2736},
            {{-146.6007, -1346.5632, 25.1281}, 238.3853},
            {{200.6563, -1411.2737, 25.1281}, 44.9046}
        }
    else
        self.GarageSpawnPoints = {
            {{-749.2634, -561.6697, 7.8245}, 180},
            {{-919.665, -204.5945, 32.8057}, 90},
            {{-1234.921, -10.4976, 58.0798}, 270},
            {{-912.0541, 305.3618, 32.7665}, 90},
            {{-459.3922, 63.0674, 2.8213}, 180},
            {{-468.7532, -201.5039, 2.8213}, 360},
            {{-718.425, 180.7856, 27.6714}, 280},
            {{-1189.0983, -203.1574, 42.9788}, 90}
        }
        self.CarSpawnPoints = {
            {{-1093.0425, -84.4261, 42.6927}, 180},
            {{-1102.4462, 155.8874, 57.7586}, 63.6874},
            {{-1000.4736, 108.2794, 13.2361}, 203.7447},
            {{-1184.2906, 69.9539, 67.6932}, 356.7323},
            {{-712.0085, 330.6576, 61.8738}, 0.2236},
            {{-584.8018, 265.1498, 61.3572}, 175.746},
            {{-656.5526, 59.7458, 17.7132}, 82.8471},
            {{-483.2016, -52.7287, 2.8213}, 180},
            {{-976.7012, 453.4439, 22.4969}, 230.6617},
            {{-736.0754, -271.7495, 17.4381}, 76.0182},
            {{-1200.0933, 523.1423, 67.5492}, 212.8388},
            {{-713.306, 264.5084, 53.029}, 182.1571}
        }
        self.PlayerSpawnPoints = {
            {{-887.7736, 159.0758, 47.8213}, 197.2778},
            {{-903.0086, 540.2868, 68.9162}, 177.2619},
            {{-758.3311, 29.6867, 2.8213}, 353.9334},
            {{-888.3676, -119.2264, 32.8212}, 353.9334},
            {{-1282.5562, -64.8545, 57.8212}, 136.8653},
            {{-992.9297, -49.1714, 37.882}, 136.8653},
            {{-292.9362, 381.1484, 77.8213}, 212.1673},
            {{-674.1395, -404.8195, 17.6713}, 225.9362}
        }
    end

    for i, sp in ipairs(self.CarSpawnPoints) do
        local spawn_point = sp
        local spawn_index = math.random(1, table.getn(self.CarSpawnPoints))
        self.CarSpawnPoints[i] = self.CarSpawnPoints[spawn_index]
        self.CarSpawnPoints[spawn_index] = spawn_point
    end
end

function Main()
    main = MainLoop{}
    main.commentary = Commentary{}:Start()
    main.scores = ScoreSheetScript{}:Start()
    InitSpawnPoints()
    local spawn_index = 0
    spawn_index = math.random(1, table.getn(main.vSpawnPoints))
    CreatePlayer(unpack(main.vSpawnPoints[spawn_index][1]))
    PlayerName(HostName())
    main.game = SixtySeconds():Start()
    main:Start()
end
