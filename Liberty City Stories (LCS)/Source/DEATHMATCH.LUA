-- DeathMatch controller
-- MattS

require 'gta'
require 'mainloop'
require 'spawn'

require 'PowerUps'
require 'Pickups'
require 'CutscenePlayer'

DeathMatch = StateMachine{'StateInit'}

function DeathMatch:StateInit()

	DbgPrintAllOptions()
	
--	IsTeamGame(false)
	self.mypickups = PickupMgr()
	self.mypickups:CreatePickups()
    self:Commentate('^T^GS_G1^S^ ^T^MPSTRT')

	if (GameScoreLimit() > 0) then 
		self.fraglimit = GameScoreLimit()
	else
		self.fraglimit = nil
	end
	
    self.scores = {}
    self.teamscores = {}
    self.headshots = 0
    
    while not IsServer() and PlayerId() == 0 do
		Wait(100)
	end
	
	--andyg +1 cos spawn point 0 doesnt exist
	DoSpawn(InitialSpawnPoint(PlayerId())) 
	
	if IsServer() then
		if UsePowerups() then
			local mytimer = PowerupTimer()
			mytimer:Start()
		end
	end
			
	Wait(1000)

	if not NoFuckingCutscene() then
		main.scores:Hide(true)
		-- cutscene guff
		Wait(0)
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

	--	ROBM - Start the game timer in timed games
	UpdateGameTime(true)
			
    --ActivatePlayers()
    
    --CameraFadeIn(1)
    return 'StateRunning'
end

function DeathMatch:CleanUp()
    self.mytimer:Stop()
    -- remove the pickups
    self.mypickups:Cleanup()
end

function DeathMatch:StateRunning()  
    local player = Player()
    if not player:IsPlaying() then
    
        main.scores:Show(true)
        Wait(1000)
        --CameraFadeOut(1)
        
        while main.scores.scores do
			Wait(250)
        end
        --player:WaitKeyPressAndCameraCheck()
        --main.scores:Hide()
        
        DoSpawn()
    end
    
    if GameTimeUp() then
		local players = AllPlayers()
		local teams = {}
		
		if IsTeamGame() then
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
			
			if (main.game:TeamScore(1) == main.game:TeamScore(2)) then
				self.winner = nil
			else
				self.winner = teams[1]
			end
		else
			table.sort(players, 
				function(a, b) 
					return self:Score(a) > self:Score(b)
				end)
				
			if (self:Score(players[1]) == self:Score(players[2])) then
				self.winner = nil
			else
				self.winner = players[1]
			end
		end
		
		
		
		self.state = 'StateGameWon'
    end
    
    -- temp debug spawn fuction
 --[[   if IsPlayerPressingHorn(player) then
		
		self:DoSpawn()
		
    end
]]--
end

function DeathMatch:StateGameWon()
    -- the game has been won    
	--	ROBM - Stop the game timer in timed games
	UpdateGameTime(false)
	
    local txt
	
	local player = Player()
	if IsTeamGame() then
		if self.winner:TeamId() == player:TeamId() then 
			DisplayFinalWinLoseMessage(1, "^S^"..player:TeamName().."^S^ ^T^MPTWIN")
		else
			DisplayFinalWinLoseMessage(2, "^S^"..self.winner:TeamName().."^S^ ^T^MPTWIN")
		end
	else
		if self.winner:PlayerNum() == player:PlayerNum() then 
			DisplayFinalWinLoseMessage(1, "^S^"..player:Name().."^S^ ^T^MPWIN")
		else
			DisplayFinalWinLoseMessage(2, "^S^"..self.winner:Name().."^S^ ^T^MPWIN")
		end
	end
	
--[[
	if (self.winner) then
		if IsTeamGame() then
			txt = AddText{x = 240, y = 110, scale = .9, align = 1, text = "^S^"..self.winner:TeamName().."^S^ ^T^MPTWIN"}
		else
			txt = AddText{x = 240, y = 110, scale = .9, align = 1, text = "^S^"..self.winner:Name().."^S^ ^T^MPWIN"}
		end
	else
		txt = AddText{x = 240, y = 110, scale = .9, align = 1, text = "^S^ ^T^MPDRAW"}
	end
    
    local counter = 0
    
    while counter < 250 do
		DisablePlayer(true)
		Wait(1)
		counter = counter + 1
    end
    --Wait(5000)
    txt:Remove()
--]]
    
    main.scores:Show(true)
	Wait(12000)

    --CameraFadeOut(1)
    
    --player:WaitKeyPressAndCameraCheck()
    
    main.scores:Hide()
    main:EndGame()
    
    return 'StateRunning'
end

function DeathMatch:Commentate(text)
    main.commentary:Print(text)
end

function DeathMatch:Score(player)
    return self.scores[player] or 0
end    

function DeathMatch:TeamScore(team)
    return self.teamscores[team] or 0
end    

function DeathMatch:RegisterPlayerKill(player, killer, headshot)
    --print('REGISTER PLAYER KILL: '..killer:Name()..' killed '..player:Name())

	if self.state ~= 'StateGameWon' then
		if player == killer then
			
			self.scores[player] = self:Score(player) - 1
			
			
			self.teamscores[player:TeamId()] = self:TeamScore(player:TeamId()) - 1
			
			self:Commentate('^S^'..player:Name()..'^S^ ^T^MPKSELF')
		else
			if IsTeamGame() then
				if player:TeamId() ~= killer:TeamId() then
					self.scores[killer] = self:Score(killer) + 1
					self.teamscores[killer:TeamId()] = self:TeamScore(killer:TeamId()) + 1
				else
					
					self.scores[killer] = self:Score(killer) - 1
					
					
					self.teamscores[killer:TeamId()] = self:TeamScore(killer:TeamId()) - 1
					
				end
			else
				self.scores[killer] = self:Score(killer) + 1
			end
	        
			-- see if they were killed with a headshot
			if headshot then
				self:Commentate('^S^'..killer:Name()..'^S^ ^T^MPK^S^ '..player:Name()..'^S^ ^T^MPKHEAD')
				self.headshots = self.headshots + 1
			else
				self:Commentate('^S^'..killer:Name()..'^S^ ^T^MPK^S^ '..player:Name())
			end

			if self.fraglimit and killer then
				-- check how far left to reach the frag limit
				local fragsleft = 0
				
				if IsTeamGame() then
					fragsleft = self.fraglimit - self:TeamScore(killer:TeamId())
				else
					fragsleft = self.fraglimit - self:Score(killer)
				end
	            
				if fragsleft <= 0 and not self.winner then
					self.winner = killer
					self.state = 'StateGameWon'
				elseif fragsleft <= 3 and fragsleft > 1 then
					--PrintNow(killer:Name()..' only needs '..fragsleft..' more kills!')
					if IsTeamGame() then
						self:Commentate('^S^'..killer:TeamName()..'^S^ ^T^MPTNEED^S^ '..fragsleft..'^S^ ^T^MPMORE')
					else
						self:Commentate('^S^'..killer:Name()..'^S^ ^T^MPNEED^S^ '..fragsleft..'^S^ ^T^MPMORE')
					end
				elseif fragsleft == 1 then
					if IsTeamGame() then
						self:Commentate('^S^'..killer:TeamName()..'^S^ ^T^MPTNEED^S^ '..fragsleft..'^S^ ^T^MP1MORE')
					else
						self:Commentate('^S^'..killer:Name()..'^S^ ^T^MPNEED^S^ '..fragsleft..'^S^ ^T^MP1MORE')
					end
				end
			end
		end
	end
end

function Main()
	main = MainLoop{}
	--GameLocation(2)
	--GameType(5)
	
	main.commentary = Commentary{}:Start()
	main.scores     = ScoreSheetScript{}:Start()

	InitSpawnPoints()
	
	local i = 0
	
	
	i = math.random(1, table.getn(main.vSpawnPoints))
	
	CreatePlayer(unpack(main.vSpawnPoints[i][1]))
	
	PlayerName(HostName())
	
	main.game = DeathMatch{}:Start()

	main:Start()
end

