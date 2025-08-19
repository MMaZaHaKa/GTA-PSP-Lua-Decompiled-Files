require "gta"
require "mainloop"
require "spawn"
require "Pickups"
require "PowerUps"
require "CutscenePlayer"

DTB = StateMachine{"StateInit"}
MessageDisplay = Script{}
ServerLogic = Script{}
KickOutOfCar = Script{}
PowerUpTimer = PowerupTimer()

DTBEVENTMASK_NONE = 16777215
DTBEVENTMASK_TYPE = 14680064
DTBEVENTMASK_PARAM1 = 1966080
DTBEVENTMASK_PARAM2 = 131008
DTBEVENTMASK_PARAM3 = 127
DTBEVENTSHIFT_TYPE = 21
DTBEVENTSHIFT_PARAM1 = 17
DTBEVENTSHIFT_PARAM2 = 7
DTBEVENTSHIFT_PARAM3 = 0
MSG_END_GAME = 1
MSG_TIMEUPDATE = 2
MSG_CAR_LOST = 3
MSG_NUM_CARS = 4
MSG_SWAP_TEAM = 5
LIMO_MODEL_INDEX = 140
IDAHO_MODEL_INDEX = 132
STINGER_MODEL_INDEX = 133
PONY_MODEL_INDEX = 144
ESPIRIT_MODEL_INDEX = 187
SHORCUT_VEHICLE_RESPAWN_TIME = 20000
teamId1 = 0
teamId2 = 1
team1RadarColour = 0
team2RadarColour = 2
radarColours = {0, 2}

function DTB:StateInit()
    DbgPrintAllOptions()
    local players = AllPlayers()
    local connected_players = table.getn(players)
    local iterations = 0
    while connected_players ~= GetExpectedNumberOfPlayers() and (iterations < 20) do
        print(
            "DTB is sat on its ass waiting for " ..
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
    self.mypickups = PickupMgr()
    self.mypickups:CreatePickups()
    self:InitGame()
    self.scores = {}
    self.teamscores = {}
    self.teamscores[1] = 0
    self.teamscores[2] = 0
    UseSuperBrakeOnPause(false)
    self.gameUnderway = false
    TeamGameEveryoneIn()

    return "StateRunning"
end

function DTB:CleanUp()
    print("DTB Cleanup")
    self.removeSplashTextNow = true
    Wait(20)
    if self.DefenceTimer ~= nil then
        self.DefenceTimer:Remove()
        self.DefenceTimer = nil
    end
    if self.carsLeftText ~= nil then
        self.carsLeftText:Remove()
        self.carsLeftText = nil
    end

    collectgarbage()

    if IsServer() then
        self.ServerLogic:Stop()
    end

    RenderHudExtras(false)
end

function DTB:InitGame()
    self.CarDealerships = {}
    self.DefenceStartPoints = {}
    self.DefenceSpawnPoints = {}
    self.AttackSpawnPoints = {}

    if GameLocation() == 0 then
        self.CarDealerships = {
            {{1217.5568, -133.5395, 14.4686}, 301.1606},
            {{1237.8014, -128.9969, 13.9326}, 71.6178},
            {{1223.91, -95.0671, 12.5592}, 169.2657},
            {{1237.8071, -90.7601, 12.128}, 4.3658}
        }
        self.DefenceStartPoints = {
            {{1245.5764, -119.3942, 13.9326}, 49.8267},
            {{1215.7571, -118.3896, 13.9326}, 359.5657},
            {{1216.8038, -65.0373, 9.5535}, 177.6218},
            {{1238.3368, -72.7951, 10.3317}, 141.8636},
            {{1243.1484, -85.036, 12.6}, 178.4465},
            {{1214.1349, -90.6364, 13.1644}, 47.1516},
            {{1227.0343, -112.0405, 14.9456}, 221.1017},
            {{1208.2361, -102.8584, 14.3751}, 32.3911}
        }
        self.DefenceSpawnPoints = {
            {{1141.7538, 39.4818, -1.5354}, 206.0494},
            {{1142.1028, -92.71, 6.4345}, 309.8683},
            {{1104.2711, -108.6361, 8.334}, 235.2965},
            {{1340.1337, -29.3839, 13.6599}, 80.7714},
            {{1313.1125, -77.7719, 16.2475}, 178.4465},
            {{1243.0214, -28.7687, 8.9407}, 47.1516},
            {{1174.9203, -68.5446, 7.4735}, 221.1017},
            {{1224.4297, -159.0303, 18.2364}, 32.3911}
        }
        self.AttackSpawnPoints = {
            {{1391.676, -847.2103, 10.7845}, 42.1146},
            {{1376.3102, -805.4339, 14.0399}, 179.8184},
            {{1375.8094, -873.0764, 10.7834}, 347.9834},
            {{1405.591, -882.0255, 10.7845}, 48.5241},
            {{1363.277, -911.0784, 11.868}, 208.3221},
            {{1417.5526, -825.066, 11.8318}, 300.7518},
            {{1420.734, -788.6942, 11.8318}, 77.0367},
            {{1375.7164, -782.0865, 12.7189}, 84.839}
        }
        self.ShortcutVehiclePoints = {
            {{1399.002, -873.7015, 10.7845}, 44.7779},
            {{1365.1599, -882.6797, 10.7834}, 268.7727}
        }
    elseif GameLocation() == 1 then
        self.CarDealerships = {
            {{325.7793, -518.8485, 33.8775}, 180.2599},
            {{285.2568, -534.7565, 35.9085}, 270.0513},
            {{327.5192, -539.9002, 29.0719}, 135.1706},
            {{273.0788, -543.1061, 26.169}, 80.8164}
        }
        self.DefenceStartPoints = {
            {{277.4468, -508.5923, 35.2345}, 176.7698},
            {{280.0491, -586.2841, 35.2345}, 327.2523},
            {{284.0731, -499.2168, 35.2345}, 168.0796},
            {{283.0218, -592.6252, 35.234}, 168.0796},
            {{291.3426, -604.3596, 36.2789}, 227.8495},
            {{274.2108, -603.1376, 38.1291}, 238.6174},
            {{298.0117, -487.9803, 36.2789}, 278.6122},
            {{299.5236, -529.2238, 36.2789}, 187.481}    
        }
        self.DefenceSpawnPoints = {
            {{282.7471, -604.0484, 36.2789}, 30.1763},
            {{277.7019, -486.0439, 36.2789}, 179.487},
            {{296.8509, -513.5869, 36.2789}, 345.2699},
            {{296.8509, -578.2233, 36.2789}, 275.487},
            {{291.3426, -604.3596, 36.2789}, 227.8495},
            {{274.2108, -603.1376, 38.1291}, 238.6174},
            {{298.0117, -487.9803, 36.2789}, 278.6122},
            {{299.5236, -529.2238, 36.2789}, 187.481}
        }
        self.AttackSpawnPoints = {
            {{0.1554, -1099.8416, 26.0555}, 58.9067},
            {{-14.6201, -1092.5254, 26.0555}, 58.9067},
            {{-40.271, -1079.4066, 26.0555}, 62.6046},
            {{-58.9729, -1057.5215, 25.1252}, 94.4561},
            {{-84.7132, -1115.6617, 25.0627}, 190.758},
            {{-71.9921, -1129.8163, 25.1292}, 316.9256},
            {{-64.1664, -1114.823, 25.1484}, 74.8882},
            {{-74.1739, -1154.3387, 25.1252}, 318.0018}
        }
        self.ShortcutVehiclePoints = {
            {{-55.9539, -1045.9575, 25.1281}, 68.3198},
            {{-55.5054, -1043.2014, 25.1281}, 74.7312}
        }
    elseif GameLocation() == 2 then
        self.CarDealerships = {
            {{-423.7345, 292.942, 61.9167}, 225.8497},
            {{-402.5321, 291.0504, 61.9155}, 260.4368},
            {{-365.3934, 286.3329, 61.6689}, 155.9908},
            {{-336.6916, 318.5909, 60.1936}, 285.8416}
        }
        self.DefenceStartPoints = {
            {{-413.0652, 283.408, 61.8324}, 267.8581},
            {{-381.3149, 298.5753, 62.8834}, 202.5833},
            {{-360.3683, 284.0265, 61.2464}, 114.312},
            {{-347.4209, 319.1649, 61.9605}, 176.4641},
            {{-425.4589, 264.1003, 62.9502}, 279.6114},
            {{-398.7724, 262.6876, 62.8707}, 286.5561},
            {{-335.1845, 297.4939, 62.9629}, 151.4842},
            {{-333.1377, 320.2585, 61.0138}, 93.0748}
        }
        self.DefenceSpawnPoints = {
            {{-290.5696, 275.6305, 65.9665}, 93.0181},
            {{-327.5276, 221.0008, 57.8212}, 47.8005},
            {{-456.9896, 252.5688, 69.0644}, 182.6544},
            {{-373.826, 367.0874, 87.4753}, 194.7484},
            {{-268.4596, 371.709, 78.8567}, 45.8441},
            {{-290.0363, 348.0956, 78.8597}, 141.8824},
            {{-306.4856, 310.2876, 72.4268}, 159.4434},
            {{-362.3963, 243.408, 60.6311}, 40.9095}
        }
        self.AttackSpawnPoints = {
            {{-1095.5054, 64.3309, 57.5367}, 84.0938},
            {{-1120.9008, 30.6547, 57.6976}, 7.049},
            {{-1136.0182, 28.5069, 57.772}, 340.8487},
            {{-1135.0078, 53.3453, 57.7624}, 22.5951},
            {{-1149.4758, 59.6414, 58.8562}, 79.0715},
            {{-1116.8956, 77.3148, 56.2307}, 186.7229},
            {{-1152.7574, 73.4037, 58.8566}, 340.4885},
            {{-1154.6077, 44.9693, 58.8566}, 181.1303}
        }
        self.ShortcutVehiclePoints = {
            {{-1126.7122, 38.2038, 58.7535}, 29.4243},
            {{-1138.4674, 69.3489, 58.8249}, 178.7971}
        }
    end

    IsTeamGame(true)
    GameElapsedMs(0)
    DisablePlayer(true)
    DefendingTeam(1)
    self.InitialSpawn = true
    self.finalSyncCarsSent = false
    self.gameseconds = 0
    self.mins = 0
    self.seconds = 0
    self.winningTeam = 1
    self.removeSplashTextNow = false
    self.MissionVehicle1 = nil
    self.MissionVehicle2 = nil
    self.MissionVehicle3 = nil
    self.MissionVehicle4 = nil
    self.ShortcutVehicle1 = nil
    self.ShortcutVehicle2 = nil
    self.ShortcutRespawnTimer = 0
    self.ShortcutRespawnLastUpdate = GameElapsedMs()
    self.Car1Destroyed = false
    self.Car2Destroyed = false
    self.Car3Destroyed = false
    self.Car4Destroyed = false
    self.TimeToBeat = 0
    self.FinalRound = false
    self.RoundsPlayed = 0
    self.timeRanOut = false
    self.SplashTextIsOnScreen = false
    self.BaseBlip = nil
    self.VehiclesLeftThisRound = 4
    self.ChangeSides = true
    self.EndOfGame = false
    local player = Player()
    self.DefenceTimer = nil
    self.carsLeftText = nil
    self:ShowHUD(false)

    if IsServer() then
        if UsePowerups() then
            PowerUpTimer:Start()
        end
    end

    Wait(1000)

    local opponents = {}
    if player:TeamId() == teamId1 then
        opponents = TeamPlayers(teamId2)
    else
        opponents = TeamPlayers(teamId1)
    end

    for _, opponent in pairs(opponents) do
        opponent:SetRadarBlipShortRange(true)
    end

    if IsServer() then
        self.ServerLogic = ServerLogic()
        self.ServerLogic:Start()
    end
end

function DTB:StateRunning()
    if self.EndOfGame == false then
        self:CheckChangeSides()
        self:CheckForRespawn()
        self:UpdateScores()
        self:UpdateLocalPlayer()
        self:ProcessNetworkEvents()
        self:CheckIfEndOfGame()
        collectgarbage()
    end
end

function ServerLogic:Run(unused_arg1, unused_arg2, unused_arg3)
    while 1 do
        main.game:UpdateMissionVehicles()
        main.game:SwapAttackDefend()
        main.game:UpdateShortcutVehicles()
        main.game:UpdateTimers()
        Wait(10)
    end
end

function ServerLogic:CleanUp()
    print("Server Logic Cleanup")
end

function DTB:UpdateTimers()
    if self.EndOfGame == true then
        return
    end

    local elapsed = GameElapsedMs()
    if elapsed - self.gameseconds >= 1000 then
        self.gameseconds = elapsed
        self.seconds = self.seconds + 1
        if self.seconds == 60 then
            self.seconds = 0
            self.mins = self.mins + 1
        end
        self:DoSendEvent(MSG_TIMEUPDATE, 0, self.mins, self.seconds)
        self:DoSendEvent(MSG_NUM_CARS, 0, self.VehiclesLeftThisRound, 0)
    end
end

function DTB:DoSendEvent(ev_type, ev_param1, ev_param2, ev_param3)
    print("Sending event " .. ev_type .. " " .. ev_param1 .. " " .. ev_param2 .. " " .. ev_param3)
    local event = MaskEventNumber(ev_type, DTBEVENTMASK_NONE, DTBEVENTSHIFT_TYPE)     +
                  MaskEventNumber(ev_param1, DTBEVENTMASK_NONE, DTBEVENTSHIFT_PARAM1) +
                  MaskEventNumber(ev_param2, DTBEVENTMASK_NONE, DTBEVENTSHIFT_PARAM2) +
                  MaskEventNumber(ev_param3, DTBEVENTMASK_NONE, DTBEVENTSHIFT_PARAM3)
    SendEvent(event)
end

function DTB:CheckForRespawn()
    local player = Player()
    if not player:IsPlaying() then
        self.removeSplashTextNow = true
        Wait(20)
        DoWasted()
        local position = self:GetPlayerRespawnPosition()
        player:Respawn(position)
        if self.ChangeSides == false then
            self:DisplayAttackDefendMessage()
        end
    end
end

function DTB:UpdateLocalPlayer()
end

function DTB:UpdateMissionVehicles()
    if IsServer() then
        if self.MissionVehicle1 ~= nil then
            if self.Car1Destroyed == false then
                if VehicleHealth(self.MissionVehicle1) <= 0 then
                    VehicleRemove3dMarker(self.MissionVehicle1)
                    if self.Car1Destroyed == false then
                        self.VehiclesLeftThisRound = self.VehiclesLeftThisRound - 1
                        self:DoSendEvent(MSG_CAR_LOST, 0, 0, 0)
                        self.Car1Destroyed = true
                    end
                end
            end
        end
        if self.MissionVehicle2 ~= nil then
            if self.Car2Destroyed == false then
                if VehicleHealth(self.MissionVehicle2) <= 0 then
                    VehicleRemove3dMarker(self.MissionVehicle2)
                    if self.Car2Destroyed == false then
                        self.VehiclesLeftThisRound = self.VehiclesLeftThisRound - 1
                        self:DoSendEvent(MSG_CAR_LOST, 0, 0, 0)
                        self.Car2Destroyed = true
                    end
                end
            end
        end
        if self.MissionVehicle3 ~= nil then
            if self.Car3Destroyed == false then
                if VehicleHealth(self.MissionVehicle3) <= 0 then
                    VehicleRemove3dMarker(self.MissionVehicle3)
                    if self.Car3Destroyed == false then
                        self.VehiclesLeftThisRound = self.VehiclesLeftThisRound - 1
                        self:DoSendEvent(MSG_CAR_LOST, 0, 0, 0)
                        self.Car3Destroyed = true
                    end
                end
            end
        end
        if self.MissionVehicle4 ~= nil then
            if self.Car4Destroyed == false then
                if VehicleHealth(self.MissionVehicle4) <= 0 then
                    VehicleRemove3dMarker(self.MissionVehicle4)
                    if self.Car4Destroyed == false then
                        self.VehiclesLeftThisRound = self.VehiclesLeftThisRound - 1
                        self:DoSendEvent(MSG_CAR_LOST, 0, 0, 0)
                        self.Car4Destroyed = true
                    end
                end
            end
        end
    end
end

function DTB:UpdateShortcutVehicles()
    if IsServer() then
        if self.EndOfGame == true then
            return
        end
        
        local shortcut_vehicle1 = nil
        local shortcut_vehicle2 = nil
        if GameLocation() == 0 then
            shortcut_vehicle1 = IDAHO_MODEL_INDEX
            shortcut_vehicle2 = STINGER_MODEL_INDEX
        elseif GameLocation() == 1 then
            shortcut_vehicle1 = STINGER_MODEL_INDEX
            shortcut_vehicle2 = ESPIRIT_MODEL_INDEX
        elseif GameLocation() == 2 then
            shortcut_vehicle1 = PONY_MODEL_INDEX
            shortcut_vehicle2 = ESPIRIT_MODEL_INDEX
        end
        
        local center = {}
        if self.ShortcutRespawnTimer <= 0 then
            if self.ShortcutVehicle1 == nil then
                center[1] = self.ShortcutVehiclePoints[1][1][1]
                center[2] = self.ShortcutVehiclePoints[1][1][2]
                center[3] = self.ShortcutVehiclePoints[1][1][3]
                if IsSphereOnScreen(center, 5, 100) == false then
                    self.ShortcutVehicle1 = CreateVehicle(shortcut_vehicle1, center, self.ShortcutVehiclePoints[1][2])
                    self.ShortcutRespawnTimer = SHORCUT_VEHICLE_RESPAWN_TIME
                end
            end
            if self.ShortcutVehicle2 == nil then
                center[1] = self.ShortcutVehiclePoints[2][1][1]
                center[2] = self.ShortcutVehiclePoints[2][1][2]
                center[3] = self.ShortcutVehiclePoints[2][1][3]
                if IsSphereOnScreen(center, 5, 100) == false then
                    self.ShortcutVehicle2 = CreateVehicle(shortcut_vehicle2, center, self.ShortcutVehiclePoints[2][2])
                    self.ShortcutRespawnTimer = SHORCUT_VEHICLE_RESPAWN_TIME
                end
            end
        end

        if IsVehicleWrecked(self.ShortcutVehicle1) then
            self.ShortcutVehicle1 = nil
        end
        if IsVehicleWrecked(self.ShortcutVehicle2) then
            self.ShortcutVehicle2 = nil
        end

        if self.ShortcutVehicle1 == nil or self.ShortcutVehicle2 == nil then
            self.ShortcutRespawnTimer = self.ShortcutRespawnTimer - (GameElapsedMs() - self.ShortcutRespawnLastUpdate)
        end
        self.ShortcutRespawnLastUpdate = GameElapsedMs()
    end
end

function DTB:UpdateRadar()
    if IsServer() then
        local coordinates = {}
        coordinates[1] = self.CarDealerships[2][1][1]
        coordinates[2] = self.CarDealerships[2][1][2]
        coordinates[3] = self.CarDealerships[2][1][3]

        if self.BaseBlip == nil then
            self.BaseBlip = AddBlipForCoord(coordinates, radarColours[DefendingTeam()], pickupicon.base)
        end
    end
end

function DTB:SpawnMissionVehicles()
    if IsServer() then
        local dealership_index = 1
        local colour1 = 0
        local colour2 = 0

        if DefendingTeam() == 1 then
            colour1 = 3
            colour2 = 0
        else
            colour1 = 7
            colour2 = 0
        end

        local coordinates = {}
        coordinates[1] = self.CarDealerships[dealership_index][1][1]
        coordinates[2] = self.CarDealerships[dealership_index][1][2]
        coordinates[3] = self.CarDealerships[dealership_index][1][3]
        self.MissionVehicle1 = CreateVehicle(
            LIMO_MODEL_INDEX, coordinates,
            self.CarDealerships[dealership_index][2], colour1, colour2
        )
        VehicleAdd3dMarker(self.MissionVehicle1)

        coordinates[1] = self.CarDealerships[dealership_index + 1][1][1]
        coordinates[2] = self.CarDealerships[dealership_index + 1][1][2]
        coordinates[3] = self.CarDealerships[dealership_index + 1][1][3]
        self.MissionVehicle2 = CreateVehicle(
            LIMO_MODEL_INDEX, coordinates,
            self.CarDealerships[dealership_index + 1][2], colour1, colour2
        )
        VehicleAdd3dMarker(self.MissionVehicle2)

        coordinates[1] = self.CarDealerships[dealership_index + 2][1][1]
        coordinates[2] = self.CarDealerships[dealership_index + 2][1][2]
        coordinates[3] = self.CarDealerships[dealership_index + 2][1][3]
        self.MissionVehicle3 = CreateVehicle(
            LIMO_MODEL_INDEX, coordinates,
            self.CarDealerships[dealership_index + 2][2], colour1, colour2
        )
        VehicleAdd3dMarker(self.MissionVehicle3)

        coordinates[1] = self.CarDealerships[dealership_index + 3][1][1]
        coordinates[2] = self.CarDealerships[dealership_index + 3][1][2]
        coordinates[3] = self.CarDealerships[dealership_index + 3][1][3]
        self.MissionVehicle4 = CreateVehicle(
            LIMO_MODEL_INDEX, coordinates,
            self.CarDealerships[dealership_index + 3][2], colour1, colour2
        )
        VehicleAdd3dMarker(self.MissionVehicle4)

        self.Car1Destroyed = false
        self.Car2Destroyed = false
        self.Car3Destroyed = false
        self.Car4Destroyed = false

        VehicleSetCarDoorLocks(self.MissionVehicle1, CARLOCK_LOCKED)
        VehicleSetCarDoorLocks(self.MissionVehicle2, CARLOCK_LOCKED)
        VehicleSetCarDoorLocks(self.MissionVehicle3, CARLOCK_LOCKED)
        VehicleSetCarDoorLocks(self.MissionVehicle4, CARLOCK_LOCKED)
    end
end

function DTB:DisplayDefenceTimer()
    local unused_lcl = Player()
    local time_passed_or_left = nil
    local minutes = nil
    local seconds = nil
    local time_as_str = nil
    if self.RoundsPlayed == 1 then
        time_passed_or_left = self:DefenceTimeInMs()
        minutes = math.floor(time_passed_or_left / 1000 / 60)
        time_passed_or_left = time_passed_or_left - minutes * (1000 * 60)
        seconds = time_passed_or_left / 1000
        if 99 < minutes then
            minutes = 99
        end
        time_as_str = string.format("%d:%02d", minutes, seconds)
    else
        time_passed_or_left = self.TimeToBeat - self:DefenceTimeInMs()
        if time_passed_or_left < 0 then
            time_passed_or_left = 0
        end
        minutes = math.floor(time_passed_or_left / 1000 / 60)
        time_passed_or_left = time_passed_or_left - minutes * (1000 * 60)
        seconds = time_passed_or_left / 1000
        time_as_str = string.format("%d:%02d", minutes, seconds)
    end

    if self.DefenceTimer ~= nil then
        self.DefenceTimer:Text("^S^" .. time_as_str)
    end

    if self.carsLeftText ~= nil then
        if DefendingTeam() == 1 then
            self.carsLeftText:Colour(GameColour(teamId1))
        else
            self.carsLeftText:Colour(GameColour(teamId2))
        end
        self.carsLeftText:Text("^S^" .. self.VehiclesLeftThisRound)
    end
end

function DTB:Commentate(msg)
    main.commentary:Print(msg)
end

function DTB:GetTheWiningTeam()
    local result = 0
    if GameElapsedMs() > self.TimeToBeat then
        result = DefendingTeam()
    elseif GameElapsedMs() == self.TimeToBeat then
        result = 0
    else
        if DefendingTeam() == 1 then
            result = 2
        else
            result = 1
        end
    end

    if result == 0 then
        print("Draw")
    elseif result == 1 then
        print("Blue Team Wins")
    else
        print("Red Team Wins")
    end

    return result
end

function DTB:CheckIfEndOfGame()
    if self.EndOfGame == true then
        print("End Of Game Reached")
        self:DisplayDefenceTimer()
        collectgarbage()
        UpdateGameTime(false)
        DisablePlayer(true)
        main.game.state = "StateGameWon"
        self.removeSplashTextNow = true
        Wait(20)
        local winning_team = self.winningTeam
        local player = Player()
        local match_result = nil
        if player:TeamId() == winning_team - 1 then
            match_result = 1
        else
            match_result = 2
        end
        self.removeSplashTextNow = true
        Wait(20)
        DisplayFinalWinLoseMessage(match_result, "^S^", winning_team - 1)
        main.scores:ToggleUpdate(false)
        main.scores:Show(true)
        Wait(12000)
        main.scores:Hide()
        main:EndGame()
        self:CleanUp()
    end
end

function DTB:SwapAttackDefend()
    if IsServer() then
        if self.EndOfGame == true then
            return
        end
        local player = Player()
        local timer_ran_out = false
        if self.RoundsPlayed == 2 then
            if self:DefenceTimeInMs() > self.TimeToBeat then
                timer_ran_out = true
                self.timeRanOut = true
            end
        end

        if
        self.MissionVehicle1 ~= nil and IsVehicleWrecked(self.MissionVehicle1) == true and
        self.MissionVehicle2 ~= nil and IsVehicleWrecked(self.MissionVehicle2) == true and
        self.MissionVehicle3 ~= nil and IsVehicleWrecked(self.MissionVehicle3) == true and
        self.MissionVehicle4 ~= nil and IsVehicleWrecked(self.MissionVehicle4) == true or
        timer_ran_out == true then
            if self.EndOfGame == false then
                if self.finalSyncCarsSent == true then  -- Isn't it supposed to be false?
                    print("Sync Num Cars At Change Sides")
                    self.VehiclesLeftThisRound = 0
                    self:DoSendEvent(MSG_NUM_CARS, 0, self.VehiclesLeftThisRound, 0)
                    self.finalSyncCarsSent = true
                    Wait(100)
                end
            end
            UpdateGameTime(false)
            if self.ShortcutVehicle1 ~= nil then
                if VehicleIsDrivenByPlayer(self.ShortcutVehicle1) == true then
                    self:KickDriverOutOfCar(self.ShortcutVehicle1)
                end
            end
            if self.ShortcutVehicle2 ~= nil then
                if VehicleIsDrivenByPlayer(self.ShortcutVehicle2) == true then
                    self:KickDriverOutOfCar(self.ShortcutVehicle2)
                end
            end
            DeleteVehicle(self.ShortcutVehicle1)
            DeleteVehicle(self.ShortcutVehicle2)

            if IsLocalPlayerEnteringAVehicle() then
                return
            end

            if player:IsPlaying() == false then
                return
            end

            if IsLocalPlayerInVehicle() then
                print("Ped is in a vehicle, get the f*ck out !!!")
                self:KickDriverOutOfCar(GetLocalPlayersVehicle())
            end

            if self.FinalRound == false then
                self.FinalRound = true
                if self.BaseBlip ~= nil then
                    RemoveBlip(self.BaseBlip)
                    self.BaseBlip = nil
                end

                VehicleRemove3dMarker(self.MissionVehicle1)
                VehicleRemove3dMarker(self.MissionVehicle2)
                VehicleRemove3dMarker(self.MissionVehicle3)
                VehicleRemove3dMarker(self.MissionVehicle4)

                local zero = {0, 0, 0}
                ClearArea(zero, 99999)
                Wait(100)
                
                local coordinates = {}
                coordinates[1] = self.ShortcutVehiclePoints[1][1][1]
                coordinates[2] = self.ShortcutVehiclePoints[1][1][2]
                coordinates[3] = self.ShortcutVehiclePoints[1][1][3]
                self.ShortcutVehicle1 = CreateVehicle(
                    IDAHO_MODEL_INDEX, coordinates, self.ShortcutVehiclePoints[1][2]
                )

                coordinates[1] = self.ShortcutVehiclePoints[2][1][1]
                coordinates[2] = self.ShortcutVehiclePoints[2][1][2]
                coordinates[3] = self.ShortcutVehiclePoints[2][1][3]
                self.ShortcutVehicle2 = CreateVehicle(
                    STINGER_MODEL_INDEX, coordinates, self.ShortcutVehiclePoints[2][2]
                )
                
                self.ShortcutRespawnTimer = 0
                self.ShortcutRespawnLastUpdate = GameElapsedMs()
                Wait(3000)
                DeleteVehicle(self.MissionVehicle1)
                DeleteVehicle(self.MissionVehicle2)
                DeleteVehicle(self.MissionVehicle3)
                DeleteVehicle(self.MissionVehicle4)
                self.MissionVehicle1 = nil
                self.MissionVehicle2 = nil
                self.MissionVehicle3 = nil
                self.MissionVehicle4 = nil

                print("Sending MSG_SWAP_TEAM")
                self:DoSendEvent(MSG_SWAP_TEAM, 0, self.mins, self.seconds)
            else
                if self.EndOfGame == false then
                    if 2 <= self.RoundsPlayed then
                        print("Sending END Rounds ==" .. self.RoundsPlayed)
                        local winning_team = nil
                        winning_team = self:GetTheWiningTeam()
                        print("winningTeam == " .. winning_team)
                        if self.timeRanOut == true then
                            self:DoSendEvent(MSG_END_GAME, 0, winning_team, 1)
                        else
                            self:DoSendEvent(MSG_END_GAME, 0, winning_team, 0)
                        end
                    end
                end
            end
        end
    end
end

function DTB:CheckChangeSides()
    if self.ChangeSides == true then
        if IsLocalPlayerEnteringAVehicle() then
            return
        end
        if IsLocalPlayerInVehicle() then
            print("Ped is in a vehicle, get the f*ck out !!!")
            self:KickDriverOutOfCar(GetLocalPlayersVehicle())
        end
        print("Changing Sides")
        self:DisplayDefenceTimer()
        if self.SplashTextIsOnScreen == true then
            self.removeSplashTextNow = true
            Wait(20)
        end
        collectgarbage()
        RenderHudExtras(false)
        DisablePlayer(true)
        self.ChangeSides = false
        self.InitialSpawn = true
        self.TimeToBeat = self:DefenceTimeInMs()
        if self.gameUnderway == true then
            self:ShowHUD(false)
            main.scores:Hide(true)
            RenderPauseScreenStuffNoBox(true)
            SetPauseScreenSelection(-1)
            local player = Player()
            
            local sprite1 = TextSprite(player, 235, 90, 1)
            sprite1:Order(-1)
            sprite1:Scale(0.32)
            sprite1:Style(0)
            local sprite2 = TextSprite(player, 235, 120, 1)
            sprite2:Order(-1)
            sprite2:Scale(0.32)
            sprite2:Style(0)
            local sprite3 = TextSprite(player, 235, 150, 1)
            sprite3:Order(-1)
            sprite3:Scale(0.31)
            sprite3:Style(0)
            
            local time_passed = nil
            local minutes = nil
            local seconds = nil
            local time_as_str = nil
            time_passed = self:DefenceTimeInMs()
            minutes = math.floor(time_passed / 1000 / 60)
            time_passed = time_passed - minutes * (1000 * 60)
            seconds = time_passed / 1000
            if 99 < minutes then
                minutes = 99
            end
            time_as_str = string.format("%d:%02d", minutes, seconds)

            if player:TeamId() + 1 == DefendingTeam() then
                sprite1:Colour(GameColour(teamId2))
                sprite3:Colour(GameColour(teamId2))
                sprite2:Colour(GameColour(teamId2))
                sprite1:Text("^T^DTBSWPA")
                sprite2:Text("^S^" .. time_as_str)
                sprite3:Text("^T^DTBSWPB")
            else
                sprite1:Colour(GameColour(teamId1))
                sprite3:Colour(GameColour(teamId1))
                sprite2:Colour(GameColour(teamId1))
                sprite1:Text("^T^DTBSWPC")
                sprite2:Text("^S^" .. time_as_str)
                sprite3:Text("^T^DTBSWPD")
            end
            
            local iterations = 0
            while iterations < 200 do
                DisablePlayer(true)
                ClearMessages()
                Wait(1)
                iterations = iterations + 1
            end
            
            -- Interesting order
            sprite1:Remove()
            sprite3:Remove()
            sprite2:Remove()

            RenderPauseScreenStuffNoBox(false)
            self:ShowHUD(true)
            main.scores:Hide(false)
        end

        CameraFadeOut(5)
        RegenerateAllPickups()

        if IsServer() then
            if UsePowerups() then
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
        
        self.VehiclesLeftThisRound = 4
        if DefendingTeam() == 1 then
            DefendingTeam(2)
        else
            DefendingTeam(1)
        end
        self:UpdateRadar()
        self:SpawnMissionVehicles()
        
        local player = Player()
        local position = self:GetPlayerRespawnPosition()
        player:Respawn(position)
        
        Wait(1000)
        if self.gameUnderway == false then
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
            self.gameUnderway = true
            self:ShowHUD(true)
        end
        
        GenerateAmbients(true)
        RenderHudExtras(true)
        GameElapsedMs(0)
        self.gameseconds = 0
        self.mins = 0
        self.seconds = 0
        UpdateGameTime(true)
        self:DisplayDefenceTimer()
        self.RoundsPlayed = self.RoundsPlayed + 1
        ExtinguishAllFires()
        CameraFadeIn(5)
        self:DisplayAttackDefendMessage()
        DisablePlayer(false)
    end
end

function DTB:KickDriverOutOfCar(car)
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

function DTB:ProcessNetworkEvents()
    if IsEventStackEmpty() == false then
        local player = Player()
        local event_code = GetEvent()
        local ev_type = MaskEventNumber(event_code, DTBEVENTMASK_TYPE, -DTBEVENTSHIFT_TYPE)
        local ev_param1 = MaskEventNumber(event_code, DTBEVENTMASK_PARAM1, -DTBEVENTSHIFT_PARAM1)
        local ev_param2 = MaskEventNumber(event_code, DTBEVENTMASK_PARAM2, -DTBEVENTSHIFT_PARAM2)
        local ev_param3 = MaskEventNumber(event_code, DTBEVENTMASK_PARAM3, -DTBEVENTSHIFT_PARAM3)

        if ev_type == MSG_SWAP_TEAM then
            print("MSG_SWAP_TEAM")
            self.mins = ev_param2
            self.seconds = ev_param3
            self.ChangeSides = true
            if self.SplashTextIsOnScreen == true then
                self.removeSplashTextNow = true
                Wait(20)
            end
        elseif ev_type == MSG_TIMEUPDATE then
            if self.ChangeSides == false then
                print("MSG_TIMEUPDATE Mins ==" .. ev_param2 .. " Seconds==" .. ev_param3)
                self.mins = ev_param2
                self.seconds = ev_param3
                self:DisplayDefenceTimer()
            end
        elseif ev_type == MSG_END_GAME then
            print("MSG_END_GAME")
            self.winningTeam = ev_param2
            self.EndOfGame = true
            self:DisplayDefenceTimer()
            if ev_param3 == 0 then
                print("Time Did Not Run Out")
                self.timeRanOut = false
            else
                print("Time Ran Out")
                self.timeRanOut = true
            end
        elseif ev_type == MSG_CAR_LOST then
            print("MSG_CAR_LOST")
            if player:TeamId() + 1 == DefendingTeam() then
                if player:TeamId() == 0 then
                    self:DisplayMessage("^t^MTN_1", 750, "^t^DTB03", true)
                else
                    self:DisplayMessage("^t^MTN_2", 750, "^t^DTB03", true)
                end
            else
                if player:TeamId() == 0 then
                    self:DisplayMessage("^t^MTN_1", 750, "^t^DTB04", true)
                else
                    self:DisplayMessage("^t^MTN_2", 750, "^t^DTB04", true)
                end
            end
            self:DisplayDefenceTimer()
        elseif ev_type == MSG_NUM_CARS then
            if IsServer() == false then
                self.VehiclesLeftThisRound = ev_param2
            end
        end
    end
end

function DTB:DisplayAttackDefendMessage()
    if self.SplashTextIsOnScreen == true then
        self.removeSplashTextNow = true
        Wait(20)
    end
    local player = Player()
    if player:TeamId() + 1 == DefendingTeam() then
        if player:TeamId() == 0 then
            self:DisplayMessage("^t^MTN_1", 1000, "^t^DTB01", true)
        else
            self:DisplayMessage("^t^MTN_2", 1000, "^t^DTB01", true)
        end
    else
        if player:TeamId() == 0 then
            self:DisplayMessage("^t^MTN_1", 1000, "^t^DTB02", true)
        else
            self:DisplayMessage("^t^MTN_2", 1000, "^t^DTB02", true)
        end
    end
end

function DTB:DisplayMessage(msg1, unused_arg1, msg2, unused_arg2)
    if self.SplashTextIsOnScreen == false then
        local player = Player()
        if player:TeamId() == 1 then
            self:Commentate("^S^~b~" .. msg1 .. "^S^ ~w~" .. msg2)
        else
            self:Commentate("^S^~r~" .. msg1 .. "^S^ ~w~" .. msg2)
        end
    end
end

function MessageDisplay:CleanUp()
    print("Message Display CLEANUP")
end

function MessageDisplay:Run()
    main.game.SplashTextIsOnScreen = true
    local player = Player()
    local sprite1 = TextSprite(player, 235, 86, 1)
    sprite1:Scale(1.2)
    sprite1:Style(2)
    sprite1:Colour(main.game.MsgColour[1], main.game.MsgColour[2], main.game.MsgColour[3], main.game.MsgColour[4])
    sprite1:Text(main.game.Msg)
    local sprite2 = TextSprite(player, 235, 125, 1)
    sprite2:Scale(0.4, 1)
    sprite2:Style(0)
    sprite2:Colour({255, 255, 255, 255})
    sprite2:Text(main.game.Msg2)

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
    sprite2:Remove()
    main.game.SplashTextIsOnScreen = false
end

function DTB:GetPlayerRespawnPosition()
    local player = Player()
    local position = {}

    if player:TeamId() + 1 == DefendingTeam() then
        if self.InitialSpawn == true then
            self.InitialSpawn = false
            main.vSpawnPoints = self.DefenceStartPoints
            print("Doing initial spawn")
            position = DoSpawn(InitialSpawnPoint(PlayerId()), false)
        else
            main.vSpawnPoints = self.DefenceSpawnPoints
            position = DoSpawn(nil, false)
        end
    else
        main.vSpawnPoints = self.AttackSpawnPoints
        if self.InitialSpawn then
            print("Doing initial spawn")
            position = DoSpawn(InitialSpawnPoint(PlayerId()), false)
        else
            position = DoSpawn(nil, false)
        end
    end
    return position
end

function DTB:UpdateScores()
    self.teamscores[DefendingTeam()] = self:DefenceTimeInMs()
end

function DTB:TeamScore(team)
    return self.teamscores[team + 1]
end

function DTB:DefenceTimeInMs()
    return self.seconds * 1000 + self.mins * 60000
end

function DTB:DidWinBecauseTimeRanOut()
    return self.timeRanOut
end

function DTB:ShowHUD(to_show)
    if self.DefenceTimer ~= nil then
        self.DefenceTimer:Remove()
        self.DefenceTimer = nil
    end
    if self.carsLeftText ~= nil then
        self.carsLeftText:Remove()
        self.carsLeftText = nil
    end

    if to_show == true then
        local player = Player()
        self.DefenceTimer = TextSprite(player, 470, 82, 2)
        self.DefenceTimer:Scale(0.4048)
        self.DefenceTimer:Style(1)
        self.DefenceTimer:Colour(255, 255, 255, 255)
        self.DefenceTimer:Text("^S^    ")
        self.carsLeftText = TextSprite(player, 470, 102, 2)
        self.carsLeftText:Scale(0.4048)
        self.carsLeftText:Style(1)
        self.carsLeftText:Text("^S^    ")
    end
end

function DTB:RegisterPlayerKill(killed, killer, is_headshot)
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

function Main()
    print("lua Main()")
    main = MainLoop{}
    main.commentary = Commentary{}:Start()
    main.scores = ScoreSheetScript{}:Start()
    InitSpawnPoints()
    local spawn_index = 0
    spawn_index = math.random(1, table.getn(main.vSpawnPoints))
    print("lua CreatePlayer()")
    CreatePlayer(unpack(main.vSpawnPoints[spawn_index][1]))
    PlayerName(HostName())
    main.game = DTB():Start()
    main:Start()
end
