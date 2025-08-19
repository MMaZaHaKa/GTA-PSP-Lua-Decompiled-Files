require "spawn"

ScoreSheet = Script{title_sprites={}, score_sprites={}, option_sprites={}, help_sprites={}, screen=0, option=0}

function ScoreSheet:Run()
end

function ScoreSheet:CleanUp()
end

function ScoreSheet:SortedPlayers()
    local players = AllPlayers()
    table.sort(players, function (player1, player2)
        if not main.game:Score(player1) or not main.game:Score(player2) then
            return false
        end
        return main.game:Score(player1) > main.game:Score(player2)
    end)
    return players
end

function ScoreSheet:SortedTeams()
    local players = AllPlayers()
    local teams = {}
    table.insert(teams, 0)
    table.insert(teams, 1)
    table.sort(teams, function (team1, team2)
        if not main.game:TeamScore(team1) or not main.game:TeamScore(team2) then
            return false
        end
        return main.game:TeamScore(team1) > main.game:TeamScore(team2)
    end)
    return teams
end

function ScoreSheet:DrawTitles()
    self:HideTitles()
    local player = Player()
    local base = AddText:With{player=player, y=70, style=0, scale=0.4}
    local DrawTitle = function (params)
        local sprite = base(params)  -- merges base params with new ones
        sprite:Order(-1)
        table.insert(self.title_sprites, sprite)
        return sprite
    end

    -- Displays gamemode name above the table
    if self.screen == 1 then
        DrawTitle{x=240, y=20, align=1, scale=0.6, text="MPQG", colour=GameColour(3)}
    -- Liberty City Survivor
    elseif GameType() == 0 then
        DrawTitle{x=240, y=20, align=1, scale=0.6, text="GS_G1", colour=GameColour(3)}
    -- Street Rage
    elseif GameType() == 1 then
        DrawTitle{x=240, y=20, align=1, scale=0.6, text="GS_G2", colour=GameColour(3)}
    -- Protection Racket
    elseif GameType() == 2 then
        DrawTitle{x=240, y=20, align=1, scale=0.6, text="GS_G3", colour=GameColour(3)}
    -- Get Stretch
    elseif GameType() == 3 then
        DrawTitle{x=240, y=20, align=1, scale=0.6, text="GS_G4", colour=GameColour(3)}
    -- Tanks For The Memories
    elseif GameType() == 4 then
        DrawTitle{x=240, y=20, align=1, scale=0.6, text="GS_G5", colour=GameColour(3)}
    -- The Hit List
    elseif GameType() == 5 then
        DrawTitle{x=240, y=20, align=1, scale=0.6, text="GS_G6", colour=GameColour(3)}
    -- The Wedding List
    elseif GameType() == 6 then
        DrawTitle{x=240, y=20, align=1, scale=0.6, text="GS_G7", colour=GameColour(3)}
    end

    -- Displays column names in the table
    if self.screen and self.screen < 2 then
        -- Liberty City Survivor
        if GameType() == 0 then
            if not IsTeamGame() then
                DrawTitle{x=110, y=50, align=0, scale=0.45, text="MPNAME"}
            else
                DrawTitle{x=110, y=50, align=0, scale=0.45, text="MPTEAM"}
            end
            DrawTitle{x=361, y=50, align=2, scale=0.45, text="MPSCORE"}
        -- Street Rage
        elseif GameType() == 1 then
            DrawTitle{x=110, y=50, align=0, scale=0.45, text="MPNAME"}
            DrawTitle{x=361, y=50, align=2, scale=0.45, text="MPI07"}
        -- Protection Racket
        elseif GameType() == 2 then
            DrawTitle{x=110, y=50, align=0, scale=0.45, text="MPTEAM"}
            DrawTitle{x=361, y=50, align=2, scale=0.45, text="MPTIME"}
        -- Get Stretch
        elseif GameType() == 3 then
            DrawTitle{x=110, y=50, align=0, scale=0.45, text="MPTEAM"}
            DrawTitle{x=361, y=50, align=2, scale=0.45, text="MPSCORE"}
        -- Tanks For The Memories
        elseif GameType() == 4 then
            DrawTitle{x=110, y=50, align=0, scale=0.45, text="MPNAME"}
            DrawTitle{x=361, y=50, align=2, scale=0.45, text="MPTIME"}
        -- The Hit List
        elseif GameType() == 5 then
            DrawTitle{x=110, y=50, align=0, scale=0.45, text="MPNAME"}
            DrawTitle{x=361, y=50, align=2, scale=0.45, text="MPTOTAL"}
        -- The Wedding List
        elseif GameType() == 6 then
            DrawTitle{x=110, y=50, align=0, scale=0.45, text="MPNAME"}
            DrawTitle{x=240, y=50, align=1, scale=0.45, text="MPCASH"}
            DrawTitle{x=361, y=50, align=2, scale=0.45, text="MPCARS"}
        end
    end
end

function ScoreSheet:DrawScores()
    self:HideScores()
    local player = Player()
    local base = AddText:With{player=player, y=70, style=1, scale=0.4}
    local DrawScore = function (params)
        local sprite = base(params)
        sprite:Order(-1)
        table.insert(self.score_sprites, sprite)
        return sprite
    end

    if GameScoreLimit() > 0 then
        -- Liberty City Survivor
        if GameType() == 0 then
            DrawScore{x=110, y=198, style=0, scale=0.35, text="GS_KLMT", colour=GameColour(10)}
            DrawScore{x=361, y=198, style=0, scale=0.35, text="^S^" .. GameScoreLimit(), colour=GameColour(10), align=2}
        end
    end

    if IsTeamGame() then
        self.teams = self:SortedTeams()
        self.rows = {}
        -- Liberty City Survivor
        if GameType() == 0 then
            self.players = AllPlayers()
            local row = 0
            local team_position = 0
            for _, team in ipairs(self.teams) do
                row = row + 1
                team_position = team_position + 1
                base.y = (60 + row * 13) + team_position * 8

                self.rows[row] = {
                    name=DrawScore{x=110, scale=0.35, text="^S^" .. TeamName(team), colour=TeamColour(team)},
                    score=DrawScore{
                        x=361, scale=0.35, text="^S^" .. main.game:TeamScore(team), colour=TeamColour(team), align=2
                    }
                }

                for _, player in ipairs(self.players) do
                    if player:TeamId() == team then
                        row = row + 1
                        base.y = (60 + row * 13) + team_position * 8
                        self.rows[row] = {
                            name=DrawScore{
                                x=122, scale=0.35, text="^S^" .. PlayerName(player), colour=TeamColour(team)
                            }
                        }
                    end
                end
            end
        -- Protection Racket
        elseif GameType() == 2 then
            self.players = AllPlayers()
            local row = 0
            local team_position = 0
            for team_index, team in ipairs(self.teams) do
                row = row + 1
                team_position = team_position + 1
                base.y = (60 + row * 13) + team_position * 8
                
                local score = main.game:TeamScore(team)
                local minutes = math.floor(score / 1000 / 60)
                score = score - minutes * (1000 * 60)
                local seconds = score / 1000
                local time_as_str = string.format("^S^%d:%02d", minutes, seconds)
                if main.game:DidWinBecauseTimeRanOut() == true and team_index and 1 < team_index then
                    time_as_str = string.format("^T^MPFAIL")
                end
                
                self.rows[row] = {
                    name=DrawScore{x=110, scale=0.35, text="^S^" .. TeamName(team), colour=TeamColour(team)},
                    score=DrawScore{x=361, scale=0.35, text=time_as_str, align=2}
                }
                                                                                                                    
                for _, player in ipairs(self.players) do
                    if player:TeamId() == team then
                        row = row + 1
                        base.y = (60 + row * 13) + team_position * 8
                        self.rows[row] = {
                            name=DrawScore{
                                x=122, scale=0.35, text="^S^" .. PlayerName(player), colour=TeamColour(team)
                            }
                        }
                    end
                end
            end
        -- Get Stretch
        elseif GameType() == 3 then
            self.players = AllPlayers()
            local row = 0
            local team_position = 0
            for _, team in ipairs(self.teams) do
                row = row + 1
                team_position = team_position + 1
                base.y = (60 + row * 13) + team_position * 8

                self.rows[row] = {
                    name=DrawScore{x=110, scale=0.35, text="^S^" .. TeamName(team), colour=TeamColour(team)},
                    score=DrawScore{x=361, scale=0.35, text="^S^" .. main.game:TeamScore(team), align=2}
                }
                
                for _, player in ipairs(self.players) do
                    if player:TeamId() == team then
                        row = row + 1
                        base.y = (60 + row * 13) + team_position * 8
                        self.rows[row] = {
                            name=DrawScore{
                                x=122, scale=0.35, text="^S^" .. PlayerName(player), colour=TeamColour(team)
                            }
                        }
                    end
                end
            end
        -- default case?
        else
            self.rows = {}
            for team_index, team in ipairs(self.teams) do
                base.y = 60 + team_index * 13
                self.rows[team] = {
                    name=DrawScore{x=110, scale=0.35, text="^S^" .. TeamName(team), colour=TeamColour(team)},
                    score=DrawScore{x=361, scale=0.35, text="^S^" .. main.game:TeamScore(team), align=2}
                }
            end
        end
    else
        self.players = self:SortedPlayers()
        self.rows = {}
        -- Street Rage
        if GameType() == 1 then
            for player_index, player in ipairs(self.players) do
                main.game:ShowHUD(false)
                local current_lap = main.game:GetCurrentLapNumber(player:PlayerNum())
                local checkpoints_completed = main.game:GetCheckpointsCompletedThisLap(player:PlayerNum())
                local checkpoints_in_lap = main.game:GetNumberOfCheckpointsInLap() - 1
                if current_lap > GameScoreLimit() then
                    current_lap = GameScoreLimit()
                    checkpoints_completed = checkpoints_in_lap
                end
                local text = "^T^MRACELA^S^ " .. current_lap ..
                             "^S^, " .. checkpoints_completed ..
                             "/" .. checkpoints_in_lap
                base.y = 60 + player_index * 15
                self.rows[player] = {
                    num=DrawScore{x=110, text="^S^" .. player_index .. " .", colour=player:Colour()},
                    name=DrawScore{x=133, text="^S^" .. player:Name(), colour=player:Colour()},
                    ping=DrawScore{x=355, text=text, align=2}
                }
            end
        -- Get Stretch (was possible to play without teams?)
        elseif GameType() == 3 then
            for player_index, player in ipairs(self.players) do
                base.y = 60 + player_index * 15
                self.rows[player] = {
                    num=DrawScore{x=110, text="^S^" .. player_index .. " .", colour=player:Colour()},
                    name=DrawScore{x=133, text="^S^" .. player:Name(), colour=player:Colour()}
                }
            end
        -- Tanks For The Memories
        elseif GameType() == 4 then
            for player_index, player in ipairs(self.players) do
                local minutes = nil
                local seconds = nil
                local time_left = GameScoreLimit() * 60000
                time_left = time_left - main.game:GetTimeMinutes(player:PlayerNum()) * 60000
                time_left = time_left - main.game:GetTimeSeconds(player:PlayerNum()) * 1000
                minutes = math.floor(time_left / 1000 / 60)
                time_left = math.floor(time_left - minutes * (1000 * 60))
                seconds = math.floor(time_left / 1000)
                local time_as_str = string.format("%d:%02d", minutes, seconds)
                base.y = 60 + player_index * 15
                self.rows[player] = {
                    num=DrawScore{x=110, text="^S^" .. player_index .. " .", colour=player:Colour()},
                    name=DrawScore{x=133, text="^S^" .. player:Name(), colour=player:Colour()},
                    time=DrawScore{x=361, text="^S^" .. time_as_str, align=2}
                }
            end
        -- The Hit List
        elseif GameType() == 5 then
            for player_index, player in ipairs(self.players) do
                local unused_lcl1 = string.format(
                    "%d:%02d", main.game:TimeMinutes(player), main.game:TimeSeconds(player)
                )
                local unused_lcl2 = string.format(
                    "%d:%02d", main.game:BonusTimeMinutes(player), main.game:BonusTimeSeconds(player)
                )
                local minutes = main.game:TimeMinutes(player)
                minutes = minutes + main.game:BonusTimeMinutes(player)
                local seconds = main.game:TimeSeconds(player)
                seconds = seconds + main.game:BonusTimeSeconds(player)
                if not seconds then
                    seconds = 0
                end
                while 59 < seconds do
                    minutes = minutes + 1
                    seconds = seconds - 60
                end
                
                local time_as_str = string.format("%d:%02d", minutes, seconds)
                base.y = 60 + player_index * 15
                self.rows[player] = {
                    num=DrawScore{x=110, text="^S^" .. player_index .. " .", colour=player:Colour()},
                    name=DrawScore{x=133, text="^S^" .. player:Name(), colour=player:Colour()},
                    total=DrawScore{x=361, text="^S^" .. time_as_str, align=2, colour=player:Colour()}
                }
            end
        -- The Wedding List
        elseif GameType() == 6 then
            for player_index, player in ipairs(self.players) do
                base.y = 60 + player_index * 15
                self.rows[player] = {
                    num=DrawScore{x=110, text="^S^" .. player_index .. " .", colour=player:Colour()},
                    name=DrawScore{x=133, text="^S^" .. player:Name(), colour=player:Colour()},
                    cash=DrawScore{x=240, text="^S^$" .. main.game:Cash(player), align=1, colour=player:Colour()},
                    cars=DrawScore{x=361, text="^S^" .. main.game:Cars(player), align=2, colour=player:Colour()}
                }
            end
        -- Liberty City Survivor
        else
            for player_index, player in ipairs(self.players) do
                base.y = 60 + player_index * 15
                self.rows[player] = {
                    num=DrawScore{x=110, text="^S^" .. player_index .. ".", colour=player:Colour()},
                    name=DrawScore{x=133, text="^S^" .. player:Name(), colour=player:Colour()},
                    score=DrawScore{x=361, align=2, text="^S^" .. main.game:Score(player), colour=player:Colour()}
                }
            end
        end
    end
end

function ScoreSheet:DrawOptions()
    self:HideOptions()
    local player = Player()
    if PlayerHealth(player) and PlayerHealth(player) <= 0 then
        return
    end
    local base = AddText:With{player=player, y=70, style=0, scale=0.4}
    local DrawOption = function (params)
        local sprite = base(params)
        sprite:Order(-1)
        table.insert(self.option_sprites, sprite)
        return sprite
    end
    
    if IsPlayerRespawning() == true then
        self.screen = 3
    end

    if self.screen == 0 then
        if main.game.state == "StateGameWon" then
            self.option = 1
            SetPauseScreenSelection(-1)
        end

        if self.option == 0 then
            DrawOption{x=240, y=220, align=1, scale=0.4, text="MPCONT", colour=Colour(10)}
            DrawOption{x=240, y=235, align=1, scale=0.4, text="MPQUIT", colour=Colour(11)}
            DrawOption{x=240, y=250, align=1, scale=0.4, text="MPHELP", colour=Colour(11)}
            SetPauseScreenSelection(0)
        elseif self.option == 1 then
            if main.game.state ~= "StateGameWon" then
                DrawOption{x=240, y=220, align=1, scale=0.4, text="MPCONT", colour=Colour(11)}
                DrawOption{x=240, y=235, align=1, scale=0.4, text="MPQUIT", colour=Colour(10)}
                DrawOption{x=240, y=250, align=1, scale=0.4, text="MPHELP", colour=Colour(11)}
                SetPauseScreenSelection(1)
            else
                SetPauseScreenSelection(-1)
            end
        else
            DrawOption{x=240, y=220, align=1, scale=0.4, text="MPCONT", colour=Colour(11)}
            DrawOption{x=240, y=235, align=1, scale=0.4, text="MPQUIT", colour=Colour(11)}
            DrawOption{x=240, y=250, align=1, scale=0.4, text="MPHELP", colour=Colour(10)}
            SetPauseScreenSelection(2)
        end
    elseif self.screen == 1 then
        if self.option == 0 then
            DrawOption{x=240, y=220, align=1, scale=0.4, text="NO", colour=Colour(10)}
            DrawOption{x=240, y=235, align=1, scale=0.4, text="YES", colour=Colour(11)}
            SetPauseScreenSelection(0)
        else
            DrawOption{x=240, y=220, align=1, scale=0.4, text="NO", colour=Colour(11)}
            DrawOption{x=240, y=235, align=1, scale=0.4, text="YES", colour=Colour(10)}
            SetPauseScreenSelection(1)
        end
    elseif self.screen == 2 then
        DrawOption{x=240, y=235, align=1, scale=0.4, text="FEM_OK", colour=Colour(10)}
        SetPauseScreenSelection(1)
    else
        if self.screen == 3 then
            SetPauseScreenSelection(-1)
        end
    end
end

function ScoreSheet:DrawHelp()
    self:HideHelp()
    ShowHelp(true)
    local player = Player()
    local base = AddText:With{player=player, y=70, style=1, scale=0.4, wrapX=365}
    local DrawHelp = function (params)
        local sprite = base(params)
        sprite:Order(-1)
        table.insert(self.help_sprites, sprite)
        return sprite
    end
    
    DrawHelp{x=110, y=50, style=0, align=0, scale=0.45, text="MPOBJ", colour=GameColour(3)}
    -- Liberty City Survivor
    if GameType() == 0 then
        if IsTeamGame() then
            DrawHelp{x=116, y=69, align=0, scale=0.38, text="GS_TO1", colour={255, 255, 255, 255}}
        else
            DrawHelp{x=116, y=69, align=0, scale=0.38, text="GS_O1", colour={255, 255, 255, 255}}
        end
    -- Street Rage
    elseif GameType() == 1 then
        DrawHelp{x=116, y=69, align=0, scale=0.38, text="GS_O2", colour={255, 255, 255, 255}}
    -- Protection Racket
    elseif GameType() == 2 then
        if player.TeamId() == DefendingTeam() - 1 then
            DrawHelp{x=116, y=69, align=0, scale=0.38, text="GS_OD3", colour={255, 255, 255, 255}}
        else
            DrawHelp{x=116, y=69, align=0, scale=0.38, text="GS_OA3", colour={255, 255, 255, 255}}
        end
    -- Get Stretch
    elseif GameType() == 3 then
        DrawHelp{x=116, y=69, align=0, scale=0.38, text="GS_O4", colour={255, 255, 255, 255}}
    -- Tanks For The Memories
    elseif GameType() == 4 then
        DrawHelp{x=116, y=69, align=0, scale=0.38, text="GS_O5", colour={255, 255, 255, 255}}
    -- The Hit List
    elseif GameType() == 5 then
        DrawHelp{x=116, y=69, align=0, scale=0.38, text="GS_O6", colour={255, 255, 255, 255}}
    -- The Wedding List
    elseif GameType() == 6 then
        DrawHelp{x=116, y=69, align=0, scale=0.38, text="GS_O7", colour={255, 255, 255, 255}}
    end

    DrawHelp{x=110, y=126, style=0, align=0, scale=0.45, text="MPLEG", colour=GameColour(3)}
end

function ScoreSheet:HideTitles()
    for _, sprite in pairs(self.title_sprites) do
        sprite:Remove()
    end
    self.title_sprites = {}
end

function ScoreSheet:HideScores()
    for _, sprite in pairs(self.score_sprites) do
        sprite:Remove()
    end
    self.score_sprites = {}
end

function ScoreSheet:HideOptions()
    for _, sprite in pairs(self.option_sprites) do
        sprite:Remove()
    end
    self.option_sprites = {}
    SetPauseScreenSelection(-1)
end

function ScoreSheet:HideHelp()
    ShowHelp(false)
    for _, sprite in pairs(self.help_sprites) do
        sprite:Remove()
    end
    self.help_sprites = {}
end

ScoreSheetScript = StateMachine{"Update"}

function ScoreSheetScript:Show(is_locked)
    self.locked = is_locked
    self:_Show()
end

function ScoreSheetScript:Hide(is_locked)
    self:_Hide()
    self.locked = is_locked
end

function ScoreSheetScript:_NeedToggle()
    if self.locked then
        return
    end
    local is_start_down = StartDown()
    local is_start_pressed = is_start_down and not self.startdown
    self.startdown = is_start_down
    return is_start_pressed
end

function ScoreSheetScript:Update()
    local player = Player()
    if not HasPlayerEnteredGame(player:PlayerNum()) then
        return
    end
    
    if self.scores then
        if not player:IsPlaying() then
            if self.scores.screen == 2 then
                self:_Hide()
            else
                self.scores:HideOptions()
            end
            return
        end

        if self.scores.doUpdate == false then
            return
        end

        self.scores:DrawOptions()
    end

    if self:_NeedToggle() then
        if self.scores then
            self:_Hide()
        else
            self:_Show()
            self.scores.screen = 0
            if main.game.state ~= "StateGameWon" then
                self.scores.option = 0
            else
                self.scores.option = 1
            end
        end
    else
        if self.scores then
            local is_down_down = DownDown()
            local is_up_down = UpDown()
            local is_cross_down = CrossDown()
            local is_circle_down = CircleDown()
            local is_triangle_down = TriangleDown()
            
            local is_left_pressed = is_down_down and not self.leftdown
            local is_right_pressed = is_up_down and not self.rightdown
            local is_cross_pressed = is_cross_down and not self.crossdown
            local is_circle_pressed = is_circle_down and not self.circledown
            local is_triangle_pressed = is_triangle_down and not self.triangledown

            self.leftdown = is_down_down
            self.rightdown = is_up_down
            self.crossdown = is_cross_down
            self.circledown = is_circle_down
            self.triangledown = is_triangle_down

            if self.scores then
                if self.scores.screen < 2 then
                    self.scores:DrawScores()
                end
            end

            if main.game.state ~= "StateGameWon" or self.scores.screen ~= 0 then
                if is_left_pressed and self.scores and self.scores.screen < 2 then
                    if self.scores.screen == 0 and self.scores.option == 2 then
                        self.scores.option = 0
                    elseif self.scores.screen == 1 and self.scores.option == 1 then
                        self.scores.option = 0
                    else
                        self.scores.option = self.scores.option + 1
                    end
                    self.scores:DrawOptions()
                elseif is_right_pressed and self.scores and self.scores.screen < 2 then
                    if self.scores.screen == 0 and self.scores.option == 0 then
                        self.scores.option = 2
                    elseif self.scores.screen == 1 and self.scores.option == 0 then
                        self.scores.option = 1
                    else
                        self.scores.option = self.scores.option - 1
                    end
                    self.scores:DrawOptions()
                end
            end
            
            if is_cross_pressed then
                if self.scores.option == 0 then
                    if self.scores.screen == 0 then
                        local player = Player()
                        if not player:IsPlaying() then
                            CameraFadeOut(1)
                            Wait(750)
                        end
                        self:_Hide()
                    else
                        self.scores.screen = 0
                        self.scores.option = 0
                        self.scores:DrawTitles()
                        self.scores:DrawScores()
                        self.scores:DrawOptions()
                        self.scores:HideHelp()
                    end
                elseif self.scores.option == 1 then
                    if self.scores.screen == 0 then
                        if main.game.state == "StateGameWon" then
                            self:_Hide()
                            main:EndGame()
                        else
                            self.scores.screen = 1
                            self.scores.option = 0
                            self.scores:DrawTitles()
                            self.scores:DrawOptions()
                            self.scores:HideScores()
                        end
                    elseif self.scores.screen == 1 then
                        self:_Hide()
                        main:EndGame()
                    elseif self.scores.screen == 2 then
                        self.scores.screen = 0
                        self.scores.option = 2
                        self.scores:DrawTitles()
                        self.scores:DrawScores()
                        self.scores:DrawOptions()
                        self.scores:HideHelp()
                    end
                else
                    self.scores.screen = 2
                    self.scores.option = 1
                    self.scores:DrawTitles()
                    self.scores:DrawHelp()
                    self.scores:DrawOptions()
                    self.scores:HideScores()
                end
            elseif is_circle_pressed or is_triangle_pressed then
                if self.scores.screen ~= 0 then
                    self.scores.screen = 0
                    self.scores.option = 0
                    self.scores:DrawTitles()
                    self.scores:DrawScores()
                    self.scores:DrawOptions()
                    self.scores:HideHelp()
                else
                    self:_Hide()
                end
            end
        end
    end
end

function ScoreSheetScript:_Show()
    local player = Player()
    if not HasPlayerEnteredGame(player:PlayerNum()) then
        return
    end

    if not self.scores then
        main.commentary:CleanUp()
        self.scores = ScoreSheet{}:Start()
        RenderPauseScreenStuff(true)
        self.scores:DrawTitles()
        self.scores:DrawScores()
        self.scores:DrawOptions()
        self.scores.doUpdate = true
    end
end

function ScoreSheetScript:_Hide()
    if self.scores then
        RenderPauseScreenStuff(false)
        self.scores:HideOptions()
        self.scores:HideScores()
        self.scores:HideTitles()
        self.scores:HideHelp()
        self.scores:Stop()
        self.scores = nil
        self.locked = false
        -- Street Rage
        if GameType() == 1 then
            main.game:ShowHUD(true)
        end
    end
end

function ScoreSheetScript:CleanUp()
    self:_Hide()
end

function ScoreSheetScript:ToggleUpdate(do_update)
    if self.scores then
        self.scores.doUpdate = do_update
    end
end
