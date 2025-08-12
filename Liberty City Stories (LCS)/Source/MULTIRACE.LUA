-- Multiplayer Race Script
-- Andyg

require 'gta'
require 'mainloop'
require 'spawn'

require 'Pickups'
Turismo = StateMachine{'StateInit'}
RaceMessagePump = Script{}
MessageDisplay = Script{}


--message ids
MSG_GOOD_RACE_POWERUP = 1
MSG_BAD_RACE_POWERUP = 2
MSG_RACE_CHECKPOINT_HIT = 3
MSG_RACE_OVER = 4
MSG_GRID_SHUFFLE_PLUS1 = 5
MSG_GRID_SHUFFLE_PLUS2 = 6
MSG_GRID_SHUFFLE_PLUS3 = 7
MSG_GRID_SHUFFLE_PLUS4 = 8
MSG_GRID_SHUFFLE_PLUS5 = 9
MSG_GRID_SHUFFLE_PLUS6 = 10
MSG_GRID_SHUFFLE_PLUS7 = 11
MSG_LAP_COMPLETED = 12
MSG_RACE_POSITION_CHANGED = 13


-- const's
POSITION_HEART_BEAT_FREQUENCY = 3000
RESPOT_TIME = 20500


--used for building the message to tell the client how far they have got along the track
function Turismo:SendCheckpointHitMessage(client, checkpointNum)
	local event = 3 + (client * 64) + (checkpointNum * 512)
	SendEvent(event)
end



function Turismo:SendLapCompleteMessage(client)
	local event = MSG_LAP_COMPLETED + (client * 64)
	SendEvent(event)
end


function Turismo:SendRacePositionChangedMessage(client, position)
	local event = MSG_RACE_POSITION_CHANGED + (client * 64) + (position * 512)
	SendEvent(event)
end


function Turismo:SendRaceOverMessage(client)
	local event = MSG_RACE_OVER + (client * 64)
	SendEvent(event)
end


function RaceMessagePump:CleanUp()
	print('MESAGE PUMP CLEANUP')
end

function RaceMessagePump:Run()

	local goodRacePickups = 
	{
		10, -- INSTANT REPAIR
		--11,-- BURST OPP TYRES
		--12 -- SET OPPS ON FIRE
	}
	
	local badRacePickups = 
	{
		10,
		--20, -- SET ON FIRE
		--21, -- BURST TYRES
	}

	while 1 do
	
		Wait(10)
		
		--querey the message queue to see if anything has happened
		if IsEventStackEmpty() == false then
			local event = GetEvent()
			
			--first 6 bits are the event type
			local eventType = MaskEventNumber(event,63,0)
			--next 3 bits are the owner of the event
			local eventOwner = MaskEventNumber(event,448,-6)
			--next 8 are the checkpoint number (only used in some messages from server)
			local checkpointNumber = MaskEventNumber(event,130560,-9)
						
			if eventType == MSG_RACE_CHECKPOINT_HIT then -- checkpoint hit
				--this is a messgae from the server telling the player 
				--which checkpoint they have just passed through
				main.game:IncrementCheckpointsCompleted(eventOwner)
				if eventOwner == PlayerId() then
					print('SERVER TELLS ME IVE HIT CHECKPOINT '..checkpointNumber)
					main.game.myLastWaypoint = checkpointNumber
					main.game:UpdateWaypointBlips()
				end
				
			--jonb : hijacked the checkpointNumber var for the race position 
			elseif eventType == MSG_RACE_POSITION_CHANGED then
				
					print('MSG Race Position Changed : player == '..eventOwner..' new pos == '..checkpointNumber)
					
					main.game.allRacePositions[eventOwner+1] = checkpointNumber
					
				if eventOwner == PlayerId() then
					main.game.currentRacePosition = checkpointNumber
				end
					
			--jonb
			elseif eventType == MSG_LAP_COMPLETED then 
				--print('Lap Completed Msg')	
				main.game:IncrementCurrentLapNumber(eventOwner)
				if eventOwner == PlayerId() then
					print('Processing Lap Completed Msg')	
					main.game.lapNumber = main.game.lapNumber + 1

					-- dont go over the number of laps when they finish 
					if main.game.lapNumber > GameScoreLimit() then
						main.game.lapNumber = GameScoreLimit()
					end
				end
				
			elseif eventType == MSG_RACE_OVER then	--RACE_OVER
				print('RACE OVER TIME TO CLOSE DOWN')
				--CameraFadeOut(3)
				--while IsCameraFading() do
				--	Wait(0)
				--end
				--main.game:CleanUp()
				main.game.raceWinner = eventOwner
				
			-- JonB
			elseif eventType == MSG_GRID_SHUFFLE_PLUS1 then 
				main.game:SetGridShuffle(1)
				--print('ShuffleMsg 1')
			elseif eventType == MSG_GRID_SHUFFLE_PLUS2 then 
				main.game:SetGridShuffle(2)
				--print('ShuffleMsg 2')
			elseif eventType == MSG_GRID_SHUFFLE_PLUS3 then 
				main.game:SetGridShuffle(3)
				--print('ShuffleMsg 3')
			elseif eventType == MSG_GRID_SHUFFLE_PLUS4 then 
				main.game:SetGridShuffle(4)
				--print('ShuffleMsg 4')
			elseif eventType == MSG_GRID_SHUFFLE_PLUS5 then 
				main.game:SetGridShuffle(5)
				--print('ShuffleMsg 5')
			elseif eventType == MSG_GRID_SHUFFLE_PLUS6 then 
				main.game:SetGridShuffle(6)			
				--print('ShuffleMsg 6')
			elseif eventType == MSG_GRID_SHUFFLE_PLUS7 then 
				main.game:SetGridShuffle(7)															
				--print('ShuffleMsg 7')
						
			else
				print 'UNKNOWN MESSGAE IN EVENT STACK!'
				print('FULL = '..event..' X')
				print('TYPE = '..eventType..' X')
				print('OWNER = '..eventOwner..' X')
			end
			
		end
				
	end
	
	print('ELVIS HAS LEFT THE MESSAGE PUMP!')
end


function Turismo:StateInit()   
	
--    while not IsServer() and PlayerId() == 0 do
--		Wait(100)
--	end

	-- wait for everyone to join, max 10 seconds 
	local allplayers = AllPlayers()
	local numPlayers = table.getn(allplayers)
	local i = 0  
    while numPlayers ~= GetExpectedNumberOfPlayers() and i < 20 do
		print('Turismo is sat on its ass waiting for '..GetExpectedNumberOfPlayers()..' players, at the minute is has '..numPlayers..' players')
		allplayers = AllPlayers()
		numPlayers = table.getn(allplayers)
		Wait(500)
		i = i + 1 
	end

	
	
--	if IsServer() then 
--		Wait(5000)
--	end

	-- jonb
	self.gridShuffle = 0
	local player = Player()
	
	self.currentRacePosition = PlayerId() + 1
	
	-- array of checkpoints hit, one entry per player 
	self.allCheckPointsCompleted = {}
	self.allCheckPointsCompleted[1] = 0
	self.allCheckPointsCompleted[2] = 0
	self.allCheckPointsCompleted[3] = 0
	self.allCheckPointsCompleted[4] = 0 
	self.allCheckPointsCompleted[5] = 0
	self.allCheckPointsCompleted[6] = 0
	self.allCheckPointsCompleted[7] = 0
	self.allCheckPointsCompleted[8] = 0
	
	-- array of current lap numbers, one entry per player 
	self.allCurrentLap = {}
	self.allCurrentLap[1] = 1
	self.allCurrentLap[2] = 1
	self.allCurrentLap[3] = 1
	self.allCurrentLap[4] = 1 
	self.allCurrentLap[5] = 1
	self.allCurrentLap[6] = 1
	self.allCurrentLap[7] = 1
	self.allCurrentLap[8] = 1
	
	-- array of current race position, one entry per player 
	self.allRacePositions = {}
	self.allRacePositions[1] = 1
	self.allRacePositions[2] = 2
	self.allRacePositions[3] = 3
	self.allRacePositions[4] = 4 
	self.allRacePositions[5] = 5
	self.allRacePositions[6] = 6
	self.allRacePositions[7] = 7
	self.allRacePositions[8] = 8
	
	self.rankhud = {}
	
	self.currentRankHeartBeat = GameElapsedMs()
	
	SetMsBeforeNextCreateCar(1000)
	self.trafficNormal = false
	-- end jonb
	
	--initialise the track data and reverse as needed

	self:InitTrack()
	if RaceReverse() then
		self:ReverseRacePoints()
	end
	
	--used for the clients to keep track of their last hit waypoint
	self.myLastWaypoint = 1
	
	self.mypickups = PickupMgr()
	self.mypickups:CreatePickups()
	
	self.scores = {}
	
	self:TurnRoadsOffAtStartLine(false)
	
	-- JonB
	self.respotCounter = 0
	self.respotLastUpdate = 0
	self.respotText = nil
	
	-- reset the game timer 
	GameElapsedMs(0)
	-- start the game timer
	UpdateGameTime(true)
	self.lapNumber = 1
	self.blip = nil
	self.nextblip = nil
	self:UpdateWaypointBlips()
	self.isRespawning = false
	
	self.SplashTextIsOnScreen = false
	
	-- init HUD 
	self.currentLapSprite = nil 
	self.poshud = nil
	self.postitle = nil
	self.lapTitle = nil
	self:ShowHUD(true)
	self:DrawHUD()
	
	self.myMessagePump = RaceMessagePump()
	self.myMessagePump:Start()
	
	self.raceWinner = -1
	
	Wait(1500)
	
	CameraFadeOut(5)
	
	--every one adds them selves to the start line
	--based on their player ID for position
	DoSpawn()
	self:CreatePlayerinCarAtTrackNode(1,true)
	
	self:Commentate('^T^GS_G2^S^ ^T^MPSTRT')
	
	SetVectorForSinglePlayerScript(self.track[1][1])

	-- turn off the race arrow
	RaceArrowVisible(false)

    return 'StateRunning'
end


function Turismo:StateRunning()
	Wait(50)
	if IsServer() then
		self:StartTheRace()
	end
	self:CheckForRespawn()	
	self:CheckForRespot()
	self:DrawHUD()
	self:SetTrafficNormal()
	
	-- end of race 
	if self.raceWinner ~= -1 then 
		self:DisplayWinnerMsg(self.raceWinner)
	end
end


--adds a car and puts the player in the car
function Turismo:CreatePlayerinCarAtTrackNode(node, startGrid)
	
	local track     = self.track
	local isStartGrid = startGrid
	
	--work out which 2 nodes we are useing to work this stuff out
	local trackNode = node
	local trackNextNode = node + 1
	if trackNextNode > table.getn(track) then
		trackNextNode = trackNextNode - table.getn(track)
	end
	
--	local startheading = 180 --self.startheading
	
	local startPos = {}
	local playerPos = {}
	
	if isStartGrid then
		-- calculate next starting grid position
		local forward = {}
		forward[1] = track[trackNode][1][1] - track[trackNextNode][1][1]
		forward[2] = track[trackNode][1][2] - track[trackNextNode][1][2]
		forward[3] = 0
		forward = VecNormalise(forward)
		local up = {0,0,1}
		local right = CrossProduct(forward,up)
		
		local startloc = {}
		local gridSlot = self.currentRacePosition - 1
		print('Grid Slot == '..gridSlot)
		
		local length = 0
		local width = 0
		length = 20.0 --we want the cars to start slightly back at the moemnt
		while gridSlot > 1 do
			gridSlot = gridSlot - 2
			length = length + 8.0
		end

		if gridSlot <= 0 then
			width = -2.5
		else
			width = 2.5
		end
	
		startPos[1] = track[trackNode][1][1] + (right[1] * width) + (forward[1] * length)
		startPos[2] = track[trackNode][1][2] + (right[2] * width) + (forward[2] * length)
		startPos[3] = track[trackNode][2]
		local z = FindGroundZFor3DCoord(startPos)
		startPos[3] = z
		--startPos[3] = -101 --track[1][3] + 3	
		playerPos[1] = startPos[1]
		playerPos[2] = startPos[2]
		playerPos[3] = startPos[3]
		--playerPos[3] = 100 --track[1][3] + 3
	else
		startPos[1] = track[trackNode][1][1]
		startPos[2] = track[trackNode][1][2]
		startPos[3] = track[trackNode][2]
		local z = FindGroundZFor3DCoord(startPos)
		startPos[3] = z
		--startPos[3] = -101 --track[1][3] + 3
		playerPos[1] = startPos[1]
		playerPos[2] = startPos[2]
		playerPos[3] = startPos[3]
		--playerPos[3] = 100 --track[1][3] + 3
		
		-- wait until the area is clear for us to spawn in, if its blocked use the road nodes to get a spawn position
		ClearArea(playerPos, 20.0)
		Wait(100)
		local i = 1
		while CheckObjectSpawnPosition(playerPos, 15.0)==false do
			playerPos = FindNthNodeClosestToCoors(playerPos, i)	
			
			--local z = FindGroundZFor3DCoord(playerPos)
			--playerPos[3] = z
			
			print("\nFind Close Returned"..playerPos[1].." "..playerPos[2].." "..playerPos[3])
			Wait(100)
			ClearArea(playerPos, 20.0)		
			i = i + 1
		end
		
		startPos[1] = playerPos[1]
		startPos[2] = playerPos[2]
		startPos[3] = playerPos[3]
		
		
		local player = Player()
		print("\nRespawning at "..playerPos[1].." "..playerPos[2].." "..playerPos[3])
		player:Respawn(playerPos)
	end
	
	local startheading = GetAngleBetweenPoints(track[trackNextNode][1][1],track[trackNextNode][1][2],track[trackNode][1][1],track[trackNode][1][2])
	
	--create a nice shiny car
	local car = CreateVehicle( RaceCar(),
				startPos,
				startheading)
	--put me in it
	--andyg: this is a bit cack handed but it was the only way to stop the cars bouncing like zebadee
	Wait(1)
	SetPosition(Player(PlayerId()),playerPos)
	Wait(1)
	WarpPlayerIntoCar(PlayerId(),car)
	
	if isStartGrid then
		PlayerCarControl(Player(PlayerId()), false)
		Wait(250)

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
			Wait(50)
			ClearSplashScreen()
		end
		
		PlayerCarControl(Player(PlayerId()), false)
	end
	
	self.isRespawning = false
end


function Turismo:TurnRoadsOffAtStartLine(onoroff)
	-- disable the roads in the area...
	local vRoadsMin = {}
	local vRoadsMax = {}
	
	vRoadsMin[1] = self.track[1][1][1] - 25.0
	vRoadsMin[2] = self.track[1][1][2] - 25.0
	vRoadsMin[3] = self.track[1][1][3] - 25.0
	vRoadsMax[1] = self.track[1][1][1] + 25.0
	vRoadsMax[2] = self.track[1][1][2] + 25.0
	vRoadsMax[3] = self.track[1][1][3] + 25.0
	
	EnableRoads( newplayer, vRoadsMin, vRoadsMax, onoroff )
end



function Turismo:StartTheRace()
	local track     = self.track
	local players   = {}

	-- work out camera pos...
	local vCamPos = {}
	
	local allplayers = AllPlayers()
		
	print("Staring to add players!")	
	
	for i,player in ipairs(allplayers) do
		
		print 'adding a player to the race'					
    	
		-- add the player to the list
		table.insert(players, player)
	end

	
	PlayerCarControl(players, false)

	--self:CheckForRespawn()			


	
	-- give them the camera back..
	RestoreCamera( 0, player )   
    
	-----------------------------------------------------------
	-- ok, start the race
	local countdown = TextSprite(players, 480/2, 272/2, 1)
	countdown:Scale(1.0)
	countdown:Style(2)
	countdown:Colour(0, 106, 164, 255)
	countdown:Text('MRACEC3')
	Wait(500)
	countdown:Text('MRACEC2')
	Wait(500)
	countdown:Text('MRACEC1')
	Wait(500)
	PlayerCarControl(players, true)
	countdown:Text('MRACEGO')
	Wait(500)
	countdown:Remove()
	
	self:TurnRoadsOffAtStartLine(true)
	
	-- keep a count of how many have finished the race	
	local numPlayersFinished = 0
	local winnerBeenDisplayed = 0

	-----------------------------------------------------------
	-- define an object to keep track of each player
	local MultiRaceClient = Script{_init = {'thisplayer'}}
		
	
	function MultiRaceClient:Run()	
		print("MULTIRACE CLIENT RUNNING")
		local playerLocal = self.thisplayer
		local lapCounter = 0
		self.totalWaypointCounter = 0
		
		-- jonb
		self.newRacePosition = 1
		self.racePosition = 1
				
		self.waypoint = 2
		-- this function handles a single player's waypoints/radar
		while self.waypoint <= table.getn(track) do		
			--print ('WP = '..self.waypoint)
			--print ('Targ WP = '..table.getn(track))
			--self.wphud:Text('Waypoint '..self.waypoint..' of '..table.getn(track))

			-- where's the waypoint?
			local pos = track[self.waypoint][1]
			local wpArrowHeight = track[self.waypoint][2]
			
			local nextway = self.waypoint + 1
			if nextway > table.getn(track) then
				--dont show an arrow if we are on the last way point
				if ((lapCounter + 1) == GameScoreLimit()) then
					nextway = self.waypoint
				else
					nextway = 1
				end
			end
			
			local nextpos = {unpack(track[nextway][1])};
			--andyg need to change this so every waypoint has a height
			nextpos[3] = pos[3] + 7
				
			local radius = 10
			-- update the waypoints
			if self.waypoint < table.getn(track) then
				self.wp = SetWaypoint(playerLocal, pos, nextpos, radius, 255, 255, 0, 128, radius * (7.0/8.0), wpArrowHeight, true )	-- yellow
			else
				self.wp = SetWaypoint(playerLocal, pos, nextpos, 10, 255, 0, 0, 128, radius * (7.0/8.0), wpArrowHeight, false )	-- red
			end
			
						
			-- wait for player to reach the way point while updating their race position
			while not self.wp:HasBeenHit() and PlayerCar(playerLocal) do
				Wait(10)
				if self.newRacePosition ~= self.racePosition then 
					self.racePosition = self.newRacePosition
					main.game:SendRacePositionChangedMessage(playerLocal:PlayerNum(), self.racePosition)
				end
			end
			
			self.wp:Remove()	
					
			if not PlayerCar(playerLocal) then
				--self.poshud:Text('get back in a car to finish the race!!')
				
				if main.game.isRespawning == false and not main.scores.scores then 
					PrintNow(playerLocal, 'MRACE11', 5000, 1)
				end
														
				while not PlayerCar(playerLocal) do									
					Wait(100)
				end
				
			else
				-- player hit the waypoint
				main.game:SendCheckpointHitMessage(playerLocal:PlayerNum(),self.waypoint)
				self.waypoint = self.waypoint + 1
				self.totalWaypointCounter = self.totalWaypointCounter + 1
				
				-- work out if wee need to go another lap
				if self.waypoint > table.getn(track) then
					lapCounter = lapCounter + 1
					
					-- jonb : tell the client they have completed a lap 
					main.game:SendLapCompleteMessage(playerLocal:PlayerNum())
					
					print("lap "..lapCounter.." complete !")	
					if lapCounter < GameScoreLimit() then
						self.waypoint = 1
						--lapCounterSprite:Text('^s^'..(lapCounter+1).."/"..GameScoreLimit())
					end
				end
				
			end
		end
		
		-- use 100 to signify race completed
		self.waypoint = 100
		--lapCounterSprite:Remove()
		numPlayersFinished = numPlayersFinished + 1

		if numPlayersFinished == 1 then
			
			--[[
			--PrintNow(player, 'MRACE04', 2000, 1)
			local winnermsg = TextSprite(players, 240, 130, 1)
			winnermsg:Scale(0.44, 1.0)
			winnermsg:Style(1)
			winnermsg:WrapX(640)
			
			winnermsg:Text('^s^~g~'..PlayerName(playerLocal)..' ^t^MRACEWI')
			Wait(5000)
			winnermsg:Remove()
			
			
			--race ends when first person crosses the finish line
			print 'race finished'
--			raceFinished = true
			--]]
	
			winnerBeenDisplayed = 1
			main.game:SendRaceOverMessage(playerLocal:PlayerNum())
			--SendEvent(4)

		--else
			--PrintNow(player, 'MRACE05', 2000, 1)
		end
		
	end

	function MultiRaceClient:CleanUp()
		print('MultiRaceClient:CleanUp')
		if self.wp then self.wp:Remove() end
		RemoveWaypoint(self.thisplayer)
	end
	-----------------------------------------------------------

	-- make a list to keep track of all the player info
	local client = {}
	-- kick off a script for each player (ooh multi-threading fun)
	for i,p in pairs(players) do
		print("STARTING CLIENT "..i)
		client[p] = MultiRaceClient{p}:Start()
	end
	
	-- monitor the global state of the race here
	local raceFinished = false
	while not raceFinished do
		-- we only bother updating race positions every few frames so wait
		-- a little while first
		Wait(50)
		--print 'race running'
		
		-- check if any players have dropped out of the race
		for i,p in ipairs(players) do
			if not IsConnected(p) or IsDead(p) then
				-- stop the player's script
				client[p]:Stop()
				PrintNow(p, 'MRACE06', 5000, 1)
				main.game.allRacePositions[i] = 9999
				--client[p].waypoint = -1
				-- sack off last slot on the race positions hud
				--rankhud[table.getn(players)]:Remove()
				--table.remove(rankhud, table.getn(players))
				-- and remove him from the list
				table.remove(players, i)
				break -- can't carry on through the list, as we just deleted
					  -- something out of it
			end
		end
	
		-- sort the players by position		
		local positions = players
		table.sort(positions, 
			function(a, b)		
			
				if not IsConnected(a) then 
					return false
				end

				if not IsConnected(b) then 
					return true
				end
									
				local lapA = client[a].totalWaypointCounter
				local lapB = client[b].totalWaypointCounter
				if (lapA ~= lapB) then
					-- who's furthest along in terms of laps
					return lapA > lapB
				end
				local wpA = client[a].waypoint
				local wpB = client[b].waypoint
				-- check who is in front, player A or player B
				if (wpA ~= wpB or wpA == 100 or wpA == -1) then
					-- who's furthest along in terms of waypoints
					return wpA > wpB
				end
				-- both heading for the same waypoint, use distance
				local waypointPos = track[wpA][1]
				return Distance(PlayerPosition(a), waypointPos) <
						Distance(PlayerPosition(b), waypointPos)
			end)
			
		
		local sendHeartBeat = false
		if GameElapsedMs() - self.currentRankHeartBeat >= POSITION_HEART_BEAT_FREQUENCY then
			self.currentRankHeartBeat  = GameElapsedMs()
			sendHeartBeat = true
		end
			
		-- print the positions on the players' screens
		for position,player in ipairs(positions) do	
				
			-- jonb update each clients race position 
			client[player].newRacePosition = position
			
			-- every second force a race position message to each player 
			if sendHeartBeat == true then
				print('Sending Race Position Heart Beat to Player '..player:PlayerNum())
				main.game:SendRacePositionChangedMessage(player:PlayerNum(), position)
			end
			
		end
			
		-- check if there are less than 2 players left in the race or if 
		-- all or 3 or more players have finished the race
		local numPlayers = table.getn(players)

		-- check for end of race 
		if self.raceWinner ~= -1 then 
			self:DisplayWinnerMsg(self.raceWinner)
		end
	
		--if numPlayers < 2 or 
		--	 numPlayersFinished >= math.min(3, numPlayers) then
		if (winnerBeenDisplayed >= 1) and (numPlayersFinished >= math.min(1, numPlayers)) then
			print 'race finished'
			raceFinished = true
		end
				
		self:CheckForRespawn()			
		self:CheckForRespot()
		self:DrawHUD()
		self:SetTrafficNormal()
		

	end
	
	for i,p in pairs(players) do
		-- kill player's script		
		client[p]:Stop()
		-- check whether they'd actually finished the race
		if client[p].waypoint ~= 100 then	
			if table.getn(players) < 2 then
				print 'disqual'
				-- inform the player that they've won due to all other
				-- players being disqualified
				PrintNow(p, 'MRACE10', 5000, 1)
			else
				print 'retired'
				-- inform the player that they've been retired
				PrintNow(p, 'MRACE06', 5000, 1)
			end
		end
	end	
	
	-- re-enable roads in area...
--andyg...	EnableRoads( newplayer, vRoadsMin, vRoadsMax, 1 )

	self:TurnRoadsOffAtStartLine(true)
	
--	self:CleanUp()
--	self:Start()

	while 1 do
--		print('WAITING FOR GAME TO END')
		Wait(0)
	end
	
	return
end



--
-- If you're killed by another player that player gets put in a tank
-- and you respawn on foot
--
function Turismo:RegisterPlayerKill(player, killer, headshot)

    print('REGISTER PLAYER KILL: '..player:Name()..' killed '..killer:Name())
	
	local killerName = killer:Name()
	local playerName = player:Name()
		
	if player == killer then
		self:Commentate('^S^'..playerName..'^S^ ^T^MPKSELF')
	else      
		-- see if they were killed with a headshot
		if headshot then
			self:Commentate('^S^'..killerName..'^S^ ^T^MPK^S^ '..playerName..'^S^ ^T^MPKHEAD')
			self.headshots = self.headshots + 1
		else
			self:Commentate('^S^'..killerName..'^S^ ^T^MPK^S^ '..playerName)
		end
	end
end



function Turismo:SetTrafficNormal()
	if self.trafficNormal == false and GameElapsedMs() > 10000 then 
		SetMsBeforeNextCreateCar(0)
		self.trafficNormal = true
	end
end


function Turismo:CheckForRespawn()
	local player = Player()
	local playerpos = self.track[self.myLastWaypoint][1]
	
	if not player:IsPlaying() then  
		self.isRespawning = true
        Wait(1000)
		CameraFadeOut(1)
		Wait(500)      	    	
		self:CreatePlayerinCarAtTrackNode(self.myLastWaypoint, false)
	end
end

function Turismo:CleanUp()
		
	print('turismo cleanup')
	
	SetMsBeforeNextCreateCar(0)
	
	self.myMessagePump:Stop()
	
	-- restore the camera if quit early..
	RestoreCamera( 0, newplayer )
	
    -- remove the pickups
    self.mypickups:CleanUp()

	EndGame()
end

function Turismo:Commentate(text)
    main.commentary:Print(text)
end


function Turismo:ReverseRacePoints()
	print 'reversing the track'

	local originalTrack = table.clone(self.track)
	local numCheckPoints = table.getn(self.track)

	--we want to keep the start point the same	
	self.track[1] = originalTrack[1]

	for i = 2 , numCheckPoints do
		self.track[i] = originalTrack[numCheckPoints-i+2]
	end
end


-- if the player is out of the car for 30 seconds he is placed back on track in a new car 
function Turismo:CheckForRespot()
	
	if IsLocalPlayerInVehicle() == true then 
		self.respotCounter = 0
		if self.respotText ~= nil then 
			self.respotText:Remove()
			self.respotText = nil
		end
	else
		
		self.respotCounter = self.respotCounter + (GameElapsedMs() - self.respotLastUpdate)
		
--		print(self.respotCounter)
		
		-- display the respot countdown
		if self.respotText == nil then 
			self.respotText = TextSprite(Player(), 240, 70, 1)		
			self.respotText:Scale(0.7)
			self.respotText:Style(2)
			self.respotText:Colour{0, 106, 164, 255}	
		end
			
		local str = string.format("%.0d", main.game:GetTimeBeforeRespot())				
		self.respotText:Text('^S^'..str)
				
		if self.respotCounter >= RESPOT_TIME then
			self:CreatePlayerinCarAtTrackNode(self.myLastWaypoint, false)
		end

	end
	
	self.respotLastUpdate = GameElapsedMs()
end

function Turismo:GetTimeBeforeRespot()
	return (RESPOT_TIME - self.respotCounter) / 1000
end


function Turismo:SetGridShuffle( shuffle )
	self.gridShuffle = shuffle
	
	self.currentRacePosition = self.currentRacePosition + shuffle
	local allplayers = AllPlayers()
	local numPlayers = table.getn(allplayers)
	print('Num Players == '..numPlayers)
	if (self.currentRacePosition > numPlayers) then
		self.currentRacePosition = self.currentRacePosition - numPlayers
	end
		
	local i = 0
	for i=1, numPlayers do 
		self.allRacePositions[i] = self.allRacePositions[i] + shuffle
	
		if (self.allRacePositions[i] > numPlayers) then
			self.allRacePositions[i] = self.allRacePositions[i] - numPlayers
		end
	end
		
	self:ShowHUD(true)
	self:DrawHUD()
	print('Grid Shuffle =='..self.gridShuffle)
end


function Turismo:ShowHUD( toggle )
	
	local player = Player()
	
	if toggle == true then 
	
		if 	self.currentLapSprite == nil and self.poshud == nil and self.postitle == nil and self.lapTitle == nil then 
			-- current lap text 
			self.currentLapSprite = TextSprite(player, 465, 60, 2)
			self.currentLapSprite:Scale(0.6)
			self.currentLapSprite:Style(0)
			self.currentLapSprite:Colour(255, 255, 255, 255)
			self.currentLapSprite:Text('^s^ ')
		
			--text saying "lap"
			self.lapTitle = TextSprite(player, 415, 60, 2)
			self.lapTitle:Scale(0.5)
			self.lapTitle:Style(0)
			self.lapTitle:Colour(255, 255, 255, 255)
			self.lapTitle:Text('^s^ ')
				
			-- race position text 
			--actual place number
			self.poshud = TextSprite(player, 465, 80, 2)
			self.poshud:Scale(0.5)
			self.poshud:Style(0)
			self.poshud:Colour(255, 255, 255, 255)
			self.poshud:Text('^s^ ')
			
			--text saying "position"
			self.postitle = TextSprite(player, 415, 80, 2)
			self.postitle:Scale(0.5)
			self.postitle:Style(0)
			self.postitle:Colour(255, 255, 255, 255)
			self.postitle:Text('^s^ ')
			
			
			local allplayers = AllPlayers()
			local player
			for i,player in ipairs(allplayers) do
				local y = 100 + (15 * (i - 1))
			
				self.rankhud[i] = TextSprite(Player(), 332, y, 0)
				self.rankhud[i]:Style(0)
				self.rankhud[i]:Scale(0.4)
				self.rankhud[i]:Pos(332, y, 0.1) -- slide in
				self.rankhud[i]:Colour(player:Colour())					
				self.rankhud[i]:Text('^S^'..self.allRacePositions[i]..'. '..player:Name())			 
			end
		
		end
	else
		if 	self.currentLapSprite ~= nil and self.poshud ~= nil and self.postitle ~= nil and self.lapTitle ~= nil then 
			self.currentLapSprite:Remove()
			self.poshud:Remove()
			self.postitle:Remove()
			self.lapTitle:Remove()
			self.currentLapSprite = nil 
			self.poshud = nil
			self.postitle = nil
			self.lapTitle = nil

			local allplayers = AllPlayers()
			local player
			for i,player in ipairs(allplayers) do
				self.rankhud[i]:Remove()
			end			
			
		end
	end
end


-- when a waypoint is hit this function is called to remove the old way point and add the next one to the radar 
function Turismo:UpdateWaypointBlips()
	
	-- remove both the old blips 
	if 	self.blip ~= nil then 
		RemoveLocalRadarBlip(self.blip)
		self.blip = nil
	end
	if 	self.nextblip ~= nil then 
		RemoveLocalRadarBlip(self.nextblip)
		self.nextblip = nil
	end	
	
	local player = Player()
	local DrawWayPoints = true
	-- no more waypoints if you've finished the race
	if self:GetCurrentLapNumber(player:PlayerNum()) > GameScoreLimit() then
		DrawWayPoints = false
		
		-- also turn off the race arrow
		RaceArrowVisible(false)
	end
	
	if DrawWayPoints == true then
	
		-- now add the new ones 

		local nextWayPoint = self:GetCheckpointsCompletedThisLap(PlayerId())
		nextWayPoint = nextWayPoint + 2 
		

		-- where's the waypoint?
		local pos = {}
		pos[1] = self.track[nextWayPoint] [1] [1]
		pos[2] = self.track[nextWayPoint] [1] [2]
		pos[3] = self.track[nextWayPoint] [1] [3]

		-- cannot do rad = pos or you get a ref ! 
		local rad = {}
		rad[1] = pos[1]
		rad[2] = pos[2]
		rad[3] = pos[3] + 1000 -- move the point high so it is always displayed on the radar 

		self.blip = AddLocalBlipForCoord(rad, 4, pickupicon.checkpoint)
		
		
		if self:GetCurrentLapNumber(player:PlayerNum()) > GameScoreLimit() or (self:GetCurrentLapNumber(player:PlayerNum()) == GameScoreLimit() and self.myLastWaypoint == (self:GetNumberOfCheckpointsInLap()-1)) then
			DrawWayPoints = false
		end
		if DrawWayPoints == true then
		
			if nextWayPoint < table.getn(self.track) then
				rad[1] = self.track[nextWayPoint + 1] [1] [1]
				rad[2] = self.track[nextWayPoint + 1] [1] [2]
				rad[3] = self.track[nextWayPoint + 1] [1] [3]  + 1000 -- move the point high so it is always displayed on the radar 
			else 
				rad[1] = self.track[1] [1] [1]
				rad[2] = self.track[1] [1] [2]
				rad[3] = self.track[1] [1] [3]  + 1000				
			end
					
			-- draw a blip for the next waypoint along as well
			self.nextblip = AddLocalBlipForCoord(rad, 1, pickupicon.checkpoint) 
		end
		
	end
end


-- Clients use this function to draw the laps completed and their race position 
function Turismo:DrawHUD()
	
	if 	self.currentLapSprite ~= nil and self.poshud ~= nil and self.postitle ~= nil and self.lapTitle ~= nil then 	
	
		-- lap number text 
		self.currentLapSprite:Text('^s^'..(self.lapNumber).."/"..GameScoreLimit())
		--print(self.currentRacePosition)

		-- race position text 
		self.poshud:Text('^s^'..self.currentRacePosition..string.ordinalSuffix(self.currentRacePosition))
		self.postitle:Text('^t^MRACEPO')
		self.lapTitle:Text('^t^MRACELA')
		
		
		-- print the rankings 
		local allplayers = AllPlayers()
		local rank = 0
		local player
		local numPlayers = table.getn(allplayers)   

		--print('NUM PLAYERS == '..numPlayers)

		for rank=1, 8 do 
			
			if self.rankhud[rank] ~= nil then 
				self.rankhud[rank]:Text('^S^'     )
			end
						
			for i,player in ipairs(allplayers) do
				if self.allRacePositions[player:PlayerNum()+1] == rank  then
					self.rankhud[rank]:Colour(player:Colour())					
					self.rankhud[rank]:Text('^S^'..self.allRacePositions[player:PlayerNum()+1]..'. '..player:Name())
				end				
			end
		end
			
		
	end
end


function Turismo:GetTotalCheckpointsCompleted( playerID )
	return self.allCheckPointsCompleted[playerID+1]
end


function Turismo:GetCheckpointsCompletedThisLap( playerID )
	local totalCP = self.allCheckPointsCompleted[playerID+1]
	local completedLaps = self:GetCurrentLapNumber(playerID)
	completedLaps = completedLaps - 1
	--print('totalcp = '..totalCP)
	--print('completedLaps = '..completedLaps)
	--print('cp in lap = '..self:GetNumberOfCheckpointsInLap())
	totalCP = totalCP - (completedLaps * self:GetNumberOfCheckpointsInLap())
	return totalCP
end


function Turismo:IncrementCheckpointsCompleted( playerID )
	self.allCheckPointsCompleted[playerID+1] = self.allCheckPointsCompleted[playerID+1] + 1
end


function Turismo:IncrementCurrentLapNumber( playerID )
	self.allCurrentLap[playerID+1] = self.allCurrentLap[playerID+1] + 1
end


function Turismo:GetCurrentLapNumber( playerID )
	return self.allCurrentLap[playerID+1]
end 


function Turismo:GetNumberOfCheckpointsInLap()
	return table.getn(self.track)
end 


function Turismo:Score(player)
    return self:GetTotalCheckpointsCompleted(player:PlayerNum())
end    


function Turismo:DisplayWinnerMsg(winnerID)

	local player = Player()
	local winnermsg
	local theWinner
	
	if winnerID == player:PlayerNum() then
		winnermsg = '^S^'..player:Name()..' ^T^MRACEWI'
		theWinner = 1
	else
		winnermsg = "^T^MRACE04"
		theWinner = 2
	end

	DisplayFinalWinLoseMessage(theWinner, winnermsg)
	
	main.game:CleanUp()
end


--sets up all the different tracks
function Turismo:InitTrack()

--GameLocation(1)
--GameScoreLimit(1)

	if GameLocation() == 0 then			--	Portland
		if RaceId() == 0 then
			self.track = {	
				{{1174, -1059, 14}, 17 },	-- 1
				{{1074, -1059, 14}, 17 },	-- 2
				{{ 988, -1023, 14}, 17 },	-- 3
				{{ 882, -1022,  4}, 7},		-- 4
				{{ 817,  -972,  4}, 7 },	-- 5
				{{ 815,  -871, 12}, 15 },	-- 6
				{{ 815,  -789, 14}, 17 },	-- 7
				{{ 815,  -624, 14}, 17 },	-- 8
				{{ 815,  -493, 14}, 17 },	-- 9
				{{ 815,  -401, 14}, 17 },	-- 10
				{{ 815,  -275,  4},  7 },	-- 11
				{{ 818,  -130, -5}, -2 },	-- 12
				{{ 906,   -85, -3},  1 },	-- 13
				{{ 975,   -85,  4},  7 },	-- 14
				{{1050,  -130,  4},  7 },	-- 15
				{{1069,  -209, 21},  8 },	-- 16
				{{1185,  -208, 23}, 26 },	-- 17
				{{1316,  -209, 49}, 45 },	-- 18
				{{1370,  -283, 49}, 52 },	-- 19
				{{1369,  -443, 49}, 52 },	-- 20
				{{1260,  -498, 32}, 35 },	-- 21
				{{1195,  -513, 23}, 26 },	-- 22
				{{1206,  -599, 19}, 22 },	-- 23
				{{1284,  -679, 19}, 22 },	-- 24
				{{1354,  -811, 14}, 17 },	-- 25
				{{1329,  -968, 14}, 17 },	-- 26
				{{1264, -1060, 14}, 17 }}	-- 27
		elseif RaceId() == 1 then
			self.track = {
				{{1125,  -640, 14}, 17 },	-- 1
				{{1125,  -518, 19}, 22 },	-- 2
				{{1125,  -428, 19}, 22 },	-- 3
				{{1125,  -284, 19}, 22 },	-- 4
				{{1125,  -212, 14}, 17 },	-- 5
				{{1125,  -128,  9}, 12 },	-- 6
				{{1125,   -49,  7}, 10 },	-- 7
				{{1053,     0,  2}, 5 },	-- 8
				{{ 911,   -59,  7}, 10 },	-- 9
				{{ 911,  -250,  4}, 7 },	-- 10
				{{ 911,  -373, 13}, 16 },	-- 11
				{{ 900,  -454, 14}, 17 },	-- 12
				{{ 815,  -470, 14}, 17 },	-- 13
				{{ 850,  -623, 14}, 17 },	-- 14
				{{1051,  -642, 14}, 17 },	-- 15
				{{1035,  -769, 14}, 17 },	-- 16
				{{ 835,  -780, 14}, 17 },	-- 17
				{{ 826,  -857, 15}, 18 },	-- 18
				{{ 817,  -972,  4}, 7 },	-- 19
				{{ 882, -1022,  4}, 7 },	-- 20
				{{ 988, -1023, 14}, 17 },	-- 21
				{{1043, -1053, 14}, 17 },	-- 22
				{{1272, -1060, 14}, 17 },	-- 23
				{{1304,  -936, 14}, 17 },	-- 24
				{{1229,  -861, 14}, 17 },	-- 25
				{{1174,  -806, 14}, 17 },	-- 26
				{{1125,  -638, 14}, 17 } }	-- 27
		elseif RaceId() == 2 then
			self.track = {
				{{ 920,  -494, 14}, 17 },	-- 1
				{{ 870,  -494, 14}, 17 },	-- 2
				{{ 814,  -474, 14}, 17 },	-- 3
				{{ 815,  -395, 14}, 17 },	-- 4
				{{ 840,  -172,  4}, 7 },	-- 5
				{{ 910,  -140,  4}, 7 },	-- 6
				{{ 921,  -229,  4}, 7 },	-- 7
				{{ 978,  -241,  4}, 7 },	-- 8
				{{1000,  -331,  9}, 12 },	-- 9
				{{1013,  -391, 14}, 17 },	-- 10
				{{1046,  -398, 14}, 17 },	-- 11
				{{1061,  -514, 14}, 17 },	-- 12
				{{1059,  -614, 14}, 17 },	-- 13
				{{ 900,  -639, 14}, 17 },	-- 14
				{{ 910,  -768, 14}, 17 },	-- 15
				{{ 996,  -768, 14}, 17 },	-- 16
				{{1069,  -798, 14}, 17 },	-- 17
				{{1114,  -798, 14}, 17 },	-- 18
				{{1109,  -697, 14}, 17 },	-- 19
				{{1019,  -670, 14}, 17 },	-- 20
				{{ 980,  -582, 14}, 17 },	-- 21
				{{ 965,  -494, 14}, 17 } }	-- 22							
		elseif RaceId() == 3 then
			self.track = {
				{{1050,  -850, 14}, 17 },	-- 1
				{{1050,  -750, 14}, 17 },	-- 2
				{{1061,  -606, 14}, 17 },	-- 3
				{{1061,  -530, 14}, 17 },	-- 4
				{{1050,  -351, 14}, 17 },	-- 5
				{{1036,  -170,  4}, 7 },	-- 6
				{{ 983,  -184,  4}, 7 },	-- 7
				{{ 959,  -228,  4}, 7 },	-- 8
				{{ 911,  -236,  4}, 7 },	-- 9
				{{ 896,  -274,  4}, 7 },	-- 10
				{{ 814,  -254,  4}, 7 },	-- 11
				{{ 823,  -120, -5}, -2 },	-- 12
				{{ 908,   -85, -2}, 0 },	-- 13
				{{ 986,   -86,  4}, 7 },	-- 14
				{{1125,  -112,  9}, 12 },	-- 15
				{{1100,    -2,  6}, 9 },	-- 16
				{{ 976,     3,  4}, 7 },	-- 17
				{{ 911,   -52,  6}, 9 },	-- 18
				{{ 899,  -128,  4}, 7 },	-- 19
				{{ 845,  -157,  4}, 7 },	-- 20
				{{ 815,  -405, 14}, 17 },	-- 21
				{{ 850,  -493, 14}, 17 },	-- 22
				{{ 980,  -510, 14}, 17 },	-- 23
				{{ 964,  -574, 14}, 17 },	-- 24
				{{ 815,  -592, 14}, 17 },	-- 25
				{{ 849,  -628, 14}, 17 },	-- 26
				{{1125,  -640, 14}, 17 },	-- 27
				{{1136,  -702, 14}, 17 },	-- 28
				{{1220,  -754, 14}, 17 },	-- 29
				{{1278,  -806, 14}, 17 },	-- 30
				{{1331,  -857, 15}, 18 },	-- 31
				{{1324,  -898, 14}, 17 },	-- 32
				{{1221,  -983, 14}, 17 },	-- 33
				{{1124,  -959, 14}, 17 },	-- 34
				{{1047,  -934, 14}, 17 } }	-- 35				
		elseif RaceId() == 4 then
			self.track = {
				{{1125, -680, 13}, 16 },	-- 1
				{{1125, -765, 13}, 16 },	-- 2
				{{1085, -830, 13}, 16 },	-- 3
				{{1034, -818, 13}, 16 },	-- 4
				{{ 900, -809, 13}, 16 },	-- 5
				{{ 891, -698, 13}, 16 },	-- 6 
				{{ 814, -680, 13}, 16 },	-- 7
				{{ 852, -573, 13}, 16 },	-- 8
				{{ 958, -585, 13}, 16 },	-- 9 
				{{1005, -620, 13}, 16 },	-- 10
				{{1125, -638, 13}, 16 } }	-- 11			
		elseif RaceId() == 5 then
			self.track = {
				{{1050,  -780, 13}, 16 },	-- 1
  				{{1050,  -850, 13}, 16 },	-- 2 
				{{1066,  -948, 13}, 16 },	-- 3  
				{{1204,  -985, 13}, 16 },	-- 4  
				{{1304,  -935, 13}, 16 },	-- 5 
				{{1321, -1032, 13}, 16 },	-- 6 
				{{1265, -1059, 13}, 16 },	-- 7 
				{{1159, -1059, 13}, 16 },	-- 8  
				{{1067, -1058, 13}, 16 },	-- 9  
				{{ 976, -1023, 13}, 16 },	-- 10  
				{{ 825,  -991,  3}, 6 },	-- 11  
				{{ 816,  -870, 12}, 15 },	-- 12 
				{{ 816,  -714, 13}, 16 },	-- 13 
				{{ 850,  -623, 13}, 16 },	-- 14 
				{{ 961,  -624, 13}, 16 },	-- 15 
				{{1050,  -640, 13}, 16 },	-- 16  
				{{1050,  -700, 13}, 16 } }	-- 17 
		elseif RaceId() == 6 then
			self.track = {		
				{{1125, -363, 18}, 21 },	-- 1 
				{{1125, -279, 18}, 21 },	-- 2 
				{{1125, -127,  8}, 11 },	-- 3 
				{{1125,  -49,  6}, 9 },	-- 4
				{{1074,    1,  1}, 4 },	-- 5 
				{{ 977,    3,  3}, 6 },	-- 6
				{{ 910,  -52,  6}, 9 },	-- 7
				{{ 900, -129,  3}, 6 },	-- 8 
				{{ 835, -195,  3}, 6 },	-- 9
				{{ 845, -273,  3}, 6 },	-- 10 
				{{ 909, -284,  3}, 6 },	-- 11 
				{{ 921, -338,  8}, 11 },	-- 12 
				{{1000, -348,  8}, 11 },	-- 13
				{{1007, -444, 13}, 16 },	-- 14 
				{{1074, -499, 14}, 17 },	-- 15
				{{1126, -483, 18}, 21 },	-- 16 
				{{1125, -425, 18}, 21 } }	-- 17	
		elseif RaceId() == 7 then
			self.track = {
				{{ 960, -493, 13}, 16 },	-- 1
				{{ 900, -493, 13}, 16 },	-- 2 
				{{ 815, -474, 13}, 16 },	-- 3
				{{ 815, -397, 13}, 16 },	-- 4
				{{ 815, -268,  3}, 6 },	-- 5
				{{ 817, -133, -6}, -3 },	-- 6 
				{{ 887,  -85, -5}, -2 },	-- 7
				{{ 980,  -85,  3}, 6 },	-- 8 
				{{1045, -129,  3}, 6 },	-- 9
				{{1065, -209,  3}, 6 },	-- 10  
				{{1195, -223, 23}, 26 },	-- 11  
				{{1207, -283, 23}, 26 },	-- 12  
				{{1297, -294, 37}, 40 },	-- 13 
				{{1280, -349, 36}, 39 },	-- 14  
				{{1195, -363, 23}, 26 },	-- 15  
				{{1186, -423, 23}, 26 },	-- 16  
				{{1125, -434, 18}, 21 },	-- 17 
				{{1113, -501, 18}, 21 },	-- 18  
				{{1040, -498, 13}, 16 } }	-- 19
		end
	elseif GameLocation() == 1 then		--	Staunton
		if RaceId() == 0 then
			self.track = {
				{{121,  -800, 25}, 28 },	-- 1
				{{110,  -941, 25}, 28 },	-- 2
				{{ 42,  -941, 25}, 28 },	-- 3
				{{ -8,  -911, 25}, 28 },	-- 4
				{{ -1,  -773, 25}, 28 },	-- 5
				{{-20,  -691, 25}, 28 },	-- 6
				{{ -97, -674, 15}, 18 },	-- 7
				{{-103, -514, 15}, 18 },	-- 8
				{{-108, -401, 15}, 18 },	-- 9
				{{ -81, -286, 15}, 18 },	-- 10
				{{  35, -280, 15}, 18 },	-- 11
				{{ 125, -206, 15}, 18 },	-- 12
				{{ 212, -207, 19}, 22 },	-- 13
				{{ 323, -180, 20}, 23 },	-- 14
				{{ 450, -133, 20}, 23 },	-- 15
				{{ 441, -331, 20}, 23 },	-- 16
				{{ 374, -342, 20}, 23 },	-- 17
				{{ 362, -401, 20}, 23 },	-- 18
				{{ 293, -401, 25}, 28 },	-- 19
				{{ 213, -428, 25}, 28 },	-- 20
				{{ 121, -614, 25}, 28 },	-- 21
				{{ 121, -710, 25}, 28 } }	-- 22
		elseif RaceId() == 1 then
			self.track = {
				{{  -8,  -732, 25}, 28 },	-- 1
				{{  -8,  -632, 25}, 28 },	-- 2
				{{ -11,  -518, 18}, 21 },	-- 3
				{{   1,  -397, 15}, 18 },	-- 4
				{{  -8,  -287, 15}, 18 },	-- 5
				{{-104,  -270, 15}, 18 },	-- 7
				{{-170,  -139, 15}, 18 },	-- 8
				{{-164,  -14, 15}, 18 },	-- 9
				{{ -66,   79, 15}, 18 },	-- 10
				{{  53,   61, 15}, 18 },	-- 11
				{{ 123,  -55, 15}, 18 },	-- 12
				{{ 252,  -71, 20}, 23 },	-- 13
				{{ 252, -219, 20}, 23 },	-- 14
				{{ 268, -401, 25}, 28 },	-- 15
				{{ 417, -409, 20}, 23 },	-- 16
				{{ 427, -578, 25}, 28 },	-- 17
				{{ 397, -696, 25}, 28 },	-- 18
				{{ 251, -712, 25}, 28 },	-- 19
				{{ 206, -812, 25}, 28 },	-- 20
				{{ 107, -941, 25}, 28 },	-- 21
				{{  39, -946, 25}, 28 },	-- 22
				{{  -8, -908, 25}, 28 },	-- 23
				{{  -8, -801, 25}, 28 } }	-- 24
		elseif RaceId() == 2 then
			self.track = {
				{{ 427, -1000, 25}, 28 },	-- 1
				{{ 428, -1190, 15}, 18 },	-- 2
				{{ 525, -1325, 15}, 18 },	-- 3
				{{ 529, -1458, 15}, 18 },	-- 4
				{{ 406, -1521, 15}, 18 },	-- 5
				{{ 406, -1419, 24}, 27 },	-- 6
				{{ 397, -1237, 25}, 28 },	-- 7
				{{ 275, -1175, 25}, 28 },	-- 8
				{{ 145, -1098, 25}, 28 },	-- 9
				{{ 157,  -899, 25}, 28 },	-- 10
				{{ 251,  -681, 25}, 28 },	-- 11
				{{ 232,  -403, 25}, 28 },	-- 12
				{{ 106,  -395, 15}, 18 },	-- 13
				{{ 106,  -206, 15}, 18 },	-- 14
				{{ 122,   -56, 15}, 18 },	-- 15
				{{ 252,   -75, 20}, 23 },	-- 16
				{{ 271,  -160, 20}, 23 },	-- 17
				{{ 322,  -198, 20}, 23 },	-- 18
				{{ 344,  -331, 21}, 24 },	-- 19
				{{ 452,  -342, 20}, 23 },	-- 20
				{{ 426,  -427, 20}, 23 },	-- 21
				{{ 426,  -590, 25}, 28 },	-- 22
				{{ 426,  -770, 25}, 28 } }	-- 23
		elseif RaceId() == 3 then
			self.track = {
				{{ -103, -330, 15}, 18 },	-- 1
				{{ -103, -270, 15}, 18 },	-- 2
				{{ -159, -159, 15}, 18 },	-- 3
				{{ -164,  -14, 15}, 18 },	-- 4
				{{  -66,   79, 15}, 18 },	-- 5
				{{   53,   61, 15}, 18 },	-- 6
				{{  107,  -28, 15}, 18 },	-- 7
				{{  121, -206, 15}, 18 },	-- 8
				{{  251, -222, 20}, 23 },	-- 9
				{{  266, -331, 25}, 28 },	-- 10
				{{  374, -341, 21}, 24 },	-- 11
				{{  351, -402, 21}, 24 },	-- 12
				{{  251, -416, 25}, 28 },	-- 13
				{{  234, -621, 25}, 28 },	-- 14
				{{  126, -600, 25}, 28 },	-- 15
				{{  137, -542, 25}, 28 },	-- 16
				{{  -12, -529, 19}, 22 },	-- 17
				{{   -8, -406, 15}, 18 },	-- 18
				{{ -103, -395, 15}, 18 }}	-- 19			
		elseif RaceId() == 4 then
			self.track = {
				{{ 160,  -533, 24}, 27 },	-- 1
				{{ 122,  -610, 24}, 27 },	-- 2 
				{{ 121,  -737, 24}, 27 },	-- 3 
				{{ 107,  -941, 24}, 27 },	-- 4
				{{  42,  -963, 24}, 27 },	-- 5 
				{{  42, -1100, 24}, 27 },	-- 6 
				{{  26, -1265, 24}, 27 },	-- 7 
				{{-137, -1210, 24}, 27 },	-- 8 
				{{-115, -1366, 24}, 27 },	-- 9 
				{{  41, -1378, 24}, 27 },	-- 10
				{{  58, -1611, 24}, 27 },	-- 11
				{{ 133, -1616, 24}, 27 },	-- 12
				{{ 225, -1574, 24}, 27 },	-- 13 
				{{ 186, -1492, 24}, 27 },	-- 14 
				{{ 197, -1270, 24}, 27},	-- 15
				{{ 306, -1257, 25}, 28 },	-- 16
				{{ 306, -1156, 24}, 27 },	-- 17 
				{{ 307, -1015, 24}, 27 },	-- 18
				{{ 335,  -883, 20}, 23 },	-- 19 
				{{ 403,  -748, 34}, 37 },	-- 20 
				{{ 476,  -602, 34}, 37 },	-- 21 
				{{ 525,  -401, 19}, 22 },	-- 22
				{{ 389,  -401, 20}, 23 },	-- 23 
				{{ 294,  -399, 23}, 26 },	-- 24
				{{ 220,  -425, 24}, 27 },	-- 25 
				{{ 190,  -475, 24}, 27 } }	-- 26
		elseif RaceId() == 5 then
			self.track = {
				{{   41, -1290, 24}, 27 },	-- 1
				{{   41, -1130, 24}, 27 },	-- 2
				{{   63,  -941, 24}, 27 },	-- 3 
				{{  147,  -955, 24}, 27 },	-- 4 
				{{  146, -1086, 24}, 27 },	-- 5 
				{{  146, -1229, 24}, 27 },	-- 6 
				{{  159, -1396, 24}, 27 },	-- 7 
				{{  297, -1396, 24}, 27 },	-- 8 
				{{  407, -1381, 24}, 27 },	-- 9 
				{{  394, -1235, 24}, 27 },	-- 10 
				{{  319, -1197, 24}, 27 },	-- 11 
				{{  197, -1136, 24}, 27 },	-- 12
				{{  101, -1088, 24}, 27 },	-- 13 
				{{   24, -1044, 24}, 27 },	-- 14 
				{{  -80, -1020, 24}, 27 },	-- 15 
				{{ -137, -1200, 24}, 27 },	-- 16 
				{{ -147, -1337, 24}, 27 },	-- 17
				{{ -202, -1387, 24}, 27 },	-- 18 
				{{ -147, -1520, 24}, 27 },	-- 19 
				{{  -50, -1596, 24}, 27 },	-- 20
				{{   41, -1590, 24}, 27 },	-- 21
				{{   41, -1470, 24}, 27 },	-- 22
				{{   41, -1370, 24}, 27 } }	-- 23
		elseif RaceId() == 6 then
			self.track = {
				{{ 407, -1181, 24}, 27 },	-- 1
				{{ 407, -1100, 24}, 27 },	-- 2
				{{ 426, -1010, 24}, 27 },	-- 3
				{{ 396,  -897, 25}, 28 },	-- 4 
				{{ 328,  -903, 20}, 23 },	-- 5
				{{ 309, -1010, 24}, 27 },	-- 6 
				{{ 274, -1175, 25}, 28 },	-- 7
				{{ 186, -1188, 24}, 27 },	-- 8
				{{ 175, -1332, 24}, 27 },	-- 9 
				{{  68, -1310, 24}, 27 },	-- 10 
				{{  20, -1348, 24}, 27 },	-- 11
				{{-105, -1361, 24}, 27 },	-- 12
				{{-202, -1380, 24}, 27 },	-- 13 
				{{-148, -1517, 24}, 27 },	-- 14 
				{{ -59, -1592, 24}, 27 },	-- 15 
				{{  41, -1594, 24}, 27 },	-- 16 
				{{  63, -1470, 24}, 27 },	-- 17 
				{{ 147, -1487, 24}, 27 },	-- 18
				{{ 166, -1599, 24}, 27 },	-- 19
				{{ 293, -1587, 24}, 27 },	-- 20 
				{{ 325, -1486, 24}, 27 },	-- 21
				{{ 306, -1405, 24}, 27 },	-- 22
				{{ 407, -1381, 24}, 27 },	-- 23
				{{ 407, -1281, 24}, 27 } }	-- 24
		elseif RaceId() == 7 then
			self.track = {
				{{  -8, -688, 25}, 28 },	-- 1
				{{  -8, -738, 25}, 28 },	-- 2
				{{ -23, -801, 25}, 28 },	-- 3 
				{{ -62, -814, 24}, 27 },	-- 4 
				{{ -53, -921, 24}, 27 },	-- 5
				{{  26, -941, 24}, 27 },	-- 6
				{{ 125, -933, 24}, 27 },	-- 7
				{{ 172, -880, 24}, 27 },	-- 8 
				{{ 190, -802, 25}, 28 },	-- 9
				{{ 121, -790, 24}, 27 },	-- 10 
				{{ 139, -696, 24}, 27 },	-- 11
				{{ 251, -681, 24}, 27 },	-- 12
				{{ 236, -621, 24}, 27 },	-- 13 
				{{ 125, -603, 24}, 27 },	-- 14
				{{ 181, -482, 24}, 27 },	-- 15
				{{ 235, -420, 24}, 27 },	-- 16
				{{ 258, -450, 24}, 27 },	-- 17
				{{ 230, -533, 25}, 28 },	-- 18 
				{{  79, -541, 24}, 27 },	-- 19
				{{  -7, -552, 18}, 21 },	-- 20 
				{{  -8, -628, 24}, 27 } }	-- 21				
		end
	elseif GameLocation() == 2 then		--	Shoreside
		if RaceId() == 0 then
			self.track = {
				{{ -870,  179, 48}, 51 }, 	-- 1
 				{{ -784,  222, 48}, 51 }, 	-- 2 
				{{ -670,  227, 53}, 56 }, 	-- 3 
				{{ -507,  227, 67}, 70 }, 	-- 4
				{{ -330,  241, 57}, 60 }, 	-- 5
				{{ -294,  303, 69}, 72 }, 	-- 6
				{{ -294,  372, 77}, 80 }, 	-- 7
				{{ -417,  358, 88}, 91 }, 	-- 8 
				{{ -595,  363, 77}, 80 }, 	-- 9 
				{{ -735,  355, 62}, 65 }, 	-- 10
				{{ -890,  391, 39}, 42 }, 	-- 11
				{{ -920,  523, 65}, 68 }, 	-- 12
				{{-1100,  514, 67}, 70 }, 	-- 13
				{{-1195,  456, 67}, 70 }, 	-- 14
				{{-1264,  276, 67}, 70 }, 	-- 15
				{{-1264,   76, 67}, 70 }, 	-- 16 
				{{-1289,  -53, 57}, 60 }, 	-- 17
				{{-1281, -217, 52}, 55 }, 	-- 18 
				{{-1153, -217, 42}, 45 }, 	-- 19
				{{-1043, -227, 42}, 45 }, 	-- 20
				{{ -937, -222, 31}, 34 }, 	-- 21
				{{ -810, -218, 27}, 30 }, 	-- 22
				{{ -819, -127, 32}, 35 }, 	-- 23 
				{{ -893, -127, 32}, 35 }, 	-- 24
				{{-1036, -127, 42}, 45 }, 	-- 25
				{{-1108, -110, 43}, 46 }, 	-- 26
				{{-1162,   -0, 57}, 60 }, 	-- 27
				{{-1146,   94, 57}, 60 }, 	-- 28
				{{-1020,  105, 48}, 51 }, 	-- 29
				{{ -940,  144, 48}, 51 } } 	-- 30							 
		elseif RaceId() == 1 then
			self.track = {
				{{-1265,	 183, 67}, 70 },	-- 1
				{{-1265,	  78, 67}, 70 },	-- 2 
				{{-1289,	 -56, 57}, 60 },	-- 3 
				{{-1282,	-216, 52}, 55 },	-- 4
				{{-1102,	-223, 42}, 45 },	-- 5 
				{{ -960,	-271, 32}, 35 },	-- 6
				{{ -850,	-285, 32}, 35 },	-- 7 
				{{ -696,	-316, 18}, 21 },	-- 8  
				{{ -636,	-482, 17}, 20 },	-- 9  
				{{ -571,	-435, -6}, -3 },	-- 10
				{{ -624,	-255,-25}, -22 },	-- 11
				{{ -568,	-118,-30}, -27 },	-- 12 
				{{ -502,	 -52,-20}, -18 },	-- 13 
				{{ -412,	  37,-20}, -18 },	-- 14 
				{{ -352,	 112,-20}, -18 },	-- 15
				{{ -534,	 153,-20}, -18 },	-- 16 
				{{ -668,	  57, -3}, -1 },	-- 17
				{{ -743,	  50,  3},  6 },	-- 18
				{{ -801,	 178, 15}, 18 },	-- 19
				{{ -897,	 247, 28}, 31 },	-- 20
				{{ -892,	 352, 37}, 40 },	-- 21 
				{{ -915,	 526, 65}, 68 },	-- 22
				{{-1111,	 510, 67}, 70 },	-- 23 
				{{-1211,	 437, 67}, 70 },	-- 24
				{{-1265,	 283, 67}, 70 } }	-- 25
		elseif RaceId() == 2 then
			self.track = {
				{{ -878, 175, 47}, 50 }, 	-- 1
				{{ -792, 218, 47}, 50 }, 	-- 2
				{{ -673, 227, 53}, 56 }, 	-- 3
				{{ -508, 227, 66}, 70 }, 	-- 4
				{{ -328, 244, 58}, 61 },	-- 5
				{{ -285, 337, 76}, 79 }, 	-- 6
				{{ -279, 427, 86}, 89 },	-- 7
				{{ -383, 515, 87}, 90 },	-- 8
				{{ -577, 627, 77}, 80 }, 	-- 9
				{{ -863, 629, 77}, 80 },  	-- 10
				{{ -909, 525, 65}, 68 }, 	-- 11
				{{-1117, 507, 67}, 70 }, 	-- 12
				{{-1243, 387, 67}, 70 }, 	-- 13
				{{-1255, 172, 67}, 70 }, 	-- 14
				{{-1088, 162, 57}, 60 }, 	-- 15
				{{-1033,  99, 47}, 50 }, 	-- 16
				{{ -959, 135, 47}, 50 } }	-- 17		
		elseif RaceId() == 3 then
			self.track = {
				{{-1048,   78, 47}, 50 }, 	-- 1
				{{-1098,  172, 57}, 60 }, 	-- 2
				{{-1190,  172, 62}, 65 }, 	-- 3
				{{-1264,  162, 67}, 70 }, 	-- 4
				{{-1264,   77, 67}, 70 }, 	-- 5
				{{-1289,  -58, 57}, 60 }, 	-- 6 
				{{-1281, -217, 52}, 55 }, 	-- 7 
				{{-1151, -218, 42}, 45 }, 	-- 8
				{{-1064, -227, 42}, 45 }, 	-- 9
				{{ -974, -205, 32}, 35 }, 	-- 10
 				{{ -974, -127, 33}, 36 }, 	-- 11
				{{ -985,  -47, 38}, 41 }, 	-- 12
 				{{-1015,   13, 43}, 46 } } 	-- 13
		elseif RaceId() == 4 then
			self.track = {
				{{ -974,   69, 18}, 21 }, 	-- 1
				{{ -921,  -39, 28}, 31 }, 	-- 2 
				{{ -893, -130, 32}, 35 }, 	-- 3 
				{{ -975, -118, 32}, 35 }, 	-- 4 
				{{ -974,  -69, 37}, 40 }, 	-- 5 
				{{-1010,    2, 42}, 45 }, 	-- 6 
				{{-1067,   98, 47}, 50 }, 	-- 7
				{{-1127,   99, 57}, 60 }, 	-- 8 
				{{-1165,   60, 57}, 60 }, 	-- 9
				{{-1165,    5, 57}, 60 }, 	-- 10
				{{-1132,  -64, 47}, 50 }, 	-- 11
				{{-1099, -129, 42}, 45 }, 	-- 12
				{{-1039, -227, 42}, 45 }, 	-- 13
				{{ -962, -217, 32}, 35 }, 	-- 14
				{{ -810, -219, 27}, 30 }, 	-- 15
				{{ -820, -127, 32}, 35 }, 	-- 16
				{{ -882, -107, 33}, 36 }, 	-- 17
				{{ -910,  -52, 29}, 32 }, 	-- 18
				{{ -975,   77, 16}, 19 }, 	-- 19
				{{-1013,  155,  8}, 12 }, 	-- 20
				{{-1065,  242,  2}, 5 }, 	-- 21
				{{-1137,  283,  2}, 5 }, 	-- 22
				{{-1190,  256,  2}, 5 }, 	-- 23
				{{-1140,  219,  3}, 6 }, 	-- 24
				{{-1045,  207, 3}, 6 }, 	-- 25
				{{-1004,  125, 11}, 14} }	-- 26
		elseif RaceId() == 5 then
			self.track = {
				{{-890,  445,  50}, 55 }, 	-- 1
				{{-889,  361,  37}, 40 }, 	-- 2
				{{-889,  308,  32}, 35 }, 	-- 3
				{{-899,  239,  27}, 30 }, 	-- 4 
				{{-804,  181,  15}, 18 }, 	-- 5 
				{{-747,   91,   4}, 7 }, 	-- 6 
				{{-739,  -13,   2}, 5 }, 	-- 7 
				{{-690, -110,   2}, 5 }, 	-- 8 
				{{-583, -208,   2}, 5 }, 	-- 9 
				{{-454, -206,   2}, 5 }, 	-- 10 
				{{-456,  -92,   2}, 5 }, 	-- 11
				{{-575,  -82,   2}, 5 }, 	-- 12
				{{-563,   87,   2}, 5 }, 	-- 13
				{{-430,   77,   2}, 5 }, 	-- 14 
				{{-444,   17,   2}, 5 }, 	-- 15
				{{-517,  -18,   9}, 12 }, 	-- 16
				{{-609,  -48,  17}, 20 }, 	-- 17
				{{-627,  102,  17}, 20 }, 	-- 18
				{{-702,  122,  21}, 24 }, 	-- 19
				{{-769,  156,  27}, 30 }, 	-- 20
				{{-635,  157,  36}, 39 }, 	-- 21
				{{-577,  192,  42}, 45 }, 	-- 22
				{{-635,  192,  48}, 51 }, 	-- 23
				{{-674,  227,  52}, 55 }, 	-- 24
				{{-624,  227,  57}, 60 }, 	-- 25
				{{-504,  227,  67}, 70 }, 	-- 26
				{{-448,  227,  67}, 70 }, 	-- 27
				{{-329,  243,  57}, 60 }, 	-- 28
				{{-281,  339,  77}, 80 }, 	-- 29
				{{-280,  425,  86}, 89 },	-- 30
				{{-311,  487,  87}, 89 },	-- 31
				{{-421,  536,  83}, 86 },	-- 32
				{{-577,  627,  77}, 80 },	-- 33
				{{-700,  634,  77}, 80 },	-- 34
				{{-853,  631,  77}, 80 },	-- 35
				{{-889,  577,  76}, 79 }}	-- 36
		elseif RaceId() == 6 then
			self.track = {
				{{-1050,   83,  47}, 50 }, 	-- 1
				{{-1010,    4,  42}, 45 }, 	-- 2 
				{{ -977,  -64,  37}, 40 }, 	-- 3
				{{ -975, -127,  32}, 35 }, 	-- 4 
				{{ -964, -217,  32}, 35 }, 	-- 5 
				{{ -810, -218,  27}, 30 }, 	-- 6
				{{ -820, -127,  32}, 35 }, 	-- 7 
				{{ -890, -127,  32}, 35 }, 	-- 8 
				{{ -974, -127,  32}, 35 }, 	-- 9 
				{{-1041, -127,  42}, 45 }, 	-- 10
				{{-1106, -115,  43}, 46 }, 	-- 11 
				{{-1149,  -57,  47}, 50 }, 	-- 12 
				{{-1213,  -57,  53}, 56 }, 	-- 13 
				{{-1289,  -45,  57}, 60 }, 	-- 14 
				{{-1265,   22,  62}, 65 }, 	-- 15
				{{-1252,  101,  67}, 70 }, 	-- 16 
				{{-1246,  164,  67}, 70 }, 	-- 17 
				{{-1169,  172,  60}, 63 }, 	-- 18
				{{-1089,  163,  57}, 60 }, 	-- 19 
				{{-1066,  114,  48}, 51 } }	-- 20
		elseif RaceId() == 7 then
			self.track = {
				{{ -845,  192,  47}, 50 }, 	-- 1 
				{{ -920,  154,  47}, 50 }, 	-- 2 
				{{-1048,   78,  47}, 50 }, 	-- 3 
				{{-1011,    6,  42}, 45 }, 	-- 4 
				{{ -974,  -70,  37}, 40 }, 	-- 5 
				{{ -975, -127,  32}, 35 }, 	-- 6 
				{{ -956, -281,  32}, 35 }, 	-- 7
				{{ -845, -285,  30}, 33 }, 	-- 8 
				{{ -709, -307,  17}, 20 }, 	-- 9 
				{{ -665, -426,  17}, 20 }, 	-- 10 
				{{ -692, -551,  15}, 18 }, 	-- 11 
				{{ -634, -638,  -3}, 0 }, 	-- 12 
				{{ -563, -430,  -6}, -3 }, 	-- 13 
				{{ -618, -296, -25}, -22}, 	-- 14 
				{{ -580, -152, -30}, -27}, 	-- 15 
				{{ -491,  -50, -21}, -18 }, -- 16 
				{{ -350,  116, -21}, -18 }, -- 17 
				{{ -477,  179, -21}, -18 }, -- 18 
				{{ -598,  102, -17}, -14 }, -- 19 
				{{ -681,   57,  -2}, 1 }, 	-- 20
				{{ -744,   57,   2}, 5 }, 	-- 21
				{{ -785,  161,  12}, 15 }, 	-- 22
				{{ -898,  255,  28}, 31 }, 	-- 23
				{{ -890,  308,  32}, 35 }, 	-- 24
				{{ -874,  371,  37}, 40 }, 	-- 25
				{{ -768,  357,  57}, 60 }, 	-- 26
				{{ -628,  358,  76}, 79 }, 	-- 27
				{{ -438,  360,  87}, 90 }, 	-- 28
				{{ -280,  363,  77}, 80 }, 	-- 29
				{{ -294,  312,  71}, 74 }, 	-- 30
				{{ -348,  227,  58}, 61 }, 	-- 31
				{{ -436,  227,  66}, 69 }, 	-- 32
				{{ -498,  227,  67}, 70 }, 	-- 33
				{{ -703,  227,  52}, 55 }, 	-- 34
				{{ -775,  227,  47}, 50 } }	-- 35
		end
	end
	
	-- JonB : randomize the grid 
	if IsServer() then
	
		local allplayers = AllPlayers()
		local numPlayers = table.getn(allplayers)
		print('Num Players == '..numPlayers)
	
		local gridShift = math.random(0, numPlayers)
		print('Calc Shift : '..gridShift)
		if gridShift > 0 then
			SendEvent(MSG_GRID_SHUFFLE_PLUS1 + gridShift-1)
		end
	end
end



--
-- uses a text sprite to display the attack/defend message
--
function Turismo:DisplayMessage(theText, length)	

	if self.SplashTextIsOnScreen == false then 
	
		--setup the message 
		self.Msg = theText
		self.MsgLength = length

		local player = Player()
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
	
	main.game = Turismo():Start()

	main:Start()
end
