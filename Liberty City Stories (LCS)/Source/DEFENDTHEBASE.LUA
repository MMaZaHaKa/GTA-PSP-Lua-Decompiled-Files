-- Defend The Base Script
-- Jon Bellamy

require 'gta'
require 'mainloop'
require 'spawn'

require 'Pickups'
require 'CutscenePlayer'

DTB = StateMachine{'StateInit'}

-- threads 
MessageDisplay = Script{}
ServerLogic = Script{}


-- game messages 
MSG_SWAP_TEAM = 4447
MSG_END_GAME = 4448
MSG_CAR_LOST = 4449

-- vehicle ID's
LIMO_MODEL_INDEX = 140
IDAHO_MODEL_INDEX = 132 
STINGER_MODEL_INDEX = 133


-- other constants
SHORCUT_VEHICLE_RESPAWN_TIME = 20000

teamId1 = 0
teamId2 = 1
team1RadarColour = 2
team2RadarColour = 0
radarColours = { 2, 0 }

--
-- Entry
--
function DTB:StateInit()   
	
	-- wait for all clients to join
    while not IsServer() and PlayerId() == 0 do
		Wait(100)
	end
	
	self.mypickups = PickupMgr()
	self.mypickups:CreatePickups()
	
	self:InitGame()
	
	self.scores = {}
	self.teamscores = {}

--	ClearSplashScreen()
--	CameraFadeOut(1)


	self.gameUnderway = false
	
    return 'StateRunning'
end


--
--
--
function DTB:CleanUp()
		
	print('DTB Cleanup')
	
	-- the server needs to terminate its extra thread 
--	if IsServer() then
--		self.ServerLogic:Stop()
--	end

	if self.DefenceTimer ~= 0 then
		self.DefenceTimer:Remove()
	end

	if self.TimeToBeatText ~= 0 then
		self.TimeToBeatText:Remove()
	end	
	
	self.mypickups:Cleanup()
end



--
-- Called once when the script loads 
--
function DTB:InitGame()

	self.CarDealerships = {}
	self.DefenceStartPoints = {}	
	self.DefenceSpawnPoints = {}		
	self.AttackSpawnPoints = {}
	
	if GameLocation() == 0 then	--	Portland
		self.CarDealerships =	{					
									{{1217.5568, -133.5395, 14.4686}, 301.1606},	-- Limo on plinth in showroom
									{{1237.8014, -128.9969, 13.9326}, 71.6178},		-- Limo in showroom floor
									{{1223.9100, -95.0671, 12.5592}, 169.2657},		-- Limo outside nearest exit
									{{1237.8071, -90.7601, 12.1280}, 4.3658},		-- Limo outside nearest bomb garage
								}	
								
		self.DefenceStartPoints={
									{{1245.5764, -119.3942, 13.9326}, 49.8267},		-- Base Spawn point 1 
									{{1215.7571, -118.3896, 13.9326}, 359.5657},	-- Base Spawn point 2 
									{{1216.8038, -65.0373, 9.5535}, 177.6218},		-- Base Spawn point 3 
									{{1238.3368, -72.7951, 10.3317}, 141.8636},		-- Base Spawn point 4 		
								}	
 
 							
		self.DefenceSpawnPoints = {					
									{{1141.7538, 39.4818, -1.5354}, 206.0494},		-- Base Respawn point 1 - Car crusher
									{{1142.1028, -92.7100, 6.4345}, 309.8683},		-- Base Respawn point 2 -Petrol Station
									{{1104.2711, -108.6361, 8.3340}, 235.2965},		-- Base Respawn point 3 -Fire Station
									{{1340.1337, -29.3839, 13.6599}, 80.7714},		-- Base Respawn point 4 -8 Balls Junk Yard							
								}
								
							
																	
		self.AttackSpawnPoints = {
									{{1391.6760, -847.2103, 10.7845}, 42.1146},		--  Attacker Spawn/Respawn point 1 - Docks
									{{1376.3102, -805.4339, 14.0399}, 179.8184},	--  Attacker Spawn/Respawn point 2 - Docks
									{{1375.8094, -873.0764, 10.7834}, 347.9834},	--  Attacker Spawn/Respawn point 3 - Docks
									{{1405.5909, -882.0255, 10.7845}, 48.5241},		--  Attacker Spawn/Respawn point 4 - Docks	
								 }	
		
		self.ShortcutVehiclePoints = {					
									{{1399.0020, -873.7015, 10.7845}, 44.7779},		-- Sanchez at the docks
									{{1360.1599, -882.6797, 10.7834}, 268.7727},	-- car spawn at the docks
								}	
								
	elseif GameLocation() == 1 then	--	Staunton Island
	
		self.CarDealerships =	{	
									{{287.7085, -556.5980, 35.2340}, 90.2599},		-- Car 1
									{{326.8324, -539.9009, 32.8327}, 30.0513},		-- Car 2
									{{285.6668, -566.8542, 30.4314}, 265.1706},		-- Car 3
									{{285.7361, -530.9559, 30.4314}, 80.8164},		-- Car 4
								}


		self.DefenceStartPoints={
									{{277.4468, -508.5923, 30.4314}, 176.7698},		-- Base Spawn point 1 
									{{280.0491, -586.2841, 30.4314}, 327.2523},		-- Base Spawn point 2 
									{{284.0731, -499.2168, 35.2345}, 168.0796},		-- Base Spawn point 3 
									{{283.0218, -592.6252, 35.2340}, 168.0796},		-- Base Spawn point 4 
								}


		self.DefenceSpawnPoints = {	
									{{287.1173, -645.3060, 25.1426}, 30.1763},		-- Base Re-Spawn point 1
									{{294.3075, -451.9876, 24.9149}, 179.4870},		-- Base Re-Spawn point 2
									{{216.5254, -538.2351, 25.4018}, 345.2699},		-- Base Re-Spawn point 3
									{{234.4608, -621.9566, 24.9732}, 275.4870},		-- Base Re-Spawn point 4
								  }


		self.AttackSpawnPoints = {
									--{{-25.4440, -1084.0563, 26.0510}, 106.5933},	-- Attacker Spawn Point 1
									{{-17.7279, -1092.9619, 26.0510}, 43.8430},		-- Attacker Spawn Point 2
									{{-17.7279, -1092.9619, 26.0510}, 43.8430},		-- Attacker Spawn Point 2
									{{-9.6814, -1092.6266, 26.2862}, 73.0756},		-- Attacker Spawn Point 3
									{{-5.3036, -1100.2549, 26.0510}, 358.6566},		-- Attacker Spawn Point 4
								 }
			
								 
		self.ShortcutVehiclePoints = {					
									{{-55.9539, -1045.9575, 25.1281}, 68.3198},		-- Sanchez - Bike 1
									{{-55.5054, -1043.2014, 25.1281}, 74.7312},		-- Sanchez - Bike 2
									 }	
								 


	elseif GameLocation() == 2 then	--	Shoreside


		self.CarDealerships =	{
									{{-423.7345, 292.9420, 61.9167}, 225.8497},		-- Limo in garage
									{{-402.5321, 291.0504, 61.9155}, 260.4368},		-- Limo near garage
									{{-365.3934, 286.3329, 61.6689}, 155.9908},		-- Limo in grounds east
									{{-336.6916, 318.5909, 60.1936}, 285.8416},		-- Limo in swimming pool
								}
								
								
		self.DefenceStartPoints={
									{{-413.0652, 283.4080, 61.8324}, 267.8581},		-- Base Spawn point 1 
									{{-381.3149, 298.5753, 62.8834}, 202.5833},		-- Base Spawn point 2 
									{{-360.3683, 284.0265, 61.2464}, 114.3120},		-- Base Spawn point 3 
									{{-347.4209, 319.1649, 61.9605}, 176.4641},		-- Base Spawn point 4 
								}
								
		self.DefenceSpawnPoints = {	
									{{-290.5696, 275.6305, 65.9665}, 93.0181},		-- Base Respawn point 1
									{{-327.5276, 221.0008, 57.8212}, 47.8005},		-- Base Respawn point 2
									{{-456.9896, 252.5688, 69.0644}, 182.6544},		-- Base Respawn point 3
									{{-373.8260, 367.0874, 87.4753}, 194.7484},		-- Base Respawn point 4								
								}
								
		self.AttackSpawnPoints = {
									{{-1095.5054, 64.3309, 57.5367}, 84.0938},		--  Attacker Spawn/Respawn point 1
									{{-1116.3947, 26.5421, 57.6908}, 7.0490},		--  Attacker Spawn/Respawn point 2
									{{-1136.0182, 28.5069, 57.7720}, 340.8487},		--  Attacker Spawn/Respawn point 3
									{{-1135.0078, 53.3453, 57.7624}, 22.5951},		--  Attacker Spawn/Respawn point 4								
								}
								
		self.ShortcutVehiclePoints = {	
--									{{-1048.4104, 51.8488, 47.8479}, 29.4243},		-- perennial car
									{{-1125.4570, 23.7166, 57.7336}, 87.7971},		-- sanchez 1
									{{-1109.9143, 111.2920, 53.8612}, 269.0036},	-- sanchez 2		
								}																					
	end
												
	
	-- toggle team game 
	IsTeamGame(true)
	
	-- reset the game timer 
	GameElapsedMs(0)
	
	DisablePlayer(true)	
		
	-- randomize the attacking team
	self.DefendingTeam = 1 --math.random(1, 2)

	self.InitialSpawn = true -- first spawn for defending team is inside the base 

	-- the mission vehicles
	self.MissionVehicle1 = nil
	self.MissionVehicle2 = nil
	self.MissionVehicle3 = nil
	self.MissionVehicle4 = nil
	
	-- shortcut vehicles to get attackers to the defenders base quickly 
	self.ShortcutVehicle1 = nil
	self.ShortcutVehicle2 = nil
	self.ShortcutRespawnTimer = 0 -- spawn instantly first time
	self.ShortcutRespawnLastUpdate = GameElapsedMs()
	
	self.Car1Destroyed = false
	self.Car2Destroyed = false
	self.Car3Destroyed = false
	self.Car4Destroyed = false

	-- how long have the defence held out
	self.DefenceTimer = 0
	self.TimeToBeatText = 0
	self.TimeToBeat = nil
	self.FinalRound = false
	self.RoundsPlayed = 0
	
	self.SplashTextIsOnScreen = false
	
--	self.MissionVehicleRadarBlip1 = nil;
--	self.MissionVehicleRadarBlip2 = nil;
--	self.MissionVehicleRadarBlip3 = nil;
--	self.MissionVehicleRadarBlip4 = nil;

	self.BaseBlip = nil
	
	-- how many vehicles left to defend before we change sides 
	self.VehiclesLeftThisRound = 4
	
	self.ChangeSides = true
	self.EndOfGame = false
	
	local player = Player()
	
	self.DefenceTimer = TextSprite(player, 465, 65, 2)
	self.DefenceTimer:Scale(0.5)
	self.DefenceTimer:Style(2)
	self.DefenceTimer:Text('^S^    ')
	
	self.TimeToBeatText = TextSprite(player, 465, 85, 2)
	self.TimeToBeatText:Scale(0.5)
	self.TimeToBeatText:Style(2)
	self.TimeToBeatText:Text('^S^    ')
		
	--if IsServer() then
	--	if UsePowerups() then
	--		local mytimer = PowerupTimer()
	--		mytimer:Start()
	--	end
	--end	
	
	Wait(1000)
	
	-- setup short range radar for enemy 
	local enemyTeam = {}
	if (player:TeamId() == teamId1) then
		enemyTeam = TeamPlayers(teamId2)
	else
		enemyTeam = TeamPlayers(teamId1)
	end
	for _,p in pairs(enemyTeam) do
		p:SetRadarBlipShortRange(true)
	end
	
	if IsServer() then
		self.ServerLogic = ServerLogic()
		self.ServerLogic:Start()
	end
--	self:Commentate('^S^Started!')
end


--
-- work horse 
--
function DTB:StateRunning()

	if self.EndOfGame == false then
	
		-- checks if we need to change attack / defend  or if the game is over 
		self:CheckChangeSides()

		-- server logic 
		--self:UpdateMissionVehicles()
		--self:UpdateRadar()
		--self:SwapAttackDefend()

		-- client logic 
		self:DisplayDefenceTimer()
		self:CheckForRespawn()
		self:UpdateScores()
		self:UpdateLocalPlayer()
			
		-- grab any server messages 
		self:ProcessNetworkEvents()
		
		self:CheckIfEndOfGame()
		
		--Wait(100)
	end
end



function ServerLogic:Run(theText, length, defendColour)	
	--print('DTB Server Thread Running')
	while 1 do 
		main.game:UpdateMissionVehicles()
		--main.game:UpdateRadar()
		main.game:SwapAttackDefend()
		main.game:UpdateShortcutVehicles()
		Wait(10)
	end
end



function ServerLogic:CleanUp()
	print('Server Logic Cleanup')
end


--
-- Is the local player dead?
--
function DTB:CheckForRespawn()
	local player = Player()
		
	if not player:IsPlaying() then

		Wait(1000)

		local playerPos = self:GetPlayerRespawnPosition()
		player:Respawn(playerPos)
		
		self:DisplayAttackDefendMessage()
	end
end



-- sorts out the players short range radar
function DTB:UpdateLocalPlayer()

	--print(LocalPlayerMsSinceLastFired())

--	if LocalPlayerMsSinceLastFired() >= 5000 then
--		GiveLocalPlayerNoRadarForEnemy()
--	else 
--		RemoveLocalPlayerNoRadarForEnemy()
--	end
end


--
-- server vehicle checks
--
function DTB:UpdateMissionVehicles()

	if IsServer() then

		-- remove markers, blips and inform other players about cars lost 
		
		if	self.MissionVehicle1 ~= nil and self.Car1Destroyed == false and VehicleHealth(self.MissionVehicle1) <= 0  then
		
			VehicleRemove3dMarker(self.MissionVehicle1)
			
			--if self.MissionVehicleRadarBlip1 ~= nil then
			--	RemoveBlip(self.MissionVehicleRadarBlip1)
			--	self.MissionVehicleRadarBlip1 = nil
			--end
			
			if self.Car1Destroyed == false then 
				SendEvent(MSG_CAR_LOST)
				self.Car1Destroyed = true
			end
		end

		if	(self.MissionVehicle2 ~= nil and self.Car2Destroyed == false and VehicleHealth(self.MissionVehicle2) <= 0) then
		
			VehicleRemove3dMarker(self.MissionVehicle2)
			
			--if self.MissionVehicleRadarBlip2 ~= nil then
			--	RemoveBlip(self.MissionVehicleRadarBlip2)
			--	self.MissionVehicleRadarBlip2 = nil
			--end
			
			if self.Car2Destroyed == false then 
				SendEvent(MSG_CAR_LOST)
				self.Car2Destroyed = true
			end
		end
		
		if	(self.MissionVehicle3 ~= nil and self.Car3Destroyed == false and VehicleHealth(self.MissionVehicle3) <= 0) then
		
			VehicleRemove3dMarker(self.MissionVehicle3)
			
			--if self.MissionVehicleRadarBlip3 ~= nil then
			--	RemoveBlip(self.MissionVehicleRadarBlip3)
			--	self.MissionVehicleRadarBlip3 = nil
			--end
			
			if self.Car3Destroyed == false then 
				SendEvent(MSG_CAR_LOST)
				self.Car3Destroyed = true
			end
		end
		
		if	(self.MissionVehicle4 ~= nil and self.Car4Destroyed == false and VehicleHealth(self.MissionVehicle4) <= 0) then
		
			VehicleRemove3dMarker(self.MissionVehicle4)
			
			--if self.MissionVehicleRadarBlip4 ~= nil then
			--	RemoveBlip(self.MissionVehicleRadarBlip4)
			--	self.MissionVehicleRadarBlip4 = nil
			--end
			
			if self.Car4Destroyed == false then 
				SendEvent(MSG_CAR_LOST)
				self.Car4Destroyed = true
			end
		end		
	end

end



-- occasionally respawn shortcut vehicles 
function DTB:UpdateShortcutVehicles()

	if IsServer() then

		local carPos = {}
					
		-- only consider respawning if the timer has expired 
		if self.ShortcutRespawnTimer <= 0 then 
		
			-- vehicle 1 
			if self.ShortcutVehicle1 == nil then
			
				carPos[1] = self.ShortcutVehiclePoints[1] [1] [1]
				carPos[2] = self.ShortcutVehiclePoints[1] [1] [2]
				carPos[3] = self.ShortcutVehiclePoints[1] [1] [3]
			
				if IsSphereOnScreen(carPos, 5.0, 100)==false then
					self.ShortcutVehicle1 = CreateVehicle( IDAHO_MODEL_INDEX,
															carPos,
															self.ShortcutVehiclePoints[1] [2])										
					self.ShortcutRespawnTimer = SHORCUT_VEHICLE_RESPAWN_TIME
				end
			end
			
			-- vehicle 2
			if self.ShortcutVehicle2 == nil then
			
				carPos[1] = self.ShortcutVehiclePoints[2] [1] [1]
				carPos[2] = self.ShortcutVehiclePoints[2] [1] [2]
				carPos[3] = self.ShortcutVehiclePoints[2] [1] [3]
			
				if IsSphereOnScreen(carPos, 5.0, 100)==false then
					self.ShortcutVehicle2 = CreateVehicle( STINGER_MODEL_INDEX,
															carPos,
															self.ShortcutVehiclePoints[2] [2])															
					self.ShortcutRespawnTimer = SHORCUT_VEHICLE_RESPAWN_TIME															
				end
			end
		end
		
		-- check if vehicles are wrecked 
		if IsVehicleWrecked(self.ShortcutVehicle1) then
			self.ShortcutVehicle1 = nil
		end
		
		if IsVehicleWrecked(self.ShortcutVehicle2) then
			self.ShortcutVehicle2 = nil
		end
		
		-- update the respawn timer 
		if 	self.ShortcutVehicle1 == nil or	self.ShortcutVehicle2 == nil then
			self.ShortcutRespawnTimer = self.ShortcutRespawnTimer - (GameElapsedMs() - self.ShortcutRespawnLastUpdate)
			--print('timer = '..self.ShortcutRespawnTimer)
		end
		self.ShortcutRespawnLastUpdate = GameElapsedMs()
	end
end


--
-- the server updates the positionof all mission vehicles, clients will pickup these changes automatically 
--
function DTB:UpdateRadar()
	
	if IsServer() then
	
		local pos = {}
			
		pos[1] = self.CarDealerships [2] [1] [1]
		pos[2] = self.CarDealerships [2] [1] [2]
		pos[3] = self.CarDealerships [2] [1] [3]
		if 	self.BaseBlip == nil then 
			self.BaseBlip = AddBlipForCoord(pos, radarColours[self.DefendingTeam], pickupicon.base)
		end
	
	
	--[[
		-- blip 1
		if self.MissionVehicle1 ~= nil and self.Car1Destroyed == false then
			local pos = VehiclePosition(self.MissionVehicle1)
			-- force the vehicle to always be drawn on radar by making its height huge 
			pos[3] = pos[3] + 1000
			
			if self.MissionVehicleRadarBlip1 ~= nil then
				UpdateBlipCoord(self.MissionVehicleRadarBlip1, pos)
			else
			
				if VehicleHealth(self.MissionVehicle1) > 0 then
					self.MissionVehicleRadarBlip1 = AddBlipForCoord(pos, 1, pickupicon.objective)
					VehicleAdd3dMarker(self.MissionVehicle1)
				end
			end
		end


		-- blip 2
		if self.MissionVehicle2 ~= nil and self.Car2Destroyed == false then
			local pos = VehiclePosition(self.MissionVehicle2)
			-- force the vehicle to always be drawn on radar by making its height huge 
			pos[3] = pos[3] + 1000
			
			if self.MissionVehicleRadarBlip2 ~= nil then
				--RemoveBlip(self.MissionVehicleRadarBlip2)
				UpdateBlipCoord(self.MissionVehicleRadarBlip2, pos)
			else
			
				if VehicleHealth(self.MissionVehicle2) > 0 then
					self.MissionVehicleRadarBlip2 = AddBlipForCoord(pos, 1, pickupicon.objective)
					VehicleAdd3dMarker(self.MissionVehicle2)
				end
			end
		end
		
		
		-- blip 3
		if self.MissionVehicle3 ~= nil and self.Car3Destroyed == false then
			local pos = VehiclePosition(self.MissionVehicle3)
			-- force the vehicle to always be drawn on radar by making its height huge 
			pos[3] = pos[3] + 1000
			
			if self.MissionVehicleRadarBlip3 ~= nil then
				--RemoveBlip(self.MissionVehicleRadarBlip3)
				UpdateBlipCoord(self.MissionVehicleRadarBlip3, pos)
			else
			
				if VehicleHealth(self.MissionVehicle3) > 0 then
					self.MissionVehicleRadarBlip3 = AddBlipForCoord(pos, 1, pickupicon.objective)
					VehicleAdd3dMarker(self.MissionVehicle3)
				end
			end
		end
		
		
		-- blip 4
		if self.MissionVehicle4 ~= nil and self.Car4Destroyed == false then
			local pos = VehiclePosition(self.MissionVehicle4)
			-- force the vehicle to always be drawn on radar by making its height huge 
			pos[3] = pos[3] + 1000
			
			if self.MissionVehicleRadarBlip4 ~= nil then
				--RemoveBlip(self.MissionVehicleRadarBlip4)
				UpdateBlipCoord(self.MissionVehicleRadarBlip4, pos)
			else
			
				if VehicleHealth(self.MissionVehicle4) > 0 then
					self.MissionVehicleRadarBlip4 = AddBlipForCoord(pos, 1, pickupicon.objective)
					VehicleAdd3dMarker(self.MissionVehicle4)
				end
			end
		end			--]]
		
	end
	
end



--
-- creates all 4 mission vehicles 
--
function DTB:SpawnMissionVehicles()

	if IsServer() then
		local dealershipIndex = 1
--		if self.DefendingTeam == 1 then dealershipIndex = 1
--		else dealershipIndex = 5
--		end

--		print('dealership = '..dealershipIndex)

		-- colour the limo's the team colours 
		local colour1 = 0
		local colour2 = 0
		if self.DefendingTeam == 1 then
			colour1 = 54
			colour2 = 0
		else
			colour1 = 3
			colour2 = 0		
		end

		local carPos = {}
		
		carPos[1] = self.CarDealerships[dealershipIndex] [1] [1]
		carPos[2] = self.CarDealerships[dealershipIndex] [1] [2]
		carPos[3] = self.CarDealerships[dealershipIndex] [1] [3]
		
		self.MissionVehicle1 = CreateVehicle( LIMO_MODEL_INDEX,
											carPos,
											self.CarDealerships[dealershipIndex] [2], colour1, colour2)		
											
		VehicleAdd3dMarker(self.MissionVehicle1)											
												
		carPos[1] = self.CarDealerships[dealershipIndex+1] [1] [1]
		carPos[2] = self.CarDealerships[dealershipIndex+1] [1] [2]
		carPos[3] = self.CarDealerships[dealershipIndex+1] [1] [3]
		
		self.MissionVehicle2 = CreateVehicle( LIMO_MODEL_INDEX,
											carPos,
											self.CarDealerships[dealershipIndex+1] [2], colour1, colour2)
		
		VehicleAdd3dMarker(self.MissionVehicle2)

		carPos[1] = self.CarDealerships[dealershipIndex+2] [1] [1]
		carPos[2] = self.CarDealerships[dealershipIndex+2] [1] [2]
		carPos[3] = self.CarDealerships[dealershipIndex+2] [1] [3]
		
		self.MissionVehicle3 = CreateVehicle( LIMO_MODEL_INDEX,
											carPos,
											self.CarDealerships[dealershipIndex+2] [2], colour1, colour2)												 
											
		VehicleAdd3dMarker(self.MissionVehicle3)

		carPos[1] = self.CarDealerships[dealershipIndex+3] [1] [1]
		carPos[2] = self.CarDealerships[dealershipIndex+3] [1] [2]
		carPos[3] = self.CarDealerships[dealershipIndex+3] [1] [3]
		
		self.MissionVehicle4 = CreateVehicle( LIMO_MODEL_INDEX,
											carPos,
											self.CarDealerships[dealershipIndex+3] [2], colour1, colour2)
		
		VehicleAdd3dMarker(self.MissionVehicle4)
											
											
		self.Car1Destroyed = false
		self.Car2Destroyed = false
		self.Car3Destroyed = false
		self.Car4Destroyed = false
		
		VehicleSetCarDoorLocks(self.MissionVehicle1, CARLOCK_LOCKED)
		VehicleSetCarDoorLocks(self.MissionVehicle2, CARLOCK_LOCKED)
		VehicleSetCarDoorLocks(self.MissionVehicle3, CARLOCK_LOCKED)
		VehicleSetCarDoorLocks(self.MissionVehicle4, CARLOCK_LOCKED)
	end
end



--
-- Shows how long the defence has held out 
--
function DTB:DisplayDefenceTimer()

	local player = Player()
	local elapsedMs
	local minutes
	local seconds
	local str
	
	elapsedMs = GameElapsedMs()
	minutes = math.floor((elapsedMs / 1000) / 60)
	elapsedMs = elapsedMs - (minutes*(1000*60))
	seconds = elapsedMs / 1000
	str = string.format("%.2d:%.2d", minutes, seconds)
	self.DefenceTimer:Text('^S^'..str)
	
	-- if there is one, display the time to beat
	if self.RoundsPlayed == 2 then
		elapsedMs = self.TimeToBeat
		minutes = math.floor((elapsedMs / 1000) / 60)
		elapsedMs = elapsedMs - (minutes*(1000*60))
		seconds = elapsedMs / 1000
		str = string.format("%.2d:%.2d", minutes, seconds)
		self.TimeToBeatText:Text('^S^'..str)
	else
		self.TimeToBeatText:Text('^S^    ')
	end
end



--
--
--
function DTB:Commentate(text)
    main.commentary:Print(text)
end



--
-- games is done, display winner / scores then cleanup
--
function DTB:CheckIfEndOfGame()
	if self.EndOfGame == true then
		print('End Of Game Reached')
		
		UpdateGameTime(false)
		DisablePlayer(true)
		
		main.game.state = 'StateGameWon'
		
		-- show scores
		--main.scores:Show(true)		
		--main.scores:Hide()
    		
    	local winningTeam=0
		if GameElapsedMs() > self.TimeToBeat then
			winningTeam = self.DefendingTeam
		elseif GameElapsedMs() == self.TimeToBeat then
			winningTeam = 0
		else
			if self.DefendingTeam == 1 then 
				winningTeam = 2
			else
				winningTeam = 1
			end			
		end	
		
		-- let any messages clear 
		Wait(2000)
	
		local winningTeamName
		if winningTeam == 0 then
			winningTeamName = nil
			print('Draw')
		elseif winningTeam == 1 then 
			print('Blue Team Wins')
			winningTeamName = '^T^MTN_1'
			--self:DisplayMessage('^S^Blue Team Wins', 3000, true)
		else
			--self:DisplayMessage('^S^Red Team Wins', 3000, false)
			print('Red Team Wins')
			winningTeamName = '^T^MTN_2'
		end	
			
		local player = Player()
		local theWinner
		if player:TeamId() == winningTeam-1 then
			theWinner = 1
		else 
			theWinner = 2
		end
		
		DisplayFinalWinLoseMessage(theWinner, "^S^"..winningTeamName.."^S^ ^T^MPTWIN")
		
		--[[
		local txt = nil
		
		if winningTeamName then
			txt = AddText{x = 240, y = 110, scale = .9, align = 1, text = "^S^"..winningTeamName.."^S^ ^T^MPTWIN"}
		else
			txt = AddText{x = 240, y = 110, scale = .9, align = 1, text = "^S^ ^T^MPDRAW"}	
		end
		
		local counter = 0
	    
		while counter < 250 do
			DisablePlayer(true)
			Wait(1)
			counter = counter + 1
		end
		txt:Remove()
		--]]
	    
		main.scores:Show(true)
		Wait(6000)
  
		main.scores:Hide()
		main:EndGame()
		
		
		--self:CleanUp()
	end
end



--
-- Runs on the server when all vehicles have been destroyed. The server will inform all clients that they need to change sides
--
function DTB:SwapAttackDefend()

	if IsServer() then

		local endOfRound = false

		-- if the second team have beaten the first teams time end the game 
		if self.RoundsPlayed == 2 then	
			
			if (GameElapsedMs()-1000) > self.TimeToBeat then
				endOfRound = true
			end			
		end


		-- all cars are toast 
		if	(self.MissionVehicle1 ~= nil and IsVehicleWrecked(self.MissionVehicle1) == true and 
			self.MissionVehicle2 ~= nil and IsVehicleWrecked(self.MissionVehicle2) == true and 
			self.MissionVehicle3 ~= nil and IsVehicleWrecked(self.MissionVehicle3) == true and 
			self.MissionVehicle4 ~= nil and IsVehicleWrecked(self.MissionVehicle4) == true) or
			(endOfRound == true) then
			
			-- change sides 
			if self.FinalRound == false then	

				--	stop the game timer
				UpdateGameTime(false)
						
				self.FinalRound = true


				-- clear all vehicles from the world 
				local pos = {0.0, 0.0, 0.0}
				ClearArea(pos, 99999.0)				

				--[[
				-- radar blips
				if self.MissionVehicleRadarBlip1 ~= nil then
					RemoveBlip(self.MissionVehicleRadarBlip1)
					self.MissionVehicleRadarBlip1 = nil
				end
				if self.MissionVehicleRadarBlip2 ~= nil then
					RemoveBlip(self.MissionVehicleRadarBlip2)
					self.MissionVehicleRadarBlip2 = nil
				end		
				if self.MissionVehicleRadarBlip3 ~= nil then
					RemoveBlip(self.MissionVehicleRadarBlip3)
					self.MissionVehicleRadarBlip3 = nil
				end
				if self.MissionVehicleRadarBlip4 ~= nil then
					RemoveBlip(self.MissionVehicleRadarBlip4)
					self.MissionVehicleRadarBlip4 = nil
				end	
				--]]
				if 	self.BaseBlip ~= nil then 
					RemoveBlip(self.BaseBlip)
					self.BaseBlip = nil
				end

				-- 3d markers 
				VehicleRemove3dMarker(self.MissionVehicle1)
				VehicleRemove3dMarker(self.MissionVehicle2)
				VehicleRemove3dMarker(self.MissionVehicle3)
				VehicleRemove3dMarker(self.MissionVehicle4)

				-- shortcut vehicles to get attackers to the defenders base quickly 
				DeleteVehicle(self.ShortcutVehicle1)
				DeleteVehicle(self.ShortcutVehicle2)
				--self.ShortcutVehicle1 = nil
				--self.ShortcutVehicle2 = nil
				
				local carPos = {}
				carPos[1] = self.ShortcutVehiclePoints[1] [1] [1]
				carPos[2] = self.ShortcutVehiclePoints[1] [1] [2]
				carPos[3] = self.ShortcutVehiclePoints[1] [1] [3]			
				self.ShortcutVehicle1 = CreateVehicle( IDAHO_MODEL_INDEX,
														carPos,
														self.ShortcutVehiclePoints[1] [2])	
																												
				carPos[1] = self.ShortcutVehiclePoints[2] [1] [1]
				carPos[2] = self.ShortcutVehiclePoints[2] [1] [2]
				carPos[3] = self.ShortcutVehiclePoints[2] [1] [3]			
				self.ShortcutVehicle2 = CreateVehicle( STINGER_MODEL_INDEX,
														carPos,
														self.ShortcutVehiclePoints[2] [2])															
				
				self.ShortcutRespawnTimer = 0 -- spawn instantly first time
				self.ShortcutRespawnLastUpdate = GameElapsedMs()

				Wait(3000)

				-- the mission vehicles
				DeleteVehicle(self.MissionVehicle1)
				DeleteVehicle(self.MissionVehicle2)
				DeleteVehicle(self.MissionVehicle3)
				DeleteVehicle(self.MissionVehicle4)
				self.MissionVehicle1 = nil
				self.MissionVehicle2 = nil
				self.MissionVehicle3 = nil
				self.MissionVehicle4 = nil
							
				SendEvent(MSG_SWAP_TEAM)	
				
			-- end of game 
			elseif self.EndOfGame == false then
				--ClearEventStack()
				SendEvent(MSG_END_GAME)
			end
		end
		
	end
end


--
-- checks if we need to change attack / defend 
-- 
function DTB:CheckChangeSides()
	if self.ChangeSides == true then 
	
		DisablePlayer(true)
	
		self.ChangeSides = false
	
		self.InitialSpawn = true -- first spawn for defending team is inside the base
				
		CameraFadeOut(5)
		
		self.TimeToBeat = GameElapsedMs()
		
		self.RoundsPlayed = self.RoundsPlayed + 1
		
		RegenerateAllPickups()
		
		--self.DefenceTimer = 0
		--self.TimeToBeatText = 0
			
		-- how many vehicles left to defend before we change sides 
		self.VehiclesLeftThisRound = 4
		
		-- swap the defending team 
		if self.DefendingTeam == 1 then 
			self.DefendingTeam = 2
		else
			self.DefendingTeam = 1
		end
		
		self:UpdateRadar()
		
		-- respawn all vehicles
		self:SpawnMissionVehicles()
		
		local player = Player()
		local playerPos = self:GetPlayerRespawnPosition()
		player:Respawn(playerPos)
		
		Wait(1000)
		
		
		if self.gameUnderway == false then
		
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
			
			self.gameUnderway = true
		end 
		
		
		if (self.DefendingTeam == 1) then
			self.DefenceTimer:Colour(TeamColour(0))
			self.TimeToBeatText:Colour(TeamColour(1))
		else
			self.DefenceTimer:Colour(TeamColour(1))
			self.TimeToBeatText:Colour(TeamColour(0))
		end 
			
		-- reset the game timer 
		GameElapsedMs(0)
		
		-- start the game timer
		UpdateGameTime(true)
		
		CameraFadeIn(5)
		
		-- display messages 
		self:DisplayAttackDefendMessage()
		
		DisablePlayer(false)
	
	end	
end


--
-- the server will send messages to clients, this is where we grab em 
--
function DTB:ProcessNetworkEvents()

	if IsEventStackEmpty() == false then 

		local player = Player()
		
		local event = GetEvent()
		
		-- all cars destroyed, change sides
		if event == MSG_SWAP_TEAM then
		--self.Commentate('^S^Change Sides')
		print('Change Sides')
		self.ChangeSides = true
		
		
		-- all done, signal end of game 
		elseif event == MSG_END_GAME then
		self.EndOfGame = true
		--self.Commentate('^S^Game Over')
		print('GameOver')
		
		-- lost a car 
		elseif event == MSG_CAR_LOST then
			print('Car Lost!')
			if player:TeamId()+1 == self.DefendingTeam then 
				-- CAR LOST!
				self:DisplayMessage('^t^DTB03', 1500, true)
			else
				-- CAR DESTROYED!
				self:DisplayMessage('^t^DTB04', 1500, false)
			end
		end	
		
	end
end


--
-- uses a text sprite to display the attack/defend message
--
function DTB:DisplayAttackDefendMessage()	
	local player = Player()
	if player:TeamId()+1 == self.DefendingTeam then 
		-- DEFEND THE CARS!
		self:DisplayMessage('^t^DTB01', 3000, true)
	else
		-- DESTROY THE CARS!
		self:DisplayMessage('^t^DTB02', 3000, false)
	end
end


--
-- uses a text sprite to display the attack/defend message
--
function DTB:DisplayMessage(theText, length, defendColour)	

	if self.SplashTextIsOnScreen == false then 
	
		--setup the message 
		self.Msg = theText
		self.MsgLength = length

		local player = Player()
		if player:TeamId() == 1 then 
			self.MsgColour = {164, 16, 0, 255}
		else 
			self.MsgColour = {0, 106, 164, 255}
		end
		
	--	if defendColour == true then
	--		self.MsgColour = {0, 106, 164, 255}
	--	else
	--		self.MsgColour = {164, 16, 0, 255}
	--	end
		
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



function DTB:GetPlayerRespawnPosition()
	local player = Player()
	local playerPos = {}
	
	if player:TeamId()+1 == self.DefendingTeam then
	
		-- first spawn for defending team is inside the base
		if self.InitialSpawn == true  then 
		
			self.InitialSpawn = false
			main.vSpawnPoints = self.DefenceStartPoints						
			playerPos = DoSpawn(InitialSpawnPoint(PlayerId()), false)
		
		-- otherwise they spawn out of the base 
		else
			main.vSpawnPoints = self.DefenceSpawnPoints
			playerPos = DoSpawn(nil, false)
			
		end
		
	else
		main.vSpawnPoints = self.AttackSpawnPoints
		playerPos = DoSpawn(nil, false)
	end
	
	return playerPos
end



--
-- updates the defending teams score to match the current time 
--
function DTB:UpdateScores()
	self.teamscores[self.DefendingTeam] = GameElapsedMs()
end    



--
-- called from scoresheet.lua to get the scores 
--
function DTB:TeamScore(team)
	--print('team = '..team)
    return self.teamscores[team+1] or 0
end    


function DTB:RegisterPlayerKill(player, killer, headshot)

	local killerName = killer:Name()
--	if killer:TeamId() == 1 then 
--		killerName = '^S^ ~r~ '..killer:Name()..'^S^ ~w~ '
--	else
--		killerName = '^S^ ~b~ '..killer:Name()..'^S^ ~w~ '
--	end
	
	local playerName = player:Name()
--	if player:TeamId() == 1 then 
--		playerName = '^S^ ~r~ '..player:Name()..'^S^ ~w~ '
--	else
--		playerName = '^S^ ~b~ '..player:Name()..'^S^ ~w~ '
--	end
		
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
	
	main.game = DTB():Start()

	main:Start()
end
