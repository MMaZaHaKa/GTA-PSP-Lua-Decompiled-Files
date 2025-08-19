require "PickupBlips"

FreeRoam = StateMachine{"StateInit"}

function FreeRoam:StateInit()
    IsTeamGame(false)
    self:CreatePickups()
    self:Commentate("FreeRoam started!")
    self.scores = {}
    return "StateRunning"
end

function FreeRoam:CleanUp()
    self.pickupBlipScript:Stop()
    for _, pickup in ipairs(self.pickups) do
        pickup:Remove()
    end
end

function FreeRoam:DoSpawn()
    local player = Player()
    local spawn_index = 0
    spawn_index = math.random(1, table.getn(main.vSpawnPoints))
    while LocatePlayer(unpack(main.vSpawnPoints[spawn_index])) do
        spawn_index = math.random(1, table.getn(main.vSpawnPoints))
    end

    print("Respawn called at point " .. spawn_index)
    player:Respawn(unpack(main.vSpawnPoints[spawn_index]))

    return "Running"
end

function FreeRoam:CreatePickups()
    self.pickups = {}
    if not IsServer() then
        return
    end

    local pickups = {}
    if GameLocation() == 0 then
        pickups = {
            {"ROCKETLA", {1319.69, -275.8, 15}, 60},
            {"FLAME", {1218.43, -134.05, 15.6}, 60},
            {"SHOTGSPA", {1125.21, 46.93, 4.3}, 60},
            {"KATANA", {1157.92, -189.99, 14.7}, 60},
            {"SNIPER", {1217.73, -239.52, 32.7}, 60},
            {"ROCKETLA", {1557.75, -215.43, 58.6}, 60},
            {"M4", {1311.2, -463.15, 59.07}, 60},
            {"CHROMEGUN", {1323.43, -529.72, 42.7}, 60},
            {"MP5K", {1156.94, -454.32, 21.3}, 60},
            {"MP5K", {1093.17, -409.97, 14.8}, 60},
            {"LASER", {1445.56, -852.3, 32.33}, 60},
            {"M60", {1431.3, -531.92, 16}, 60},
            {"UZI", {1276.97, 381.41, 33.69}, 60},
            {"MP5K", {1311.12, -315.79, 42.06}, 60},
            {"LASER", {1025.17, -392.37, 14.86}, 60},
            {"MP5K", {1020.26, -340.25, 14.9}, 60},
            {"FLAME", {959.6, -330.4, 9.6}, 60},
            {"MP5K", {955, -246.9, 4.76}, 60},
            {"SNIPER", {1205.53, -1021.48, 21.67}, 60},
            {"M4", {1495.79, -1155.84, 12.14}, 60},
            {"SNIPER", {1189.8444, -1127.639, 16.964}, 60},
            {"GLOCK17", {1115.7642, -1245.2356, 10.5215}, 60},
            {"MINIGUN", {949.8057, -1114.218, 12.1322}, 60},
            {"GLOCK17", {936.4595, -933.3459, 18.1263}, 60},
            {"PYTHON", {828.6426, -1053.7435, 13.3173}, 60},
            {"GRENADE", {859.9639, -980.8849, 9.4852}, 60},
            {"SHOTGSPA", {863.9258, -663.9533, 13.9361}, 60},
            {"GLOCK17", {990.6151, -735.4258, 13.9316}, 60},
            {"M4", {789.5125, -575.8696, 18.7961}, 60},
            {"MOLOTOV", {816.6223, -561.0172, 23.3231}, 60},
            {"AK47", {898.1657, -414.5687, 25.5337}, 60},
            {"M4", {1037.7203, -156.4187, 22.9032}, 60},
            {"SNIPER", {1020.6446, -222.0203, 8.3127}, 60},
            {"GLOCK17", {1062.2878, -569.4073, 15.6044}, 60},
            {"MP5K", {1091.8301, -693.1956, 13.9333}, 60},
            {"GLOCK17", {1163.0736, -643.7957, 17.8527}, 60},
            {"MP5K", {1568.1666, -694.6786, 10.7862}, 60},
            {"PYTHON", {1214.5089, -309.6771, 28.9209}, 60},
            {"MP5K", {1158.3252, -270.691, 16.2547}, 60},
            {"UZI", {1004.9731, -49.0745, 6.4086}, 60},
            {"MP5K", {765.8713, 193.6255, 2.945}, 60},
            {"GLOCK17", {883.1309, -524.9763, 15.5528}, 60},
            {"MP5K", {991.968, -471.6987, 2.736}, 60},
            {"KATANA", {1020.6091, -339.8971, 13.8116}, 60},
            {"SHOTGSPA", {1159.6012, -106.0999, 6.6061}, 60},
            {"health", {1238.9845, -1243.9845, 10.8609}},
            {"health", {1277.0895, -982.9139, 14.2334}},
            {"health", {1289.2567, -854.8746, 14.4858}},
            {"health", {1325.3098, -681.9615, 12.8695}},
            {"health", {1146.5005, -591.9588, 14.4155}},
            {"health", {953.5963, -358.1068, 10.9022}},
            {"health", {868.9496, -212.1607, 4.0257}},
            {"health", {892.5656, 200.8766, 6.27}},
            {"health", {1313.7164, -75.7409, 15.7261}},
            {"health", {1275.363, -381.1106, 33.0068}},
            {"BODYARMOUR", {1243.8541, -316.0791, 31.815}}
        }
    elseif GameLocation() == 1 then
        pickups = {
            {"ROCKETLA", {1319.69, -275.8, 15}, 60},
            {"FLAME", {1218.43, -134.05, 15.6}, 60},
            {"SHOTGSPA", {1125.21, 46.93, 4.3}, 60},
            {"KATANA", {1157.92, -189.99, 14.7}, 60},
            {"SNIPER", {1217.73, -239.52, 32.7}, 60}
        }
    else
        pickups = {
            {"ROCKETLA", {1319.69, -275.8, 15}, 60},
            {"FLAME", {1218.43, -134.05, 15.6}, 60},
            {"SHOTGSPA", {1125.21, 46.93, 4.3}, 60},
            {"KATANA", {1157.92, -189.99, 14.7}, 60},
            {"SNIPER", {1217.73, -239.52, 32.7}, 60}
        }
    end

    for _, pickup in ipairs(pickups) do
        table.insert(self.pickups, CreatePickup(unpack(pickup)))
    end

    self.pickupBlipScript = PickupBlipScript{}:Start(self.pickups)
end

function FreeRoam:StateRunning()
    local player = Player()
    if not player:IsPlaying() then
        main.scores:Show(true)
        Wait(1000)
        while main.scores.scores do
            Wait(250)
        end
        self:DoSpawn()
    end
end

function FreeRoam:Commentate(msg)
    main.commentary:Print(msg)
end

function FreeRoam:Score(player)
    local score = self.scores[player]
    if not score then
        score = 0
    end
    return score
end

function FreeRoam:RegisterPlayerKill(killed, killer, is_headshot)
    if killed == killer then
        self:Commentate(killed:Name() .. " killed himself")
    elseif is_headshot then
        self:Commentate(killer:Name() .. " killed " .. killed:Name() .. " with a headshot!")
    else
        self:Commentate(killer:Name() .. " killed " .. killed:Name())
    end
end
