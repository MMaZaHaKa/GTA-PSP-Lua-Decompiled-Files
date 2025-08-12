-- Team DeathMatch controller
-- RobM

require 'Pickups'
require 'CutscenePlayer'

TeamDeathMatch = StateMachine{'StateInit'}

PowerupTimer = Script{}

function TeamDeathMatch:StateInit()

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
	
	--andyg +1 cos span point 0 doesnt exist
	DoSpawn(PlayerId()+1) 
	
	if IsServer() then
		if UsePowerups() then
			local mytimer = PowerupTimer()
			mytimer:Start()
		end
	end
			
	Wait(1000)

	ClearSplashScreen()
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
	end

	--	ROBM - Start the game timer in timed games
	UpdateGameTime(true)
			
    --ActivatePlayers()
    
    --CameraFadeIn(1)
    return 'StateRunning'
end

function TeamDeathMatch:CleanUp()
    self.mytimer:Stop()
    -- remove the pickups
    self.mypickups:Cleanup()
end

function TeamDeathMatch:StateRunning()  
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

		self.winner = teams[1]
		self.state = 'StateGameWon'
    end
    
    -- temp debug spawn fuction
 --[[   if IsPlayerPressingHorn(player) then
		
		self:DoSpawn()
		
    end
]]--
end

function TeamDeathMatch:StateGameWon()
    -- the game has been won    
	--	ROBM - Stop the game timer in timed games
	UpdateGameTime(false)
	
    local txt = AddText{x = 240, y = 110, scale = .9, align = 1, text = "^S^"..self.winner:TeamName().."^S^ ^T^MPTWIN"}
    local counter = 0
    
    while counter < 250 do
		DisablePlayer(true)
		Wait(1)
		counter = counter + 1
    end
    --Wait(5000)
    txt:Remove()
    
    main.scores:Show(true)
	Wait(12000)

    --CameraFadeOut(1)
    
    --player:WaitKeyPressAndCameraCheck()
    
    main.scores:Hide()
    main:EndGame()
    
    return 'StateRunning'
end

function TeamDeathMatch:Commentate(text)
    main.commentary:Print(text)
end

function TeamDeathMatch:Score(player)
    return self.scores[player] or 0
end    

function TeamDeathMatch:TeamScore(team)
    return self.teamscores[team] or 0
end    

function TeamDeathMatch:RegisterPlayerKill(player, killer, headshot)
    --print('REGISTER PLAYER KILL: '..player:Name()..' killed '..killer:Name())

	if self.state ~= 'StateGameWon' then
		if player == killer then
			if self:Score(player) > 0 then
				self.scores[player] = self:Score(player) - 1
			end
			if self:TeamScore(player:TeamId()) > 0 then
				self.teamscores[player:TeamId()] = self:TeamScore(player:TeamId()) - 1
			end
			self:Commentate('^S^'..player:Name()..'^S^ ^T^MPKSELF')
		else
			if player:TeamId() ~= killer:TeamId() then
				self.scores[killer] = self:Score(killer) + 1
				self.teamscores[killer:TeamId()] = self:TeamScore(killer:TeamId()) + 1
			else
				if self:Score(killer) > 0 then
					self.scores[killer] = self:Score(killer) - 1
				end
				if self:TeamScore(killer:TeamId()) > 0 then
					self.teamscores[killer:TeamId()] = self:TeamScore(killer:TeamId()) - 1
				end
			end
	        
	        local killerName = killer:Name()
--	        if killer:TeamId() == 1 then 
--				killerName = '^S^ ~r~ '..killer:Name()..'^S^ ~w~ '
--			else
--				killerName = '^S^ ~b~ '..killer:Name()..'^S^ ~w~ '
--			end
			
			local playerName = player:Name()
--	        if player:TeamId() == 1 then 
--				playerName = '^S^ ~r~ '..player:Name()..'^S^ ~w~ '
--			else
--				playerName = '^S^ ~b~ '..player:Name()..'^S^ ~w~ '
--			end
	        
			-- see if they were killed with a headshot
			if headshot then
				self:Commentate('^S^'..killerName..'^S^ ^T^MPK^S^ '..playerName..'^S^ ^T^MPKHEAD')
				self.headshots = self.headshots + 1
			else
				self:Commentate('^S^'..killerName..'^S^ ^T^MPK^S^ '..playerName)
			end

			if self.fraglimit and killer then
				-- check how far left to reach the frag limit
				local fragsleft = self.fraglimit - self:TeamScore(killer:TeamId())
	            
				if fragsleft <= 0 and not self.winner then
					self.winner = killer
					self.state = 'StateGameWon'
				elseif fragsleft <= 3 and fragsleft > 1 then
					--PrintNow(killer:Name()..' only needs '..fragsleft..' more kills!')
					self:Commentate('^S^'..killer:TeamName()..'^S^ ^T^MPTNEED^S^ '..fragsleft..'^S^ ^T^MPMORE')
				elseif fragsleft == 1 then
					self:Commentate('^S^'..killer:TeamName()..'^S^ ^T^MPTNEED^S^ '..fragsleft..'^S^ ^T^MP1MORE')
				end
			end
		end
	end
end
