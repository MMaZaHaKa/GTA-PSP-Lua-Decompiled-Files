-- Tank game controller
-- NeilD

require 'gta'
require 'mainloop'
require 'spawn'

require 'Pickups'
require 'PickupBlips'
require 'CutscenePlayer'


Tank = StateMachine{'StateInit'}


playerintank = -1


-- JonB : threads 
MultiTankClient = Script{_init = {'thisplayer'}}
TankMessagePump = Script{}
MessageDisplay = Script{}


-- other constants
WRECKED_TANK_CLEANUP_TIME = 20000
DEATH_WAIT_RESPAWN_TIME = 1000


-- ox0FFFFFFF : lua can only use 24 bits of precision
TANKEVENTMASK_NONE = 16777215

TANKEVENTMASK_TYPE = 14680064	-- 3 bits 
TANKEVENTMASK_PARAM1 = 1966080	-- 4 bits 
TANKEVENTMASK_PARAM2 = 131008	-- 10 bits 
TANKEVENTMASK_PARAM3 = 127

TANKEVENTSHIFT_TYPE = 21
TANKEVENTSHIFT_PARAM1 = 17
TANKEVENTSHIFT_PARAM2 = 7
TANKEVENTSHIFT_PARAM3 = 0

TANKEVENT_PLAYERINTANK = 0
TANKEVENT_GAMEOVER = 1
TANKEVENT_TIMEUPDATE = 2
TANKEVENT_TANK_DAMAGE = 3
TANKEVENT_AQUIRE_TANK = 4
-- don't use more than 7 events 


--
--
--
function Tank:StateInit()

	DbgPrintAllOptions()

	self.TankSpawnPoints = {}
	self.PlayerSpawnPoints = {}
	
		if GameLocation() == 0 then	--	Portland
			self.TankSpawnPoints =	{					
										{{797.8071, 207.5598, 2.6607}, 358.5674},
										{{929.1254, -54.7401, 6.8729}, 355.8375},
										{{1222.6725, -85.2097, 11.5875}, 121.4133},
										{{858.0843, -204.6711, 2.4764}, 87.2288},
										{{1340.4441, -252.3403, 48.6063}, 265.8214}, 
										{{1159.9774, -392.3391, 25.8040}, 270.8189},
										{{863.2579, -619.9805, 13.7827}, 266.1452},
										{{1012.0970, -855.1946, 13.9287}, 356.2619},
										{{1229.6819, -797.6679, 13.6930}, 215.9505},
										{{1550.7103, -702.2163, 10.7862}, 92.8023},
										{{880.7193, -988.7128, 4.0137}, 180.1849},
										{{1240.3583, -1036.9274, 13.8260}, 271.3563},
									}	
									
			self.PlayerSpawnPoints ={					
										{{1293.8296, -936.3995, 13.9326}, 9.3867},
										{{1037.9810, -933.4276, 13.9326}, 307.8666},
										{{826.0873, -848.7362, 14.0352}, 340.3770},
										{{1038.0424, -671.6776, 13.9326}, 195.6944},
										{{1203.4410, -512.1193, 23.9328}, 57.2714},
										{{843.8878, -507.8421, 13.9326}, 21.4699},
										{{1133.5897, -194.7319, 13.9326}, 149.1851},
										{{1356.6787, -290.3170, 48.9329}, 336.6544},
									}
									
		elseif GameLocation() == 1 then	--	Staunton Island
			self.TankSpawnPoints =	{
										{{155.8805, 186.9074, 10.6642}, 102.7052},	-- Tank 1 - Ferry Port
										{{268.2766, 53.4401, 12.7449}, 40.6748},	-- Tank 2 - Unfinished Tunnel Entrance
										{{176.0187, -155.4800, 15.4296}, 77.6582},	-- Tank 3 - University
										{{45.3672, -355.7569, 15.1348}, 349.4941},	-- Tank 4 - Yakuza Compound
										{{349.3484, -447.7346, 21.1986}, 88.0826},	-- Tank 5 - Near Pay'n'spray
										{{237.8835, -1109.3201, 25.1263}, 182.8372},-- Tank 6 - On bridge north of Amco Building
										{{463.3164, -786.4393, 15.1136}, 0.0033},	-- Tank 7 - Near waterside Just north of Callahan bridge
										{{95.2948, -999.2633, 26.2304}, 270.0},	-- Tank 8 - In park
										{{455.0771, -1489.4423, 17.6312}, 289.1265},-- Tank 9 - Casino Car park
										{{268.7971, -1679.5638, 25.0030}, 305.9543},-- Tank 10 - In trees at far south of island
										{{-121.2830, -1172.0967, 14.8282}, 355.1831 },-- Tank 11 - Under dualcarriageway south west of Island
										{{-50.3564, -464.0094, 15.3250}, 96.0153},	-- Tank 12 - Fire Station			
									}
									
			self.PlayerSpawnPoints ={	
										{{164.25, -622.24, -100.0}, 0.0},			-- standard set form startup.lua
										{{47.52, -635.31, -100.0}, 0.0}, 
										{{39.34, -724.23, -100.0}, 0.0}, 
										{{-116.20, -1176.88, -100.0}, 0.0}, 
										{{-91.98, -1383.62, -100.0}, 0.0}, 
										{{-29.16, -1152.60, -100.0}, 0.0}, 
										{{96.98, -1097.28, -100.0}, 0.0}
									}
				
		elseif GameLocation() == 2 then	--	Shoreside	
									
			self.TankSpawnPoints =	{
		
										{{-585.1682, 337.9316, 71.6561}, 0.2330},		-- Tank 1 - Back of posh house, driveway
										{{-334.1411, 128.9998, 7.3551}, 99.0586},		-- Tank 2 - woods
										{{-528.0366, -21.3841, 2.8213}, 359.2286},		-- Tank 3 - under wichita bridge
										{{-1184.0801, 304.2325, 2.3991}, 181.0941},		-- Tank 4 - in front of dam pumphouse
										{{-1124.5128, 135.8386, 57.7689}, 359.9820},    -- Tank 5 - by old import / export garage
										{{-1206.1182, 114.5237, 67.5982}, 88.7102},		-- Tank 6 - old "trap" courtyard
										{{-1268.1327, -152.1534, 57.7441}, 1.9605},		-- Tank 7 - in front of hospital
										{{-1062.7156, -153.1494, 32.7021}, 203.8334},	-- Tank 8 - flop house courtyard
										{{-741.3131, 195.6344, 27.6714}, 160.1146},		-- Tank 9 - ctf hillside carpark
										{{-848.1931, -173.8011, 32.8155}, 359.9948},    -- Tank 10 - turtle's head warehouse
										{{-366.6813, 260.2819, 60.1424}, 192.7559},		-- Tank 11 - front of DTB mansion
										{{-784.5757, 312.2558, 49.4734}, 343.6330},		-- Tank 12 - safehouse driveway
									}
									
			self.PlayerSpawnPoints ={							
										{{-725.23, 39.73, -100.0}, 0.0},				-- standard set form startup.lua
										{{-748.79, -583.35, -100.0}, 0.0}, 
										{{-644.43, -723.88, -100.0}, 0.0}, 
										{{-695.81, -194.61, -100.0}, 0.0}, 
										{{-861.49, 172.22, -100.0}, 0.0}, 
										{{-1211.44, 412.65, -100.0}, 0.0}
									}
		
		end



	-- array of damage done to tank, one entry per player 
	self.allPlayerDamage = {}
	self:ClearDamageArray()
	
    self.scores = {}
	self.tanktime = {}

	self.mypickups = PickupMgr()
	self.mypickups:CreatePickups()

	self.InATank = false
	
	self.winningPlayer=0

	-- Wait for server to start		
	
    while not IsServer() and PlayerId() == 0 do
		Wait(100)
	end


	-- Go...
			
	Wait(1000)	

	-- make a list of players
	
	self.players   = {}	
	self.totalmins = {}	
	self.totalseconds = {}	
	self.allplayers = AllPlayers()
		
	for i,player in ipairs(self.allplayers) do
		print('Insert '..i)
		table.insert(self.players, player)	
	end

	local t = 0
	while t<=8 do	
		self.totalmins[t] = 0	
		self.totalseconds[t] = 0
		t=t+1
	end	

	self.localplayer = Player(PlayerId())

	local player = Player()

    self.tankDamage = 0

	self.SplashTextIsOnScreen = false

    self.tankDam = TextSprite(player, 420, 85, 2)
	self.tankDam:Scale(0.5)
	self.tankDam:Style(2)
	self.tankDam:Colour(player:Colour())
	self.tankDam:Text('^T^DAM')
      
    self.tankDmgTxt = TextSprite(player, 465, 85, 2)
	self.tankDmgTxt:Scale(0.5)
	self.tankDmgTxt:Style(2)
	self.tankDmgTxt:Colour(player:Colour())
	self.tankDmgTxt:Text('^S^0000')
    
	self.tanktime = TextSprite(player, 465, 65, 2)
	self.tanktime:Scale(0.5)
	self.tanktime:Style(2)
	self.tanktime:Colour(player:Colour())
	self.tanktime:Text('^S^00:00')

	self.EndOfGame = false
    
    self.myMessagePump = TankMessagePump()
	self.myMessagePump:Start()
	Wait(100)
    
	-- JonB : manually cleanup old tanks when we get a chance 
	self.currentTank = nil
	self.wreckedTank = nil
	
    -- Decide who's going in the tank to start with

	--[[if IsServer() then
		-- Choose the player who'll start off in the tank
		self:ChoosePlayerInTank()
		self:DoSendEvent( TANKEVENT_PLAYERINTANK, playerintank, 0, 0 )					
	else
		-- Wait for the server to say who's starting off in the tank
		while playerintank<0 do
			--self:ReceiveEvents()
			Wait(1)
		end
	end--]]
		
	if IsServer() then
		local carPos = self:GetTankRespawnPosition()
		self.currentTank = CreateVehicle( TankModel(), carPos , carPos[4])
		VehicleSetCarDoorLocks(self.currentTank, CARLOCK_UNLOCKED)
	end
	
	self.StartGameRunForTank = true
	self.TankRadarBlip = nil
		
	-- force the first spawn 
	if self.localplayer:PlayerNum() ~= playerintank then
		--local startPos = self:GetOnFootRespawnPosition()
		--self.localplayer:Respawn(startPos, startPos[4])
		main.vSpawnPoints = self.PlayerSpawnPoints
		local startPos = DoSpawn(InitialSpawnPoint(PlayerId()), false) 
		print('^S^ XXXXXXXXXXXXXXXXXXXXXXXXXX'..PlayerId()..'^S^ '..InitialSpawnPoint(PlayerId()))
		self.localplayer:Respawn(startPos, startPos[4])
	end
	
	-- kick off a script for each player (ooh multi-threading fun)
	self.client = {}
	if IsServer() then
		for i,p in pairs(self.players) do
			self.client[p] = MultiTankClient{p}:Start()
		end
	end
	
	Wait(100)
	-- cutscene guff
	if not NoFuckingCutscene() then
		main.scores:Hide(true)
		Wait(5)
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

	-- Set the timer going
	SetGameTime(GameTimeLimit()) 
	UpdateGameTime(true)
	
    return 'StateRunning'
end



--
--
--
function Tank:CleanUp()
    self.mypickups:Cleanup()
    self.myMessagePump:Stop()
end



--
-- Workhorse
--
function Tank:StateRunning()  

	self:UpdateDamageDoneToTank()

	self:CheckPutInTank()

	self:CheckForRespawn_NoTank()

	self:UpdateRadar()
	
	self:CheckForGameOver()
	
	self:CheckForTankDisconnection()
	
	self:CheckForEndGame()
	
	Wait(10)
end


function Tank:CheckPutInTank()

	local player = Player()

	-- at the start of the game check for the first player to get in the tank 
	if self.StartGameRunForTank == true and player:InATank() then 
		
		-- get the tank object 
		self.currentTank = GetLocalPlayersVehicle()
		
		self:DoSendEvent( TANKEVENT_AQUIRE_TANK, PlayerId(), 0, 0 )
		Wait(200)
				
		-- the server will have a blip to remove 
		if self.TankRadarBlip ~= nil then
			RemoveBlip(self.TankRadarBlip)
			self.TankRadarBlip = nil
		end
	end

	-- If this is us and we're not in a tank then respawn inside one somewhere....
	if PlayerId() == playerintank and player:IsPlaying() and not player:InATank() then				
		self:TransferPlayerToTank()			
	end
	
--	if PlayerId() == playerintank then
--		self.tankDam:Text('^T^KE_HLTH')
--	else
--		self.tankDam:Text('^T^DAM')
--	end
end



function Tank:UpdateRadar()
			
	if	PlayerId() == playerintank or 
		(self.StartGameRunForTank == true and IsServer()) then 

		local pos
		
		if self.currentTank == nil then 
			pos = PlayerPosition(Player())
		else
			pos = VehiclePosition(self.currentTank)
		end
		
		-- force the vehicle to always be drawn on radar by making its height huge 
		pos[3] = pos[3] + 1000
		
		if self.TankRadarBlip ~= nil then
			UpdateBlipCoord(self.TankRadarBlip, pos)
		else		
			self.TankRadarBlip = AddBlipForCoord(pos, 1, pickupicon.objective)			
		end
	end
end


function Tank:UpdateDamageDoneToTank()
	local player = Player()
	--print('XXXXXX I AM == '..player:PlayerNum())
	--print('XXXXXX IN Tank == '..playerintank)
	if player:PlayerNum() == playerintank then
	
		-- player in tank shows all damage done 
		self.tankDamage = 1000 - VehicleHealth(self.currentTank)
		local str = string.format("%.4d", self.tankDamage)
		self.tankDmgTxt:Text('^S^ '..str)

		local amt = VehicleGetLastDamageAmount(self.currentTank)
		local id = VehicleGetLastDamagePlayerID(self.currentTank)
		
		--print('TEST BEFORE SEND AMT == '..amt..' By Player ='..id)
		
		if amt > 0 and id ~= -1 then
			--print('Sending Tank Damage = '..amt..' By Player ='..id)
			VehicleClearLastDamagePlayerID(self.currentTank)	
			self:DoSendEvent( TANKEVENT_TANK_DAMAGE, id, amt, 0 )	
		end
		
	end
end


function Tank:CheckForGameOver()
	if IsServer() then
	
		local numPlayers = table.getn(self.players)  
		local i=0
		local score
		
		-- check for premature end of game 
		if numPlayers == 1 then
			print('All Clients Gone, Quiting')
			UpdateGameTime(false)
			self.winningPlayer = 0
			--self.state = 'StateGameOver'
			self.EndOfGame = true
		end
		
		for i=0, numPlayers do 
			
			score = self:GetTimeMinutes(i) * 60000
			score = score + (self:GetTimeSeconds(i) * 1000)
			
			--print('\nSCORE = '..score)
			--print('\nSCORE Limit= '..score)
			if score >= (GameScoreLimit()*60000) then	
				Tank:DoSendEvent( TANKEVENT_GAMEOVER, i, 0, 0 )	
			end	
		end 
		
	end
end


-- Check to see if player in tank has disconnected
function Tank:CheckForTankDisconnection()

	if IsServer() and playerintank ~= -1 then
		local player = Player(playerintank)
		if not IsConnected(player) then 
			print("Player has left the game and was in a tank "..playerintank)
			self:ChoosePlayerInTank()
			Tank:DoSendEvent( TANKEVENT_PLAYERINTANK, playerintank, 0, 0 )					
		end
	end
end


--
--
--
function Tank:ChoosePlayerInTank()
	local NumPlayers = table.getn(self.players)    
	
	local Found = false
	
	local newTankPlayer
	
	while not Found do
		newTankPlayer = math.random(0, NumPlayers-1)   		
		
		-- same player cannot go in again
		if newTankPlayer ~= playerintank then
			Found = IsConnected( Player( newTankPlayer ) )
		end
	end
	
	playerintank = newTankPlayer
	
	print( "Player In Tank Is "..playerintank )
	TargetPlayer(playerintank)
end



--
--	Transfers a player to a tank....
--  Also selects a respawn point for them
--
function Tank:TransferPlayerToTank()	

	print("Respawning player in transferplayertotank")
		
	local startPos = self:GetTankRespawnPosition()
	
	print("Transfering player to a tank")

	local carPos = startPos

	startPos[3] = -100			
	
	print('\nx == '..carPos[1])	
	print('\ny == '..carPos[2])	
	print('\nz == '..carPos[3])	
	print('\nheading == '..carPos[4])

	self.currentTank = CreateVehicle( TankModel(), carPos , carPos[4])
				
	SetPosition(Player(PlayerId()), startPos)
	WarpPlayerIntoCar(PlayerId(), self.currentTank)

	self.InATank = true
	
	self:DisplayTankMessage('^S^ ^S^'..Player(playerintank):Name()..'^S^ ^T^MPTANK', 2000)			
end	



-- respawns a player on foot 
function Tank:CheckForRespawn_NoTank()
	local player = Player()

	if player:PlayerNum() ~= playerintank then		
		if not player:IsPlaying() then

			Wait(DEATH_WAIT_RESPAWN_TIME)
			--player:WaitKeyPress()	

			local playerPos = self:GetOnFootRespawnPosition()
			--player:Respawn(playerPos)
			self.localplayer:Respawn(playerPos, playerPos[4])
		end
	end
end


--
--
--
function Tank:CheckForEndGame()    
	
	if self.EndOfGame == true then
	
		main.game.state = 'StateGameWon'
		Wait(100)

		local HighestPerson = -1	
		local HighestTime = 0	

		self.tanktime:Remove() 
		self.tankDmgTxt:Remove()
		self.tankDam:Remove()

		if IsServer() then	
			for i,p in pairs(self.players) do		
				self.client[p]:Stop()
			end	
		end
		
		
	--[[
		local a = 0
		while a<=8 do
			local ThisTime = ( self.totalmins[a] * 60 ) + self.totalseconds[a]
			if  ThisTime > HighestTime then
				HighestTime = ThisTime
				HighestPerson = a
			end
			a = a + 1
		end
	--]]

	--[[
		local txt = AddText{x = 240, y = 108, scale = .9, align = 1, text = '^T^MPOVER'}
		local str = string.format("%.2d:%.2d", self.totalmins[HighestPerson], self.totalseconds[HighestPerson])
		local txt2 = AddText{x = 240, y = 150, scale = .6, align = 1, text = '^T^MPHIGH^S^ '..str..'^S^ ^T^MPBY^S^'..Player(HighestPerson):Name()}
		Wait(5000)
		txt2:Remove()
		txt:Remove()
	    
		main.scores:Show(true)
		Wait(5000)  
		main.scores:Hide()
	    
		main:EndGame()
	--]]
	  
	  
  		UpdateGameTime(false)
	  	
  		local winningPlayer = Player(self.winningPlayer)
		
		local player = Player()
		local theWinner
		if player:PlayerNum() == self.winningPlayer then
			theWinner = 1
		else 
			theWinner = 2
		end
		
		if theWinner == 1 then 
			DisplayFinalWinLoseMessage(theWinner, "^S^"..player:Name().."^S^ ^T^MPWIN")
		else
			DisplayFinalWinLoseMessage(theWinner, "^T^MRACE04")
		end
		
		
		--[[
		local txt = AddText{x = 240, y = 128, scale = .9, align = 1, text = "^S^"..player:Name().."^S^ ^T^MPWIN"}
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
		Wait(6000)

		--CameraFadeOut(1)
	    
		--player:WaitKeyPressAndCameraCheck()
	    
		main.scores:Hide()
		main:EndGame()
	end
    
    --return 'StateRunning'
end


 -- JonB : manually cleanup old tanks when we get a chance 
--function Tank:UpdateWreckedTank()
	
--self.ShortcutRespawnTimer = WRECKED_TANK_CLEANUP_TIME

--	if self.wreckedTank ~= nil and IsVehicleWrecked(self.wreckedTank) == true then 
		
--		local tankPos = {}
--		tankPos = VehiclePosition(self.wreckedTank)
--		if IsSphereOnScreen(tankPos, 5.0, 100)==false then
--			DeleteVehicle(self.wreckedTank)
--			self.wreckedTank = nil 
--		end

		-- update the respawn timer 
--		if 	self.ShortcutVehicle1 == nil or	self.ShortcutVehicle2 == nil then
--			self.ShortcutRespawnTimer = self.ShortcutRespawnTimer - (GameElapsedMs() - self.ShortcutResoawnLastUpdate)
--			print('timer = '..self.ShortcutRespawnTimer)
--		end
--		self.ShortcutRespawnLastUpdate = GameElapsedMs()

--	end
--end


--
--
--
function Tank:Commentate(text)
    main.commentary:Print(text)
end



--
-- JonB : called by score sheet to lua to get a particular players score 
--
function Tank:Score(player)
	local totalScore=0
	totalScore = self.totalmins[player:PlayerNum()] * 60
	totalScore = totalScore + self.totalseconds[player:PlayerNum()]
	return totalScore
end    


--
-- If you're killed by another player that player gets put in a tank
-- and you respawn on foot
--
function Tank:RegisterPlayerKill(player, killer, headshot)

	if IsServer() then
		-- the player in the tank has been killed, warp the killer into the tank
		if player:PlayerNum() == playerintank and player:InATank() then
			
			-- if the player in the tank killed themselves then someone else gets a go 
			--if killer:PlayerNum() == player:PlayerNum() and killer:PlayerNum() == playerintank then
			--	self:ChoosePlayerInTank()
			--else	
				-- they killed him fair give the guy who did most damage the tank 	
				local mostDam = self:PlayerWhoDamagedTankMost()
				if mostDam ~= playerintank then 
					playerintank = mostDam 
				else
					self:ChoosePlayerInTank() -- tie for damage, randomly pick one 
				end
				
				TargetPlayer(playerintank)
			--end

			print('The Tank is dead, Long live the Tank : '..playerintank)
			
			-- tell all the clients who is now in the tank, the message handler will put them into it 
			self:DoSendEvent( TANKEVENT_PLAYERINTANK, playerintank, 0, 0 )				
		end
	end
	
	-- if this player has just died in the tank copy the wrecked ptr so we can clean it up later 
--	if self.localplayer:PlayerNum() == player:PlayerNum() and self.currentTank ~= nil then	
--		self.wreckedTank = self.currentTank
--		self.currentTank = nil
--	end



	
	-- display messages 
	
	-- someone killed thenselves
	if killer:PlayerNum() == player:PlayerNum() then
		self:Commentate('^S^'..player:Name()..'^S^ ^T^MPKSELF')
	else
		self:Commentate('^S^'..killer:Name()..'^S^ ^T^MPK^S^ '..player:Name())
	end
	
end



--
-- Keeps track of one tank - updating the total time for how long you've been driving a tank
--
function MultiTankClient:Run()	
	
	if main.game.EndOfGame == false then
		
		local playerLocal = self.thisplayer:PlayerNum()
			
		self.gameseconds = GetGameSeconds()
		
		self.mins = 0
		self.seconds = 0
		
		while 1>0 do
			if  playerintank == playerLocal then
										
				Wait(100)

				local newseconds = GetGameSeconds()
							
				if newseconds != self.gameseconds then
						
					self.gameseconds = newseconds
					
					self.seconds = self.seconds + 1
					if self.seconds==60 then
						self.seconds = 0
						self.mins = self.mins + 1
					end		
					
					-- Tell everyone			
					Tank:DoSendEvent( TANKEVENT_TIMEUPDATE, playerLocal, self.mins, self.seconds )
				end
			else
				Wait(500)
			end	
		end
	end
end



--
--
--
function Tank:GetTimeMinutes(playernum)
    return self.totalmins[playernum]
end    



--
--
--
function Tank:GetTimeSeconds(playernum)
    return self.totalseconds[playernum]
end    



--
--
--
function MultiTankClient:CleanUp()
end




--
-- Translates an event type and 2 parameters into a single event value
--
function Tank:DoSendEvent( Type, Param1, Param2, Param3 )

	print("Sending event "..Type.." "..Param1.." "..Param2.." "..Param3)
		
	local Event = MaskEventNumber( Type, TANKEVENTMASK_NONE, TANKEVENTSHIFT_TYPE )
	Event = Event + MaskEventNumber( Param1, TANKEVENTMASK_NONE, TANKEVENTSHIFT_PARAM1 )
	Event = Event + MaskEventNumber( Param2, TANKEVENTMASK_NONE, TANKEVENTSHIFT_PARAM2 )
	Event = Event + MaskEventNumber( Param3, TANKEVENTMASK_NONE, TANKEVENTSHIFT_PARAM3 )
	
	SendEvent( Event )
end



function Tank:ClearDamageArray()
	self.allPlayerDamage[1] = 0
	self.allPlayerDamage[2] = 0
	self.allPlayerDamage[3] = 0
	self.allPlayerDamage[4] = 0 
	self.allPlayerDamage[5] = 0
	self.allPlayerDamage[6] = 0
	self.allPlayerDamage[7] = 0
	self.allPlayerDamage[8] = 0
end


function Tank:PlayerWhoDamagedTankMost()

	print('PlayerWhoDamagedTankMost')
	
	local numPlayers = table.getn(self.players)  
	local i=1
	local bestScore=0
	local bestPlayerID=0
	
	for i=1, numPlayers do 
		
		if self.allPlayerDamage[i] > bestScore then
			bestScore = self.allPlayerDamage[i]
			bestPlayerID = i-1
		end
	end		
	
	return bestPlayerID
end


--
--
--
function Tank:ReceiveEvents()
	while not IsEventStackEmpty() do
	
		local Event = GetEvent()
		
		if self.EndOfGame == true then
			return
		end
			
		local Type = MaskEventNumber( Event, TANKEVENTMASK_TYPE, -TANKEVENTSHIFT_TYPE )
		local PlayerNumber = MaskEventNumber( Event, TANKEVENTMASK_PARAM1, -TANKEVENTSHIFT_PARAM1 )
		local Mins = MaskEventNumber( Event, TANKEVENTMASK_PARAM2, -TANKEVENTSHIFT_PARAM2 )
		local Seconds = MaskEventNumber( Event, TANKEVENTMASK_PARAM3, -TANKEVENTSHIFT_PARAM3 )
		
		local player = Player()
		
		if Type == TANKEVENT_TIMEUPDATE then 
			self.totalmins[PlayerNumber] = Mins
			self.totalseconds[PlayerNumber] = Seconds
			
			--print("TANKEVENT_TIMEUPDATE : Mins = "..Mins.." Second = "..Seconds)
			
			if PlayerNumber == PlayerId() and player:InATank() then
				local str = string.format("%.2d:%.2d", Mins, Seconds)
				--print("Text "..str)
				self.tanktime:Text('^S^'..str)
			end
		
		
		elseif Type == TANKEVENT_GAMEOVER then 
			print('XXX TANKEVENT_GAMEOVER XXX')
			UpdateGameTime(false)
			self.winningPlayer = PlayerNumber
			--self.state = 'StateGameOver'
			self.EndOfGame = true
		
		
		elseif Type == TANKEVENT_TANK_DAMAGE then 
			print('XXX TANKEVENT_TANK_DAMAGE XXX')
			print('Player '..PlayerNumber..' Damaged It By = '..Mins)
			local player = Player()
			--print('PlayerNumber == '..PlayerNumber..'player:PlayerNum() == '..player:PlayerNum())
			if PlayerNumber == player:PlayerNum() then
				self.tankDamage = self.tankDamage + Mins
				print('Player '..PlayerNumber..' Total Damage = '..self.tankDamage)
				local str = string.format("%.4d", self.tankDamage)
				--self.tankDmgTxt:Text('^T^DAM'..'^S^ '..str)
				self.tankDmgTxt:Text('^S^ '..str)
			end
			
			-- server keeps track of who has the greatest damage 
			if IsServer() then
				self.allPlayerDamage[PlayerNumber+1] = self.allPlayerDamage[PlayerNumber+1] + Mins
			end
		
		
		-- TODO : Force a response message so we know they're in the tank 
		
		elseif Type == TANKEVENT_PLAYERINTANK then
			playerintank = PlayerNumber
			print("MSG = TANKEVENT_PLAYERINTANK : Player In Tank = "..playerintank)
			
			-- no running for the tank anymore
			self.StartGameRunForTank = false
			
			-- remove any radar blip we may have
			if self.TankRadarBlip ~= nil then
				RemoveBlip(self.TankRadarBlip)
				self.TankRadarBlip = nil
			end
			
			self:ClearDamageArray()
			self.tankDamage = 0
			local str = string.format("%.4d", self.tankDamage)
			self.tankDmgTxt:Text('^S^ '..str)

--[[			
			-- If this is us and we're not in a tank then respawn inside one somewhere....
			if PlayerId() == playerintank then
							
--				if not player:IsPlaying() then 
--					Wait(DEATH_WAIT_RESPAWN_TIME + 100)
--				end
				self:TransferPlayerToTank()
				self.InATank = true	
							
				--[[
				-- can't put the player in if they're dead so pick another player and send the message again 
				local player = Player()
				if not player:IsPlaying() then 
					Wait(1600)
					self:ChoosePlayerInTank()
					self:DoSendEvent( TANKEVENT_PLAYERINTANK, playerintank, 0, 0 )	
				else			
					self:TransferPlayerToTank()
					self.InATank = true	
				end
				--]]
			else
				self.InATank = false
			end
--]]
			
			-- only show the messages if you are not wasted 	
			if player:IsPlaying() then 			
				self:DisplayTankMessage('^S^ '..Player(playerintank):Name()..'^S^ '..'^T^MPTANK', 1500)
			end

--[[			
			-- sort out the radar icons
			local allplayers = AllPlayers()
			for i,player in ipairs(allplayers) do
				if (i-1) == playerintank then 		
					--print("Tank"..i..playerintank)
					Player((i-1)):SetRadarBlipIcon(pickupicon.objective)
				else
					Player((i-1)):SetRadarBlipIcon(pickupicon.player)
					--print("Player"..i..playerintank)
				end
			end
--]]
		
		
		elseif Type == TANKEVENT_AQUIRE_TANK then
			
			playerintank = PlayerNumber
			print("MSG = TANKEVENT_AQUIRE_TANK : Player In Tank = "..playerintank)
			
			-- no running for the tank anymore
			self.StartGameRunForTank = false	
			
			self:ClearDamageArray()
			
			-- only show the messages if you are not wasted 	
			if player:IsPlaying() then 			
				self:DisplayTankMessage('^S^ '..Player(playerintank):Name()..'^S^ '..'^T^MPTANK', 1500)
			end
		end
		

	end
end


function Tank:GetOnFootRespawnPosition()
	local pos = {}
	
	main.vSpawnPoints = self.PlayerSpawnPoints
	pos = DoSpawn(nil, false)

	return pos
end 


function Tank:GetTankRespawnPosition()
	
	local pos = {}
	
	main.vSpawnPoints = self.TankSpawnPoints
	pos = DoSpawn(nil, false)

	return pos
end 


--
-- JonB uses a text sprite to display the message in its own thread
--
function Tank:DisplayTankMessage(theText, length)		

	if self.SplashTextIsOnScreen == false then 
		--setup the message 
		self.Msg = theText
		self.MsgLength = length
		self.MsgColour = {0, 106, 164, 255}

		-- display the message in a seperate thread so we don't slow time everything 
		self.MessageDisplay = MessageDisplay()
		self.MessageDisplay:Start()
	end
end



function MessageDisplay:CleanUp()
	print('Message Display CLEANUP')
end


function MessageDisplay:Run()
	main.game.SplashTextIsOnScreen = true
	local player = Player()
	local text = TextSprite(player, 240, 70, 1)
	
	text:Scale(0.7)
	text:Style(2)
	text:Colour(main.game.MsgColour[1], main.game.MsgColour[2], main.game.MsgColour[3], main.game.MsgColour[4])
	text:Text(main.game.Msg)
	Wait(main.game.MsgLength)
	text:Remove()
	main.game.SplashTextIsOnScreen = false
end 


function TankMessagePump:CleanUp()
	print('MESAGE PUMP CLEANUP')
end


function TankMessagePump:Run()

	while 1 do
		main.game:ReceiveEvents()
		Wait(50)
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
	
	main.game = Tank():Start()

	main:Start()
end
