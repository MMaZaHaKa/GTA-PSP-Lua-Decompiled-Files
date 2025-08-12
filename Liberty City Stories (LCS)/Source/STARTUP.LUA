---------------------------------------------------------------------------
-- SETTINGS

--change this to be the name of the host machine (or comment out to scan
--the network for open games)
--[[ 
someCarType sets the type of car you will all race with, i suggest the mini.
not all of the cars will work. i.e. the boats and big things like tanks that 
are very wide, coaches are ok though :)
comment out to have a variety of different cars

landstalker	idaho		stinger		linerunner  perennial   
sentinel    patriot		firetruck   trashmaster stretch     
manana      infernus    blista      pony        mule        
cheetah     ambulance	fbi			moonbeam    esperanto   
taxi        kuruma		bobcat      mrwhoopee	buggy
police		enforcer    securicar   banshee		bus
rhino       barracks	coach		cabbie		stallion
rumpo		bellyup		mrwongs		mafia		yardie
yakuza		diablos		columbians	hoods		panlant
flatbed		yankee		borgnine	spider		mclaren
shelby		subaru		pontiac		supra		skyline
cyclone		esprit		mini		hotrod		]]

--someCarType = cars.mini

---------------------------------------------------------------------------
require 'gta'
require 'mainloop'
require 'PowerUps'

main = MainLoop{}

--
-- InitSpawnPoints()
--
--		Setup the spawn points...
--
function InitSpawnPoints()
	
	main.vSpawnOffsets = {
		{{0.0, 4.0, 0.0}, 0.0},		--	NORTH
		{{2.0, 2.0, 0.0}, 0.0},		--	NORTH/EAST
		{{4.0, 0.0, 0.0}, 0.0},		--	EAST
		{{2.0, -2.0, 0.0}, 0.0},	--	SOUTH/EAST
		{{0.0, -4.0, 0.0}, 0.0},	--	SOUTH
		{{-2.0, -2.0, 0.0}, 0.0},	--	SOUTH/WEST
		{{-4.0, 0.0, 0.0}, 0.0},	--	WEST
		{{-2.0, 2.0, 0.0}, 0.0},	--	NORTH/WEST
	}
	
	if GameType() == 5 then
		if GameLocation() == 0 then					--	Portland
			main.vSpawnPoints = {
	--				pos					 heading
				{{947.3441, -47.9133, 6.4330}, 180.0},
				{{1278.4918, -92.0525, 13.9868}, 0.0},
				{{941.0820, -347.7505, 8.9325}, 180.0},
				{{1292.4677, -335.2223, 36.1601}, 0.0},
				{{927.5822, -679.3553, 13.9329}, 0.0},
				{{1295.4650, -630.3524, 11.4177}, 270.0},
				{{850.5524, -986.9323, 4.2155}, 0.0},
				{{1319.8976, -992.9208, 13.7946}, 270.0}
			}
		elseif GameLocation() == 1 then				--	Staunton Island
			main.vSpawnPoints = {
	--				pos					 heading
				{{176.3820, -16.4696, 15.1780}, 0.0}, 
				{{375.6499, -136.2530, 20.2108}, 340.1611}, 
				{{-19.4568, -472.8146, 17.6069}, 90.0}, 
				{{347.8423, -512.8240, 19.7519}, 90.0}, 
				{{59.5232, -962.6240, 25.1281}, 270.0}, 
				{{397.8806, -912.9601, 25.1281}, 90.0}, 
				{{-50.6070, -1474.3346, 25.1041}, 270.0},
				{{308.0347, -1410.1143, 25.1282}, 180.0}
			}
		else										--	Shoreside Vale
			main.vSpawnPoints = {
				{{-1113.2144, 521.6744, 67.1784}, 17.4366}, 
				{{-1256.4679, 131.1646, 67.8212}, 270.0}, 
				{{-869.7761, 192.6611, 47.8213}, 25.2610}, 
				{{-764.1891, 193.7988, 27.6714}, 90.0}, 
				{{-997.2046, -40.0340, 38.6395}, 116.9062}, 
				{{-623.6219, -44.7300, 17.8212}, 90.8104},
				{{-443.6338, -4.8689, 2.8213}, 90.0},
				{{-1270.3594, -209.2431, 52.3545}, 0.0}
			}
		end
--[[ jonb	
	-- Tank game - spawn points must be ok for tanks or players to spawn into
	elseif	GameType() == 4 then
		if GameLocation() == 0 then					--	Portland
	--				pos					 heading
			main.vSpawnPoints = {
				{{1148.88, -879.64, -100.0}, 0.0},
				{{1256.71, -1138.25, -100.0}, 0.0},
				{{1398.94, -802.87, -100.0}, 0.0},				
				{{1273.42, -631.96, -100.0}, 0.0},
				{{1363.49, -460.32, -100.0}, 0.0},				
				{{1418.31, -190.34, -100.0}, 0.0},
				{{1195.49, -75.28, -100.0}, 0.0},
				{{939.88, -230.85, -100.0}, 0.0},
				{{835.50, -208.78, -100.0}, 0.0},												
				{{1049.56, -839.97, -100.0}, 0.0},
			}
		elseif GameLocation() == 1 then				--	Staunton Island
			main.vSpawnPoints = {
	--				pos					 heading
				{{121.25, -631.24, -100.0}, 0.0}, 
				{{-6.34, -729.23, -100.0}, 0.0}, 
				{{-129.20, -1176.88, -100.0}, 0.0}, 
				{{-91.98, -1364.62, -100.0}, 0.0},				 
				{{-29.16, -1152.60, -100.0}, 0.0}, 
				{{74.98, -1076.28, -100.0}, 0.0},
				{{264.0, -1270.0, -100.0}, 0.0},
				{{200.0, -813.0, -100.0}, 0.0},
			}
		else										--	Shoreside Vale
			main.vSpawnPoints = {
				 -- THESE NEED DOING...
				{{-725.23, 39.73, -100.0}, 0.0}, 
				{{-748.79, -583.35, -100.0}, 0.0}, 
				{{-644.43, -723.88, -100.0}, 0.0}, 
				{{-695.81, -194.61, -100.0}, 0.0}, 
				{{-861.49, 172.22, -100.0}, 0.0}, 
				{{-1211.44, 412.65, -100.0}, 0.0}
			}
		end
--]]
	else
		if GameLocation() == 0 then					--	Portland
			main.vSpawnPoints = {
	--				pos					 heading
				{{1148.88, -921.64, -100.0}, 0.0},
				{{1256.71, -1138.25, -100.0}, 0.0},
				{{1398.94, -802.87, -100.0}, 0.0},
				{{1273.42, -631.96, -100.0}, 0.0},
				{{1338.49, -456.32, -100.0}, 0.0},
				{{1418.31, -190.34, -100.0}, 0.0},
				{{1259.35, -249.13, -100.0}, 0.0},
				{{1218.49, -113.28, -100.0}, 0.0},
				{{1086.61, -80.26, -100.0}, 0.0},
				{{939.88, -198.85, -100.0}, 0.0},
				{{862.50, -208.78, -100.0}, 0.0},
				{{868.82, -307.78, -100.0}, 0.0},
				{{869.36, -821.49, -100.0}, 0.0},
				{{1026.56, -842.97, -100.0}, 0.0},
				{{918.96, -898.72, -100.0}, 0.0},
				{{777.98, -881.05, -100.0}, 0.0}
			}
		elseif GameLocation() == 1 then				--	Staunton Island
			main.vSpawnPoints = {
	--				pos					 heading
				{{164.25, -622.24, -100.0}, 0.0}, 
				{{47.52, -635.31, -100.0}, 0.0}, 
				{{39.34, -724.23, -100.0}, 0.0}, 
				{{-116.20, -1176.88, -100.0}, 0.0}, 
				{{-91.98, -1383.62, -100.0}, 0.0}, 
				{{-29.16, -1152.60, -100.0}, 0.0}, 
				{{96.98, -1097.28, -100.0}, 0.0}
			}
		else										--	Shoreside Vale
			main.vSpawnPoints = {
				{{-725.23, 39.73, -100.0}, 0.0}, 
				{{-748.79, -583.35, -100.0}, 0.0}, 
				{{-644.43, -723.88, -100.0}, 0.0}, 
				{{-695.81, -194.61, -100.0}, 0.0}, 
				{{-861.49, 172.22, -100.0}, 0.0}, 
				{{-1211.44, 412.65, -100.0}, 0.0}
			}
		end
	end
end
--
-- DoSpawn()
--
--		Spawn the player at a good position....
--
function DoSpawn(try_this_point_first, bSpawnPlayer)
	try_this_point_first = try_this_point_first or -1
	bSpawnPlayer = bSpawnPlayer or true
	local player = Player()
	local i = 0
	local j = 0
	local finalspawnpoint = unpack(main.vSpawnPoints[1])
	
	i = try_this_point_first
	-- pick a random point..
--	if try_this_point_first < 1 or try_this_point_first > table.getn(main.vSpawnPoints) then 
--		i = math.random(1, table.getn(main.vSpawnPoints))
--	end

	--	Pick the closest point - ROBM
	if try_this_point_first < 1 or try_this_point_first > table.getn(main.vSpawnPoints) then
		local shortestdistance = 100000.0
		local distance = 0

		for j,spawnpoint in ipairs(main.vSpawnPoints) do
			distance = Distance2D(unpack(spawnpoint), player:Position())

			if distance < shortestdistance and distance > 20.0 then
				shortestdistance = distance
				i = j
			end
		end

		finalspawnpoint = AddVectors(unpack(main.vSpawnPoints[i]), unpack(main.vSpawnOffsets[player:PlayerNum() + 1]))

		while LocatePlayer(finalspawnpoint) do
			j = j + 1
			if j > 8 then
				j = 1
			end
			finalspawnpoint = AddVectors(unpack(main.vSpawnPoints[i]), unpack(main.vSpawnOffsets[j]))
		end
	else
		finalspawnpoint = unpack(main.vSpawnPoints[i])
		-- check to make sure nobody near ere...
		while LocatePlayer( finalspawnpoint ) do
			i = math.random( 1, table.getn(main.vSpawnPoints) )
			finalspawnpoint = unpack(main.vSpawnPoints[i])
		end
	end	
	
	-- go!
	if bSpawnPlayer == true then 
		print( "Respawn called at point "..i )
		player:Respawn(finalspawnpoint, main.vSpawnPoints[i][2])	--unpack(main.vSpawnPoints[i]))
	end 

	-- NeilD - No one seemed to be using this return value, so it now returns the spawn pos
	--return 'Running'	
	
	-- heading
	finalspawnpoint[4] = main.vSpawnPoints[i][2]
	return finalspawnpoint
end

function Main()
	main = MainLoop{}
	--GameLocation(2)
	--GameType(5)

	--GameType(4)
	
	InitSpawnPoints()
	
	local i = 0
	
	
	i = math.random(1, table.getn(main.vSpawnPoints))
	
	CreatePlayer(unpack(main.vSpawnPoints[i][1]))
	
	PlayerName(HostName())
	
	main:Start()
end
