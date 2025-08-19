MAX_SPAWN_ATTEMPTS = 20
MIN_DISTANCE_FROM_ENEMY = 100
MIN_DISTANCE_FROM_TEAMDM_BUDDY = 30
MAX_DISTANCE_FROM_TEAMDM_BUDDY = 200
MAX_DISTANCE_FROM_ENEMY = 400
MIN_DISTANCE_FROM_ENEMY_TDM = 100

function InitSpawnPoints()
    main.vSpawnOffsets = {
        {{0, 4.0E-4, 0}, 0},
        {{2.0E-4, 2.0E-4, 0}, 0},
        {{4.0E-4, 0, 0}, 0},
        {{2.0E-4, -2.0E-4, 0}, 0},
        {{0, -4.0E-4, 0}, 0},
        {{-2.0E-4, -2.0E-4, 0}, 0},
        {{-4.0E-4, 0, 0}, 0},
        {{-2.0E-4, 2.0E-4, 0}, 0}
    }

    -- The Hit List
    if GameType() == 5 then
        if GameLocation() == 0 then
            main.vSpawnPoints = {
                {{947.3441, -47.9133, 6.433}, 180},
                {{1278.4918, -92.0525, 13.9868}, 0},
                {{941.082, -347.7505, 8.9325}, 180},
                {{1292.4677, -335.2223, 36.1601}, 0},
                {{927.5822, -679.3553, 13.9329}, 0},
                {{1295.465, -630.3524, 11.4177}, 270},
                {{850.5524, -986.9323, 4.2155}, 0},
                {{1319.8976, -992.9208, 13.7946}, 270}
            }
        elseif GameLocation() == 1 then
            main.vSpawnPoints = {
                {{176.382, -16.4696, 15.178}, 0},
                {{375.6499, -136.253, 20.2108}, 340.1611},
                {{-19.4568, -472.8146, 17.6069}, 90},
                {{347.8423, -512.824, 19.7519}, 90},
                {{59.5232, -962.624, 25.1281}, 270},
                {{397.8806, -912.9601, 25.1281}, 90},
                {{-50.607, -1474.3346, 25.1041}, 270},
                {{308.0347, -1410.1143, 25.1282}, 180}
            }
        else
            main.vSpawnPoints = {
                {{-1113.2144, 521.6744, 67.1784}, 17.4366},
                {{-1256.4679, 131.1646, 67.8212}, 270},
                {{-869.7761, 192.6611, 47.8213}, 25.261},
                {{-764.1891, 193.7988, 27.6714}, 90},
                {{-997.2046, -40.034, 38.6395}, 116.9062},
                {{-623.6219, -44.73, 17.8212}, 90.8104},
                {{-443.6338, -4.8689, 2.8213}, 90},
                {{-1270.3594, -209.2431, 52.3545}, 0}
            }
        end
    else
        if GameLocation() == 0 then
            main.vSpawnPoints = {
                {{1148.88, -921.64, -100}, 0},
                {{1256.71, -1138.25, -100}, 0},
                {{1398.94, -802.87, -100}, 0},
                {{1273.42, -631.96, -100}, 0},
                {{1338.49, -456.32, -100}, 0},
                {{1418.31, -190.34, -100}, 0},
                {{1310.47, -247.8, -100}, 0},
                {{1218.49, -113.28, -100}, 0},
                {{1086.61, -80.26, -100}, 0},
                {{939.88, -198.85, -100}, 0},
                {{862.5, -208.78, -100}, 0},
                {{868.82, -307.78, -100}, 0},
                {{869.36, -821.49, -100}, 0},
                {{1026.56, -842.97, -100}, 0},
                {{918.96, -898.72, -100}, 0},
                {{777.98, -881.05, -100}, 0},
                {{1151.0116, -846.1448, -100}, 0},
                {{1172.3298, -681.2702, -100}, 0},
                {{1417.6161, -300.6821, -100}, 0},
                {{1173.7748, -87.2451, -100}, 0},
                {{1074.9625, -56.6575, -100}, 0},
                {{789.5881, -88.4424, -100}, 0},
                {{979.5832, -805.4543, -100}, 0},
                {{1288.622, -859.1627, -100}, 0},
                {{1483.4081, -685.2923, -100}, 0},
                {{1158.5193, -390.3186, -100}, 0},
                {{1031.6392, -471.3281, -100}, 0},
                {{875.7205, 21.3731, -100}, 0},
                {{1465.9043, -28.22, -100}, 0},
                {{1197.4836, -939.0728, -100}, 0},
                {{1321.1272, -530.5629, -100}, 0}
            }
        elseif GameLocation() == 1 then
            main.vSpawnPoints = {
                {{164.25, -622.24, -100}, 0},
                {{47.52, -635.31, -100}, 0},
                {{39.34, -724.23, -100}, 0},
                {{-116.2, -1176.88, -100}, 0},
                {{-91.98, -1383.62, -100}, 0},
                {{-29.16, -1152.6, -100}, 0},
                {{90, -1083, -100}, 0},
                {{164.5574, -953.114, -100}, 0},
                {{219.6748, -818.8812, -100}, 0},
                {{286.0683, -657.4827, -100}, 0},
                {{294.0222, -457.0866, -100}, 0},
                {{349.725, -446.6711, -100}, 0},
                {{402.5265, -375.9272, -100}, 0},
                {{405.343, -47.5705, -100}, 0},
                {{285.7704, -16.9074, -100}, 0},
                {{160.9776, 183.4123, -100}, 0},
                {{-25.1238, -270.5583, -100}, 0},
                {{-81.3993, -461.9238, -100}, 0},
                {{-73.3877, -752.6894, -100}, 0},
                {{-70.9119, -1457.6758, -100}, 0},
                {{68.8348, -1647.3816, -100}, 0},
                {{455.5428, -1422.1069, -100}, 0},
                {{206.8697, -1201.0068, -100}, 0}
            }
        else
            main.vSpawnPoints = {
                {{-725.23, 39.73, -100}, 0},
                {{-748.79, -583.35, -100}, 0},
                {{-644.43, -723.88, -100}, 0},
                {{-695.81, -194.61, -100}, 0},
                {{-915.2529, 378.3158, -100}, 0},
                {{-572.1587, 341.2114, -100}, 0},
                {{-232.2661, 296.9166, -100}, 0},
                {{-368.2611, 266.5529, -100}, 0},
                {{-386.6228, 120.0279, -100}, 0},
                {{-724.3732, 186.3237, -100}, 0},
                {{-680.1751, 88.5354, -100}, 0},
                {{-635.5839, -32.0773, -100}, 0},
                {{-1239.5514, 107.5347, -100}, 0},
                {{-1250.6254, -11.4786, -100}, 0},
                {{-1207.0363, -23.5518, -100}, 0},
                {{-1262.3395, -181.0767, -100}, 0},
                {{-1097.8418, -196.6317, -100}, 0},
                {{-1033.4478, -199.1378, -100}, 0},
                {{-749.2313, -44.8154, -100}, 0},
                {{-779.8675, -224.4498, -100}, 0},
                {{-414.4514, 55.5245, -100}, 0},
                {{-868.1404, -114.1105, -100}, 0}
            }
        end
    end
end

function PopulateSpawnListStandard(spawns)
    local player = Player()
    local players = AllPlayers()
    for _, spawn_point in ipairs(main.vSpawnPoints) do
        local add_this_one = true
        local is_close_to_somebody = false
        for _, pl in pairs(players) do
            if pl:PlayerNum() ~= player:PlayerNum() then
                local distance = Distance2D(unpack(spawn_point), pl:Position())
                if distance < MIN_DISTANCE_FROM_ENEMY then
                    add_this_one = false
                elseif distance < MAX_DISTANCE_FROM_ENEMY then
                    is_close_to_somebody = true
                end
            end
        end
        
        if not is_close_to_somebody then
            add_this_one = false
        end
        if add_this_one then
            table.insert(spawns, spawn_point)
        end
    end
end

function PopulateSpawnListTeamDM(spawns)
    local player = Player()
    local players = AllPlayers()
    for _, spawn_point in ipairs(main.vSpawnPoints) do
        local add_this_one = true
        for _, pl in pairs(players) do
            if pl:PlayerNum() ~= player:PlayerNum() and player:TeamId() == pl:TeamId() then
                local distance = Distance2D(unpack(spawn_point), pl:Position())
                if distance > MAX_DISTANCE_FROM_TEAMDM_BUDDY then
                    add_this_one = false
                end
                if distance < MIN_DISTANCE_FROM_TEAMDM_BUDDY then
                    add_this_one = false
                end
            elseif pl:PlayerNum() ~= player:PlayerNum() then
                if Distance2D(unpack(spawn_point), pl:Position()) < MIN_DISTANCE_FROM_ENEMY_TDM then
                    add_this_one = false
                end
            end
        end
        
        if add_this_one then
            table.insert(spawns, spawn_point)
        end
    end
end

function PopulateSpawnListTeamGame(spawns)
    local unused_lcl1 = Player()
    local unused_lcl2 = AllPlayers()
    for _, spawn_point in ipairs(main.vSpawnPoints) do
        table.insert(spawns, spawn_point)
    end
end

function DoSpawn(try_this_point_first, do_respawn)
    if not try_this_point_first then
        try_this_point_first = -1
    end
    if do_respawn == nil then
        do_respawn = true
    end
    local player = Player()
    local unused_lcl1 = AllPlayers()
    local spawn_index = 0
    local unused_lcl2 = 0
    local position = unpack(main.vSpawnPoints[1])
    local heading = 0
    
    spawn_index = try_this_point_first
    
    local is_team_dm = false
    if GameType() == 0 then
        if IsTeamGame() then
            print("In team mode spawn check")
            local team_members = TeamPlayers(player:TeamId())
            if 1 < table.getn(team_members) then
                print("setting down team spawn to true")
                is_team_dm = true
            end
        end
    end
    
    local is_team_game = IsTeamGame()
    
    print("try_this_point_first is " .. try_this_point_first)
    if (try_this_point_first < 1) or (try_this_point_first > table.getn(main.vSpawnPoints)) then
        print("Generating a spawn point list")
        local spawns = {}
        
        if is_team_dm then
            PopulateSpawnListTeamDM(spawns)
        elseif is_team_game then
            PopulateSpawnListTeamGame(spawns)
            if table.getn(spawns) == 0 then
                print("Team DM didnt find a suitable spawn location. Retrying with standard spawn populate.")
                PopulateSpawnListStandard(spawns)
            end
        else
            PopulateSpawnListStandard(spawns)
        end

        if table.getn(spawns) == 0 then
            print("SPAWN WARNING!! Havent been able to find a player spawn point that meet conditions! Its ok though.")
            for _, spawn_point in ipairs(main.vSpawnPoints) do
                table.insert(spawns, spawn_point)
            end
        end

        spawn_index = math.random(1, table.getn(spawns))
        position = AddVectors(unpack(spawns[spawn_index]), unpack(main.vSpawnOffsets[player:PlayerNum() + 1]))
        heading = spawns[spawn_index][2]
        -- Forgot to specify the index
        table.remove(spawns)
        
        local is_clear = IsAreaClearOfPlayers(position)
        while not is_clear and 0 < table.getn(spawns) do
            print("Attempt to spawn failed")
            spawn_index = math.random(1, table.getn(spawns))
            position = AddVectors(unpack(spawns[spawn_index]), unpack(main.vSpawnOffsets[player:PlayerNum() + 1]))
            print("trying point " .. spawn_index .. " out of a list of " .. table.getn(spawns))
            heading = spawns[spawn_index][2]
            table.remove(spawns, spawn_index)
            is_clear = IsAreaClearOfPlayers(position)
        end
        
        if not is_clear then
            print("Going into fallback spawn mode, where we try every spawn point specified for this GM and Island")
            for _, spawn_point in ipairs(main.vSpawnPoints) do
                table.insert(spawns, spawn_point)
            end
            while not is_clear and 0 < table.getn(spawns) do
                print("DESPERATE Attempt to spawn failed")
                spawn_index = math.random(1, table.getn(spawns))
                position = AddVectors(unpack(spawns[spawn_index]), unpack(main.vSpawnOffsets[player:PlayerNum() + 1]))
                print("trying point " .. spawn_index .. " out of a list of " .. table.getn(spawns))
                heading = spawns[spawn_index][2]
                table.remove(spawns, spawn_index)
                is_clear = IsAreaClearOfPlayers(position)
            end
        end
        
        if not is_clear then
            print("Going into SUPER FALLBACK spawn mode. Look into putting more spawn points in.")
            spawn_index = math.random(1, table.getn(main.vSpawnPoints))
            position = AddVectors(unpack(main.vSpawnPoints[spawn_index]), unpack(main.vSpawnOffsets[player:PlayerNum() + 1]))
            heading = main.vSpawnPoints[spawn_index][2]    
        end
    else
        print("Trying to do an initial spawn at point " .. spawn_index)
        position = AddVectors(unpack(main.vSpawnPoints[spawn_index]), unpack(main.vSpawnOffsets[player:PlayerNum() + 1]))
        heading = main.vSpawnPoints[spawn_index][2]
    end

    if do_respawn == true then
        print("Respawn called at point " .. spawn_index)
        player:Respawn(position, heading)
    end
    
    position[4] = heading
    collectgarbage()
    return position
end

g_isRespawning = false

function IsPlayerRespawning()
    return g_isRespawning
end

function DoWasted()
    Wait(2500)
    g_isRespawning = true
    ClearMessages()
    main.scores:Show(true)
    collectgarbage()
    local iterations = 0
    while iterations < 200 do
        DisablePlayer(true)
        ClearMessages()
        Wait(1)
        iterations = iterations + 1
        if 50 < iterations then
            if CrossDown() then
                break
            end
        end
    end
    main.scores:Hide()
    DoSpawn()
    g_isRespawning = false
end
