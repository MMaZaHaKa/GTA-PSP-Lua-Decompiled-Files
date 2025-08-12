-- HitParade controller
-- RobM

require 'gta'
require 'mainloop'
require 'spawn'

require 'PowerUps'
require 'Pickups'
require 'CutscenePlayer'

HitParade = StateMachine{'StateInit'}

CAR_HEALTH_DEC_PERIOD_MS = 1000
CAR_HEALTH_DEC_AMOUNT = 50

HIT_PARADE_GAME_TIME = 5

function HitParade:StateInit()

	--andyg... play the cutscene to start the game
--	PlayCutscene('biker')
--	CameraFadeIn(1)
	-- we will not get here till the cutscene has finished
	
	DbgPrintAllOptions()
	
--	IsTeamGame(false)
	self.mypickups = PickupMgr()
	self.mypickups:CreatePickups()
    self:Commentate('^T^GS_G6^S^ ^T^MPSTRT')
	self.fraglimit = GameScoreLimit()
--    self.scores = {}
	self.timeminutes = {}
	self.timeseconds = {}
	self.bonustimeminutes = {}
	self.bonustimeseconds = {}
	self.playerIsInCar = false
	self.timeToNextDecCarHealth = -1
	
    self.headshots = 0
    
    while not IsServer() and PlayerId() == 0 do
		Wait(100)
	end
	
	Wait(2000)
	
	--	Set the targets
	local players = AllPlayers()
	self.targetlist = {}
	self.currenttarget = 0
	
	--Server only variable
	self.currenttargetindex = 0

	--	Populate the list
	for i,player in ipairs(players) do
		self.targetlist[i] = player:PlayerNum()
	end
	print(table.getn(self.targetlist)," players have joined")

	--	Randomise the list
	for i,target in ipairs(self.targetlist) do
		local temptarget = target
		local changetarget = math.random(1, table.getn(self.targetlist))
		
		self.targetlist[i] = self.targetlist[changetarget]
		self.targetlist[changetarget] = temptarget
	end

	--	Set the first target
	self.neednewtarget = true

	--andyg +1 cos spawn point 0 doesnt exist
	DoSpawn(InitialSpawnPoint(PlayerId())) 
	
	if IsServer() then
		if UsePowerups() then
			local mytimer = PowerupTimer()
			mytimer:Start()
		end
	end

	if not NoFuckingCutscene() then
		-- cutscene guff
		main.scores:Hide(true)
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


    
    --	Tell the code that the game has started
    StartGame()
    
    return 'StateRunning'
end

function HitParade:CleanUp()
    self.mytimer:Stop()
    -- remove the pickups
    self.mypickups:Cleanup()
end

function HitParade:StateRunning()  
    local player = Player()
    if not player:IsPlaying() then
    
        main.scores:Show(true)
        Wait(1000)
        --CameraFadeOut(1)
        
        if TargetPlayer() == 200 then
			--main.scores:Hide()
			self:GetWinner()
			return
        end
        --player:WaitKeyPressAndCameraCheck()
        --main.scores:Hide()
        
       
        
        DoSpawn()
         if self.neednewtarget then
			self:NewTarget()
		end
		
    end
    
    if TargetPlayer() == 200 then
		self:GetWinner()
		return
    end

	if PlayerHealth(player) and PlayerHealth(player) > 0 then
		if self.neednewtarget then
			self:NewTarget()
		end
    end
    
    if GameTimeUp() then
		local players = AllPlayers()
		
		UpdateGameTime(false)
		--	Set the survival time
		for i,itplayer in ipairs(players) do
			if itplayer:PlayerNum() == self.currenttarget then
				self:SaveTime(itplayer)
			end
		end
		
		SetGameTime(HIT_PARADE_GAME_TIME)
		--	Refresh the scores
		if main.scores.scores and main.scores.scores.screen == 0 then
			main.scores.scores:DrawScores()
		end
		
		if (IsServer()) then
			if (self.currenttargetindex + 1 > table.getn(players)) then
				self:GetWinner()
			else 
				self:NewTarget()
			end
		end
		
    end
    
    --Handle disconnection
    local targetPlayer = Player(self.currenttarget)
    if not IsConnected(targetPlayer) then
		print("Target disconnected. Setting find new target")
		UpdateGameTime(false)
		self:SaveTime(Player(self.currentTarget))
		self.neednewtarget = true		
    end
    
    if (IsServer()) then
		local players = AllPlayers()
		--In case everyone else quits and leaves the server on their lonesome as the mark
		if (table.getn(players) == 1) then
			self:GetWinner()
		end
    end
    
    local playerCar = player:Car()
    if player:PlayerNum() == self.currenttarget and playerCar then
		local elapsedMS = GameElapsedMs()
		if not self.playerIsInCar then
			self.timeToNextDecCarHealth = elapsedMS + CAR_HEALTH_DEC_PERIOD_MS
			self.playerIsInCar = true
		end
		
		if elapsedMS > self.timeToNextDecCarHealth then
			local orighealth = VehicleHealth(playerCar)
			--local newhealth = orighealth - CAR_HEALTH_DEC_AMOUNT
			VehicleSetHealth(playerCar, orighealth - CAR_HEALTH_DEC_AMOUNT)
			self.timeToNextDecCarHealth = elapsedMS + CAR_HEALTH_DEC_PERIOD_MS
			print("reducing vehicle health to " .. (orighealth - CAR_HEALTH_DEC_AMOUNT) .. " from " .. orighealth)
		end
		
	else
		self.playerIsInCar = false	
		self.timeToNextDecCarHealth = -1
    end
    
    
    -- temp debug spawn fuction
 --[[   if IsPlayerPressingHorn(player) then
		
		self:DoSpawn()
		
    end
]]--
end

function HitParade:StateGameWon()
    -- the game has been won    
	--	ROBM - Stop the game timer in timed games
	UpdateGameTime(false)
	
	local txt
	
	if self.winner then
		txt = AddText{x = 240, y = 110, scale = .9, align = 1, text = "^S^"..self.winner:Name().."^S^ ^T^MPWIN"}
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
    
    main.scores:Show(true)
	Wait(12000)

    --CameraFadeOut(1)
    
    --player:WaitKeyPressAndCameraCheck()
    
    main.scores:Hide()
    main:EndGame()
    
    return 'StateRunning'
end

function HitParade:Commentate(text)
    main.commentary:Print(text)
end

function HitParade:TimeMinutes(player)
    return self.timeminutes[player] or 0
end    

function HitParade:TimeSeconds(player)
    return self.timeseconds[player] or 0
end    

function HitParade:BonusTimeMinutes(player)
    return self.bonustimeminutes[player] or 0
end    

function HitParade:BonusTimeSeconds(player)
    return self.bonustimeseconds[player] or 0
end

function HitParade:SaveTime(player)
	local secondslasted = 0
	local minuteslasted = 0
	
	secondslasted = 60 - GameTimeSeconds()
	minuteslasted = 4 - GameTimeMinutes()
	print("Minutes lasted: "..minuteslasted .." Seconds lasted: " .. secondslasted)
	if secondslasted > 59 then
		secondslasted = 0
		minuteslasted = minuteslasted + 1
	end

	self.timeminutes[player] = self:TimeMinutes(player) + minuteslasted
	self.timeseconds[player] = self:TimeSeconds(player) + secondslasted
	
	while self:TimeSeconds(player) > 59 do
		self.timeminutes[player] = self:TimeMinutes(player) + 1
		self.timeseconds[player] = self:TimeSeconds(player) - 60
	end
end

function HitParade:GiveTimeBonus(player)
	local secondsleft = 0
	local minutesleft = 0
	
	secondsleft = GameTimeSeconds()
	minutesleft = GameTimeMinutes()
	
	--Bonus is ten percent of max survival time
	local bonusSeconds = HIT_PARADE_GAME_TIME * 60 / 10
	
	
	--self.bonustimeminutes[player] = self:BonusTimeMinutes(player) + minutesleft
	self.bonustimeseconds[player] = self:BonusTimeSeconds(player) + bonusSeconds
	
	while self:BonusTimeSeconds(player) > 59 do
		self.bonustimeminutes[player] = self:BonusTimeMinutes(player) + 1
		self.bonustimeseconds[player] = self:BonusTimeSeconds(player) - 60
	end
end

function HitParade:GiveExtraTimeBonus(player, time)
	self.bonustimeseconds[player] = self:BonusTimeSeconds(player) + time
	
	while self:BonusTimeSeconds(player) > 59 do
		self.bonustimeminutes[player] = self:BonusTimeMinutes(player) + 1
		self.bonustimeseconds[player] = self:BonusTimeSeconds(player) - 60
	end
end

function HitParade:Score(player)
	local timescore = 0
	local bonusscore = 0
	local totalscore = 0
	
	timescore = (self:TimeMinutes(player) * 60) + self:TimeSeconds(player)
	bonusscore = (self:BonusTimeMinutes(player) * 60) + self:BonusTimeSeconds(player)
	
	totalscore = timescore + bonusscore
	
	return totalscore
end

function HitParade:GetWinner()
	local players = AllPlayers()
	TargetPlayer(200)
	if not self.winner then
		table.sort(players, 
			function(a, b) 
				return self:Score(a) > self:Score(b)
			end)
		
		if (self:Score(players[1]) == self:Score(players[2])) then
				self.winner = nil
		else
				self.winner = players[1]
		end
		
		self.state = 'StateGameWon'
	end
end

function HitParade:NewTarget()
	local players = AllPlayers()
	--	Set the game timer
	SetGameTime(HIT_PARADE_GAME_TIME)
	--	Stop the game timer in timed games
	UpdateGameTime(false)
	
	--	Print the countdown
	if IsServer() then
		--	Set the target so noone is targetted
		TargetPlayer(100)
		
		--	Make sure everyone is alive first
		WaitUntilAllPlayersAlive()
		
		self.currenttargetindex = self.currenttargetindex + 1
		print("new server currenttargetindex is...",self.currenttargetindex)
		if self.currenttargetindex > table.getn(self.targetlist) then
			self:GetWinner()
		else
		
		
			while not IsConnected(Player(self.targetlist[self.currenttargetindex])) do
				self.currenttarget = self.currenttarget + 1
				
				if self.currenttargetindex > table.getn(self.targetlist) then
					TargetPlayer(200)
					self:GetWinner()
					return
				end
			end
			local myPlayer = Player(self.targetlist[self.currenttargetindex])
			print("***** Target is ", myPlayer:Name(), myPlayer)
			
			Wait(1000)
			PrintNow(players, 'MPHP05', 10000, 1)
			Wait(1000)
			PrintNow(players, 'MPHP04', 10000, 1)
			Wait(1000)
			PrintNow(players, 'MPHP03', 10000, 1)
			Wait(1000)
			PrintNow(players, 'MPHP02', 10000, 1)
			Wait(1000)
			PrintNow(players, 'MPHP01', 10000, 1)
			Wait(1000)
			for i,player in ipairs(players) do
				if player:PlayerNum() == self.targetlist[self.currenttargetindex] then
					PrintNow(player, 'MPHPGO2', 5000, 1)
				else
					PrintNow(player, 'MPHPGO', 5000, 1)
				end
			end
			
			--	Set the target
			TargetPlayer(self.targetlist[self.currenttargetindex])
			self.currenttarget = self.targetlist[self.currenttargetindex]
		end
	else
		while TargetPlayer() >= 100 do
			Wait(0)
			print("holding for new target")
			if TargetPlayer() == 200 then
				self:GetWinner()
				return
			end
		end
		self.currenttarget = TargetPlayer()
		print("new self.currenttarget (client) is ",self.currenttarget)
	end
	
	local newTarget = Player(self.currenttarget);
	--local targetString = string.format("^S^~r~%s ~w~^T^%s", Player(self.currenttarget):Name(),'MPHPMAR')
	main.commentary:Print('^S^~r~'..newTarget:Name()..'~w~^S^ ^T^MPHPMAR')
	
	--self.currenttarget = self.currenttarget + 1
		
	--	Start the game timer in timed games
	UpdateGameTime(true)
	self.playerIsInCar = false
	self.neednewtarget = false
end

function HitParade:RegisterPlayerKill(player, killer, headshot)
    --print('REGISTER PLAYER KILL: '..killer:Name()..' killed '..player:Name())

	if self.state ~= 'StateGameWon' then
		if player == killer then
			self:Commentate('^S^'..player:Name()..'^S^ ^T^MPKSELF')
			if player:PlayerNum() == TargetPlayer() then
				UpdateGameTime(false)
				self:SaveTime(player)
				self.neednewtarget = true
			end
		else
			-- see if they were killed with a headshot
			if headshot then
				self:Commentate('^S^'..killer:Name()..'^S^ ^T^MPK^S^ '..player:Name()..'^S^ ^T^MPKHEAD')
				self.headshots = self.headshots + 1
			else
				self:Commentate('^S^'..killer:Name()..'^S^ ^T^MPK^S^ '..player:Name())
			end

			if killer then
				if player:PlayerNum() == TargetPlayer() then
					UpdateGameTime(false)
					self:SaveTime(player)
					self:GiveTimeBonus(killer)
					self.neednewtarget = true
				else
					self:GiveExtraTimeBonus(killer, 15)
					if killer:PlayerNum() == PlayerId() then
						PrintNow(Player(), 'MPHPKI', 5000, 1)
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
	
	main.game = HitParade():Start()

	main:Start()
end
