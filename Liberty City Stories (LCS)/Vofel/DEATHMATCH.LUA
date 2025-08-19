require "gta"
require "mainloop"
require "spawn"
require "PowerUps"
require "Pickups"
require "CutscenePlayer"

PowerUpTimer = PowerupTimer()
teamId1 = 0
teamId2 = 1
teamDraw = 99
teamError = 101
hornDebounce = false
testSpawnPoint = 1
DeathMatch = StateMachine{"StateInit"}

function DeathMatch:StateInit()
    DbgPrintAllOptions()
    self.mypickups = PickupMgr()
    self.mypickups:CreatePickups()
    if GameScoreLimit() > 0 then
        self.fraglimit = GameScoreLimit()
    else
        self.fraglimit = nil
    end
    self.scores = {}
    self.teamscores = {}
    self.headshots = 0
    self.winningTeam = teamError
    self.gamePossiblyOver = false
    self.gameOverTestCount = 0
    self.DMTime = nil
    GenerateAmbients(false)
    UseSuperBrakeOnPause(false)
    
    -- ???
    if IsServer() then end
    while not IsServer() and PlayerId() == 0 do
        Wait(100)
    end

    print("Doing initial spawn")
    DoSpawn(InitialSpawnPoint(PlayerId()))
    
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
    
    if not NoFuckingCutscene() then
        main.scores:Hide(true)
        while SyncCutScene() == false do
            Wait(5)
        end
        Wait(0)
        RunScriptedCutscene()
        Wait(0)
        while ProcessScriptedCutscene() do
            Wait(0)
            collectgarbage()
        end
        main.scores:Hide(false)
    else
        Wait(20)
        ClearSplashScreen()
    end
    
    GenerateAmbients(true)
    UpdateGameTime(true)
    TeamGameEveryoneIn()
    
    return "StateRunning"
end

function DeathMatch:CleanUp()
    collectgarbage()
    if self.DMTime ~= nil then
        self.DMTime.Remove()
        self.DMTime = nil
    end
    self.mytimer:Stop()
    self.mypickups:Cleanup()
end

function DeathMatch:StateRunning()
    local player = Player()
    local players = AllPlayers()

    if not player:IsPlaying() then
        if not self.gamePossiblyOver then
            DoWasted()
        end
    end

    if GameTimeUp() then
        collectgarbage()
        self.state = "StateGameWon"
    else
        if GameTimeLimit() > 0 then
            if main.scores.scores then
                if self.DMTime ~= nil then
                    self.DMTime:Remove()
                    self.DMTime = nil
                end
            else
                if self.DMTime == nil then
                    -- Why? We already have player in a variable...
                    local player = Player()
                    self.DMTime = TextSprite(player, 470, 85, 2)
                    self.DMTime:Scale(0.4048)
                    self.DMTime:Style(1)
                    self.DMTime:Colour(GameColour(10))
                end
            end
            -- Could be in the inner scope
            local time_as_str = string.format("%d:%02d", GameTimeMinutes(), GameTimeSeconds())
            if self.DMTime ~= nil then
                self.DMTime:Text("^S^" .. time_as_str)
            end
        end
    end
    
    if self.gamePossiblyOver then
        self.gameOverTestCount = self.gameOverTestCount + 1
    end
    
    if self.gamePossiblyOver then
        if self.gameOverTestCount < 20 then
            self.gamePossiblyOver = false
            for _, player in pairs(players) do
                local points_left_to_win = nil
                if IsTeamGame() then
                    points_left_to_win = self.fraglimit - self:TeamScore(player:TeamId())
                else
                    points_left_to_win = self.fraglimit - self:Score(player)
                end
                if points_left_to_win <= 0 then
                    self.state = "StateGameWon"
                    self.winner = player
                    if IsTeamGame() then
                        self.winningTeam = player:TeamId()
                    end
                end
            end
        end
    end

    if IsPlayerPressingHorn(player) then
        if not hornDebounce then
            print("Horntest on")
            hornDebounce = true
        end
    end
    if not IsPlayerPressingHorn(player) then
        hornDebounce = false
    end
end

function DeathMatch:StateGameWon()
    UpdateGameTime(false)
    local unused_lcl = nil
    local player = Player()
    local players = AllPlayers()

    if IsTeamGame() then
        if self:TeamScore(teamId1) > self:TeamScore(teamId2) then
            self.winningTeam = teamId1
        elseif self:TeamScore(teamId2) > self:TeamScore(teamId1) then
            self.winningTeam = teamId2
        else
            self.winningTeam = teamDraw
        end
    else
        table.sort(players, function (player1, player2)
            return self:Score(player1) > self:Score(player2)
        end)
        if self:Score(players[1]) == self:Score(players[2]) then
            self.winner = nil
        else
            self.winner = players[1]
        end
    end

    if IsTeamGame() then
        if self.winningTeam == teamDraw then
            DisplayFinalWinLoseMessage(0, "")
        elseif self.winningTeam == player:TeamId() then
            DisplayFinalWinLoseMessage(1, "", self.winningTeam)
        else
            DisplayFinalWinLoseMessage(2, "", self.winningTeam)
        end
    else
        if not self.winner then
            if self:Score(player) < self:Score(players[1]) then
                DisplayFinalWinLoseMessage(2, " ")
            else
                DisplayFinalWinLoseMessage(0, " ")
            end
        else
            if self.winner:PlayerNum() == player:PlayerNum() then
                DisplayFinalWinLoseMessage(1, "")
            else
                DisplayFinalWinLoseMessage(2, "")
            end
        end
    end
    main.scores:ToggleUpdate(false)
    main.scores:Show(true)
    Wait(12000)
    main.scores:Hide()
    main:EndGame()
    return "StateRunning"
end

function DeathMatch:Commentate(msg)
    main.commentary:Print(msg)
end

function DeathMatch:Score(player)
    local score = self.scores[player]
    if not score then
        score = 0
    end
    return score
end

function DeathMatch:TeamScore(team)
    local score = self.teamscores[team]
    if not score then
        score = 0
    end
    return score
end

function DeathMatch:RegisterPlayerKill(killed, killer, is_headshot)
    if self.state ~= "StateGameWon" then
        if killed == killer then
            self.scores[killed] = self:Score(killed) - 1
            self.teamscores[killed:TeamId()] = self:TeamScore(killed:TeamId()) - 1
            self:Commentate("^S^" .. killed:Name() .. "^S^ ^T^MPKSELF")
        else
            if IsTeamGame() then
                if killed:TeamId() ~= killer:TeamId() then
                    self.scores[killer] = self:Score(killer) + 1
                    self.teamscores[killer:TeamId()] = self:TeamScore(killer:TeamId()) + 1
                else
                    self.scores[killer] = self:Score(killer) - 1
                    self.teamscores[killer:TeamId()] = self:TeamScore(killer:TeamId()) - 1
                end
            else
                self.scores[killer] = self:Score(killer) + 1
            end

            if is_headshot then
                self:Commentate("^S^" .. killer:Name() .. "^S^ ^T^MPK^S^ " .. killed:Name() .. "^S^ ^T^MPKHEAD")
                self.headshots = self.headshots + 1
            else
                self:Commentate("^S^" .. killer:Name() .. "^S^ ^T^MPK^S^ " .. killed:Name())
            end
            
            if self.fraglimit and killer then
                local points_left_to_win = 0
                if IsTeamGame() then
                    points_left_to_win = self.fraglimit - self:TeamScore(killer:TeamId())
                else
                    points_left_to_win = self.fraglimit - self:Score(killer)
                end
                if points_left_to_win <= 0 and not self.winner then
                    print("Setting gamePossiblyOver ")
                    self.gamePossiblyOver = true
                    self.gameOverTestCount = 0
                elseif points_left_to_win <= 3 and 1 < points_left_to_win then
                    if IsTeamGame() then
                        self:Commentate(
                            "^S^" .. killer:TeamName() ..
                            "^S^ ^T^MPTNEED^S^ " .. points_left_to_win ..
                            "^S^ ^T^MPMORE"
                        )
                    else
                        self:Commentate(
                            "^S^" .. killer:Name() ..
                            "^S^ ^T^MPNEED^S^ " .. points_left_to_win ..
                            "^S^ ^T^MPMORE"
                        )
                    end
                elseif points_left_to_win == 1 then
                    if IsTeamGame() then
                        self:Commentate(
                            "^S^" .. killer:TeamName() ..
                            "^S^ ^T^MPTNEED^S^ " .. points_left_to_win ..
                            "^S^ ^T^MP1MORE"
                        )
                    else
                        self:Commentate(
                            "^S^" .. killer:Name() ..
                            "^S^ ^T^MPNEED^S^ " .. points_left_to_win ..
                            "^S^ ^T^MP1MORE"
                        )
                    end
                end
            end
        end
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
    main.game = DeathMatch{}:Start()
    main:Start()
end
