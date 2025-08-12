-- FreeRoam controller
-- RobM

require 'PickupBlips'

FreeRoam = StateMachine{'StateInit'}

function FreeRoam:StateInit()   
	IsTeamGame(false)
    self:CreatePickups()
    self:Commentate('FreeRoam started!')
    self.scores = {}

    --CameraFadeIn(1)
    return 'StateRunning'
end

function FreeRoam:CleanUp()
    -- remove the pickups
    self.pickupBlipScript:Stop()
    for _,pickup in ipairs(self.pickups) do 
        pickup:Remove() 
    end
end

--
-- FreeRoam:DoSpawn()
--
--		Spawn the player at a good position....
--
function FreeRoam:DoSpawn()

	local player = Player()
	local i = 0
	
	-- pick a random point..
	i = math.random(1, table.getn(main.vSpawnPoints))
	
	-- check to make sure nobody near ere...
	while LocatePlayer( unpack( main.vSpawnPoints[i] ) ) do
		i = math.random( 1, table.getn(main.vSpawnPoints) )
	end
			
	-- go!
	print( "Respawn called at point "..i )
	player:Respawn(unpack(main.vSpawnPoints[i]))
	
	return 'Running'	
end

function FreeRoam:CreatePickups()
    self.pickups = {}
    
    if not IsServer() then
        return 
    end
    
    local pickups = {}
    
	if GameLocation() == 0 then					--	Portland
		pickups = {
		--   model      position               ammo
			{'ROCKETLA',  {1319.69, -275.8,  15.00},  60},		--tunnel
			{'FLAME',  {1218.43, -134.05, 15.60},  60},			--car show room
			{'SHOTGSPA',  {1125.21, 46.93,   4.300},  60},		--junk conveyor
			{'KATANA',  {1157.92, -189.99, 14.70},  60},		--end alley
			{'SNIPER',  {1217.73, -239.52, 32.70},  60},		--Roof
			{'ROCKETLA',  {1557.75, -215.43, 58.60},  60},		--Lighthouse overlook
			{'M4',  {1311.20, -463.15, 59.07},  60},			--patio roof
			{'CHROMEGUN',  {1323.43, -529.72, 42.70},  60},		--train platform
			{'MP5K',  {1156.94, -454.32, 21.30},  60},		--pass through
			{'MP5K',  {1093.17, -409.97, 14.80},  60},		--down alley
			{'LASER',  {1445.56, -852.30, 32.33},  60},			--warehouse roof
			{'M60',  {1431.30, -531.92, 16.00},  60},			--beach
			{'UZI',  {1276.97, 381.410, 33.69},  60},			--long alley
			{'MP5K',  {1311.12, -315.79, 42.06},  60},		--off road
			{'LASER',  {1025.17, -392.37, 14.86},  60},			--open alley
			{'MP5K',  {1020.26, -340.25, 14.90},  60},		--garage
			{'FLAME',  {959.6,   -330.4,  9.6},    60},			--work underpass
			{'MP5K',  {955.0,   -246.9,  4.76},   60},		--construction site
			{'SNIPER',  {1205.53, -1021.48, 21.67},  60},		--roof ramp
			{'M4',  {1495.79, -1155.84, 12.14},  60},			--pier end
			{'SNIPER',  {1189.8444, -1127.6390, 16.9640},  60},	--roof near pier
			{'GLOCK17',  {1115.7642, -1245.2356, 10.5215},  60},	--end wooden pier
			{'MINIGUN',  {949.8057, -1114.2180, 12.1322},  60},	--behind food factory
			{'GLOCK17',  {936.4595, -933.3459, 18.1263},  60},	--bridge jump mound
			{'PYTHON',  {828.6426, -1053.7435, 13.3173},  60},	--park 
			{'GRENADE',  {859.9639, -980.8849, 9.4852},  60},	--diner roof
			{'SHOTGSPA',  {863.9258, -663.9533, 13.9361},  60},	--laundry alley 
			{'GLOCK17',  {990.6151, -735.4258, 13.9316},  60},	--china town alley 
			{'M4',  {789.5125, -575.8696, 18.7961},  60},		--usj jump
			{'MOLOTOV',  {816.6223, -561.0172, 23.3231},  60},	--overpass walkway 
			{'AK47',  {898.1657, -414.5687, 25.5337},  60},	--JDT roof
			{'M4',  {1037.7203, -156.4187, 22.9032},  60},		--Train Platform Covered 
			{'SNIPER',  {1020.6446, -222.0203, 8.3127},  60},	--In the treess
			{'GLOCK17',  {1062.2878, -569.4073, 15.6044},  60},	--Box alley 
			{'MP5K',  {1091.8301, -693.1956, 13.9333},  60},	--Easy alley 
			{'GLOCK17',  {1163.0736, -643.7957, 17.8527},  60},	--Police Station Round back 
			{'MP5K',  {1568.1666, -694.6786, 10.7862},  60},	--Docks crane 
			{'PYTHON',  {1214.5089, -309.6771, 28.9209},  60},	--Ma Cip's 
			{'MP5K',  {1158.3252, -270.6910, 16.2547},  60},	--Off road garage 
			{'UZI',  {1004.9731, -49.0745, 6.4086},  60},		--Radio Station Entrance 
			{'MP5K',  {765.8713, 193.6255, 2.9450},  60},		--Docks Powerhouse 
			{'GLOCK17',  {883.1309, -524.9763, 15.5528},  60},	--Raised off road 
			{'MP5K',  {991.9680, -471.6987, 2.7360},  60},	--UnderGround entrance 
			{'KATANA',  {1020.6091, -339.8971, 13.8116},  60},	--Patio garage
			{'SHOTGSPA',  {1159.6012, -106.0999, 6.6061},  60},	--Behind Petrol Station
	        
		-- health    
			{'health',  {1238.9845, -1243.9845, 10.8609}},		--End Wooden Pier
			{'health',  {1277.0895, -982.9139, 14.2334}},		--Coach dept
			{'health',  {1289.2567, -854.8746, 14.4858}},		--dead end
			{'health',  {1325.3098, -681.9615, 12.8695}},		--Supermarket flower bed
			{'health',  {1146.5005, -591.9588, 14.4155}},		--Hospital 
			{'health',  {953.5963, -358.1068, 10.9022}},		--Alley
			{'health',  {868.9496, -212.1607, 4.0257}},			--Courtyard
			{'health',  {892.5656, 200.8766, 6.2700}},			--Ferry Jump 
			{'health',  {1313.7164, -75.7409, 15.7261}},		--Train Yard 
			{'health',  {1275.3630, -381.1106, 33.0068}},		--Long alley
	 
		-- Other
			
			{'BODYARMOUR', {1243.8541, -316.0791, 31.8150}}		--BackYard Body Armour
		}
	elseif GameLocation() == 1 then				--	Staunton Island
		pickups = {
		--   model      position               ammo
			{'ROCKETLA',  {1319.69, -275.8,  15.00},  60},		--tunnel
			{'FLAME',  {1218.43, -134.05, 15.60},  60},			--car show room
			{'SHOTGSPA',  {1125.21, 46.93,   4.300},  60},		--junk conveyor
			{'KATANA',  {1157.92, -189.99, 14.70},  60},		--end alley
			{'SNIPER',  {1217.73, -239.52, 32.70},  60}			--Roof
		}
	else										--	Shoreside Vale
		pickups = {
		--   model      position               ammo
			{'ROCKETLA',  {1319.69, -275.8,  15.00},  60},		--tunnel
			{'FLAME',  {1218.43, -134.05, 15.60},  60},			--car show room
			{'SHOTGSPA',  {1125.21, 46.93,   4.300},  60},		--junk conveyor
			{'KATANA',  {1157.92, -189.99, 14.70},  60},		--end alley
			{'SNIPER',  {1217.73, -239.52, 32.70},  60}			--Roof
		}
	end	
           
    for _,args in ipairs(pickups) do
        table.insert(self.pickups, CreatePickup(unpack(args)))
    end    
    
    self.pickupBlipScript = PickupBlipScript{}:Start(self.pickups)
end

function FreeRoam:StateRunning()  
    local player = Player()
    if not player:IsPlaying() then
        main.scores:Show(true)
        Wait(1000)
        --CameraFadeOut(1)
        while main.scores.scores do
			Wait(250)
        end
--        player:WaitKeyPressAndCameraCheck()
--        main.scores:Hide()
        self:DoSpawn()
    end
end

function FreeRoam:Commentate(text)
    main.commentary:Print(text)
end

function FreeRoam:Score(player)
    return self.scores[player] or 0
end    

function FreeRoam:RegisterPlayerKill(player, killer, headshot)
    if player == killer then
        self:Commentate(player:Name()..' killed himself')
    else
        -- see if they were killed with a headshot
        if headshot then
			self:Commentate(killer:Name()..' killed '..player:Name()..' with a headshot!')
		else
			self:Commentate(killer:Name()..' killed '..player:Name())
		end
    end
end
