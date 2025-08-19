require "gta"
require "mainloop"
require "spawn"
require "PowerUps"
require "Pickups"
require "PickupBlips"
require "CutscenePlayer"

PowerUpTimer = PowerupTimer()
Tank = StateMachine{"StateInit"}
playerintank = -1
MultiTankClient = Script{_init={"thisplayer"}}
TankMessagePump = Script{}
MessageDisplay = Script{}
KickOutOfCar = Script{}

WRECKED_TANK_CLEANUP_TIME = 20000
DEATH_WAIT_RESPAWN_TIME = 1000
TANKEVENTMASK_NONE = 16777215
TANKEVENTMASK_TYPE = 14680064
TANKEVENTMASK_PARAM1 = 1966080
TANKEVENTMASK_PARAM2 = 131008
TANKEVENTMASK_PARAM3 = 127
TANKEVENTSHIFT_TYPE = 21
TANKEVENTSHIFT_PARAM1 = 17
TANKEVENTSHIFT_PARAM2 = 7
TANKEVENTSHIFT_PARAM3 = 0
TANKEVENT_GAMEOVER = 1
TANKEVENT_TIMEUPDATE = 2
TANKEVENT_TANK_DAMAGE = 3
TANKEVENT_AQUIRE_TANK = 4
TANKEVENT_PLAYERINTANK = 5

function Tank:StateInit()
    DbgPrintAllOptions()
    local players = AllPlayers()
    local connected_players = table.getn(players)
    local iterations = 0
    while connected_players ~= GetExpectedNumberOfPlayers() and (iterations < 20) do
        print(
            "Tank is sat on its ass waiting for " ..
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
    self.TankSpawnPoints = {}
    self.PlayerSpawnPoints = {}

    if GameLocation() == 0 then
        self.TankSpawnPoints = {
            {{797.8071, 207.5598, 2.6607}, 358.5674},
            {{929.1254, -54.7401, 6.8729}, 355.8375},
            {{1222.6725, -85.2097, 11.5875}, 121.4133},
            {{858.0843, -204.6711, 2.4764}, 87.2288},
            {{1340.4441, -252.3403, 48.6063}, 265.8214},
            {{1159.9774, -392.3391, 25.804}, 270.8189},
            {{863.2579, -619.9805, 13.7827}, 266.1452},
            {{1012.097, -855.1946, 13.9287}, 356.2619},
            {{1229.6819, -797.6679, 13.693}, 215.9505},
            {{1550.7103, -702.2163, 10.7862}, 92.8023},
            {{880.7193, -988.7128, 4.0137}, 180.1849},
            {{1240.3583, -1036.9274, 13.826}, 271.3563}
        }
        self.PlayerSpawnPoints = {
            {{1293.4583, -934.6291, 13.9326}, 9.3867},
            {{1037.981, -933.4276, 13.9326}, 307.8666},
            {{826.0873, -848.7362, 14.0352}, 340.377},
            {{1038.0424, -671.6776, 13.9326}, 195.6944},
            {{1203.441, -512.1193, 23.9328}, 57.2714},
            {{843.8878, -507.8421, 13.9326}, 21.4699},
            {{1133.5897, -194.7319, 13.9326}, 149.1851},
            {{1356.6787, -290.317, 48.9329}, 336.6544}
        }
    elseif GameLocation() == 1 then
        self.TankSpawnPoints = {
            {{155.8805, 186.9074, 10.6642}, 102.7052},
            {{268.2766, 53.4401, 12.7449}, 40.6748},
            {{176.0187, -155.48, 15.4296}, 77.6582},
            {{51.3637, -355.7569, 15.1348}, 349.4941},
            {{349.3484, -447.7346, 21.1986}, 88.0826},
            {{237.74, -1156.3549, 26.0804}, 90},
            {{463.3164, -786.4393, 15.1136}, 0.0033},
            {{44.9321, -998.8205, 25.5804}, 180},
            {{455.0771, -1489.4423, 17.6312}, 289.1265},
            {{268.7971, -1679.5638, 25.003}, 305.9543},
            {{-124.1932, -1149.4763, 15.9319}, 355.1831},
            {{-90.8065, -439.4426, 16.2269}, 96.0153}
        }
        self.PlayerSpawnPoints = {
            {{164.25, -622.24, -100}, 0},
            {{47.52, -635.31, -100}, 0},
            {{39.34, -724.23, -100}, 0},
            {{-116.2, -1176.88, -100}, 0},
            {{-91.98, -1383.62, -100}, 0},
            {{-29.16, -1152.6, -100}, 0},
            {{96.98, -1097.28, -100}, 0}
        }
    elseif GameLocation() == 2 then
        self.TankSpawnPoints = {
            {{-585.1682, 337.9316, 71.6561}, 0.233},
            {{-334.1411, 128.9998, 7.3551}, 99.0586},
            {{-528.0366, -21.3841, 2.8213}, 359.2286},
            {{-1184.0801, 304.2325, 2.3991}, 181.0941},
            {{-1124.5128, 135.8386, 57.7689}, 359.982},
            {{-1206.1182, 114.5237, 67.5982}, 88.7102},
            {{-1268.1327, -152.1534, 57.7441}, 1.9605},
            {{-1062.7156, -153.1494, 32.7021}, 203.8334},
            {{-741.3131, 195.6344, 27.6714}, 160.1146},
            {{-877.9, -201.54, 32.8155}, 90},
            {{-366.6813, 260.2819, 60.1424}, 192.7559},
            {{-784.5757, 312.2558, 49.4734}, 343.633}
        }
        self.PlayerSpawnPoints = {
            {{-725.23, 39.73, -100}, 0},
            {{-748.79, -583.35, -100}, 0},
            {{-715.24, -721.57, 8.85}, 0},
            {{-648.56, -152.97, 3.71}, 0},
            {{-861.49, 172.22, -100}, 0},
            {{-1211.44, 412.65, -100}, 0}
        }
    end
    
    UseSuperBrakeOnPause(false)
    self.removeSplashTextNow = false
    self.allPlayerDamage = {}
    self:ClearDamageArray()
    self.scores = {}
    self.mypickups = PickupMgr()
    self.mypickups:CreatePickups()
    self.InATank = false
    self.winningPlayer = 0

    if IsServer() then
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

    Wait(1000)
    self.players = {}
    self.totalmins = {}
    self.totalseconds = {}
    self.allplayers = AllPlayers()
    
    for player_index, player in ipairs(self.allplayers) do
        print("Insert " .. player_index)
        table.insert(self.players, player)
    end
    local i = 0
    while i <= 8 do
        self.totalmins[i] = 0
        self.totalseconds[i] = 0
        i = i + 1
    end
    
    self.localplayer = Player(PlayerId())
    local unused_lcl = Player()
    self.tankDamage = 0
    self.SplashTextIsOnScreen = false
    self.tankDam = nil
    self.tankDmgTxt = nil
    self.tanktime = nil
    self:ShowHUD(false)
    self.EndOfGame = false
    self.myMessagePump = TankMessagePump()
    self.myMessagePump:Start()

    Wait(100)
    self.currentTank = nil

    if IsServer() then
        local position = self:GetTankRespawnPosition()
        self.currentTank = CreateVehicle(TankModel(), position, position[4])
        VehicleAdd3dMarker(self.currentTank)
        VehicleSetCarDoorLocks(self.currentTank, CARLOCK_UNLOCKED)
    end

    self.StartGameRunForTank = true
    self.TankRadarBlip = nil

    if self.localplayer:PlayerNum() ~= playerintank then
        main.vSpawnPoints = self.PlayerSpawnPoints
        local position = DoSpawn(InitialSpawnPoint(PlayerId()), false)
        print("^S^ " .. PlayerId() .. "^S^ " .. InitialSpawnPoint(PlayerId()))
        self.localplayer:Respawn(position, position[4])
    end

    self.client = {}
    if IsServer() then
        for _, player in pairs(self.players) do
            self.client[player] = MultiTankClient{player}:Start()
        end
    end

    Wait(100)

    if not NoFuckingCutscene() then
        main.scores:Hide(true)
        Wait(5)
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
    self:ShowHUD(true)
    SetGameTime(GameTimeLimit())
    GameElapsedMs(0)
    UpdateGameTime(true)
    self:Commentate("^T^MPTNK")

    return "StateRunning"
end

function Tank:CleanUp()
    print("Tank Cleanup")
    self.removeSplashTextNow = true
    Wait(20)

    if self.tankDam ~= nil then
        self.tankDam.Remove()
        self.tankDam = nil
    end
    if self.tankDmgTxt ~= nil then
        self.tankDmgTxt.Remove()
        self.tankDmgTxt = nil
    end
    if self.tanktime ~= nil then
        self.tanktime.Remove()
        self.tanktime = nil
    end

    collectgarbage()
    self.mypickups:Cleanup()
    self.myMessagePump:Stop()
end

function Tank:StateRunning()
    self:UpdateDamageDoneToTank()
    self:CheckPutInTank()
    self:CheckForRespawn_NoTank()
    self:UpdateRadar()
    self:CheckForGameOver()
    self:CheckForTankDisconnection()
    self:CheckForEndGame()
    Wait(10)
    collectgarbage()
end

function Tank:CheckPutInTank()
    local player = Player()
    if IsServer() then
        if self.StartGameRunForTank == true then
            if IsVehicleWrecked(self.currentTank) then
                local position = self:GetTankRespawnPosition()
                self.currentTank = CreateVehicle(TankModel(), position, position[4])
                VehicleAdd3dMarker(self.currentTank)
                VehicleSetCarDoorLocks(self.currentTank, CARLOCK_UNLOCKED)
            end
        end
    end

    if self.StartGameRunForTank == true then
        if player:InATank() then
            self.currentTank = GetLocalPlayersVehicle()
            self:DoSendEvent(TANKEVENT_AQUIRE_TANK, PlayerId(), 0, 0)
            Wait(200)
        end
    end

    if PlayerId() == playerintank then
        if IsLocalPlayerDrowning() == false then
            if not player:InATank() then
                self:TransferPlayerToTank()
            end
        end
    end
end

function Tank:UpdateRadar()
    if PlayerId() == playerintank or (self.StartGameRunForTank == true and IsServer()) then
        local position = nil
        position = VehiclePosition(self.currentTank)
        if position ~= nil then
            position[3] = position[3] + 1000
            if self.TankRadarBlip ~= nil then
                UpdateBlipCoord(self.TankRadarBlip, position)
            else
                self.TankRadarBlip = AddBlipForCoord(position, 3, pickupicon.tank)
            end

            if PlayerId() == playerintank then
                local player = Player()
                SetBlipVisibleForPlayerState(self.TankRadarBlip, player:PlayerNum(), false)
            end

            if self.StartGameRunForTank == false then
                if self.TankRadarBlip ~= nil then
                    SetRadarBlipColour(self.TankRadarBlip, VehicleGetDriverPlayerColour(self.currentTank))
                    position[2] = position[2] + 1
                    UpdateBlipCoord(self.TankRadarBlip, position)
                end
            end
        end
    end
end

function Tank:UpdateDamageDoneToTank()
    local player = Player()
    if player:PlayerNum() == playerintank then
        LimitTankSpeed(self.currentTank)
        self.tankDamage = 1000 - VehicleHealth(self.currentTank)
        local damage_percentage = self.tankDamage
        damage_percentage = damage_percentage / 7.5
        if damage_percentage < 0 then
            damage_percentage = 0
        elseif 100 < damage_percentage then
            damage_percentage = 100
        end

        local damage_as_str = string.format("%.3d", damage_percentage)
        if self.tankDmgTxt ~= nil then
            self.tankDmgTxt:Text("^S^ " .. damage_as_str .. "%")
        end
        
        local last_damage = VehicleGetLastDamageAmount(self.currentTank)
        local last_damage_player = VehicleGetLastDamagePlayerID(self.currentTank)
        if 0 < last_damage and last_damage_player ~= -1 then
            VehicleClearLastDamagePlayerID(self.currentTank)
            self:DoSendEvent(TANKEVENT_TANK_DAMAGE, last_damage_player, last_damage, 0)
        end
    end
end

function Tank:CheckForGameOver()
    if IsServer() then
        local number_of_players = table.getn(self.players)
        local unused_lcl = 0
        local time_in_ms = nil
        if number_of_players == 1 then
            print("All Clients Gone, Quiting")
            UpdateGameTime(false)
            self.winningPlayer = 0
            self.EndOfGame = true
        end

        for i = 0, number_of_players, 1 do
            time_in_ms = self:GetTimeMinutes(i) * 60000
            time_in_ms = time_in_ms + self:GetTimeSeconds(i) * 1000
            if time_in_ms >= GameScoreLimit() * 60000 then
                Tank:DoSendEvent(TANKEVENT_GAMEOVER, i, 0, 0)
            end
        end
    end
end

function Tank:CheckForTankDisconnection()
    if IsServer() then
        if playerintank ~= -1 then
            local player_in_tank = Player(playerintank)
            if not IsConnected(player_in_tank) then
                print("Player has left the game and was in a tank " .. playerintank)
                self:ChoosePlayerInTank()
                Tank:DoSendEvent(TANKEVENT_PLAYERINTANK, playerintank, 0, 0)
            end
        end
    end
end

function Tank:ChoosePlayerInTank()
    local number_of_players = table.getn(self.players)
    local found = false
    local player_index = nil
    while not found do
        player_index = math.random(0, number_of_players - 1)
        if player_index ~= playerintank then
            found = IsConnected(Player(player_index))
        end
    end
    playerintank = player_index
    print("Player In Tank Is " .. playerintank)
    TargetPlayer(playerintank)
end

function Tank:TransferPlayerToTank()
    Wait(2000)
    if IsLocalPlayerEnteringAVehicle() then
        return
    end
    print("Respawning player in transferplayertotank")
    CameraFadeOut(3)
    local position = self:GetTankRespawnPosition()
    print("Transfering player to a tank")
    local original_position = position
    position[3] = -100

    -- why is it multiline??
    print([[

x == ]] .. original_position[1])
    print([[

y == ]] .. original_position[2])
    print([[

z == ]] .. original_position[3])
    print([[

heading == ]] .. original_position[4])

    ClearLocalPlayerLockOn()
    if IsLocalPlayerInVehicle() then
        print("Ped is in a vehicle, get the f*ck out !!!")
        self:KickDriverOutOfCar(GetLocalPlayersVehicle())
    end

    if PlayerHealth(Player()) <= 1 or IsLocalPlayerInVehicle() then
        print("respawn player for tank")
        self.localplayer:Respawn(original_position, original_position[4])
    end

    local player = Player()
    if not player:IsPlaying() then
        print("**************** NOT PLAYING RESPAWN")
        self.localplayer:Respawn(original_position, original_position[4])
    end

    self.currentTank = CreateVehicle(TankModel(), original_position, original_position[4])
    VehicleAdd3dMarker(self.currentTank)
    SetPosition(Player(PlayerId()), position)
    WarpPlayerIntoCar(PlayerId(), self.currentTank)
    self.InATank = true
    local unused_lcl = Player()
    ShowRadar(true)
    CameraFadeIn(5)
    self:DisplayTankMessage("^T^MPTNKGA", 1500, "^T^MPTNKGB", {255, 255, 255, 255}, {255, 255, 255, 255})
end

function Tank:KickDriverOutOfCar(car)
    print("Kick driver out of car")
    local kick_out = KickOutOfCar()
    kick_out.isDriverKickedOutOfCar = false
    kick_out.carToKickDriverOutOf = car
    kick_out:Start()
    while kick_out.isDriverKickedOutOfCar == false do
        Wait(0)
    end
    self.carToKickDriverOutOf = nil
end

function KickOutOfCar:Run()
    VehicleSetEmergencyStop(self.carToKickDriverOutOf, true)
    Wait(500)
    VehicleForceOutPeds(self.carToKickDriverOutOf)
    local iterations = 0
    while VehicleIsDrivenByPlayer(self.carToKickDriverOutOf) do
        Wait(0)
        iterations = iterations + 1
        if 15 < iterations then
            iterations = 0
            VehicleForceOutPeds(self.carToKickDriverOutOf)
        end
    end
    VehicleSetEmergencyStop(self.carToKickDriverOutOf, false)
    self.isDriverKickedOutOfCar = true
end

function Tank:CheckForRespawn_NoTank()
    local player = Player()
    if player:PlayerNum() ~= playerintank then
        if not player:IsPlaying() then
            DoWasted()
            local position = self:GetOnFootRespawnPosition()
            self.localplayer:Respawn(position, position[4])
        end
    end
end

function Tank:CheckForEndGame()
    if self.EndOfGame == true then
        main.game.state = "StateGameWon"
        Wait(100)
        local unused_lcl1 = -1
        local unused_lcl2 = 0

        if IsServer() then
            for _, player in pairs(self.players) do
                self.client[player]:Stop()
            end
        end

        UpdateGameTime(false)
        local unused_lcl3 = Player(self.winningPlayer)
        local player = Player()
        local match_result = nil
        
        if player:PlayerNum() == self.winningPlayer then
            match_result = 1
        else
            match_result = 2
        end
        
        if match_result == 1 then
            DisplayFinalWinLoseMessage(match_result, "^S^")
        else
            DisplayFinalWinLoseMessage(match_result, "^S^")
        end

        main.scores:ToggleUpdate(false)
        main.scores:Show(true)
        Wait(12000)
        main.scores:Hide()
        main:EndGame()
    end
end

function Tank:Commentate(msg)
    main.commentary:Print(msg)
end

function Tank:Score(player)
    local score = 0
    score = self.totalmins[player:PlayerNum()] * 60
    score = score + self.totalseconds[player:PlayerNum()]
    return score
end

function Tank:RegisterPlayerKill(killed, killer, is_headshot)
    print("***RegisterPlayerKill***")
    local player = Player()
    if player:PlayerNum() == killed:PlayerNum() then
        if player:PlayerNum() == playerintank then
            if self.currentTank ~= nil then
                VehicleRemove3dMarker(self.currentTank)
            end
        end
    end
    
    self:UpdateDamageDoneToTank()
    if IsServer() then
        if killed:PlayerNum() == playerintank then
            if killed:InATank() then
                local dealt_most_damage = self:PlayerWhoDamagedTankMost()
                if dealt_most_damage ~= playerintank then
                    playerintank = dealt_most_damage
                else
                    self:ChoosePlayerInTank()
                end
                TargetPlayer(playerintank)
                print("The Tank is dead, Long live the Tank : " .. playerintank)
                self:DoSendEvent(TANKEVENT_PLAYERINTANK, playerintank, 0, 0)
            end
        end
    end

    local killer_name = killer:Name()
    local killed_name = killed:Name()
    if killed == killer then
        self:Commentate("^S^" .. killed_name .. "^S^ ^T^MPKSELF")
    elseif is_headshot then
        self:Commentate("^S^" .. killer_name .. "^S^ ^T^MPK^S^ " .. killed_name .. "^S^ ^T^MPKHEAD")
    else
        self:Commentate("^S^" .. killer_name .. "^S^ ^T^MPK^S^ " .. killed_name)
    end
end

function MultiTankClient:Run()
    if main.game.EndOfGame == false then
        local player_id = self.thisplayer:PlayerNum()
        self.gameseconds = GameElapsedMs()
        self.mins = 0
        self.seconds = 0
        while 0 < 1 do
            if playerintank == player_id then
                Wait(100)
                local elapsed = GameElapsedMs()
                if 1000 <= elapsed - self.gameseconds then
                    self.gameseconds = elapsed
                    self.seconds = self.seconds + 1
                    if self.seconds == 60 then
                        self.seconds = 0
                        self.mins = self.mins + 1
                    end
                    Tank:DoSendEvent(TANKEVENT_TIMEUPDATE, player_id, self.mins, self.seconds)
                end
            else
                Wait(500)
            end
        end
    end
end

function Tank:GetTimeMinutes(player)
    return self.totalmins[player]
end

function Tank:GetTimeSeconds(player)
    return self.totalseconds[player]
end

function MultiTankClient:CleanUp()
end

function Tank:DoSendEvent(ev_type, ev_param1, ev_param2, ev_param3)
    print("Sending event " .. ev_type .. " " .. ev_param1 .. " " .. ev_param2 .. " " .. ev_param3)
    local event = MaskEventNumber(ev_type, TANKEVENTMASK_NONE, TANKEVENTSHIFT_TYPE)     +
                  MaskEventNumber(ev_param1, TANKEVENTMASK_NONE, TANKEVENTSHIFT_PARAM1) +
                  MaskEventNumber(ev_param2, TANKEVENTMASK_NONE, TANKEVENTSHIFT_PARAM2) +
                  MaskEventNumber(ev_param3, TANKEVENTMASK_NONE, TANKEVENTSHIFT_PARAM3)
    SendEvent(event)
end

function Tank:ClearDamageArray()
    self.allPlayerDamage[1] = 0
    self.allPlayerDamage[2] = 0
    self.allPlayerDamage[3] = 0
    self.allPlayerDamage[4] = 0
    self.allPlayerDamage[5] = 0
    self.allPlayerDamage[6] = 0
    self.allPlayerDamage[7] = 0
    self.allPlayerDamage[8] = 0
end

function Tank:PlayerWhoDamagedTankMost()
    print("PlayerWhoDamagedTankMost")
    local number_of_players = table.getn(self.players)
    local unused_lcl = 1
    local max_damage = 0
    local player_index = 0
    for i = 1, number_of_players, 1 do
        if max_damage < self.allPlayerDamage[i] then
            max_damage = self.allPlayerDamage[i]
            player_index = i - 1
        end
    end
    return player_index
end

function Tank:ReceiveEvents()
    while not IsEventStackEmpty() do
        local event_code = GetEvent()
        if self.EndOfGame == true then
            return
        end

        local ev_type = MaskEventNumber(event_code, TANKEVENTMASK_TYPE, -TANKEVENTSHIFT_TYPE)
        local ev_param1 = MaskEventNumber(event_code, TANKEVENTMASK_PARAM1, -TANKEVENTSHIFT_PARAM1)
        local ev_param2 = MaskEventNumber(event_code, TANKEVENTMASK_PARAM2, -TANKEVENTSHIFT_PARAM2)
        local ev_param3 = MaskEventNumber(event_code, TANKEVENTMASK_PARAM3, -TANKEVENTSHIFT_PARAM3)
        local player = Player()

        if ev_type == TANKEVENT_TIMEUPDATE then
            self.totalmins[ev_param1] = ev_param2
            self.totalseconds[ev_param1] = ev_param3
            if ev_param1 == PlayerId() then
                if player:InATank() then
                    local minutes = nil
                    local seconds = nil
                    local time_left = GameScoreLimit() * 60000
                    time_left = time_left - ev_param2 * 60000
                    time_left = time_left - ev_param3 * 1000
                    minutes = math.floor(time_left / 1000 / 60)
                    time_left = math.floor(time_left - minutes * (1000 * 60))
                    seconds = math.floor(time_left / 1000)
                    local time_as_str = string.format("%d:%02d", minutes, seconds)
                    if self.tanktime ~= nil then
                        self.tanktime:Text("^S^" .. time_as_str)
                    end
                end
            end
        elseif ev_type == TANKEVENT_GAMEOVER then
            print("XXX TANKEVENT_GAMEOVER XXX")
            UpdateGameTime(false)
            self.winningPlayer = ev_param1
            self.EndOfGame = true
        elseif ev_type == TANKEVENT_TANK_DAMAGE then
            print("XXX TANKEVENT_TANK_DAMAGE XXX")
            print("Player " .. ev_param1 .. " Damaged It By = " .. ev_param2)
            local player = Player()
            if ev_param1 == player:PlayerNum() then
                self.tankDamage = self.tankDamage + ev_param2
                print("Player " .. ev_param1 .. " Total Damage = " .. self.tankDamage)
                
                local damage_percentage = self.tankDamage
                damage_percentage = self.tankDamage / 7.5
                if damage_percentage < 0 then
                    damage_percentage = 0
                elseif 100 < damage_percentage then
                    damage_percentage = 100
                end
                
                local damage_as_str = string.format("%.3d", damage_percentage)
                if self.tankDmgTxt ~= nil then
                    self.tankDmgTxt:Text("^S^ " .. damage_as_str .. "%")
                end
            end

            if IsServer() then
                self.allPlayerDamage[ev_param1 + 1] = self.allPlayerDamage[ev_param1 + 1] + ev_param2
            end
        elseif ev_type == TANKEVENT_PLAYERINTANK then
            playerintank = ev_param1
            print("MSG = TANKEVENT_PLAYERINTANK : Player In Tank = " .. playerintank)
            collectgarbage()

            if playerintank ~= PlayerId() then
                self.currentTank = nil
            end
            
            self.StartGameRunForTank = false
            if self.TankRadarBlip ~= nil then
                RemoveBlip(self.TankRadarBlip)
                self.TankRadarBlip = nil
            end

            self:ClearDamageArray()
            self.tankDamage = 0
            local damage_as_str = string.format("%.3d", self.tankDamage)

            if self.tankDmgTxt ~= nil then
                self.tankDmgTxt:Text("^S^ " .. damage_as_str .. "%")
            end

            if player:IsPlaying() then
                if PlayerId() ~= playerintank then
                    self:DisplayTankMessage(
                        "^S^ " .. Player(playerintank):Name() .. "^S^ ", 1500,
                        "^T^MPTANK", Player(playerintank):Colour(), {255, 255, 255, 255}
                    )
                end
            end

            local player = Player(playerintank)
            local player_colour = player:Colour()
            if self.tankDmgTxt ~= nil then
                self.tankDmgTxt:Colour(player_colour)
            end

            if self.tankDam ~= nil then
                self.tankDam:Colour(player_colour)
            end
        elseif ev_type == TANKEVENT_AQUIRE_TANK then
            playerintank = ev_param1
            print("MSG = TANKEVENT_AQUIRE_TANK : Player In Tank = " .. playerintank)
            self.StartGameRunForTank = false
            if self.TankRadarBlip ~= nil then
                RemoveBlip(self.TankRadarBlip)
                self.TankRadarBlip = nil
            end
            
            self:ClearDamageArray()
            if player:IsPlaying() then
                if PlayerId() ~= playerintank then
                    self:DisplayTankMessage(
                        "^S^ " .. Player(playerintank):Name() .. "^S^ ", 1500,
                        "^T^MPTANK", Player(playerintank):Colour(), {255, 255, 255, 255}
                    )
                end
            end

            local player = Player(playerintank)
            local player_colour = player:Colour()
            if self.tankDmgTxt ~= nil then
                self.tankDmgTxt:Colour(player_colour)
            end
            if self.tankDam ~= nil then
                self.tankDam:Colour(player_colour)
            end
        end
    end
end

function Tank:GetOnFootRespawnPosition()
    local position = {}
    main.vSpawnPoints = self.PlayerSpawnPoints
    position = DoSpawn(-1, false)
    return position
end

function Tank:GetTankRespawnPosition()
    print("GetTankRespawnPosition()")
    local position = {}
    main.vSpawnPoints = self.TankSpawnPoints
    position = DoSpawn(-1, false)
    return position
end

function Tank:ShowHUD(to_show)
    if self.tankDam ~= nil then
        self.tankDam:Remove()
        self.tankDam = nil
    end
    if self.tankDmgTxt ~= nil then
        self.tankDmgTxt:Remove()
        self.tankDmgTxt = nil
    end
    if self.tanktime ~= nil then
        self.tanktime:Remove()
        self.tanktime = nil
    end

    if to_show == true then
        local player = Player()
        self.tankDam = TextSprite(player, 420, 105, 2)
        self.tankDam:Scale(0.4048)
        self.tankDam:Style(1)
        self.tankDam:Colour(255, 255, 255, 255)
        self.tankDam:Text("^T^DAM")
        self.tankDmgTxt = TextSprite(player, 470, 105, 2)
        self.tankDmgTxt:Scale(0.4048)
        self.tankDmgTxt:Style(1)
        self.tankDmgTxt:Colour(255, 255, 255, 255)
        self.tankDmgTxt:Text("^S^000%")
        self.tanktime = TextSprite(player, 470, 85, 2)
        self.tanktime:Scale(0.4048)
        self.tanktime:Style(1)
        self.tanktime:Colour(Player():Colour())
        local minutes = nil
        local seconds = nil
        local time_left = GameScoreLimit() * 60000
        time_left = time_left - self:GetTimeMinutes(player:PlayerNum()) * 60000
        time_left = time_left - self:GetTimeSeconds(player:PlayerNum()) * 1000
        minutes = math.floor(time_left / 1000 / 60)
        time_left = math.floor(time_left - minutes * (1000 * 60))
        seconds = math.floor(time_left / 1000)
        local time_as_str = string.format("%d:%02d", minutes, seconds)
        self.tanktime:Text("^S^" .. time_as_str)
    end

    if self.StartGameRunForTank == false then
        local player = Player(playerintank)
        local player_colour = player:Colour()
        if self.tankDmgTxt ~= nil then
            self.tankDmgTxt:Colour(player_colour)
        end
        if self.tankDam ~= nil then
            self.tankDam:Colour(player_colour)
        end
    end
end

function Tank:DisplayTankMessage(msg1, unused_arg1, msg2, unused_arg2, unused_arg3)
    self:Commentate("^S^" .. msg1 .. "^S^ " .. msg2)
end

function MessageDisplay:CleanUp()
    print("Message Display CLEANUP")
end

function MessageDisplay:Run()
    main.game.SplashTextIsOnScreen = true
    main.game:ShowHUD(false)
    local player = Player()
    local sprite1 = TextSprite(player, 240, 83, 1)
    sprite1:Scale(0.47)
    sprite1:Style(0)
    sprite1:Colour(main.game.MsgColour1)
    sprite1:Text(main.game.Msg)
    
    local sprite2 = nil    
    if main.game.MsgLineTwo ~= nil then
        sprite2 = TextSprite(player, 240, 100, 1)
        sprite2:Scale(0.47)
        sprite2:Style(0)
        sprite2:Colour(main.game.MsgColour2)
        sprite2:Text(main.game.MsgLineTwo)
    end
    
    local iterations = 0
    while iterations < 100 do
        Wait(1)
        iterations = iterations + 1
        if main.game.removeSplashTextNow == true then
            main.game.removeSplashTextNow = false
            iterations = main.game.MsgLength
        end
        if player:IsPlaying() == false then
            iterations = main.game.MsgLength
        end
    end

    sprite1:Remove()
    if sprite2 then
        sprite2:Remove()
        main.game.MsgLineTwo = nil
    end
    main.game:ShowHUD(true)
    main.game.SplashTextIsOnScreen = false
end

function TankMessagePump:CleanUp()
    print("MESAGE PUMP CLEANUP")
end

function TankMessagePump:Run()
    while 1 do
        main.game:ReceiveEvents()
        Wait(50)
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
    main.game = Tank():Start()
    main:Start()
end
