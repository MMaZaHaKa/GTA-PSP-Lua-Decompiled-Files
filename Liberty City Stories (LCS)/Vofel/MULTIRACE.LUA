require "gta"
require "mainloop"
require "spawn"
require "Pickups"

Turismo = StateMachine{"StateInit"}
RaceMessagePump = Script{}
MessageDisplay = Script{}

MSG_GOOD_RACE_POWERUP = 1
MSG_BAD_RACE_POWERUP = 2
MSG_RACE_CHECKPOINT_HIT = 3
MSG_RACE_OVER = 4
MSG_GRID_SHUFFLE_PLUS1 = 5
MSG_GRID_SHUFFLE_PLUS2 = 6
MSG_GRID_SHUFFLE_PLUS3 = 7
MSG_GRID_SHUFFLE_PLUS4 = 8
MSG_GRID_SHUFFLE_PLUS5 = 9
MSG_GRID_SHUFFLE_PLUS6 = 10
MSG_GRID_SHUFFLE_PLUS7 = 11
MSG_LAP_COMPLETED = 12
MSG_RACE_POSITION_CHANGED = 13
MSG_RACE_START = 14
MSG_REQUEST_RESPAWN = 15
MSG_RESPAWN_OK = 16
MSG_RESPAWN_DONE = 17
POSITION_HEART_BEAT_FREQUENCY = 2500
RESPOT_TIME = 20500

function Turismo:SendCheckpointHitMessage(player_id, checkpoint_number)
    local event = (3 + player_id * 64) + checkpoint_number * 512
    SendEvent(event)
end

function Turismo:SendLapCompleteMessage(player_id)
    local event = MSG_LAP_COMPLETED + player_id * 64
    SendEvent(event)
end

function Turismo:SendRacePositionChangedMessage(player_id, position)
    local event = (MSG_RACE_POSITION_CHANGED + player_id * 64) + position * 512
    SendEvent(event)
end

function Turismo:SendRaceOverMessage(player_id)
    local event = MSG_RACE_OVER + player_id * 64
    SendEvent(event)
end

function Turismo:SendOkToRespawnMessage(player_id)
    local event = MSG_RESPAWN_OK + player_id * 64
    SendEvent(event)
end

function Turismo:SendRequestRespawnMessage(player_id)
    local event = MSG_REQUEST_RESPAWN + player_id * 64
    SendEvent(event)
end

function Turismo:SendRespawnDoneMessage(player_id)
    local event = MSG_RESPAWN_DONE + player_id * 64
    SendEvent(event)
end

function RaceMessagePump:CleanUp()
    print("MESAGE PUMP CLEANUP")
end

function RaceMessagePump:Run()
    local unused_lcl1 = {10}
    local unused_lcl2 = {10}

    while 1 do
        Wait(10)
        if IsEventStackEmpty() == false then
            local event_code = GetEvent()
            local ev_type = MaskEventNumber(event_code, 63, 0)
            local ev_param1 = MaskEventNumber(event_code, 448, -6)     -- player_id
            local ev_param2 = MaskEventNumber(event_code, 130560, -9)  -- checkpoint

            if ev_type == MSG_RACE_CHECKPOINT_HIT then
                main.game:IncrementCheckpointsCompleted(ev_param1)
                if ev_param1 == PlayerId() then
                    print("SERVER TELLS ME IVE HIT CHECKPOINT " .. ev_param2)
                    main.game.myLastWaypoint = ev_param2
                    main.game:UpdateWaypointBlips()
                end
            elseif ev_type == MSG_RACE_POSITION_CHANGED then
                collectgarbage()
                if ev_param1 == nil then
                    return
                end
                main.game.allRacePositions[ev_param1 + 1] = ev_param2
                ToggleLocalPlayerControls(true)
                if ev_param1 == PlayerId() then
                    main.game.currentRacePosition = ev_param2
                end
            elseif ev_type == MSG_LAP_COMPLETED then
                main.game:IncrementCurrentLapNumber(ev_param1)
                if ev_param1 == PlayerId() then
                    print("Processing Lap Completed Msg")
                    main.game.lapNumber = main.game.lapNumber + 1
                    if main.game.lapNumber > GameScoreLimit() then
                        main.game.lapNumber = GameScoreLimit()
                    end
                end
            elseif ev_type == MSG_RACE_OVER then
                print("RACE OVER TIME TO CLOSE DOWN")
                main.game.raceWinner = ev_param1
                main.game.raceOver = true
            elseif ev_type == MSG_GRID_SHUFFLE_PLUS1 then
                main.game:SetGridShuffle(1)
                print("ShuffleMsg 1")
            elseif ev_type == MSG_GRID_SHUFFLE_PLUS2 then
                main.game:SetGridShuffle(2)
                print("ShuffleMsg 2")
            elseif ev_type == MSG_GRID_SHUFFLE_PLUS3 then
                main.game:SetGridShuffle(3)
                print("ShuffleMsg 3")
            elseif ev_type == MSG_GRID_SHUFFLE_PLUS4 then
                main.game:SetGridShuffle(4)
                print("ShuffleMsg 4")
            elseif ev_type == MSG_GRID_SHUFFLE_PLUS5 then
                main.game:SetGridShuffle(5)
                print("ShuffleMsg 5")
            elseif ev_type == MSG_GRID_SHUFFLE_PLUS6 then
                main.game:SetGridShuffle(6)
                print("ShuffleMsg 6")
            elseif ev_type == MSG_GRID_SHUFFLE_PLUS7 then
                main.game:SetGridShuffle(7)
                print("ShuffleMsg 7")
            elseif ev_type == MSG_RACE_START then
                print("MSG_RACE_START")
                main.game.raceStarted = true
                main.game:ShowHUD(true)
                GameElapsedMs(0)
                GenerateAmbients(true)
                VehicleSetEmergencyStop(GetLocalPlayersVehicle(), false)
            elseif ev_type == MSG_REQUEST_RESPAWN then
                if IsServer() then
                    local timeSinceLastRespawn = GameElapsedMs() - main.game.lastRespawnTime
                    print("timeSinceLastRespawn == " .. timeSinceLastRespawn)
                    if main.game.blockRespawn == false or 4000 < timeSinceLastRespawn then
                        main.game.blockRespawn = true
                        main.game:SendOkToRespawnMessage(ev_param1)
                        main.game.lastRespawnTime = GameElapsedMs()
                    end
                end
            elseif ev_type == MSG_RESPAWN_DONE then
                if IsServer() then
                    main.game.blockRespawn = false
                end
            elseif ev_type == MSG_RESPAWN_OK then
                if ev_param1 == PlayerId() then
                    main.game.canRespawn = true
                end
            else
                print("UNKNOWN MESSGAE IN EVENT STACK!")
                print("FULL = " .. event_code .. " X")
                print("TYPE = " .. ev_type .. " X")
                print("OWNER = " .. ev_param1 .. " X")
            end
        end
    end

    print("ELVIS HAS LEFT THE MESSAGE PUMP!")
end

function Turismo:StateInit()
    DbgPrintAllOptions()
    local players = AllPlayers()
    local connected_players = table.getn(players)
    local iterations = 0
    while connected_players ~= GetExpectedNumberOfPlayers() and (iterations < 25) do
        print(
            "Turismo is sat on its ass waiting for " ..
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
    self.canRespawn = false
    if IsServer() then
        self.blockRespawn = false
        self.lastRespawnTime = 0
    end
    self.gridShuffle = 0
    local unused_lcl = Player()
    self.currentRacePosition = PlayerId() + 1
    self.allCheckPointsCompleted = {}
    self.allCheckPointsCompleted[1] = 0
    self.allCheckPointsCompleted[2] = 0
    self.allCheckPointsCompleted[3] = 0
    self.allCheckPointsCompleted[4] = 0
    self.allCheckPointsCompleted[5] = 0
    self.allCheckPointsCompleted[6] = 0
    self.allCheckPointsCompleted[7] = 0
    self.allCheckPointsCompleted[8] = 0
    self.allCurrentLap = {}
    self.allCurrentLap[1] = 1
    self.allCurrentLap[2] = 1
    self.allCurrentLap[3] = 1
    self.allCurrentLap[4] = 1
    self.allCurrentLap[5] = 1
    self.allCurrentLap[6] = 1
    self.allCurrentLap[7] = 1
    self.allCurrentLap[8] = 1
    self.allRacePositions = {}
    self.allRacePositions[1] = 1
    self.allRacePositions[2] = 2
    self.allRacePositions[3] = 3
    self.allRacePositions[4] = 4
    self.allRacePositions[5] = 5
    self.allRacePositions[6] = 6
    self.allRacePositions[7] = 7
    self.allRacePositions[8] = 8
    self.rankhud = {}
    self.currentRankHeartBeat = GameElapsedMs()
    SetMaxAmbientCars(1)
    self.trafficNormal = false
    UseSuperBrakeOnPause(false)
    ScriptControlsMpCarLimit(true)
    self.raceStarted = false
    self.raceOver = false
    self:InitTrack()
    if RaceReverse() then
        self:ReverseRacePoints()
    end
    self.myLastWaypoint = 1
    self.mypickups = PickupMgr()
    self.mypickups:CreatePickups()
    self.scores = {}
    if IsServer() then
        self:EnableRoadsAtStartLine(true)
    end
    self.respotCounter = 0
    self.respotLastUpdate = 0
    self.respotText = nil
    GameElapsedMs(0)
    UpdateGameTime(true)
    self.lapNumber = 1
    self.blip = nil
    self.nextblip = nil
    self:UpdateWaypointBlips()
    self.isRespawning = false
    self.SplashTextIsOnScreen = false
    self.currentLapSprite = nil
    self.poshud = nil
    self.lapTitle = nil
    self.myMessagePump = RaceMessagePump()
    self.myMessagePump:Start()
    self.raceWinner = -1
    Wait(1500)
    CameraFadeOut(5)
    DoSpawn()
    self:CreatePlayerinCarAtTrackNode(1, true)
    SetVectorForSinglePlayerScript(self.track[1][1])
    RaceArrowVisible(false)

    return "StateRunning"
end

function Turismo:StateRunning()
    Wait(50)
    if IsServer() then
        self:StartTheRace()
    end
    self:CheckForRespawn()
    self:CheckForRespot()
    self:DrawHUD()
    self:SetTrafficNormal()
    if self.raceWinner ~= -1 then
        self:DisplayWinnerMsg(self.raceWinner)
    end
    collectgarbage()
end

function Turismo:CreatePlayerinCarAtTrackNode(checkpoint_number, is_race_start)
    local track = self.track
    local is_race_start = is_race_start
    local current_checkpoint = checkpoint_number
    local next_checkpoint = checkpoint_number + 1
    if next_checkpoint > table.getn(track) then
        next_checkpoint = next_checkpoint - table.getn(track)
    end
    if current_checkpoint == nil then
        current_checkpoint = 1
    end
    if next_checkpoint == nil then
        next_checkpoint = 2
    end
    local heading = nil
    local vehicle = nil
    local coordinates = {}
    local coordinates2 = {}
    if is_race_start then
        -- the following calculates starting positions in a grid
        local direction_reversed = {}
        direction_reversed[1] = track[current_checkpoint][1][1] - track[next_checkpoint][1][1]
        direction_reversed[2] = track[current_checkpoint][1][2] - track[next_checkpoint][1][2]
        direction_reversed[3] = 0
        direction_reversed = VecNormalise(direction_reversed)
        local unit_vector = {0, 0, 1}
        local left_right_direction = CrossProduct(direction_reversed, unit_vector)
        local unused_lcl = {}
        local grid_slot = self.currentRacePosition - 1
        print("Grid Slot == " .. grid_slot)
        local front_back_offset = 0
        local left_right_offset = 0
        front_back_offset = 20
        while 1 < grid_slot do
            grid_slot = grid_slot - 2
            front_back_offset = front_back_offset + 8
        end
        if grid_slot <= 0 then
            left_right_offset = -2.5
        else
            left_right_offset = 2.5
        end

        Wait(2000)

        coordinates[1] = track[current_checkpoint][1][1]             + 
                         left_right_direction[1] * left_right_offset +
                         direction_reversed[1] * front_back_offset
        coordinates[2] = track[current_checkpoint][1][2]             +
                         left_right_direction[2] * left_right_offset +
                         direction_reversed[2] * front_back_offset
        coordinates[3] = track[current_checkpoint][2]
        local ground_z = FindGroundZFor3DCoord(coordinates)
        coordinates[3] = ground_z

        -- what is this for? Just use coordinates...
        coordinates2[1] = coordinates[1]
        coordinates2[2] = coordinates[2]
        coordinates2[3] = coordinates[3]

        heading = GetAngleBetweenPoints(
            track[next_checkpoint][1][1], track[next_checkpoint][1][2],
            track[current_checkpoint][1][1], track[current_checkpoint][1][2]
        )

        print("creating vehicle at X = " .. coordinates[1] .. " Y = " .. coordinates[2] .. " Z = " .. coordinates[3])
        vehicle = CreateVehicle(RaceCar(), coordinates, heading)
        VehicleSetColours(vehicle, MapPlayerColourToCarColour(PlayerId()), MapPlayerColourToCarColour(PlayerId()))
        Wait(1)
        SetPosition(Player(PlayerId()), coordinates2)
        Wait(1)
        WarpPlayerIntoCar(PlayerId(), vehicle)
        Wait(10)
        VehicleSetEmergencyStop(GetLocalPlayersVehicle(), true)
    else
        while self.canRespawn == false do
            self:SendRequestRespawnMessage(PlayerId())
            Wait(500)
            print("Respawn Blocked, Waiting ...")
        end
        
        local is_player_in_vehicle = false
        while is_player_in_vehicle == false do
            vehicle = nil
            coordinates2 = self:GenerateCarRespawnPos(checkpoint_number)
            coordinates[1] = coordinates2[1]
            coordinates[2] = coordinates2[2]
            coordinates[3] = coordinates2[3]
            
            heading = GetAngleBetweenPoints(
                track[next_checkpoint][1][1], track[next_checkpoint][1][2],
                track[current_checkpoint][1][1], track[current_checkpoint][1][2]
            )
            
            vehicle = CreateVehicle(RaceCar(), coordinates, heading)
            VehicleSetColours(vehicle, MapPlayerColourToCarColour(PlayerId()), MapPlayerColourToCarColour(PlayerId()))
            
            local player = Player()
            print([[

Respawning at ]] .. coordinates2[1] .. " " .. coordinates2[2] .. " " .. coordinates2[3])
            player:Respawn(coordinates2)
            Wait(1)
            SetPosition(Player(PlayerId()), coordinates2)
            Wait(1)
            if WarpPlayerIntoCar(PlayerId(), vehicle) == true then
                is_player_in_vehicle = true
            end
        end

        self.canRespawn = false
        Wait(500)
        self:SendRespawnDoneMessage(PlayerId())
    end
    
    if is_race_start then
        PlayerCarControl(Player(PlayerId()), false)
        Wait(250)
        if not NoFuckingCutscene() then
            main.scores:Hide(true)
            RunScriptedCutscene()
            Wait(0)
            while ProcessScriptedCutscene() do
                Wait(0)
            end
            main.scores:Hide(false)
        else
            Wait(750)
            ClearSplashScreen()
        end
        GameElapsedMs(0)
        PlayerCarControl(Player(PlayerId()), false)
    end
    self.isRespawning = false
end

function Turismo:EnableRoadsAtStartLine(to_enable)
    local from = {}
    local to = {}
    from[1] = self.track[1][1][1] - 25
    from[2] = self.track[1][1][2] - 25
    from[3] = self.track[1][1][3] - 25
    to[1] = self.track[1][1][1] + 25
    to[2] = self.track[1][1][2] + 25
    to[3] = self.track[1][1][3] + 25
    EnableRoads(from, to, to_enable)
end

function Turismo:StartTheRace()
    local track = self.track
    local connected_players = {}
    local unused_lcl = {}
    local players = AllPlayers()
    print("Staring to add players!")

    for _, player in ipairs(players) do
        print("adding a player to the race")
        table.insert(connected_players, player)
    end

    PlayerCarControl(connected_players, false)
    RestoreCamera(0, player)
    local sprite = TextSprite(connected_players, 480 / 2, 272 / 2 - 30, 1)
    sprite:Scale(1.8)
    sprite:Style(2)
    sprite:Colour(255, 255, 255, 255)
    sprite:Text("^S^3")
    Wait(1000)
    sprite:Text("^S^2")
    Wait(1000)
    sprite:Text("^S^1")
    Wait(1000)
    PlayerCarControl(connected_players, true)
    sprite:Text("MRACEGO")
    Wait(500)
    sprite:Remove()
    SendEvent(MSG_RACE_START)
    local players_finished = 0
    local game_possibly_over = 0
    local MultiRaceClient = Script{_init={"thisplayer"}}
    
    function MultiRaceClient:Run()
        print("MULTIRACE CLIENT RUNNING")
        local player = self.thisplayer
        local lap = 0
        self.totalWaypointCounter = 0
        self.newRacePosition = 1
        self.racePosition = 1
        self.waypoint = 2
        while self.waypoint <= table.getn(track) do
            if self.waypoint == nil then
                self.waypoint = 1
            end
            local coordinates = track[self.waypoint][1]
            local arrow_z = track[self.waypoint][2]
            local next_checkpoint = self.waypoint + 1
            if next_checkpoint > table.getn(track) then
                if lap + 1 == GameScoreLimit() then
                    next_checkpoint = self.waypoint
                else
                    next_checkpoint = 1
                end
            end
            if next_checkpoint == nil then
                next_checkpoint = 1
            end
            -- used to calculate arrow rotation
            local next_coordinates = {unpack(track[next_checkpoint][1])}
            next_coordinates[3] = coordinates[3] + 7
            local radius = 10  -- trigger radius; visual radius is * (7 / 8)

            if
            self.waypoint == table.getn(track) and
            main.game:GetCurrentLapNumber(player:PlayerNum()) == GameScoreLimit() then
                self.wp = SetWaypoint(player, coordinates, next_coordinates, 10, 255, 0, 0, 128, radius * (7 / 8), arrow_z, false)
            else
                self.wp = SetWaypoint(player, coordinates, next_coordinates, radius, 255, 255, 0, 128, radius * (7 / 8), arrow_z, true)
            end
            
            while not self.wp:HasBeenHit() and PlayerCar(player) do
                Wait(10)
                if self.newRacePosition ~= self.racePosition then
                    self.racePosition = self.newRacePosition
                    main.game:SendRacePositionChangedMessage(player:PlayerNum(), self.racePosition)
                end
            end

            self.wp:Remove()
            if not PlayerCar(player) then
                while not PlayerCar(player) do
                    Wait(100)
                end
            else
                main.game:SendCheckpointHitMessage(player:PlayerNum(), self.waypoint)
                self.waypoint = self.waypoint + 1
                self.totalWaypointCounter = self.totalWaypointCounter + 1
                if self.waypoint > table.getn(track) then
                    lap = lap + 1
                    main.game:SendLapCompleteMessage(player:PlayerNum())
                    print("lap " .. lap .. " complete !")
                    if lap < GameScoreLimit() then
                        self.waypoint = 1
                    end
                end
            end
        end
        self.waypoint = 100
        players_finished = players_finished + 1
        if players_finished == 1 then
            main.game:SendRaceOverMessage(player:PlayerNum())
        end
    end

    function MultiRaceClient:CleanUp()
        print("MultiRaceClient:CleanUp")
        if self.wp then
            self.wp:Remove()
        end
        RemoveWaypoint(self.thisplayer)
    end

    local clients = {}
    for key, player in pairs(connected_players) do
        print("STARTING CLIENT " .. key)
        if player ~= nil then
            clients[player] = MultiRaceClient{player}:Start()
        end
    end
    
    local is_finished = false
    while not is_finished do
        Wait(50)
        for index, player in ipairs(connected_players) do
            if not IsConnected(player) or IsDead(player) then
                if player ~= nil then
                    clients[player]:Stop()
                end
                if index == nil then
                    index = 1
                end
                main.game.allRacePositions[index] = 9999
                table.remove(connected_players, index)
                break
            end
        end
        
        local players = connected_players        
        table.sort(players, function (player1, player2)
            if not IsConnected(player1) or player1 == nil then
                return false
            end
            if not IsConnected(player2) or player2 == nil then
                return true
            end
            
            local player1_checkpoints = clients[player1].totalWaypointCounter
            local player2_checkpoints = clients[player2].totalWaypointCounter
            if player1_checkpoints ~= player2_checkpoints then
                return player1_checkpoints > player2_checkpoints
            end
            
            local player1_waypoint = clients[player1].waypoint
            local player2_waypoint = clients[player2].waypoint
            if player1_waypoint ~= player2_waypoint or player1_waypoint == 100 or player1_waypoint == -1 then
                return player1_waypoint > player2_waypoint
            end
            
            if player1_waypoint ~= nil then
                local coordinates = track[player1_waypoint][1]
                return Distance(PlayerPosition(player1), coordinates) < Distance(PlayerPosition(player2), coordinates)
            end
        end)
        
        local is_time_to_sync = false
        if GameElapsedMs() - self.currentRankHeartBeat >= POSITION_HEART_BEAT_FREQUENCY then
            self.currentRankHeartBeat = GameElapsedMs()
            is_time_to_sync = true
        end

        for index, player in ipairs(players) do
            if player ~= nil then
                clients[player].newRacePosition = index
                if is_time_to_sync == true then
                    main.game:SendRacePositionChangedMessage(player:PlayerNum(), index)
                end
            end
        end

        local number_of_players = table.getn(connected_players)
        if self.raceWinner ~= -1 then
            self:DisplayWinnerMsg(self.raceWinner)
            game_possibly_over = 1
        end
        if 1 <= game_possibly_over then
            if players_finished >= math.min(1, number_of_players) then
                print("race finished")
                is_finished = true
            end
        end

        self:CheckForRespawn()
        self:CheckForRespot()
        self:DrawHUD()
        self:SetTrafficNormal()
    end

    for _, player in pairs(connected_players) do
        if player ~= nil then
            clients[player]:Stop()
            if clients[player].waypoint ~= 100 then
                if table.getn(connected_players) < 2 then
                    print("disqual")
                else
                    print("retired")
                end
            end
        end
    end
    
    while true do
        Wait(0)
    end
    
    return
end

function Turismo:RegisterPlayerKill(killed, killer, is_headshot)
    print("REGISTER PLAYER KILL: " .. killed:Name() .. " killed " .. killer:Name())
    local killer_name = killer:Name()
    local killed_name = killed:Name()
    if killed == killer then
        self:Commentate("^S^" .. killed_name .. "^S^ ^T^MPKSELF")
    elseif is_headshot then
        self:Commentate("^S^" .. killer_name .. "^S^ ^T^MPK^S^ " .. killed_name .. "^S^ ^T^MPKHEAD")
        self.headshots = self.headshots + 1
    else
        self:Commentate("^S^" .. killer_name .. "^S^ ^T^MPK^S^ " .. killed_name)
    end
end

function Turismo:SetTrafficNormal()
    if self.trafficNormal == false and self.raceStarted == true and GameElapsedMs() > 10000 then
        self.trafficNormal = true
        GenerateAmbients(true)
        if IsServer() then
            print("Enabling Road Nodes")
            self:EnableRoadsAtStartLine(false)
        end
    elseif self.trafficNormal == true then
        if self:AmILeadingTheRace() == true then
            SetMaxAmbientCars(6)
        else
            SetMaxAmbientCars(3)
        end
    end
end

function Turismo:CheckForRespawn()
    if self.myLastWaypoint == nil then
        return
    end
    local player = Player()
    local unused_lcl = self.track[self.myLastWaypoint][1]

    if self.respotText ~= nil then
        self.respotText:Remove()
        self.respotText = nil
    end

    if not player:IsPlaying() then
        self.isRespawning = true
        Wait(600)
        CameraFadeOut(3)
        Wait(200)
        self:CreatePlayerinCarAtTrackNode(self.myLastWaypoint, false)
        Wait(200)
        CameraFadeIn(3)
    end
end

function Turismo:CleanUp()
    print("turismo cleanup")
    self:ShowHUD(false)
    collectgarbage()
    self.myMessagePump:Stop()
    RestoreCamera(0, newplayer)
    self.mypickups:CleanUp()
end

function Turismo:Commentate(msg)
    main.commentary:Print(msg)
end

function Turismo:ReverseRacePoints()
    print("reversing the track")
    local track = table.clone(self.track)
    local number_of_checkpoints = table.getn(self.track)
    if number_of_checkpoints == nil then
        return
    end

    self.track[1] = track[1]
    for i = 2, number_of_checkpoints do
        self.track[i] = track[number_of_checkpoints - i + 2]
    end
end

function Turismo:CheckForRespot()
    if IsLocalPlayerInVehicle() == true or IsLocalPlayerEnteringAVehicle() == true then
        self.respotCounter = 0
        if self.respotText ~= nil then
            self.respotText:Remove()
            self.respotText = nil
        end
    else
        self.respotCounter = self.respotCounter + (GameElapsedMs() - self.respotLastUpdate)
        if main.game:GetTimeBeforeRespot() <= 1 then
            collectgarbage()
            self:CreatePlayerinCarAtTrackNode(self.myLastWaypoint, false)
            if self.respotText then
                self.respotText:Remove()
                self.respotText = nil
            end
        else
            if self.respotText == nil then
                if ShowRadar() then
                    self.respotText = TextSprite(Player(), 240 + 50, 210, 1)
                else
                    self.respotText = TextSprite(Player(), 240, 210, 1)
                end
                self.respotText:Scale(0.4)
                self.respotText:Style(1)
                self.respotText:Colour({0, 106, 164, 255})
            end
            local msg = "^S^ "
            if main.game:GetTimeBeforeRespot() < 2 then
                msg = "^T^MRACE12^S^ 1 ^T^MRACE14"
            else
                msg = string.format("%.0d", main.game:GetTimeBeforeRespot())
                msg = "^T^MRACE12^S^ " .. msg .. "^S^ ^T^MRACE13"
            end
            self.respotText:Text("^S^" .. msg)
        end
    end
    self.respotLastUpdate = GameElapsedMs()
end

function Turismo:GetTimeBeforeRespot()
    return (RESPOT_TIME - self.respotCounter) / 1000
end

function Turismo:SetGridShuffle(shuffle)
    self.gridShuffle = shuffle
    if self.gridShuffle == nil then
        self.gridShuffle = 0
    end
    self.currentRacePosition = self.currentRacePosition + shuffle

    local players = AllPlayers()
    local number_of_players = table.getn(players)
    print("Num Players == " .. number_of_players)
    if number_of_players < self.currentRacePosition then
        self.currentRacePosition = self.currentRacePosition - number_of_players
    end

    local unused_lcl = 0
    for i = 1, number_of_players do
        if i == nil then
            i = 1
        end
        self.allRacePositions[i] = self.allRacePositions[i] + shuffle
        if number_of_players < self.allRacePositions[i] then
            self.allRacePositions[i] = self.allRacePositions[i] - number_of_players
        end
    end

    print("Grid Shuffle ==" .. self.gridShuffle)
end

function Turismo:ShowHUD(to_show)
    local player = Player()
    if to_show == true then
        if self.currentLapSprite == nil and self.poshud == nil and self.lapTitle == nil then
            self.currentLapSprite = TextSprite(player, 470, 110, 2)
            self.currentLapSprite:Scale(0.4048)
            self.currentLapSprite:Style(1)
            self.currentLapSprite:Colour(255, 255, 255, 255)
            self.currentLapSprite:Text("^S^    ")
            self.currentLapSprite:Align(2)
            self.lapTitle = TextSprite(player, 440, 110, 2)
            self.lapTitle:Scale(0.4048)
            self.lapTitle:Style(1)
            self.lapTitle:Colour(255, 255, 255, 255)
            self.lapTitle:Text("^S^      ")
            self.lapTitle:Align(2)
            self.poshud = TextSprite(player, 470, 92, 2)
            self.poshud:Scale(0.4048)
            self.poshud:Style(1)
            self.poshud:Colour(255, 255, 255, 255)
            self.poshud:Text("^S^     ")
            self.poshud:Align(2)
            local unused_lcl1 = AllPlayers()
            local unused_lcl2 = nil
            for i = 1, 6, 1 do
                local y = 130 + 14 * (i - 1)
                self.rankhud[i] = TextSprite(Player(), 470, y, 0)
                self.rankhud[i]:Style(1)
                self.rankhud[i]:Scale(0.32)
                self.rankhud[i]:Align(2)
                self.rankhud[i]:Pos(470, y, 0.1)
                self.rankhud[i]:Text("^S^")
            end
        end
    else
        if self.currentLapSprite ~= nil and self.poshud ~= nil and self.lapTitle ~= nil then
            self.currentLapSprite:Remove()
            self.poshud:Remove()
            self.lapTitle:Remove()
            self.currentLapSprite = nil
            self.poshud = nil
            self.lapTitle = nil
            local unused_lcl1 = AllPlayers()
            local unused_lcl2 = nil
            for i = 1, 6, 1 do
                self.rankhud[i]:Remove()
            end
        end
    end
end

function Turismo:UpdateWaypointBlips()
    if self.blip ~= nil then
        RemoveLocalRadarBlip(self.blip)
        self.blip = nil
    end
    if self.nextblip ~= nil then
        RemoveLocalRadarBlip(self.nextblip)
        self.nextblip = nil
    end

    local player = Player()
    local create_blip = true
    if self:GetCurrentLapNumber(player:PlayerNum()) > GameScoreLimit() then
        create_blip = false
        RaceArrowVisible(false)
    end

    if create_blip == true then
        local next_checkpoint = self:GetCheckpointsCompletedThisLap(PlayerId()) + 2
        if next_checkpoint > self:GetNumberOfCheckpointsInLap() then
            next_checkpoint = next_checkpoint - self:GetNumberOfCheckpointsInLap()
        end
        if next_checkpoint == nil then
            next_checkpoint = 1
        end
        if next_checkpoint <= 0 then
            next_checkpoint = 1
        end
        local coordinates = {}
        coordinates[1] = self.track[next_checkpoint][1][1]
        coordinates[2] = self.track[next_checkpoint][1][2]
        coordinates[3] = self.track[next_checkpoint][1][3]

        local coordinates2 = {}
        coordinates2[1] = coordinates[1]
        coordinates2[2] = coordinates[2]
        coordinates2[3] = coordinates[3] + 1000
        self.blip = AddLocalBlipForCoord(coordinates2, 4, pickupicon.checkpoint)
        if
        self:GetCurrentLapNumber(player:PlayerNum()) > GameScoreLimit() or
        (self:GetCurrentLapNumber(player:PlayerNum()) == GameScoreLimit() and
         self.myLastWaypoint == self:GetNumberOfCheckpointsInLap() - 1) then
            create_blip = false
        end
        if create_blip == true then
            if next_checkpoint < table.getn(self.track) then
                coordinates2[1] = self.track[next_checkpoint + 1][1][1]
                coordinates2[2] = self.track[next_checkpoint + 1][1][2]
                coordinates2[3] = self.track[next_checkpoint + 1][1][3] + 1000
            else
                coordinates2[1] = self.track[1][1][1]
                coordinates2[2] = self.track[1][1][2]
                coordinates2[3] = self.track[1][1][3] + 1000
            end
            self.nextblip = AddLocalBlipForCoord(coordinates2, 1, pickupicon.checkpoint)
        end
    end
end

function Turismo:DrawHUD()
    if self.currentLapSprite ~= nil and self.poshud ~= nil and self.lapTitle ~= nil then
        self.currentLapSprite:Text("^s^" .. self.lapNumber .. "/" .. GameScoreLimit())
        local position_text = nil
        if self.currentRacePosition == 1 then
            position_text = "^T^RACEP1"
        elseif self.currentRacePosition == 2 then
            position_text = "^T^RACEP2"
        elseif self.currentRacePosition == 3 then
            position_text = "^T^RACEP3"
        elseif self.currentRacePosition == 4 then
            position_text = "^T^RACEP4"
        elseif self.currentRacePosition == 5 then
            position_text = "^T^RACEP5"
        elseif self.currentRacePosition == 6 then
            position_text = "^T^RACEP6"
        end

        self.poshud:Text(position_text)
        self.lapTitle:Text("^t^MRACELA")
        local players = AllPlayers()
        local unused_lcl1 = 0
        local unused_lcl2 = nil
        local unused_lcl3 = table.getn(players)
        for i = 1, 6, 1 do
            if self.rankhud[i] ~= nil then
                self.rankhud[i]:Text("^S^")
            end

            for _, player in ipairs(players) do
                if player ~= nil then
                    if self.allRacePositions[player:PlayerNum() + 1] == i then
                        if self.rankhud[i] ~= nil then
                            self.rankhud[i]:Colour(player:Colour())
                            self.rankhud[i]:Text(
                                "^S^" .. player:Name() .. "  " .. self.allRacePositions[player:PlayerNum() + 1]
                            )
                        end
                    end
                end
            end
        end
    end
end

function Turismo:GetTotalCheckpointsCompleted(player_id)
    if player_id == nil then
        print("NULL PLAYER in GetTotalCheckpointsCompleted")
        return 1
    end

    return self.allCheckPointsCompleted[player_id + 1]
end

function Turismo:GetCheckpointsCompletedThisLap(player_id)
    if player_id == nil then
        print("NULL PLAYER in GetCheckpointsCompletedThisLap")
        return 1
    end
    local completed = self.allCheckPointsCompleted[player_id + 1]
    local previous_lap = self:GetCurrentLapNumber(player_id) - 1
    local completed_full_laps = self:GetNumberOfCheckpointsInLap()
    completed_full_laps = previous_lap * completed_full_laps
    completed = completed - completed_full_laps
    return completed
end

function Turismo:IncrementCheckpointsCompleted(player_id)
    if player_id == nil then
        return
    end
    self.allCheckPointsCompleted[player_id + 1] = self.allCheckPointsCompleted[player_id + 1] + 1
end

function Turismo:IncrementCurrentLapNumber(player_id)
    if player_id == nil then
        return
    end
    self.allCurrentLap[player_id + 1] = self.allCurrentLap[player_id + 1] + 1
end

function Turismo:AmILeadingTheRace()
    local player = Player()
    if player == nil then
        return false
    end
    if self.allRacePositions[player:PlayerNum() + 1] == 1 then
        return true
    else
        return false
    end
end

function Turismo:GetCurrentLapNumber(player_id)
    if player_id == nil then
        return 1
    end
    return self.allCurrentLap[player_id + 1]
end

function Turismo:GetRacePosition(player_id)
    if player_id == nil then
        return 6
    end
    return self.allRacePositions[player_id + 1]
end

function Turismo:GetNumberOfCheckpointsInLap()
    return table.getn(self.track)
end

function Turismo:Score(player)
    return 8 - self:GetRacePosition(player:PlayerNum())
end

function Turismo:DisplayWinnerMsg(winner_id)
    self:ShowHUD(false)
    main.game.state = "StateGameWon"
    local player = Player()
    local winner = Player(winner_id)
    local msg = nil
    local match_result = nil
    if winner_id == player:PlayerNum() then
        msg = "^T^MRACE04"
        match_result = 1
    else
        msg = "^S^" .. winner:Name() .. " ^T^MRACEWI"
        match_result = 2
    end

    DisplayFinalWinLoseMessage(match_result, msg)
    main.scores:ToggleUpdate(false)
    main.scores:Show(true)
    Wait(12000)
    main.scores:Hide()
    main:EndGame()
    main.game:CleanUp()
end

function Turismo:GenerateCarRespawnPos(checkpoint)
    local track = self.track
    local unused_lcl = startGrid
    local coordinates = {}
    local respawn_position = {}
    if checkpoint == nil then
        checkpoint = 1
    end
    local current_checkpoint = checkpoint
    local next_checkpoint = checkpoint + 1
    if next_checkpoint > table.getn(track) then
        next_checkpoint = next_checkpoint - table.getn(track)
    end
    if current_checkpoint == nil then
        current_checkpoint = 1
    end
    if next_checkpoint == nil then
        next_checkpoint = 2
    end
    coordinates[1] = track[current_checkpoint][1][1]
    coordinates[2] = track[current_checkpoint][1][2]
    coordinates[3] = track[current_checkpoint][2]
    local ground_z = FindGroundZFor3DCoord(coordinates)
    coordinates[3] = ground_z
    respawn_position[1] = coordinates[1]
    respawn_position[2] = coordinates[2]
    respawn_position[3] = coordinates[3]
    ClearArea(respawn_position, 10)
    Wait(250)
    local i = 1
    while CheckObjectSpawnPosition(respawn_position, 8) == false do
        local previous_checkpoint = current_checkpoint - i
        if previous_checkpoint < 1 then
            previous_checkpoint = previous_checkpoint + table.getn(track)
        end
        if previous_checkpoint == nil then
            previous_checkpoint = 1
        end
        respawn_position[1] = track[previous_checkpoint][1][1]
        respawn_position[2] = track[previous_checkpoint][1][2]
        respawn_position[3] = track[previous_checkpoint][2]
        ClearArea(respawn_position, 10)
        Wait(250)
        i = i + 1
    end
    return respawn_position
end

function Turismo:InitTrack()
    if GameLocation() == 0 then
        if RaceId() == 0 then
            self.track = {
                {{1174, -1059, 14}, 17},
                {{1264, -1060, 14}, 17},
                {{1329, -968, 14}, 17},
                {{1354, -811, 14}, 17},
                {{1284, -679, 19}, 22},
                {{1206, -599, 19}, 22},
                {{1195, -513, 23}, 26},
                {{1260, -498, 32}, 35},
                {{1369, -443, 49}, 52},
                {{1370, -283, 49}, 52},
                {{1316, -209, 49}, 45},
                {{1185, -208, 23}, 26},
                {{1062, -208, 4}, 7},
                {{1050, -130, 4}, 7},
                {{975, -85, 4}, 7},
                {{906, -85, -3}, 1},
                {{818, -130, -5}, -2},
                {{815, -275, 4}, 7},
                {{815, -401, 14}, 17},
                {{815, -493, 14}, 17},
                {{815, -624, 14}, 17},
                {{815, -789, 14}, 17},
                {{815, -871, 12}, 15},
                {{817, -972, 4}, 7},
                {{882, -1022, 4}, 7},
                {{988, -1023, 14}, 17},
                {{1074, -1059, 14}, 17}
            }
        elseif RaceId() == 1 then
            self.track = {
                {{1125, -640, 14}, 17},
                {{1125, -518, 19}, 22},
                {{1125, -428, 19}, 22},
                {{1125, -284, 19}, 22},
                {{1125, -212, 14}, 17},
                {{1125, -128, 9}, 12},
                {{1125, -49, 7}, 10},
                {{1053, 0, 2}, 5},
                {{911, -59, 7}, 10},
                {{911, -250, 4}, 7},
                {{911, -373, 13}, 16},
                {{900, -454, 14}, 17},
                {{815, -470, 14}, 17},
                {{850, -623, 14}, 17},
                {{1051, -642, 14}, 17},
                {{1035, -769, 14}, 17},
                {{835, -780, 14}, 17},
                {{826, -857, 15}, 18},
                {{817, -972, 4}, 7},
                {{882, -1022, 4}, 7},
                {{988, -1023, 14}, 17},
                {{1043, -1053, 14}, 17},
                {{1272, -1060, 14}, 17},
                {{1304, -936, 14}, 17},
                {{1229, -861, 14}, 17},
                {{1174, -806, 14}, 17},
                {{1125, -638, 14}, 17}
            }
        elseif RaceId() == 2 then
            self.track = {
                {{920, -494, 14}, 17},
                {{870, -494, 14}, 17},
                {{814, -474, 14}, 17},
                {{815, -395, 14}, 17},
                {{840, -172, 4}, 7},
                {{910, -140, 4}, 7},
                {{921, -229, 4}, 7},
                {{978, -241, 4}, 7},
                {{1000, -331, 9}, 12},
                {{1013, -391, 14}, 17},
                {{1046, -398, 14}, 17},
                {{1061, -514, 14}, 17},
                {{1059, -614, 14}, 17},
                {{900, -639, 14}, 17},
                {{910, -768, 14}, 17},
                {{996, -768, 14}, 17},
                {{1069, -798, 14}, 17},
                {{1114, -798, 14}, 17},
                {{1109, -697, 14}, 17},
                {{1019, -670, 14}, 17},
                {{980, -582, 14}, 17},
                {{965, -494, 14}, 17}
            }
        elseif RaceId() == 3 then
            self.track = {
                {{1050, -850, 14}, 17},
                {{1050, -750, 14}, 17},
                {{1061, -606, 14}, 17},
                {{1061, -530, 14}, 17},
                {{1050, -351, 14}, 17},
                {{1036, -170, 4}, 7},
                {{983, -184, 4}, 7},
                {{959, -228, 4}, 7},
                {{911, -236, 4}, 7},
                {{896, -274, 4}, 7},
                {{814, -254, 4}, 7},
                {{823, -120, -5}, -2},
                {{908, -85, -2}, 0},
                {{986, -86, 4}, 7},
                {{1125, -112, 9}, 12},
                {{1100, -2, 6}, 9},
                {{976, 3, 4}, 7},
                {{911, -52, 6}, 9},
                {{899, -128, 4}, 7},
                {{845, -157, 4}, 7},
                {{815, -405, 14}, 17},
                {{850, -493, 14}, 17},
                {{980, -510, 14}, 17},
                {{964, -574, 14}, 17},
                {{815, -592, 14}, 17},
                {{849, -628, 14}, 17},
                {{1125, -640, 14}, 17},
                {{1136, -702, 14}, 17},
                {{1220, -754, 14}, 17},
                {{1278, -806, 14}, 17},
                {{1331, -857, 15}, 18},
                {{1324, -898, 14}, 17},
                {{1221, -983, 14}, 17},
                {{1124, -959, 14}, 17},
                {{1047, -934, 14}, 17}
            }
        elseif RaceId() == 4 then
            self.track = {
                {{1125, -680, 13}, 16},
                {{1125, -765, 13}, 16},
                {{1085, -830, 13}, 16},
                {{1034, -818, 13}, 16},
                {{900, -809, 13}, 16},
                {{891, -698, 13}, 16},
                {{814, -680, 13}, 16},
                {{852, -573, 13}, 16},
                {{958, -585, 13}, 16},
                {{1005, -620, 13}, 16},
                {{1125, -638, 13}, 16}
            }
        elseif RaceId() == 5 then
            self.track = {
                {{1050, -780, 13}, 16},
                {{1050, -850, 13}, 16},
                {{1066, -948, 13}, 16},
                {{1204, -985, 13}, 16},
                {{1304, -935, 13}, 16},
                {{1321, -1032, 13}, 16},
                {{1265, -1059, 13}, 16},
                {{1159, -1059, 13}, 16},
                {{1067, -1058, 13}, 16},
                {{976, -1023, 13}, 16},
                {{825, -991, 3}, 6},
                {{816, -870, 12}, 15},
                {{816, -714, 13}, 16},
                {{850, -623, 13}, 16},
                {{961, -624, 13}, 16},
                {{1050, -640, 13}, 16},
                {{1050, -700, 13}, 16}
            }
        elseif RaceId() == 6 then
            self.track = {
                {{1125, -363, 18}, 21},
                {{1125, -279, 18}, 21},
                {{1125, -127, 8}, 11},
                {{1125, -49, 6}, 9},
                {{1074, 1, 1}, 4},
                {{977, 3, 3}, 6},
                {{910, -52, 6}, 9},
                {{900, -129, 3}, 6},
                {{835, -195, 3}, 6},
                {{845, -273, 3}, 6},
                {{909, -284, 3}, 6},
                {{921, -338, 8}, 11},
                {{1000, -348, 8}, 11},
                {{1007, -444, 13}, 16},
                {{1074, -499, 14}, 17},
                {{1126, -483, 18}, 21},
                {{1125, -425, 18}, 21}
            }
        elseif RaceId() == 7 then
            self.track = {
                {{960, -493, 13}, 16},
                {{900, -493, 13}, 16},
                {{815, -474, 13}, 16},
                {{815, -397, 13}, 16},
                {{815, -268, 3}, 6},
                {{817, -133, -6}, -3},
                {{887, -85, -5}, -2},
                {{980, -85, 3}, 6},
                {{1045, -129, 3}, 6},
                {{1065, -209, 3}, 6},
                {{1195, -223, 23}, 26},
                {{1207, -283, 23}, 26},
                {{1297, -294, 37}, 40},
                {{1280, -349, 36}, 39},
                {{1195, -363, 23}, 26},
                {{1186, -423, 23}, 26},
                {{1125, -434, 18}, 21},
                {{1113, -501, 18}, 21},
                {{1040, -498, 13}, 16}
            }
        end
    elseif GameLocation() == 1 then
        if RaceId() == 0 then
            self.track = {
                {{121, -800, 25}, 28},
                {{110, -941, 25}, 28},
                {{42, -941, 25}, 28},
                {{-8, -911, 25}, 28},
                {{-1, -773, 25}, 28},
                {{-20, -691, 25}, 28},
                {{-97, -674, 15}, 18},
                {{-103, -514, 15}, 18},
                {{-108, -401, 15}, 18},
                {{-81, -286, 15}, 18},
                {{35, -280, 15}, 18},
                {{125, -206, 15}, 18},
                {{212, -207, 19}, 22},
                {{323, -180, 20}, 23},
                {{450, -133, 20}, 23},
                {{441, -331, 20}, 23},
                {{374, -342, 20}, 23},
                {{362, -401, 20}, 23},
                {{293, -401, 25}, 28},
                {{213, -428, 25}, 28},
                {{121, -614, 25}, 28},
                {{121, -710, 25}, 28}
            }
        elseif RaceId() == 1 then
            self.track = {
                {{-8, -732, 25}, 28},
                {{-8, -632, 25}, 28},
                {{-11, -518, 18}, 21},
                {{1, -397, 15}, 18},
                {{-8, -287, 15}, 18},
                {{-104, -270, 15}, 18},
                {{-170, -139, 15}, 18},
                {{-164, -14, 15}, 18},
                {{-66, 79, 15}, 18},
                {{53, 61, 15}, 18},
                {{123, -55, 15}, 18},
                {{252, -71, 20}, 23},
                {{252, -219, 20}, 23},
                {{268, -401, 25}, 28},
                {{417, -409, 20}, 23},
                {{427, -578, 25}, 28},
                {{397, -696, 25}, 28},
                {{251, -712, 25}, 28},
                {{206, -812, 25}, 28},
                {{107, -941, 25}, 28},
                {{39, -946, 25}, 28},
                {{-8, -908, 25}, 28},
                {{-8, -801, 25}, 28}
            }
        elseif RaceId() == 2 then
            self.track = {
                {{427, -1000, 25}, 28},
                {{428, -1190, 15}, 18},
                {{525, -1325, 15}, 18},
                {{529, -1458, 15}, 18},
                {{406, -1521, 15}, 18},
                {{406, -1419, 24}, 27},
                {{397, -1237, 25}, 28},
                {{275, -1175, 25}, 28},
                {{145, -1098, 25}, 28},
                {{157, -899, 25}, 28},
                {{251, -681, 25}, 28},
                {{232, -403, 25}, 28},
                {{106, -395, 15}, 18},
                {{106, -206, 15}, 18},
                {{122, -56, 15}, 18},
                {{252, -75, 20}, 23},
                {{271, -160, 20}, 23},
                {{322, -198, 20}, 23},
                {{344, -331, 21}, 24},
                {{452, -342, 20}, 23},
                {{426, -427, 20}, 23},
                {{426, -590, 25}, 28},
                {{426, -770, 25}, 28}
            }
        elseif RaceId() == 3 then
            self.track = {
                {{-103, -330, 15}, 18},
                {{-103, -270, 15}, 18},
                {{-159, -159, 15}, 18},
                {{-164, -14, 15}, 18},
                {{-66, 79, 15}, 18},
                {{53, 61, 15}, 18},
                {{107, -28, 15}, 18},
                {{121, -206, 15}, 18},
                {{251, -222, 20}, 23},
                {{266, -331, 25}, 28},
                {{374, -341, 21}, 24},
                {{351, -402, 21}, 24},
                {{251, -416, 25}, 28},
                {{234, -621, 25}, 28},
                {{126, -600, 25}, 28},
                {{137, -542, 25}, 28},
                {{-12, -529, 19}, 22},
                {{-8, -406, 15}, 18},
                {{-103, -395, 15}, 18}
            }
        elseif RaceId() == 4 then
            self.track = {
                {{160, -533, 24}, 27},
                {{122, -610, 24}, 27},
                {{121, -737, 24}, 27},
                {{107, -941, 24}, 27},
                {{42, -963, 24}, 27},
                {{42, -1100, 24}, 27},
                {{26, -1265, 24}, 27},
                {{-137, -1210, 24}, 27},
                {{-115, -1366, 24}, 27},
                {{41, -1378, 24}, 27},
                {{58, -1611, 24}, 27},
                {{133, -1616, 24}, 27},
                {{225, -1574, 24}, 27},
                {{186, -1492, 24}, 27},
                {{197, -1270, 24}, 27},
                {{306, -1257, 25}, 28},
                {{306, -1156, 24}, 27},
                {{307, -1015, 24}, 27},
                {{335, -883, 20}, 23},
                {{403, -748, 34}, 37},
                {{476, -602, 34}, 37},
                {{525, -401, 19}, 22},
                {{389, -401, 20}, 23},
                {{294, -399, 23}, 26},
                {{220, -425, 24}, 27},
                {{190, -475, 24}, 27}
            }
        elseif RaceId() == 5 then
            self.track = {
                {{41, -1290, 24}, 27},
                {{41, -1130, 24}, 27},
                {{63, -941, 24}, 27},
                {{147, -955, 24}, 27},
                {{146, -1086, 24}, 27},
                {{146, -1229, 24}, 27},
                {{159, -1396, 24}, 27},
                {{297, -1396, 24}, 27},
                {{407, -1381, 24}, 27},
                {{394, -1235, 24}, 27},
                {{319, -1197, 24}, 27},
                {{197, -1136, 24}, 27},
                {{101, -1088, 24}, 27},
                {{24, -1044, 24}, 27},
                {{-80, -1020, 24}, 27},
                {{-137, -1200, 24}, 27},
                {{-147, -1337, 24}, 27},
                {{-202, -1387, 24}, 27},
                {{-147, -1520, 24}, 27},
                {{-50, -1596, 24}, 27},
                {{41, -1590, 24}, 27},
                {{41, -1470, 24}, 27},
                {{41, -1370, 24}, 27}
            }
        elseif RaceId() == 6 then
            self.track = {
                {{407, -1181, 24}, 27},
                {{407, -1100, 24}, 27},
                {{426, -1010, 24}, 27},
                {{396, -897, 25}, 28},
                {{328, -903, 20}, 23},
                {{309, -1010, 24}, 27},
                {{274, -1175, 25}, 28},
                {{186, -1188, 24}, 27},
                {{175, -1332, 24}, 27},
                {{68, -1310, 24}, 27},
                {{20, -1348, 24}, 27},
                {{-105, -1361, 24}, 27},
                {{-202, -1380, 24}, 27},
                {{-148, -1517, 24}, 27},
                {{-59, -1592, 24}, 27},
                {{41, -1594, 24}, 27},
                {{63, -1470, 24}, 27},
                {{147, -1487, 24}, 27},
                {{166, -1599, 24}, 27},
                {{293, -1587, 24}, 27},
                {{325, -1486, 24}, 27},
                {{306, -1405, 24}, 27},
                {{407, -1381, 24}, 27},
                {{407, -1281, 24}, 27}
            }
        elseif RaceId() == 7 then
            self.track = {
                {{-8, -688, 25}, 28},
                {{-8, -738, 25}, 28},
                {{-23, -801, 25}, 28},
                {{-62, -814, 24}, 27},
                {{-53, -921, 24}, 27},
                {{26, -941, 24}, 27},
                {{125, -933, 24}, 27},
                {{172, -880, 24}, 27},
                {{190, -802, 25}, 28},
                {{121, -790, 24}, 27},
                {{139, -696, 24}, 27},
                {{251, -681, 24}, 27},
                {{236, -621, 24}, 27},
                {{125, -603, 24}, 27},
                {{181, -482, 24}, 27},
                {{235, -420, 24}, 27},
                {{258, -450, 24}, 27},
                {{230, -533, 25}, 28},
                {{79, -541, 24}, 27},
                {{-7, -552, 18}, 21},
                {{-8, -628, 24}, 27}
            }
        end
    elseif GameLocation() == 2 then
        if RaceId() == 0 then
            self.track = {
                {{-870, 179, 48}, 51},
                {{-784, 222, 48}, 51},
                {{-670, 227, 53}, 56},
                {{-507, 227, 67}, 70},
                {{-330, 241, 57}, 60},
                {{-294, 303, 69}, 72},
                {{-294, 372, 77}, 80},
                {{-417, 358, 88}, 91},
                {{-595, 363, 77}, 80},
                {{-735, 355, 62}, 65},
                {{-890, 391, 39}, 42},
                {{-920, 523, 65}, 68},
                {{-1100, 514, 67}, 70},
                {{-1195, 456, 67}, 70},
                {{-1264, 276, 67}, 70},
                {{-1264, 76, 67}, 70},
                {{-1289, -53, 57}, 60},
                {{-1281, -217, 52}, 55},
                {{-1153, -217, 42}, 45},
                {{-1043, -227, 42}, 45},
                {{-937, -222, 31}, 34},
                {{-810, -218, 27}, 30},
                {{-819, -127, 32}, 35},
                {{-893, -127, 32}, 35},
                {{-1036, -127, 42}, 45},
                {{-1108, -110, 43}, 46},
                {{-1162, 0, 57}, 60},
                {{-1146, 94, 57}, 60},
                {{-1020, 105, 48}, 51},
                {{-940, 144, 48}, 51}
            }
        elseif RaceId() == 1 then
            self.track = {
                {{-1265, 183, 67}, 70},
                {{-1265, 78, 67}, 70},
                {{-1289, -56, 57}, 60},
                {{-1282, -216, 52}, 55},
                {{-1102, -223, 42}, 45},
                {{-960, -271, 32}, 35},
                {{-850, -285, 32}, 35},
                {{-696, -316, 18}, 21},
                {{-636, -482, 17}, 20},
                {{-571, -435, -6}, -3},
                {{-624, -255, -25}, -22},
                {{-568, -118, -30}, -27},
                {{-502, -52, -20}, -18},
                {{-412, 37, -20}, -18},
                {{-352, 112, -20}, -18},
                {{-534, 153, -20}, -18},
                {{-668, 57, -3}, -1},
                {{-743, 50, 3}, 6},
                {{-801, 178, 15}, 18},
                {{-897, 247, 28}, 31},
                {{-892, 352, 37}, 40},
                {{-915, 526, 65}, 68},
                {{-1111, 510, 67}, 70},
                {{-1211, 437, 67}, 70},
                {{-1265, 283, 67}, 70}
            }
        elseif RaceId() == 2 then
            self.track = {
                {{-878, 175, 47}, 50},
                {{-792, 218, 47}, 50},
                {{-673, 227, 53}, 56},
                {{-508, 227, 66}, 70},
                {{-328, 244, 58}, 61},
                {{-285, 337, 76}, 79},
                {{-279, 427, 86}, 89},
                {{-383, 515, 87}, 90},
                {{-577, 627, 77}, 80},
                {{-863, 629, 77}, 80},
                {{-909, 525, 65}, 68},
                {{-1117, 507, 67}, 70},
                {{-1243, 387, 67}, 70},
                {{-1255, 172, 67}, 70},
                {{-1088, 162, 57}, 60},
                {{-1033, 99, 47}, 50},
                {{-959, 135, 47}, 50}
            }
        elseif RaceId() == 3 then
            self.track = {
                {{-1020, 23, 43}, 46},
                {{-1049, 83, 48}, 51},
                {{-1098, 172, 57}, 60},
                {{-1190, 172, 62}, 65},
                {{-1264, 162, 67}, 70},
                {{-1264, 77, 67}, 70},
                {{-1289, -58, 57}, 60},
                {{-1281, -217, 52}, 55},
                {{-1151, -218, 42}, 45},
                {{-1064, -227, 42}, 45},
                {{-974, -205, 32}, 35},
                {{-974, -127, 33}, 36},
                {{-985, -47, 38}, 41}
            }
        elseif RaceId() == 4 then
            self.track = {
                {{-974, 69, 18}, 21},
                {{-921, -39, 28}, 31},
                {{-893, -130, 32}, 35},
                {{-975, -118, 32}, 35},
                {{-974, -69, 37}, 40},
                {{-1010, 2, 42}, 45},
                {{-1067, 98, 47}, 50},
                {{-1127, 99, 57}, 60},
                {{-1165, 60, 57}, 60},
                {{-1165, 5, 57}, 60},
                {{-1132, -64, 47}, 50},
                {{-1099, -129, 42}, 45},
                {{-1039, -227, 42}, 45},
                {{-962, -217, 32}, 35},
                {{-810, -219, 27}, 30},
                {{-820, -127, 32}, 35},
                {{-882, -107, 33}, 36},
                {{-910, -52, 29}, 32},
                {{-975, 77, 16}, 19},
                {{-1013, 155, 8}, 12},
                {{-1065, 242, 2}, 5},
                {{-1137, 283, 2}, 5},
                {{-1190, 256, 2}, 5},
                {{-1140, 219, 3}, 6},
                {{-1045, 207, 3}, 6},
                {{-1004, 125, 11}, 14}
            }
        elseif RaceId() == 5 then
            self.track = {
                {{-673, 227, 53}, 56},
                {{-607, 227, 58}, 61},
                {{-510, 227, 67}, 70},
                {{-447, 227, 68}, 71},
                {{-329, 243, 57}, 60},
                {{-281, 339, 77}, 80},
                {{-280, 425, 86}, 89},
                {{-311, 487, 87}, 89},
                {{-421, 536, 83}, 86},
                {{-577, 627, 77}, 80},
                {{-700, 634, 77}, 80},
                {{-853, 631, 77}, 80},
                {{-889, 577, 76}, 79},
                {{-890, 445, 50}, 55},
                {{-889, 361, 37}, 40},
                {{-889, 308, 32}, 35},
                {{-890, 236, 27}, 30},
                {{-804, 181, 15}, 18},
                {{-747, 91, 4}, 7},
                {{-739, -13, 2}, 5},
                {{-690, -110, 2}, 5},
                {{-583, -208, 2}, 5},
                {{-455, -195, 2}, 5},
                {{-460, -92, 2}, 5},
                {{-575, -82, 2}, 5},
                {{-563, 87, 2}, 5},
                {{-430, 77, 2}, 5},
                {{-446, 16, 3}, 6},
                {{-517, -18, 9}, 12},
                {{-610, -46, 18}, 21},
                {{-627, 102, 17}, 20},
                {{-702, 122, 21}, 24},
                {{-769, 156, 27}, 30},
                {{-635, 157, 36}, 39},
                {{-577, 192, 42}, 45},
                {{-635, 192, 48}, 51}
            }
        elseif RaceId() == 6 then
            self.track = {
                {{-890, -127, 32}, 35},
                {{-974, -127, 32}, 35},
                {{-1041, -127, 42}, 45},
                {{-1106, -115, 43}, 46},
                {{-1149, -57, 47}, 50},
                {{-1213, -57, 53}, 56},
                {{-1289, -45, 57}, 60},
                {{-1265, 22, 62}, 65},
                {{-1252, 101, 67}, 70},
                {{-1246, 164, 67}, 70},
                {{-1169, 172, 60}, 63},
                {{-1089, 163, 57}, 60},
                {{-1066, 114, 48}, 51},
                {{-1050, 83, 47}, 50},
                {{-1010, 4, 42}, 45},
                {{-977, -64, 37}, 40},
                {{-975, -127, 32}, 35},
                {{-964, -217, 32}, 35},
                {{-810, -218, 27}, 30},
                {{-820, -127, 32}, 35}
            }
        elseif RaceId() == 7 then
            self.track = {
                {{-845, 192, 47}, 50},
                {{-920, 154, 47}, 50},
                {{-1048, 78, 47}, 50},
                {{-1011, 6, 42}, 45},
                {{-974, -70, 37}, 40},
                {{-975, -127, 32}, 35},
                {{-956, -281, 32}, 35},
                {{-845, -285, 30}, 33},
                {{-709, -307, 17}, 20},
                {{-665, -426, 17}, 20},
                {{-692, -551, 15}, 18},
                {{-634, -638, -3}, 0},
                {{-563, -430, -6}, -3},
                {{-618, -296, -25}, -22},
                {{-580, -152, -30}, -28},
                {{-491, -50, -21}, -19},
                {{-350, 116, -21}, -18},
                {{-477, 179, -21}, -18},
                {{-598, 102, -17}, -14},
                {{-681, 57, -2}, 1},
                {{-744, 57, 2}, 5},
                {{-785, 161, 12}, 15},
                {{-898, 255, 28}, 31},
                {{-890, 308, 32}, 35},
                {{-874, 371, 37}, 40},
                {{-768, 357, 57}, 60},
                {{-628, 358, 76}, 79},
                {{-438, 360, 87}, 90},
                {{-280, 363, 77}, 80},
                {{-294, 312, 71}, 74},
                {{-348, 227, 58}, 61},
                {{-436, 227, 66}, 69},
                {{-498, 227, 67}, 70},
                {{-703, 227, 52}, 55},
                {{-775, 227, 47}, 50}
            }
        end
    end

    Wait(5)
    while SyncCutScene() == false do
        Wait(5)
    end

    if IsServer() then
        local players = AllPlayers()
        local number_of_players = table.getn(players)
        print("Num Players == " .. number_of_players)
        local grid_shuffle = math.random(0, number_of_players)
        print("Calc Shift : " .. grid_shuffle)
        if 0 < grid_shuffle then
            SendEvent(MSG_GRID_SHUFFLE_PLUS1 + grid_shuffle - 1)
        end
    end
end

function Turismo:DisplayMessage(msg, msg_length)
    if self.SplashTextIsOnScreen == false then
        self.Msg = msg
        self.MsgLength = msg_length
        local unused_lcl = Player()
        self.MsgColour = {0, 106, 164, 255}
        self.MessageDisplay = MessageDisplay()
        self.MessageDisplay:Start()
    end
end

function MessageDisplay:CleanUp()
    print("Message Display CLEANUP")
end

function MessageDisplay:Run()
    main.game.SplashTextIsOnScreen = true
    local player = Player()
    local sprite = TextSprite(player, 240, 70, 1)
    sprite:Scale(0.7)
    sprite:Style(2)
    sprite:Colour(main.game.MsgColour[1], main.game.MsgColour[2], main.game.MsgColour[3], main.game.MsgColour[4])
    sprite:Text(main.game.Msg)
    Wait(main.game.MsgLength)
    sprite:Remove()
    main.game.SplashTextIsOnScreen = false
end

function Main()
    print("lua Main()")
    main = MainLoop{}
    main.commentary = Commentary{}:Start()
    main.scores = ScoreSheetScript{}:Start()
    InitSpawnPoints()
    local spawn_index = 0
    spawn_index = math.random(1, table.getn(main.vSpawnPoints))
    print("lua->CreatePlayer()")
    CreatePlayer(unpack(main.vSpawnPoints[spawn_index][1]))
    PlayerName(HostName())
    main.game = Turismo():Start()
    main:Start()
end
