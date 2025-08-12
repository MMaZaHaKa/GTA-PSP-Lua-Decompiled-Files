-- Score sheet 
-- MattS

-- to show: scores = ScoreSheet{}:Start()
-- to hide: scores:Stop()

-- if using start button script: scores = ScoreSheetScript{}:Start()
-- then scores:Show() or scores:Hide()
-- pass true to show or hide to prevent user from toggling scores

-----------------------------------------------------------
ScoreSheet = Script{title_sprites = {}, score_sprites = {}, option_sprites = {}, screen = 0, option = 1}

function ScoreSheet:Run()
--[[    while 1 do
        self:DrawTitles()
        Wait(250) 
    end]]
end

function ScoreSheet:CleanUp()
end

function ScoreSheet:SortedPlayers()
    local players = AllPlayers()
    table.sort(players, 
        function(a, b) 
            return main.game:Score(a) > main.game:Score(b)
        end)
    return players
end    

function ScoreSheet:SortedTeams()
    local players = AllPlayers()
	local teams = {}

	--	Add everyones team to the team table	
	for i,player in ipairs(players) do
		table.insert(teams, player:TeamId())
	end
	
	--	Remove duplicates
	for i,team1 in ipairs(teams) do
		for j,team2 in ipairs(teams) do
			if i != j and team1 == team2 then
				table.remove(teams, j)
			end
		end
	end
	
	--	Sort the teams on their scores
    table.sort(teams, 
        function(a, b) 
            return main.game:TeamScore(a) > main.game:TeamScore(b)
        end)
        
    return teams
end

function ScoreSheet:DrawTitles()
	self:HideTitles()
	
    local localplayer = Player()
    -- set up the font style etc   
    local AddScoreText = AddText:With{
        player = localplayer,
        y      = 70, 
        style  = 0,
        scale  = 0.4
    }       
    local function Add(settings)
        local spr = AddScoreText(settings)
        spr:Order(-1.0)
        table.insert(self.title_sprites, spr)
        return spr
    end
	
	-- add headings
    if self.screen == 0 then
    	-- game title headings     	
    	if GameType() == 0 then
			Add{x = 240, y = 20, align = 1, scale = .6, text = 'GS_G1', colour = GameColour(3)}    
		elseif GameType() == 1 then
			Add{x = 240, y = 20, align = 1, scale = .6, text = 'GS_G2', colour = GameColour(3)}    
		elseif GameType() == 2 then
			Add{x = 240, y = 20, align = 1, scale = .6, text = 'GS_G3', colour = GameColour(3)}    
		elseif GameType() == 3 then
			Add{x = 240, y = 20, align = 1, scale = .6, text = 'GS_G4', colour = GameColour(3)}  
		elseif GameType() == 4 then 
			Add{x = 240, y = 20, align = 1, scale = .6, text = 'GS_G5', colour = GameColour(3)}  	
		elseif GameType() == 5 then
			Add{x = 240, y = 20, align = 1, scale = .6, text = 'GS_G6', colour = GameColour(3)}  
		elseif GameType() == 6 then 
			Add{x = 240, y = 20, align = 1, scale = .6, text = 'GS_G7', colour = GameColour(3)}     				
		end   	
    else
		--	Add quit title
		Add{x = 240, y = 20, align = 1, scale = .6, text = 'MPQG', colour = GameColour(3)}
	end
    
	-- game mode table headings 
	if GameType() == 0 then
		if not IsTeamGame() then
			Add{x = 110, y = 55, align = 0, scale = .45, text = 'MPNAME'}
		else
			Add{x = 110, y = 55, align = 0, scale = .45, text = 'MPTEAM'}
		end
		Add{x = 320, y = 55, align = 1, scale = .45, text = 'MPSCORE'}
	
	elseif GameType() == 1 then 
		Add{x = 110, y = 55, align = 0, scale = .45, text = 'MPNAME'}
		Add{x = 240, y = 55, align = 0, scale = .45, text = 'MPCPS'}
	
	elseif GameType() == 2 then
		Add{x = 110, y = 55, align = 0, scale = .45, text = 'MPTEAM'}
		Add{x = 320, y = 55, align = 1, scale = .45, text = 'MPSCORE'}	
	
	elseif GameType() == 3 then  
		Add{x = 110, y = 55, align = 0, scale = .45, text = 'MPTEAM'}
		Add{x = 320, y = 55, align = 1, scale = .45, text = 'MPSCORE'}
	
	elseif GameType() == 4 then -- Tank
		Add{x = 110, y = 55, align = 0, scale = .45, text = 'MPNAME'}
		Add{x = 320, y = 55, align = 1, scale = .45, text = 'MPTIME'}

	elseif GameType() == 5 then
		Add{x = 110, y = 55, align = 0, scale = .45, text = 'MPNAME'}
		Add{x = 310, y = 55, align = 1, scale = .45, text = 'MPTOTAL'}
		--Add{x = 240, y = 55, align = 1, scale = .45, text = 'MPTOTAL'}
		--Add{x = 320, y = 55, align = 1, scale = .45, text = 'MPTIME'}
		--Add{x = 400, y = 55, align = 1, scale = .45, text = 'MPBONUS'}
		
	elseif GameType() == 6 then
		Add{x = 110, y = 55, align = 0, scale = .45, text = 'MPNAME'}
		Add{x = 260, y = 55, align = 1, scale = .45, text = 'MPCASH'}
		Add{x = 330, y = 55, align = 1, scale = .45, text = 'MPCARS'}
--		elseif GameType() == 3 then
--			Add{x = 10, y = 10, align = 0, scale = .8, text = 'FREE ROAM'}    
--			Add{x = 110, align = 0, scale = .45, text = 'NAME'}
	end
end



function ScoreSheet:DrawScores()
	self:HideScores()
	
    local localplayer = Player()
    -- set up the font style etc   
    local AddScoreText = AddText:With{
        player = localplayer,
        y      = 70, 
        style  = 0,
        scale  = 0.4
    }       
    local function Add(settings)
        local spr = AddScoreText(settings)
        spr:Order(-1.0)
        table.insert(self.score_sprites, spr)
        return spr
    end
    
	if IsTeamGame() then
		-- sort the players by score    
		self.teams = self:SortedTeams()
		self.rows = {}
		
		-- Team DM
		if GameType() == 0 then
			self.players = AllPlayers()
			local rowCount = 0		
			for i,team in ipairs(self.teams) do
				rowCount = rowCount + 1
				AddScoreText.y = 60+rowCount*15
				self.rows[rowCount] = 
				{
					name  = Add{x = 110, text = '^S^'..TeamName(team), colour = TeamColour(team)},
					score = Add{x = 320, text = '^S^'..main.game:TeamScore(team), colour = TeamColour(team), align = 1},
				}
				for j,player in ipairs(self.players) do
					if player:TeamId() == team then
						rowCount = rowCount + 1	
						AddScoreText.y = 60+rowCount*15
						self.rows[rowCount] = 
						{
							name  = Add{x = 150, text = '^S^'..PlayerName(player), colour = TeamColour(team)},
						}
					end
				end
				
			end	
		-- Defend The Base
		elseif GameType() == 2 then 
			self.players = AllPlayers()
			local rowCount = 0	
			for i,team in ipairs(self.teams) do
				rowCount = rowCount + 1
				AddScoreText.y = 60+rowCount*15
				local elapsedMs = main.game:TeamScore(team)
				local minutes = math.floor((elapsedMs / 1000) / 60)
				elapsedMs = elapsedMs - (minutes*(1000*60))
				local seconds = elapsedMs / 1000
				local str = string.format("%.2d:%.2d", minutes, seconds)
				
				self.rows[rowCount] = 
				{
					name  = Add{x = 110, text = '^S^'..TeamName(team), colour = TeamColour(team)},
					score = Add{x = 320, text = '^S^'..str, align = 1},
				}
				
				for j,player in ipairs(self.players) do
					if player:TeamId() == team then
						rowCount = rowCount + 1	
						AddScoreText.y = 60+rowCount*15
						self.rows[rowCount] = 
						{
							name  = Add{x = 150, text = '^S^'..PlayerName(player), colour = TeamColour(team)},
						}
					end
				end
			end			
		
		elseif GameType() == 3 then
			self.players = AllPlayers()
			local rowCount = 0		
			for i,team in ipairs(self.teams) do
				rowCount = rowCount + 1
				AddScoreText.y = 60+rowCount*15
				self.rows[rowCount] = 
				{
					name  = Add{x = 110, text = '^S^'..TeamName(team), colour = TeamColour(team)},
					score = Add{x = 320, text = '^S^'..main.game:TeamScore(team), align = 1},
				}
				for j,player in ipairs(self.players) do
					if player:TeamId() == team then
						rowCount = rowCount + 1	
						AddScoreText.y = 60+rowCount*15
						self.rows[rowCount] = 
						{
							name  = Add{x = 150, text = '^S^'..PlayerName(player), colour = TeamColour(team)},
						}
					end
				end
				
			end
		else
			self.rows = {}
			for i,team in ipairs(self.teams) do
				AddScoreText.y = 60+i*15
				self.rows[team] = 
				{
					name  = Add{x = 110, text = '^S^'..TeamName(team), colour = TeamColour(team)},
					score = Add{x = 320, text = '^S^'..main.game:TeamScore(team), align = 1},
				}
			end
		end
	else
		-- sort the players by score    
		self.players = self:SortedPlayers()

		self.rows = {}
		
		--turismo
		if GameType() == 1 then 
			-- show the waypoints and the laps done
			for i,player in ipairs(self.players) do
				
				-- turn off the turismo hud 
				main.game:ShowHUD(false)
				local lap = main.game:GetCurrentLapNumber(player:PlayerNum())
				local waypoints = main.game:GetCheckpointsCompletedThisLap(player:PlayerNum())
				local totalWP = main.game:GetNumberOfCheckpointsInLap()
			
				AddScoreText.y = 60+i*15
				self.rows[player] = 
				{
					num	  = Add{x = 110, text = '^S^'..i..' .', colour = player:Colour()},
					name  = Add{x = 130, text = '^S^'..player:Name(), colour = player:Colour()},
					--ping  = Add{x = 250, text = '^S^Lap = '..lap..'^S^ WayPoint = '..waypoints..'/'..totalWP, align = 0}
				}
			end
		elseif GameType() == 3 then
			for i,player in ipairs(self.players) do
				AddScoreText.y = 60+i*15
				self.rows[player] = 
				{
					name  = Add{x = 110, text = '^S^'..player:Name(), colour = player:Colour()},
				}
			end

		-- Tank
		elseif GameType() == 4 then
			for i,player in ipairs(self.players) do
				local timestring = string.format("%.2d:%.2d", main.game:GetTimeMinutes(player:PlayerNum()), main.game:GetTimeSeconds(player:PlayerNum()))
				AddScoreText.y = 60+i*15
				self.rows[player] = 
				{
					name  = Add{x = 110, text = '^S^'..player:Name(), colour = player:Colour()},
					time = Add{x = 320, text = '^S^'..timestring, align = 1},
				}
			end
			
		elseif GameType() == 5 then
			for i,player in ipairs(self.players) do
				local timestring = string.format("%.2d:%.2d", main.game:TimeMinutes(player), main.game:TimeSeconds(player))
				local bonustimestring = string.format("%.2d:%.2d", main.game:BonusTimeMinutes(player), main.game:BonusTimeSeconds(player))
				local totalMinutes = main.game:TimeMinutes(player) + main.game:BonusTimeMinutes(player)
				local totalSeconds = main.game:TimeSeconds(player) + main.game:BonusTimeSeconds(player)
				
				while (totalSeconds > 59) do
					totalMinutes = totalMinutes + 1
					totalSeconds = totalSeconds - 60	
				end
				
				local totalTimeString = string.format("%.2d:%.2d", totalMinutes, totalSeconds)
				
				AddScoreText.y = 60+i*15

				self.rows[player] = 
				{
					name  = Add{x = 110, text = '^S^'..player:Name(), colour = player:Colour()},					
					total = Add{x = 310, text = '^S^'..totalTimeString, align = 1, colour = player:Colour()},
--jonb				total = Add{x = 240, text = '^S^'..totalTimeString, align = 1},
--					time  = Add{x = 320, text = '^S^'..timestring, align = 1},
--					bonus  = Add{x = 400, text = '^S^'..bonustimestring, align = 1}
				}
			end
			
		-- Gone in Sixty seconds		
		elseif GameType() == 6 then
			for i,player in ipairs(self.players) do
				AddScoreText.y = 60+i*15
				self.rows[player] = 
				{
					name  = Add{x = 110, text = '^S^'..player:Name(), colour = player:Colour()},
					cash = Add{x = 260, text = '^S^$'..main.game:Cash(player), align = 1, colour = player:Colour()},
					cars = Add{x = 330, text = '^S^'..main.game:Cars(player), align = 1, colour = player:Colour()}
				}
			end
			
		else
			-- deathmatch
			for i,player in ipairs(self.players) do
				AddScoreText.y = 60+i*15
				self.rows[player] = 
				{
					num	  = Add{x = 110, text = '^S^'..i..' .', colour = player:Colour()},
					name  = Add{x = 130, text = '^S^'..player:Name(), colour = player:Colour()},
					score = Add{x = 320, align = 1, text = '^S^'..main.game:Score(player), colour = player:Colour()},
				}
			end	
		end
	end
end

function ScoreSheet:DrawOptions()
    self:HideOptions()
    
    local localplayer = Player()
    -- set up the font style etc   
    local AddScoreText = AddText:With{
        player = localplayer,
        y      = 70, 
        style  = 0,
        scale  = 0.4
    }       
    local function Add(settings)
        local spr = AddScoreText(settings)
        spr:Order(-1.0)
        table.insert(self.option_sprites, spr)
        return spr
    end
    
	--	Add quit options
    if self.screen == 0 then
		if main.game.state == 'StateGameWon' then
			self.option = 0
		end
		if self.option == 0 then
			if main.game.state ~= 'StateGameWon' then
				Add{x = 240, y = 240, align = 1, scale = .4, text = 'MPQUIT', colour = Colour(3)}
				Add{x = 240, y = 220, align = 1, scale = .4, text = 'MPCONT', colour = Colour(6)}
			else
				Add{x = 240, y = 240, align = 1, scale = .4, text = 'MPQUIT', colour = Colour(3)}
			end
		else
			Add{x = 240, y = 240, align = 1, scale = .4, text = 'MPQUIT', colour = Colour(6)}
			Add{x = 240, y = 220, align = 1, scale = .4, text = 'MPCONT', colour = Colour(3)}
		end
	else
		if self.option == 0 then
			Add{x = 240, y = 240, align = 1, scale = .4, text = 'YES', colour = Colour(3)}
			Add{x = 240, y = 220, align = 1, scale = .4, text = 'NO', colour = Colour(6)}
		else
			Add{x = 240, y = 240, align = 1, scale = .4, text = 'YES', colour = Colour(6)}
			Add{x = 240, y = 220, align = 1, scale = .4, text = 'NO', colour = Colour(3)}
		end
	end
end

function ScoreSheet:HideTitles()
    for _,text in pairs(self.title_sprites) do text:Remove() end
    self.title_sprites = {}
end

function ScoreSheet:HideScores()
    for _,text in pairs(self.score_sprites) do text:Remove() end
    self.score_sprites = {}
end

function ScoreSheet:HideOptions()
    for _,text in pairs(self.option_sprites) do text:Remove() end
    self.option_sprites = {}
end

-----------------------------------------------------------
ScoreSheetScript = StateMachine{'Update'}

function ScoreSheetScript:Show(lock)
    self.locked = lock
    self:_Show()
end

function ScoreSheetScript:Hide(lock)
    self:_Hide()
    self.locked = lock
end

function ScoreSheetScript:_NeedToggle()
    if self.locked then return end

    local startdown = StartDown()
    local pressed = startdown and not self.startdown
    self.startdown = startdown
    return pressed
end        

function ScoreSheetScript:Update()
    if self:_NeedToggle() then
        if self.scores then
            self:_Hide()
        else
            self:_Show()
            self.scores.screen = 0
			if main.game.state ~= 'StateGameWon' then
				self.scores.option = 1
				SetPauseScreenSelection(1)
	        else
	            self.scores.option = 0
	            SetPauseScreenSelection(0)
	        end
        end
    else
		if self.scores then
			DisablePlayer(true)
			
            local leftdown = DownDown()
            local rightdown = UpDown()
            local crossdown = CrossDown()
            
            local leftpressed = leftdown and not self.leftdown
            local rightpressed = rightdown and not self.rightdown
            local crosspressed = crossdown and not self.crossdown
            
            self.leftdown = leftdown
            self.rightdown = rightdown
            self.crossdown = crossdown
			
			ClearMessages()
			
			self.scores:DrawScores()
			
			if main.game.state ~= 'StateGameWon' or self.scores.screen ~= 0 then
				if leftpressed then
					if self.scores.option == 0 then
						self.scores.option = 1
						SetPauseScreenSelection(1)
					else
						self.scores.option = 0
						SetPauseScreenSelection(0)
					end
					--	Refresh the options
					self.scores:DrawOptions()
				elseif rightpressed then
					if self.scores.option == 0 then
						self.scores.option = 1
						SetPauseScreenSelection(1)
					else
						self.scores.option = 0
						SetPauseScreenSelection(0)
					end
					--	Refresh the options
					self.scores:DrawOptions()
				end
			end
			
			if crosspressed then
				if self.scores.option == 0 then
					if self.scores.screen == 0 then

						if main.game.state == 'StateGameWon' then
							self:_Hide()
							main:EndGame()
						else
							self.scores.screen = 1
							self.scores.option = 1
							SetPauseScreenSelection(1)
							--	Refresh the menu
							self.scores:DrawTitles()
							self.scores:DrawOptions()
							--	Dont need scores
							self.scores:HideScores()
						end
					else
						self:_Hide()
						main:EndGame()
					end
				else
					if self.scores.screen == 0 then
						local player = Player()
						if not player:IsPlaying() then
							-- NeilD Fade out before ending the menu, respawn will then fade back in
							CameraFadeOut(1)
							Wait(750)
						end
						self:_Hide()
					else
						self.scores.screen = 0
						self.scores.option = 1
						SetPauseScreenSelection(1)
						--	Refresh the menu
						self.scores:DrawTitles()
						self.scores:DrawScores()
						self.scores:DrawOptions()
					end
				end
			end
		end
    end
end

function ScoreSheetScript:_Show()
    if not self.scores then
		--	Erase the commentary when showing pause menu
		main.commentary:CleanUp()

        self.scores = ScoreSheet{}:Start()
    
		RenderPauseScreenStuff(true)
		self.scores:DrawTitles()
		self.scores:DrawScores()
		self.scores:DrawOptions()
    end
end

function ScoreSheetScript:_Hide()
    if self.scores then
		
		RenderPauseScreenStuff(false)
		
		self.scores:HideOptions()
		self.scores:HideScores()
		self.scores:HideTitles()
	
        self.scores:Stop()
        self.scores = nil
        self.locked = false
        
		-- turn the turismo hud back on
		if GameType() == 1 then 	
			main.game:ShowHUD(true)
		end
    end
end

function ScoreSheetScript:CleanUp()
    self:_Hide()
end
