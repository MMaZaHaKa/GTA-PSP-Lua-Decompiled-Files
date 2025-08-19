require "gta"
require "mainloop"
require "spawn"
require "PowerUps"
require "Pickups"
require "CutscenePlayer"

HitParade = StateMachine{"StateInit"}
PowerUpTimer = PowerupTimer()
CAR_HEALTH_DEC_PERIOD_MS = 1000
CAR_HEALTH_DEC_AMOUNT = 50
HIT_PARADE_GAME_TIME = 5

function HitParade:StateInit()
    DbgPrintAllOptions()
    self.mypickups = PickupMgr()
    self.mypickups:CreatePickups()
    self.fraglimit = GameScoreLimit()
    self.timeminutes = {}
    self.timeseconds = {}
    self.bonustimeminutes = {}
    self.bonustimeseconds = {}
    self.playerIsInCar = false
    self.timeToNextDecCarHealth = -1
    self.weAreOnFirstTarget = true
    self.gameFinishing = false
    self.HPTime = nil
    UseSuperBrakeOnPause(false)
    self.headshots = 0
    self.numAllRespawns = 0
    
    while not IsServer() and PlayerId() == 0 do
        Wait(100)
    end

    local players = AllPlayers()
    local connected_players = table.getn(players)
    local iterations = 0
    -- don't know why GetExpectedNumberOfPlayers is called on every iteration
    while connected_players ~= GetExpectedNumberOfPlayers() and (iterations < 20) do 
        print(
            "Hit Parade is sat on its ass waiting for " ..
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
    local players = AllPlayers()
    self.targetlist = {}
    self.currenttarget = 0
    self.currenttargetindex = 0

    for i, player in ipairs(players) do
        self.targetlist[i] = player:PlayerNum()
    end
    
    print(table.getn(self.targetlist), " players have joined")

    -- randomly shuffle the list of players
    for i, pl in ipairs(self.targetlist) do
        local player = pl
        local idx = math.random(1, table.getn(self.targetlist))
        self.targetlist[i] = self.targetlist[idx]
        self.targetlist[idx] = player
    end

    self.neednewtarget = true
    
    for _, player in pairs(players) do
        print("Player " .. player:PlayerNum() .. " has an initial spawn of " .. InitialSpawnPoint(player))
    end

    self:DoForcedSpawn()

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
    StartGame()
    return "StateRunning"
end

function HitParade:CleanUp()
    self.mytimer:Stop()
    if self.HPTime ~= nil then
        self.HPTime.Remove()
        self.HPTime = nil
    end
    self.mypickups:Cleanup()
    collectgarbage()
end

function HitParade:HandlePlayerDead(is_last_target)
    if is_last_target == nil then
        is_last_target = true
    end

    local player = Player()
    if not player:IsPlaying() then
        DoWasted()
        if TargetPlayer() == 200 then
            self:GetWinner()
            return
        end
        DoSpawn()
        if self.neednewtarget and not is_last_target then
            self:NewTarget()
        end
    end
end

function HitParade:StateRunning()
    local player = Player()
    local players = AllPlayers()
    self:HandlePlayerDead()

    if TargetPlayer() == 200 then
        self:GetWinner()
        return
    end

    if PlayerHealth(player) then
        if 0 < PlayerHealth(player) then
            if self.neednewtarget then
                self:NewTarget()
            end
        end
    end
    
    if GameTimeUp() then
        UpdateGameTime(false)
        self:SaveTime(Player(self.currenttarget))
        self.neednewtarget = true
    else
        if main.scores.scores then
            if self.HPTime ~= nil then
                self.HPTime:Remove()
                self.HPTime = nil
            end
        else
            if self.HPTime == nil then
                -- Why? We already have player in a variable...
                local player = Player()
                self.HPTime = TextSprite(player, 470, 85, 2)
                self.HPTime:Scale(0.4048)
                self.HPTime:Style(1)
                self.HPTime:Colour(GameColour(10))
            end
        end
        -- Could be in the inner scope
        local time_as_str = string.format("%d:%02d", GameTimeMinutes(), GameTimeSeconds())
        if self.HPTime ~= nil then
            self.HPTime:Text("^S^" .. time_as_str)
        end
    end

    local target = Player(self.currenttarget)
    if not IsConnected(target) then
        print("Target disconnected. Setting find new target")
        UpdateGameTime(false)
        self.neednewtarget = true
    end
    
    if IsServer() then
        -- Why? We already have players in a variable...
        local players = AllPlayers()
        if table.getn(players) == 1 then
            self:GetWinner()
        end
    end
    
    local players_car = player:Car()
    if player:PlayerNum() == self.currenttarget and players_car then
        local elapsed = GameElapsedMs()

        if not self.playerIsInCar then
            self.timeToNextDecCarHealth = elapsed + CAR_HEALTH_DEC_PERIOD_MS
            self.playerIsInCar = true
        end

        if elapsed > self.timeToNextDecCarHealth then
            local hp = VehicleHealth(players_car)
            VehicleSetHealth(players_car, hp - CAR_HEALTH_DEC_AMOUNT)
            self.timeToNextDecCarHealth = elapsed + CAR_HEALTH_DEC_PERIOD_MS
            print(
                "reducing vehicle health to " ..
                (hp - CAR_HEALTH_DEC_AMOUNT) ..
                " from " .. hp
            )
        end
    else
        self.playerIsInCar = false
        self.timeToNextDecCarHealth = -1
    end
    
    if self.currenttarget ~= TargetPlayer() then
        if TargetPlayer() < 100 then
            self.currenttarget = TargetPlayer()
            print("DOING EMERGENCY TARGET CHANGE TO " .. self.currenttarget)
            self.numAllRespawns = self.numAllRespawns + 1
            for _, player in pairs(players) do
                if player:PlayerNum() == self.currenttarget then
                    player:SetRadarBlipShortRange(false)
                    player:SetRadarBlipIcon(pickupicon.targetplayer)
                else
                    player:SetRadarBlipShortRange(true)
                    player:SetRadarBlipIcon(pickupicon.player)
                end
            end
        end
    end

    collectgarbage()
end

function HitParade:StateGameWon()
    UpdateGameTime(false)
    self:HandlePlayerDead(true)
    local player = Player()
    local match_result = nil
    
    if self.winner then
        if self.winner:PlayerNum() == player:PlayerNum() then
            match_result = 1
        else
            match_result = 2
        end
    else
        match_result = 0
    end

    if winner then
        DisplayFinalWinLoseMessage(match_result, "^S^" .. self.winner:Name() .. "^S^ ^T^MPWIN")
    else
        DisplayFinalWinLoseMessage(match_result, "")
    end

    main.scores:ToggleUpdate(false)
    main.scores:Show(true)
    Wait(12000)
    main.scores:Hide()
    main:EndGame()
    
    return "StateRunning"
end

function HitParade:Commentate(msg)
    main.commentary:Print(msg)
end

function HitParade:TimeMinutes(player)
    local time_minutes = self.timeminutes[player]
    if not time_minutes then
        time_minutes = 0
    end
    return time_minutes
end

function HitParade:TimeSeconds(player)
    local time_seconds = self.timeseconds[player]
    if not time_seconds then
        time_seconds = 0
    end
    return time_seconds
end

function HitParade:BonusTimeMinutes(player)
    local time_minutes = self.bonustimeminutes[player]
    if not time_minutes then
        time_minutes = 0
    end
    return time_minutes
end

function HitParade:BonusTimeSeconds(player)
    local time_seconds = self.bonustimeseconds[player]
    if not time_seconds then
        time_seconds = 0
    end
    return time_seconds
end

function HitParade:SaveTime(player)
    if self.gameFinishing then
        return
    end
    local seconds = 0
    local minutes = 0
    seconds = 60 - GameTimeSeconds()
    minutes = HIT_PARADE_GAME_TIME - 1 - GameTimeMinutes()
    print("Minutes lasted: " .. minutes .. " Seconds lasted: " .. seconds)
    if 59 < seconds then
        seconds = 0
        minutes = minutes + 1
    end
    self.timeminutes[player] = self:TimeMinutes(player) + minutes
    self.timeseconds[player] = self:TimeSeconds(player) + seconds
    while 59 < self:TimeSeconds(player) do
        self.timeminutes[player] = self:TimeMinutes(player) + 1
        self.timeseconds[player] = self:TimeSeconds(player) - 60
    end
end

function HitParade:GiveTimeBonus(player)
    -- Unused
    local seconds = 0
    local minutes = 0
    seconds = GameTimeSeconds()
    minutes = GameTimeMinutes()

    local bonus_time = HIT_PARADE_GAME_TIME * 60 / 10
    self.bonustimeseconds[player] = self:BonusTimeSeconds(player) + bonus_time
    while 59 < self:BonusTimeSeconds(player) do
        self.bonustimeminutes[player] = self:BonusTimeMinutes(player) + 1
        self.bonustimeseconds[player] = self:BonusTimeSeconds(player) - 60
    end
end

function HitParade:GiveExtraTimeBonus(player, extra_time)
    self.bonustimeseconds[player] = self:BonusTimeSeconds(player) + extra_time
    while 59 < self:BonusTimeSeconds(player) do
        self.bonustimeminutes[player] = self:BonusTimeMinutes(player) + 1
        self.bonustimeseconds[player] = self:BonusTimeSeconds(player) - 60
    end
end

function HitParade:Score(player)
    local score = 0
    local bonus_score = 0
    local total_score = 0
    score = self:TimeMinutes(player) * 60 + self:TimeSeconds(player)
    bonus_score = self:BonusTimeMinutes(player) * 60 + self:BonusTimeSeconds(player)
    total_score = score + bonus_score
    return total_score
end

function HitParade:GetWinner()
    self.gameFinishing = true
    local players = AllPlayers()
    TargetPlayer(200)
    if not self.winner then
        table.sort(players, function (player1, player2)
            return self:Score(player1) > self:Score(player2)
        end)
        print("Score 1 = " .. self:Score(players[1]) .. " Score 2 = " .. self:Score(players[2]))
        if self:Score(players[1]) == self:Score(players[2]) then
            self.winner = nil
        else
            self.winner = players[1]
        end
        self.state = "StateGameWon"
    end
end

function HitParade:NewTarget()
    local players = AllPlayers()
    SetGameTime(HIT_PARADE_GAME_TIME)
    UpdateGameTime(false)
    for _, player in pairs(players) do
        player:SetRadarBlipShortRange(true)
        player:SetRadarBlipIcon(pickupicon.player)
    end

    if IsServer() then
        TargetPlayer(100)
        Wait(2000)
        local is_everyone_alive = false
        while not is_everyone_alive do
            self:HandlePlayerDead(true)
            is_everyone_alive = true
            for _, player in pairs(players) do
                if player:IsDead() then
                    is_everyone_alive = false
                end
            end
            Wait(1)
            if is_everyone_alive then
                print("All players alive (LIES!!)")
            end
        end

        self.currenttargetindex = self.currenttargetindex + 1
        print("new server currenttargetindex is...", self.currenttargetindex)
        if self.currenttargetindex > table.getn(self.targetlist) then
            self:GetWinner()
        else
            while not IsConnected(Player(self.targetlist[self.currenttargetindex])) do
                self.currenttargetindex = self.currenttargetindex + 1
                if self.currenttargetindex > table.getn(self.targetlist) then
                    TargetPlayer(200)
                    self:GetWinner()
                    return
                end
            end
            
            local target = Player(self.targetlist[self.currenttargetindex])
            print("***** Target is ", target:Name(), target)
            Wait(1000)
            PrintNow(players, "MPHP05", 10000, 1)
            Wait(1000)
            PrintNow(players, "MPHP04", 10000, 1)
            Wait(1000)
            PrintNow(players, "MPHP03", 10000, 1)
            Wait(1000)
            PrintNow(players, "MPHP02", 10000, 1)
            Wait(1000)
            PrintNow(players, "MPHP01", 10000, 1)
            Wait(1000)

            for _, player in ipairs(players) do
                if player:PlayerNum() == self.targetlist[self.currenttargetindex] then
                    PrintNow(player, "MPHPGO2", 5000, 1)
                else
                    PrintNow(player, "MPHPGO", 5000, 1)
                end
            end
            
            TargetPlayer(self.targetlist[self.currenttargetindex])
            self.currenttarget = self.targetlist[self.currenttargetindex]
            local player = Player()
            player:SetHealth(100)
            if self.weAreOnFirstTarget then
                self.weAreOnFirstTarget = false
            else
                self:DoForcedSpawn()
            end

            -- redundant check?
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
        end
    else
        while TargetPlayer() < 100 do
            self:HandlePlayerDead(true)
            Wait(0)
        end
        while 100 <= TargetPlayer() do
            Wait(0)
            print("holding for new target")
            self:HandlePlayerDead(true)
            if TargetPlayer() == 200 then
                self:GetWinner()
                return
            end
        end

        local player = Player()
        player:SetHealth(100)
        if self.weAreOnFirstTarget then
            self.weAreOnFirstTarget = false
        else
            self:DoForcedSpawn()
        end

        self.currenttarget = TargetPlayer()
        print("new self.currenttarget (client) is ", self.currenttarget)
    end

    -- Could be in the inner scope
    local target = Player(self.currenttarget)
    if TargetPlayer() ~= 200 then
        main.commentary:Print("^S^~r~" .. target:Name() .. "~w~^S^ ^T^MPHPMAR")
    end
    print("I think the current target is " .. self.currenttarget)
    for _, player in pairs(players) do
        if player:PlayerNum() == self.currenttarget then
            player:SetRadarBlipShortRange(false)
            player:SetRadarBlipIcon(pickupicon.targetplayer)
        else
            player:SetRadarBlipShortRange(true)
            player:SetRadarBlipIcon(pickupicon.player)
        end
    end

    collectgarbage()
    UpdateGameTime(true)
    self.playerIsInCar = false
    self.neednewtarget = false
end

function HitParade:RegisterPlayerKill(killed, killer, is_headshot)
    if self.state ~= "StateGameWon" then
        if killed == killer then
            self:Commentate("^S^" .. killed:Name() .. "^S^ ^T^MPKSELF")
            if killed:PlayerNum() == TargetPlayer() then
                UpdateGameTime(false)
                self:SaveTime(killed)
                self.neednewtarget = true
            end
        else
            if is_headshot then
                self:Commentate("^S^" .. killer:Name() .. "^S^ ^T^MPK^S^ " .. killed:Name() .. "^S^ ^T^MPKHEAD")
                self.headshots = self.headshots + 1
            else
                self:Commentate("^S^" .. killer:Name() .. "^S^ ^T^MPK^S^ " .. killed:Name())
            end

            if killer then
                if killed:PlayerNum() == TargetPlayer() then
                    UpdateGameTime(false)
                    self:SaveTime(killed)
                    self:GiveTimeBonus(killer)
                    self.neednewtarget = true
                else
                    if killer:PlayerNum() == PlayerId() then
                        PrintNow(Player(), "MPHPKI", 5000, 1)
                    end
                end
            else
                if killed:PlayerNum() == TargetPlayer() then
                    UpdateGameTime(false)
                    self:SaveTime(killed)
                    self.neednewtarget = true
                end
            end
        end
    end
end

function HitParade:DoForcedSpawn()
    print("Doing forced spawn")
    self.numAllRespawns = self.numAllRespawns + 1
    DoSpawn(InitialSpawnPoint(Player(math.mod(PlayerId() + self.numAllRespawns, 6))))
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
    main.game = HitParade():Start()
    main:Start()
end
