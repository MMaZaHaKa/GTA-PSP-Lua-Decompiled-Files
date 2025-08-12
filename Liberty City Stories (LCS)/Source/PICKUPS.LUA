-- Pickups
-- andyg

require 'PickupBlips'

PickupMgr = Object{}

--deletes all the pickups
function PickupMgr:CleanUp()
	--stop drawing the pickups
	self.pickupBlipScript:Stop()
	--remove the pickups from the world
    for _,pickup in ipairs(self.pickups) do 
        pickup:Remove() 
    end
end


--creates the pickups depending on game type and island
function PickupMgr:CreatePickups()

	self.pickups = {}
	
	--only create the pickups on the servr at the moment
	if IsServer() then
	    
		local pickupdata = {}
	    
    		if GameLocation() == 0 then		--	Portland
    			pickupdata = {
    			--   model      position               ammo
    			--area8	
    				{pickup.shotgun,  {1238.4011, -1249.2380, 11.8730},  12},		--end of pier
    				{pickup.sniper,  {1182.1538, -1117.1766, 11.8192},  30},		--between warehouses
    				{pickup.tec9,  {1147.1584, -925.2814, 15.0079},  50},		--middle of path (easy) 
    				{pickup.molotov,  {1387.9872, -1001.4305, 11.8830},  10},		--between lorry trailers
    				{pickup.chainsaw,  {1301.8599, -1023.6431, 14.8451},  60},		--coach station
    				{pickup.rocket_launcher,  {1575.3541, -928.5635, 10.3405},  5},		--ship!
    				{pickup.ak47,  {1317.7924, -844.6498, 14.9858},  30},			--big alley near dockers 
    				{pickup.grenade,  {1132.9966, -976.2681, 14.8263},  10},		--behind bins near sawmill
	    		
					{pickup.health,  {1319.3462, -1007.6297, 14.8094}},		--Coach dept
					{pickup.health,  {1153.5819, -1077.5167, 13.5928}},             --grass banking
					{pickup.health,  {1553.7484, -890.5146, 11.7833}},		--next to ship
					{pickup.armour,  {1329.7201, -1155.3195, 11.8202}},             --near warehouses
					{pickup.armour,  {1202.5760, -945.2961, 15.0672}},              --between buildings
			
			--area7	
    				{pickup.shotgun,  {1103.0620, -1136.5417, 11.8192},  12},		--next to vinnie's warehouse
    				{pickup.sniper,  {1103.2638, -1039.9801, 25.1575},  14},		--on top of sawmill (hard) PSG1 or summat
    				{pickup.ak47,  {1035.5594, -1014.1666, 14.9313},  30},			--big tenament
    				{pickup.minigun,  {947.9678, -1113.4272, 13.1322},  30},			--behind drug factory
    				{pickup.sniper,  {926.4890, -1045.8192, 14.4932},  30},			--grassy knoll
    				{pickup.tec9,  {934.6821, -848.4339, 14.8313},  6},		--basketball court
    				--{pickup.rocket_launcher,  {1078.8763, -911.2841, 15.1771},  300},			--behind buildings at start of bridge
    				{pickup.det_grenade,  {789.0198, -937.0288, 15.0354},  10},		--under bridge
	    			
    				{pickup.health,  {878.6973, -1010.7620, 4.8675}},		--greasy joe's diner
					{pickup.health,  {774.2908, -854.0803, 14.7246}},		--next to water, near bridge
					{pickup.health,  {1031.0684, -933.0208, 14.9334}},		--start of bridge
					{pickup.armour,  {795.2945, -1004.9326, 4.8487}},		--tunnel
					{pickup.armour,  {1048.9757, -1154.1892, 13.1295}},		--by water, south
			
			--area6	
    				{pickup.sniper,  {1260.3101, -727.4758, 23.3430},    30},	--on top of taxi building
    				{pickup.tec9,  {1273.5935, -743.9666, 14.9277},   50},		--alley next to taxi building
    				{pickup.chainsaw,  {1272.7783, -617.6541, 12.1677},  60},		--supasave
    				{pickup.shotgun,  {1171.4500, -663.9650, 18.8591},  12},			--behind cops
    				{pickup.rocket_launcher,  {1205.1144, -803.7195, 21.9090},  5},	--top o' bitchin' dog food
    				{pickup.tec9,  {1486.2443, -774.5760, 11.7823},  30},	--docks1
    				{pickup.det_grenade,  {1442.9634, -673.6034, 11.7862},  10},	--docks2
    				{pickup.molotov,  {1418.8116, -561.2812, 27.4560},  10},	--brow near beach south
	    			
    				{pickup.health,  {1325.2334, -682.5991, 13.3427}},		--supasave
					{pickup.health,  {1183.4369, -567.6328, 20.5223}},              --pigs
					{pickup.health,  {1179.9272, -751.6107, 14.9483}},		--field
					{pickup.armour,  {1483.7257, -623.2601, 15.8246}},		--new scaffold
					{pickup.armour,  {1400.5881, -837.1541, 11.7845}},		--behind portacabin
			
			--area5	
    				{pickup.sniper,  {849.6788, -806.3579, 27.5369},  14},		--top of southmost chinatown building
    				{pickup.shotgun,  {868.7071, -663.7165, 14.9361},  12},	--Mr wongs laundry alley
    				{pickup.det_grenade,  {758.8101, -587.5039, 24.0152},  10},	-- train tracks
    				{pickup.molotov,  {903.2400, -598.9313, 17.3037},  50},	--little ramp between two streets
    				{pickup.ak47,  {1061.3633, -568.3510, 16.6948},  30},		--alley north of punk noodles
    				{pickup.tec9,  {1085.6558, -693.6800, 14.9333},  30},	    --alley south-east of punk noodles 
    				{pickup.rocket_launcher,  {978.5672, -681.0534, 14.9329},  30},		--chinese market
    				{pickup.minigun,  {1008.3642, -749.9523, 14.9316},  60},		--south chinese market
	    				
    				{pickup.health,  {927.1153, -681.6978, 14.9329}},		--chinese market
					{pickup.health,  {1068.5796, -694.7872, 14.9333}},		--1st maria shop
					{pickup.health,  {883.1231, -547.7568, 14.9327}},		--chinesey buildings
					{pickup.armour,  {922.2511, -793.7344, 15.1297}},		--alley
					{pickup.armour,  {796.5292, -561.1240, 23.8231}},		--footbridge
			
			--area4	
    				{pickup.rocket_launcher,  {1624.8036, -270.0052, 23.1456},  5},		--overlooking lighthouse
    				{pickup.shotgun,  {1345.5742, -389.0824, 46.8913},  12},	--alley southeast
    				{pickup.molotov,  {1408.1510, -352.3069, 49.4392},  7},	-- behind buildings at top of cliff
    				{pickup.tec9,  {1265.9596, -297.0884, 39.8659},  50},	--near old safehouse
    				{pickup.ak47,  {1210.6884, -330.2845, 25.9959},  30},		--ma's
    				{pickup.chainsaw,  {1167.8335, -461.7343, 22.7914},  60},		--near maria's
    				{pickup.sniper,  {1306.8975, -536.9243, 47.5480},  30},		--bridge over track
    				--{pickup.det_grenade,  {1160.8082, -236.2865, 17.1449},  300},		--new safehouse
	    		
					{pickup.health,  {1355.7018, -318.2846, 49.9307}},             --leone territory
					{pickup.health,  {1180.3762, -463.2792, 24.2913}},		--ratrun
					{pickup.health,  {1274.5616, -196.3914, 33.3328}},		--north on pavement
					{pickup.armour,  {1246.5503, -388.6110, 29.0790}},		--st marks alley
					{pickup.armour,  {1410.1499, -314.3487, 49.3908}},		--clifftop

    			--area3
    				{pickup.chainsaw,  {994.5536, -471.5893, 4.7096},  60},		--subway steps
    				{pickup.shotgun,  {1090.9064, -406.1047, 14.9602},  12},	--behind ammunation
    				{pickup.grenade,  {825.7883, -426.3899, 15.6327},  10},	--middle of main road
    				{pickup.molotov,  {863.4547, -301.2214, 8.2144},  50},		--gta3 safehouse
    				{pickup.ak47,  {937.8840, -200.6623, 5.5756},  30},		--raised bit north of construction 
    				{pickup.tec9,  {952.5809, -331.0723, 9.9325},  30},		 --blue walkway
    				{pickup.sniper,  {929.7228, -399.8782, 29.0918},  14},		--top of building overlooking J.D's
    				{pickup.det_grenade,  {1017.0515, -207.6367, 12.9065},  10},		--top of ridge at bottom of hill
	    
    				{pickup.health,  {932.7903, -253.0277, 4.9237}},		--construction site
					{pickup.health,  {825.6195, -348.5254, 10.4039}},               --MOR
					{pickup.health,  {1086.7998, -228.3988, 9.3846}},               --north of ammunation
					{pickup.armour,  {1081.1232, -389.2643, 15.2532}},              --behind ammunation
					{pickup.armour,  {848.4544, -241.4469, 5.2577}},                --behind wall
			
			--area2
    				{pickup.sniper,  {1419.5056, -193.6966, 50.2434},  30},		--sal's
    				{pickup.shotgun,  {1165.9436, -148.1886, 14.9334},  12},	--south of petrol station
    				{pickup.molotov,  {1235.8333, -116.2467, 14.9326},  10},	-- autos
    				{pickup.tec9,  {1326.1029, -54.0221, 14.8431},  50},	--train yard
    				{pickup.rocket_launcher,  {1320.1128, -352.0229, 15.2435},  5},		--tunnel
    				{pickup.chainsaw,  {1225.9666, 145.4707, 9.2751},  60},		 --very north by water
    				{pickup.det_grenade,  {1173.4381, 0.8479, 0.0252},  10},		--scrapyard
    				{pickup.ak47,  {1279.8035, -179.4836, 31.7287},  30},		--behind buildings on hill
	    			
    				{pickup.health,  {1282.4351, -80.1266, 14.4190}},			--8ball's
					{pickup.health,  {1138.5503, -79.6955, 7.4335}},		--gas station
					{pickup.health,  {1139.4219, 108.4135, 1.2472}},                --junkjard
					{pickup.armour,  {1459.4512, -178.3427, 55.7397}},		--sal's
					{pickup.armour,  {1251.3943, 18.1692, 9.2759}},			--corner of wall

			--area1	
    				{pickup.sniper,  {1012.1614, -34.1731, 20.6331},  14},		--roof of head radio
    				--{pickup.rocket_launcher,  {1124.9573, 46.5368, 4.6281},  300},			--top of conveyor
    				{pickup.tec9,  {854.2657, -204.7187, 3.9226},  50},		--building north of gta3 safehouse
    				{pickup.shotgun,  {974.2974, -126.2021, 4.9593},  12},		--between buildings south of head radio
    				{pickup.det_grenade,  {1083.3535, -70.6726, 9.3526},  10},		--fire station
    				{pickup.shotgun,  {1061.5795, 121.2558, 9.2757},  30},	    --far north between containers
    				{pickup.sniper,  {849.9562, 262.3258, 1.2180},  12},		--very far north end of pier
    				{pickup.chainsaw,  {784.4633, 208.3205, 3.7091},  60},		--in front of ferry terminal
	    			
					{pickup.health,  {946.9291, -30.3201, 7.4330}},		--Head radio
					{pickup.health,  {803.0809, -174.5709, -3.9190}},		--grass by road
					{pickup.health,  {917.6138, 194.4840, 4.4738}},		--road leading to ferry port
					{pickup.armour,  {709.4316, 175.7180, 4.6584}},           --ferry
					{pickup.armour,  {889.9774, 13.2502, 24.0152}},		--train tracks
					
			--extra_ones
	    
    				{pickup.ak47,  {873.4038, 54.6747, 10.7600},  30},		--big rubbish field
    				{pickup.shotgun,  {1468.4039, -77.7275, 18.0674},  12},		--behind sal's
    				{pickup.minigun,  {1483.7692, -423.6853, 10.8379},  50},		--beach
	    			
	    			-- powerups    			
	    			{pickup.megadamage, {1022.4225, -281.6971, 11.6126}, 120}, -- quad damage - on grassy knoll next to hepburn construction
					{pickup.invisible, {1082.8711, -874.5551, 14.9610}, 120}, -- invisibility - in building near old school hall
    			}
    		
		elseif GameLocation() == 1 then		--	Staunton Island
			pickupdata = {
			
		--area1 
			{pickup.rocket_launcher,  {-18.9646, -227.3992, 29.8132},  10},		--1 stadium ent.
			{pickup.ak47,  {-166.6796, -86.5270, 16.1281},  100},		--2 pavement in front of r* sign
			{pickup.sniper,  {-114.0080, 90.2075, 23.7642},  20},		--3 top of usj
			{pickup.molotov,  {157.1552, -89.6627, 20.1317},  10},		--4 uni
			{pickup.tec9,  {86.6841, -271.0940, 16.1282},  100},		--5 edge of grass patch near stadium southeast
			{pickup.shotgun,  {85.8526, 62.0500, 16.1281},  20},		--6 edge of grass patch near stadium northeast
			{pickup.chainsaw,  {-181.6383, -229.2516, 3.0077},  10},		--7 path by water
			{pickup.grenade,  {152.6397, 244.6639, 11.6714},  10},		--8 ferries

					{pickup.health,  {8.0438, 158.2417, 10.6911}},		--north of stadium
					{pickup.health,  {131.2948, -246.9034, 16.1303}},		--NW corner of university
					{pickup.health,  {31.6541, -215.1370, 29.7573}},		--E corner of stadium entrance
					{pickup.armour,  {-302.8382, -106.0074, 1.3235}},         --jetty West of stadium
    		--area2
			{pickup.ak47,  {387.8773, -49.6129, 19.1455},  100},		--1 top of steps at ecoli
			{pickup.shotgun,  {288.5750, 14.5047, 9.2954},  20},		--2 entrance of tunnel
			{pickup.det_grenade,  {274.4805, -151.3062, 21.4009},  10},		--3 fountain
			{pickup.tec9,  {392.6464, -232.2340, 21.2863},  100},		--4 parisian backalley
			{pickup.rocket_launcher,  {539.2078, -227.7842, 22.8391},  10},		--5 top of little bridge
			{pickup.chainsaw,  {225.6796, -243.1202, 16.1354},  12},		--6 by the side of the uni
			{pickup.sniper,  {461.3714, -60.4560, 20.4013},  20},		--7 grassy knoll
			{pickup.minigun,  {311.1770, 150.6066, 6.7825},  200},		--8 pier 

					{pickup.health,  {412.2010, -15.6680, 11.5289}},		--carpark of bistro/restaurant
					{pickup.health,  {348.1933, -252.6339, 16.5619}},		--subway steps
					{pickup.armour,  {265.8773, -40.4615, 16.1780}},          --hospital carpark

		--area3
			{pickup.grenade,  {-14.5586, -445.4185, 18.6017},  10},		--1 raised walkway
			{pickup.rocket_launcher,  {53.9878, -633.2505, 28.8959},  10},		--2 island in park
			{pickup.tec9,  {183.3566, -533.9287, 26.1547},  100},		--3 path near shopping
			{pickup.shotgun,  {-45.4264, -336.1899, 16.1283},  20},		--4 middle of car park
			{pickup.sniper,  {-161.3304, -499.3698, 15.2069},  20},	    --5 end of path by water
			{pickup.shotgun,  {-73.5023, -691.5687, 15.9785},  20},		--6 under freeway, at start of ramp
			{pickup.ak47,  {127.4823, -314.6342, 16.1303},  100},		--7 uni, opposite yakuza compound
			--{pickup.flamethrower,  {129.1635, -470.2218, 15.9964},  300},		--8 gta3 safehouse

					{pickup.health,  {-1.0893, -529.9128, 26.0724}},		--on top of uncle BJs Deli (jump off helix)
					{pickup.health,  {140.1274, -646.1885, 26.1259}},		--West side of mall
					{pickup.health,  {-221.2036, -315.1253, 1.4160}},		--jetty SW of stadium
					{pickup.armour,  {66.9742, -341.7166, 16.1315}},          --inside colombian base south of stadium
					{pickup.armour,  {-76.4602, -450.7281, 16.1358}},         --tiny alley at firestation

		--area4
			{pickup.chainsaw,  {427.4810, -347.8263, 23.8034},  12},		--1 ft stunton, little park
			--{pickup.ak47,  {221.3848, -622.0241, 25.9740},  100},		--2 red walkway
			{pickup.det_grenade,  {332.9192, -361.0118, 23.1756},  10},		--3 narrow alley
			{pickup.shotgun,  {235.0777, -420.0157, 26.1547},  20},		--4 end of pointy building
			{pickup.shotgun,  {470.0943, -676.3466, 17.0943},  20},		--5 grass verge near asukas
			{pickup.sniper,  {439.4245, -656.3184, 38.2752},  20},		--6 centre of freeway
			{pickup.tec9,  {279.9217, -656.2534, 26.1426},  100},		--7 just south of multi-storey
			{pickup.molotov,  {353.2662, -585.6368, 20.5170},  10},		--8 behind multi
			{pickup.tec9,  {502.6442, -434.8127, 19.0229},  100},		--9 rocks overhanging 
			{pickup.ak47,  {416.8767, -514.0427, 26.1281},  100},		--10 mor

					{pickup.health,  {523.7003, -671.5518, 16.6312}},		--just inside swimming pool entrance
					{pickup.health,  {581.2285, -441.4650, 19.0677}},		--outcrop of land at freeway junction
					{pickup.health,  {371.2046, -435.1332, 21.0766}},		--alley north of multistorey carpark
					{pickup.armour,  {379.8510, -517.2027, 26.1213}},         --inside garage at rear of multistorey carpark

		--area5
			{pickup.ak47,  {43.2178, -879.9251, 34.1308},  100},		--1 park, south
			{pickup.molotov,  {168.6215, -998.2197, 28.1833},  10},		--2 tw@ cafe
			{pickup.sniper,  {-67.6814, -1119.9060, 26.1352},  20},	   --3 churchyard
			{pickup.grenade,  {147.1442, -757.0955, 29.1584},  10},		--4 steps of big white building
			{pickup.shotgun,  {166.5697, -1133.4026, 26.1281},  20},	--5 archway 
			{pickup.tec9,  {-50.2946, -763.0078, 26.1305},  100},		--6 doorway
			--{pickup.flamethrower,  {-63.0124, -937.1064, 15.8430},  300},		--7 under freeway
			{pickup.tec9,  {21.2991, -1125.3928, 26.0883},  100},		--8 back of church
			{pickup.shotgun,  {94.7810, -961.6431, 29.1521},  20},		--9 town hall steps

					{pickup.health,  {38.6209, -724.2225, 22.7164}},		--toilets in park
					{pickup.health,  {-48.1324, -872.9277, 16.9369}},		--under freeway, hidden around corner
					{pickup.health,  {-10.8730, -1091.0701, 27.0510}},	--narrow graveyard at north of church
					{pickup.health,  {83.3542, -991.6765, 26.6281}},		--flowerbed behind courthouse
					{pickup.health,  {166.9951, -1040.8634, 26.1339}},	--in alley south of Tw@ cafe
					{pickup.armour,  {68.8317, -773.5626, 22.8922}},          --under footbridge in park
		
		--area6
			{pickup.rocket_launcher,  {396.0922, -881.8372, 32.1495},  10},		--1 top of wal
			{pickup.tec9,  {389.0978, -1028.2582, 26.0787},  100},		--2 grass
			{pickup.ak47,  {296.8719, -1080.4738, 28.2782},  100},	--3 raised near tosh
			{pickup.tec9,  {334.8151, -813.1529, 28.3818},  100},		--4 grass next to freeway
			{pickup.chainsaw,  {211.9643, -836.0396, 24.1795},  12},		--5 rubbish grey building
			{pickup.minigun,  {244.2408, -931.1363, 30.0133},  200},		--6 bridge
			{pickup.ak47,  {449.6400, -1021.7003, 16.1156},  100},	--7 near pier 
			{pickup.molotov,  {469.3693, -846.8632, 18.1219},  10},		--8 pcj bit
			{pickup.shotgun,  {440.1427, -1170.2030, 16.4572},  20},	--9 between signs

					{pickup.health,  {333.1736, -952.1639, 33.1412}},		--next to freeway, via museum steps
					{pickup.health,  {240.8735, -1063.1118, 29.6225}},	--on steps of office block
					{pickup.health,  {502.6035, -1048.2776, 1.6752}},		--middle of jetty
					{pickup.health,  {338.6740, -734.5394, 25.6823}},		--alley next to ammunation
					{pickup.armour,  {340.3510, -1121.1010, 25.9564}},        --entrance steps of LCPD building
					{pickup.armour,  {233.7513, -809.9095, 28.3393}},         --pathway neat office block
		
		--area7
			{pickup.chainsaw,  {112.1903, -1258.2954, 26.1281},  12},	--1 dojo
			{pickup.det_grenade,  {147.3746, -1583.8622, 30.9033},  10},	--2 footbridge
			{pickup.ak47,  {-146.7106, -1548.1036, 25.9768},  100},	--3 grass bank
			{pickup.tec9,  {-171.2565, -1296.1251, 25.6634},  100},	--4 between roads
			{pickup.shotgun,  {19.4487, -1305.6299, 25.4370},  20},		--5 water feature
			{pickup.minigun,  {110.7564, -1457.8505, 32.1357},  200},		--6 wall of big white building
			{pickup.molotov,  {-112.7039, -1398.3604, 26.1041},  10},	--7 liberty tree, north ent.
			{pickup.tec9,  {22.2295, -1515.5632, 26.0690},  100},		--8 liberty tree, east ent.

					{pickup.health,  {3.7249, -1320.5448, 28.9841}},		--entrance to gallery
					{pickup.health,  {111.5237, -1232.6802, 26.1281}},	--alley at teyaku dojo
					{pickup.health,  {-240.4522, -1400.8868, 10.9768}},	--pathway leading to jetty, SW of island
					{pickup.health,  {74.5476, -1595.2391, 28.3410}},		--flowerbed of officeblock west of donald love building
					{pickup.health,  {-5.2605, -1446.3555, 26.0997}},		--alleyway leading to car park to the west of love building
					{pickup.armour,  {19.4366, -1240.2572, 27.7909}},         --corner of white building north of gallery
					{pickup.armour,  {-184.7864, -1230.4316, 17.9272}},       --on ledge of underpass near gallery

		--area8
			{pickup.grenade,  {322.8639, -1229.9548, 28.6629},  10},	--1 pyramid
			{pickup.rocket_launcher,  {312.0387, -1534.5155, 39.7277},  10},	--2 morning star
			{pickup.sniper,  {436.7471, -1389.0802, 29.9038},  20},	--3 casino steps
			{pickup.ak47,  {395.1092, -1530.8867, 17.2016},  100},		--4 grass
			{pickup.chainsaw,  {507.6279, -1379.7787, 25.9270},  12},	--5 behind casino
			{pickup.tec9,  {200.4206, -1285.0986, 26.1281},  100},	--6 corner
			{pickup.shotgun,  {319.4207, -1356.6794, 26.8735},  20},	--7 tosh
			{pickup.molotov,  {240.5015, -1413.0853, 26.1282},  10},	--8 filler

					{pickup.health,  {218.4009, -1507.7183, 27.3755}},	--entrance of donald loves building
					{pickup.health,  {244.7295, -1207.9480, 20.4144}},	--underground carpark of AMCO building
					{pickup.health,  {359.8225, -1317.5646, 26.2112}},	--carpark east of casino
					{pickup.health,  {401.3023, -1605.9877, 25.9740}},	--grass cliff-edge SW of casino
					{pickup.health,  {507.8522, -1365.5096, 25.9269}},	--by casino spotlights
					{pickup.armour,  {296.8474, -1359.1641, 28.2782}},        --grass in central reservation outside Toshiko's apartment
					{pickup.armour,  {419.1234, -1464.9121, 26.1729}},        --at top of steps to casino carpark
			
  			-- powerups    			
			{pickup.killfrenzy, {-141.5010, -105.9569, 16.1281}, 120}, -- killfrenzy - behind stadium billboards
			{pickup.megadamage, {263.9221, -931.2843, 31.9245}, 120},  -- quad damage - road onto callahan bridge
		
		}
		
		else				--	Shoreside Vale

		pickupdata = {
		
		--area1

		{pickup.grenade,  {-1178.9146, 335.7963, 31.7777},  10},		--1 vent on roof of building, under dam
		{pickup.tec9,  {-1249.5565, 160.6126, 68.6709},  100},		--2 entrance to undercover storage
		{pickup.ak47,  {-1068.1783, 156.8197, 59.0778},  100},		--3 hill
		{pickup.ak47,  {-1108.8717, 533.3457, 68.5363},  10},		--4 right dam pod
		{pickup.shotgun,  {-1184.1217, 498.5787, 68.5415},  20},		--5 left dam pod
		{pickup.rocket_launcher,  {-1035.6367, 455.5263, 23.5578},  100},		--6 under dam
		{pickup.tec9,  {-950.2345, 310.7479, 33.7339},  100},		--7 path at upper dam
		{pickup.chainsaw,  {-621.5113, 370.1580, 77.7677},  10},		--8 rocky patch above posh houses
		{pickup.shotgun,  {-1172.0604, 277.0716, 3.5321},  20},		--9 between boulders
		{pickup.ak47,  {-1035.1123, 227.9059, 3.6750},  100},		--10 by water
		{pickup.det_grenade,  {-806.8631, 348.7738, 52.1446},  10},		--11 safehouse
		{pickup.molotov,  {-1281.8588, 270.5881, 66.9462},  10},		--12 dam, front of sign
		{pickup.ak47,  {-907.0657, 505.7512, 63.3359},  100},		--13 grass
		{pickup.shotgun,  {-624.6401, 622.5327, 78.2558},  20},		--14 tunnel1
		{pickup.rocket_launcher,  {-329.4771, 507.2226, 88.5111},  10},		--15 tunnel2
		{pickup.sniper,  {-989.9016, 246.1893, 38.0991},  20},		--16 pointy rock (sniper)

				{pickup.health,  {-1196.0145, 360.7970, 31.0024}},	--on top of pumping building at lower dam
				{pickup.health,  {-982.9041, 489.1714, 69.2396}},		--grass east of upper dam
				{pickup.health,  {-683.0677, 623.7474, 78.2548}},		--middle of tunnel east of dam
				{pickup.health,  {-952.3976, 270.6275, 33.7117}},		--grass in bend in road
				{pickup.health,  {-1138.7020, 244.8181, 3.3991}},		--middle of grass to the south of lower dam
				{pickup.health,  {-1123.9177, 146.9966, 58.7213}},	--between 'wee-fan' warehouses
				{pickup.health,  {-1246.8558, 131.4639, 68.5468}},	--inside entrance to undercover storage company warehouse
				{pickup.armour,  {-1315.8434, 294.3044, 70.0519}},	--grass to west of upper dam
				{pickup.armour,  {-864.2217, 259.6947, 41.0782}},		--pool of shoreside safehouse
				{pickup.armour,  {-983.3112, 164.9747, 3.7639}},		--rock outcrop near bridge

		--area2

		{pickup.ak47,  {-1305.9211, -201.3007, 57.5757},  100},		--1 hill
		{pickup.shotgun,  {-1104.5039, -82.9808, 43.7951},  20},		--2 bottom of steps at AM
		{pickup.molotov,  {-994.8559, 19.0871, 47.7030},  10},		--3 another hill
		{pickup.det_grenade,  {-902.9615, 175.5488, 48.8213},  10},		--4 bridge1
		{pickup.det_grenade,  {-984.1099, 110.8421, 48.8213},  10},		--5 bridge2
		{pickup.chainsaw,  {-1169.9432, 88.4637, 58.8166},  10},		--6 near pay n spray
		{pickup.grenade,  {-1256.7976, 3.8911, 63.8212},  10},		--7 corner
		{pickup.rocket_launcher,  {-668.1377, -250.9123, 22.6908},  10},		--8 near busted bridge
		{pickup.tec9,  {-1192.7335, -176.3369, 44.1278},  100},		--9 side of crap building
		{pickup.tec9,  {-921.8276, -116.0754, 33.9540},  100},		--10 between billboards
		{pickup.molotov,  {-922.4296, -301.4371, 33.6749},  10},		--11 also between billboards
		{pickup.ak47,  {-791.9249, -252.9316, 22.3993},  100},		--12 trees
		{pickup.chainsaw,  {-987.8137, -202.3344, 33.8258},  10},		--13 flop house
		{pickup.minigun,  {-891.9738, -15.0054, 4.3080},  200},		--14 next to water
		{pickup.sniper,  {-802.6744, -119.1191, 36.4339},  20},		--15 pointy rock (sniper)
		{pickup.shotgun,  {-700.5819, -338.8854, 18.8206},  20},		--16 grass (extra one)
		{pickup.sniper,  {-1243.7849, -370.3406, 62.8267},  20},		--17 middle of nowhere (airport sniping spot)

				{pickup.health,  {-1308.2848, 67.2151, 69.9911}},		--top of hill to north-west of police station
				{pickup.health,  {-977.5160, -10.9610, 45.4835}},		--edge of cliff east of liberty pharmaceuticals
				{pickup.health,  {-847.5316, -156.4884, 33.8156}},	--north entrance of turtlehead warehouse
				{pickup.health,  {-785.8389, -178.2265, 27.0342}},	--grass east of turtlehead warehouse
				{pickup.health,  {-669.4155, -249.6792, 22.4053}},	--rock near collapsed wood bridge jump
				{pickup.health,  {-1125.2697, -272.2292, 55.1123}},	--grass hil north of airport
				{pickup.health,  {-1277.0243, -204.3907, 59.6565}},	--south east corner of hospital
				{pickup.health,  {-1088.2889, -30.9559, 48.8236}},	--entrance to liberty pharmaceuticals
				{pickup.armour,  {-961.0096, -183.9636, 48.8083}},	--on top of turtlehead warehouse (SW corner)
				{pickup.armour,  {-1170.2101, -41.2273, 63.1324}},	-- top of vent on garages east of police station

		--area3

		{pickup.sniper,  {-725.0923, 53.8323, 20.1161},  20},		--1 usj on top of tunnel
		{pickup.ak47,  {-254.9323, 380.3705, 83.2303},  100},		--2 hill
		{pickup.shotgun,  {-396.6440, 211.0263, 63.3694},  20},		--3 cartel mansion
		{pickup.molotov,  {-490.9164, 284.1248, 74.1127},  10},		--4 posh white house
		{pickup.minigun,  {-227.5913, 331.3380, 3.4584},  200},		--5 park
		{pickup.ak47,  {-455.6807, -21.9207, 3.8213},  100},		--6 projects doorway
		{pickup.minigun,  {-591.9163, -78.0835, 5.1024},  200},		--7 projects behind sign
		{pickup.tec9,  {-556.5086, 57.8378, 3.8213},  100},		--8 proj. front of garage
		{pickup.chainsaw,  {-656.8580, -38.2457, 18.8226},  10},		--9 gta3 safehouse front of garage
		{pickup.shotgun,  {-588.1567, 116.6647, 18.2485},  20},		--10 trees
		{pickup.molotov,  {-423.1866, -144.4195, 7.2921},  10},		--11 just south of proj.
		{pickup.shotgun,  {-408.2195, 87.5390, 3.7254},  20},		--12 ent. picnic area
		{pickup.tec9,  {-528.8318, -240.9129, 3.9222},  100},		--13 behind wall
		{pickup.rocket_launcher,  {-762.0179, -91.6711, 3.0751},  10},		--14 right by the water
		{pickup.shotgun,  {-809.3438, 126.2594, 26.2036},  20},		--15 under bridge
		{pickup.grenade,  {-778.6487, 204.3694, 28.7664},  10},		--16 car park
		{pickup.ak47,  {-535.7486, 189.3272, 46.0075},  100},		--17 wiggly road
		{pickup.tec9,  {-634.8486, 250.3076, 60.5297},  100},		--18 front lawn

				{pickup.health,  {-677.3319, 205.5225, 53.8198}},		--corner of cliffside road south of mansions
				{pickup.health,  {-616.1229, 285.4514, 65.1468}},		--porch of middle mansion
				{pickup.health,  {-402.7343, 366.9131, 90.2975}},		--bottom of cliff north of mansions
				{pickup.health,  {-231.1376, 191.1937, 12.2247}},		--hill south of dirt-track carpark
				{pickup.health,  {-465.5269, 54.4311, 3.8213}},		--north east entrance of apartment block
				{pickup.health,  {-667.3107, 104.6015, 18.9694}},		--bottom of cliffside road
				{pickup.health,  {-554.1663, -73.3393, 3.8213}},		--behind billboard south west of apartment block
				{pickup.health,  {-495.2516, -188.3703, 1.6884}},		--grass at waters-edge at corner of road
				{pickup.health,  {-634.9911, -120.1295, 6.2981}},		--hill near road south of apartment block
				{pickup.armour,  {-294.3105, 266.0922, 67.1938}},		--edge of cliff east of mansions
				{pickup.armour,  {-411.1188, 20.8521, 3.8725}},		--behind billboards east of apartment block
				{pickup.armour,  {-732.6067, 47.5126, 3.6070}},		--entrance to tunnel under apartment block

		--area4

		{pickup.ak47,  {-1542.1121, -946.6136, 14.4772},  100},		--1 helipad
		{pickup.tec9,  {-1614.7549, -782.5118, 12.6235},  100},		--2 ledge, corner
		{pickup.rocket_launcher,  {-1342.9647, -835.3528, 18.4852},  10},		--3 hanger roof
		{pickup.molotov,  {-1410.8899, -1063.6525, 10.8095},  10},		--4 slanted runway
		{pickup.shotgun,  {-1097.3091, -852.4142, 11.0766},  20},		--5 between ramps
		{pickup.det_grenade,  {-1173.0283, -668.4009, 13.7275},  10},		--6 wing of plane
		{pickup.grenade,  {-1305.8170, -537.5673, 11.0766},  10},		--7 n/w hanger
		{pickup.sniper,  {-1427.5117, -609.5578, 19.0872},  20},		--8 grassy mound
		{pickup.minigun,  {-1087.1561, -571.8889, 20.3599},  200},		--9 platform - jump up steps
		{pickup.ak47,  {-1033.2089, -447.6659, 11.0781},  100},		--10 path, ent
		{pickup.chainsaw,  {-1065.4889, -1175.5314, 10.7999},  10},		--11 slanted runway2
		{pickup.det_grenade,  {-1193.6815, -1039.8694, 3.4423},  10},		--12 lower bit

				{pickup.health,  {-1111.7230, -505.8408, 10.8749}},	--just inside hangar near access road
				{pickup.health,  {-1102.4868, -655.6399, 14.2318}},	--on top of steps west of terminal
				{pickup.health,  {-1353.4780, -523.0536, 11.0766}},	--beside north-western hanger
				{pickup.health,  {-1269.3074, -713.2909, 14.3733}},	--on top of steps near small terminal
				{pickup.health,  {-1485.5513, -782.5019, 12.6235}},	--on wall on west side of airstrip
				{pickup.health,  {-1495.0115, -1063.3479, 3.4429}},	--on seaward ledge at south western part of airstrip
				{pickup.health,  {-1012.8546, -1224.5356, 10.8095}},	--at end of diagonal runway
				{pickup.health,  {-1008.8545, -949.3159, 11.1549}},	--on grass halfway along runway
				{pickup.health,  {-1282.8481, -901.1232, 11.0779}},	--on west part of runway
				{pickup.armour,  {-1127.4115, -766.7277, 11.0766}},	--under plane wing south of terminal
				{pickup.armour,  {-1554.5155, -908.9347, 14.4785}},	--on helipad

		--area5

		{pickup.tec9,  {-655.7507, -399.9820, 18.6087},  100},		--1 m.o.r
		{pickup.chainsaw,  {-631.0912, -718.1263, 18.9172},  10},		--2 water next to statue
		{pickup.det_grenade,  {-632.5631, -498.2050, 23.3845},  10},		--3 top of tunnel ent.
		{pickup.ak47,  {-750.7540, -520.3548, 10.0086},  100},		--4 terminal steps
		{pickup.molotov,  {-839.3370, -458.4833, 11.0778},  10},		--5 fire station
		{pickup.grenade,  {-748.5740, -422.2263, 9.4086},  10},		--6 behind love-fist sign (small)
		{pickup.shotgun,  {-849.7783, -649.5356, 13.8124},  20},		--7 top of container
		{pickup.tec9,  {-549.4403, -971.5536, 10.8012},  100},		--8 end of runway
		{pickup.ak47,  {-821.1240, -925.7550, 11.0741},  100},		--9 another runway
		{pickup.grenade,  {-928.8517, -750.6072, 11.0779},  10},		--10 hanger, between containers
		{pickup.rocket_launcher,  {-769.9731, -751.7317, 19.2258},  10},		--11 ledge around terminal

				{pickup.health,  {-955.2161, -752.0958, 11.0751}},	--between cargo containers south of terminal
				{pickup.health,  {-505.6645, -935.3997, 11.8037}},	--at end of horizontal runway (lower)
				{pickup.health,  {-763.9592, -879.5562, 11.0759}},	--at end of horizontal runway (upper)
				{pickup.health,  {-852.4181, -715.1934, 10.8059}},	--south east corner of terminal compound
				{pickup.health,  {-840.6257, -470.1930, 11.0744}},	--corner of airport fireengine garage
				{pickup.health,  {-679.5853, -776.7424, 18.8586}},	--corner of subway entrance plaza
				{pickup.health,  {-655.3177, -524.1627, 22.8663}},	--center of freeway between tunnel exits
				{pickup.health,  {-680.0857, -394.8276, 18.7662}},	--behind billboard on approach to airport
				{pickup.armour,  {-758.7523, -1054.6404, 7.3285}},	--on seaward ledge south of terminal
				{pickup.armour,  {-965.5682, -456.2681, 11.0766}},	--between cargo containers at north of terminal compound
				{pickup.armour,  {-539.5904, -629.7623, 13.5276}},	--under bridge
		
  		-- powerups    			
		{pickup.regenhealth, {-441.5010, -105.9569, 16.1281}, 120}, -- regeneration - near gta3 safehouse garage
		{pickup.megadamage, {-639.6958, -26.4413, 18.8226}, 120}, -- quad damage - outside mr benz
		}

    		end
	    	          	       
	    --andyg... TODO: remove or switch any powerups from the list depending on game type 
	    --andyg...  hopfully it should look something like this...
	    --self:SwitchPickupTypeForAnother(pickup.rocket_launcher,pickup.glock17)
	    
	    --add any pickups in depending on game type, e.game. race pickups
	    if GameType() == 1 then
			if UseRacePowerups() then
				self:AddRacePickups()
			end
	    else 	    	    	          
			for _,args in ipairs(pickupdata) do
				table.insert(self.pickups, CreatePickup(unpack(args)))
			end
		end
		
		-- Defend the base pickups are created as well as standard pickups 
	    if GameType() == 2 then
			self:AddDTBPickups()
		--as are CTF base pickups
		elseif GameType() == 3 then
			self:AddCTFPickups()
		end
	    
    end
    
    self.pickupBlipScript = PickupBlipScript{}:Start(90)

end


--adds the uniquie race pickups to the game
function PickupMgr:AddRacePickups()

	--only create the pickup on the srver machine
	if IsServer() then
	
		local pickupdata = {}
		
		if GameLocation() == 0 then					--	Portland
			if RaceId() == 0 then
				pickupdata = {
				{pickup.racegood,  {819.0, -925.0, 8},  60},
    				{pickup.racebad,  {1038.0, -184.0, 5},  60},	
    				{pickup.racegood,  {807.0, -318.0, 7},  60},
    				{pickup.racebad,  {835.0, -748.0, 15},  60},
				{pickup.racegood,  {1253.0, -208.0, 29},  60},
    				{pickup.racebad,  {1365.0, -352.0, 50},  60},
    				{pickup.racegood,  {1231.0, -636.0, 20},  60},
    				{pickup.racebad,  {1325.0, -1039.0, 15},  60}}							
    		elseif RaceId() == 1 then 
				pickupdata = {
				{pickup.racegood,  {1135.0, -348.0, 20},  60},
				{pickup.racebad,  {1103.0, -30.0, 7},  60},
				{pickup.racegood,  {905.0, -273.0, 15},  60},
				{pickup.racebad,  {835.0, -554.0, 1},  60},
				{pickup.racegood,  {932.0, -611.0, 15},  60},
				{pickup.racebad,  {977.0, -759.0, 15},  60},
				{pickup.racegood,  {912.0, -1030.0, 8},  60},
				{pickup.racebad,  {1150.0, -1099.0, 12},  60},
				{pickup.racegood,  {1174.0, -1044.0, 15},  60},
				{pickup.racebad,  {1276.0, -892.0, 15},  60},
				{pickup.racegood,  {1144.0, -739.0, 15},  60}}
    		elseif RaceId() == 2 then
				pickupdata = {
				{pickup.racegood,  {825.0, -283.0, 5},  60},
				{pickup.racebad,  {1004.0, -281.0, 5},  60},
				{pickup.racegood,  {1063.0, -457.0, 15},  60},
				{pickup.racebad,  {934.0, -611.0, 15},  60},
				{pickup.racebad,  {1034.0, -778.0, 15},  60},
				{pickup.racegood,  {1139.0, -747.0, 15},  60},
				{pickup.racebad,  {1007.0, -632.0, 15},  60}}
    		elseif RaceId() == 3 then
				pickupdata = {
				{pickup.racegood,  {1066.0, -674.0, 15},  60},
				{pickup.racebad,  {1062.0, -460.0, 15},  60},
				{pickup.racegood,  {809.0, -211.0, -0},  60},
				{pickup.racebad,  {1085.0, -128.0, 9},  60},
				{pickup.racegood,  {1059.0, 0.0, 2},  60},
				{pickup.racebad,  {826.0, -300.0, 5},  60},
				{pickup.racegood,  {826.0, -480.0, 15},  60},
				{pickup.racebad,  {927.0, -479.0, 15},  60},
				{pickup.racegood,  {895.0, -574.0, 15},  60},
				{pickup.racebad,  {825.0, -622.0, 15},  60},
				{pickup.racegood,  {934.0, -611.0, 15},  60},
				{pickup.racebad,  {1166.0, -720.0, 15},  60},
				{pickup.racegood,  {1288.0, -939.0, 15},  60},
				{pickup.racebad,  {1135.0, -963.0, 15},  60}}
 			elseif RaceId() == 4 then
				pickupdata = {
				{pickup.racebad,  {1118.0, -820.0, 15},  60},
				{pickup.racegood,  {957.0, -825.0, 15},  60},
				{pickup.racebad,  {900.0, -742.0, 15},  60},
				{pickup.racegood,  {824.0, -604.0, 15},  60},
				{pickup.racebad,  {920.0, -568.0, 15},  60},
				{pickup.racegood,  {1050.0, -623.0, 15},  60}}
    		elseif RaceId() == 5 then
				pickupdata = {
				{pickup.racegood,  {1039.0, -919.0, 15},  60},
				{pickup.racebad,  {1136.0, -962.0, 15},  60},
				{pickup.racegood,  {1340.0, -995.0, 15},  60},
				{pickup.racebad,  {1105.0, -1060.0, 15},  60},
				{pickup.racegood,  {807.0, -960.0, 5},  60},
				{pickup.racebad,  {835.0, -686.0, 15},  60},
				{pickup.racegood,  {1051.0, -632.0, 15},  60}}
    		elseif RaceId() == 6 then
				pickupdata = {
				{pickup.racegood,  {1120.0, -321.0, 20},  60},
				{pickup.racebad,  {1132.0, -208.0, 15},  60},
				{pickup.racegood,  {1015.0, 5.0, 2},  60},
				{pickup.racebad,  {851.0, -149.0, 5},  60},
				{pickup.racegood,  {871.0, -273.0, 5},  60},
				{pickup.racebad,  {981.0, -333.0, 10},  60},
				{pickup.racegood,  {995.0, -41.0, 15},  60},
				{pickup.racebad,  {1033.0, -476.0, 15},  60}}
    		elseif RaceId() == 7 then
				pickupdata = {
				{pickup.racegood,  {857.0, -499.0, 15},  60},
				{pickup.racebad,  {835.0, -330.0, 8},  60},
				{pickup.racegood,  {912.0, -84.0, -2},  60},
				{pickup.racebad,  {1041.0, -169.0, 5},  60},
				{pickup.racegood,  {1157.0, -203.0, 19},  60},
				{pickup.racebad,  {1189.0, -256.0, 25},  60},
				{pickup.racegood,  {1288.0, -327.0, 40},  60},
				{pickup.racebad,  {1145.0, -421.0, 21},  60},
				{pickup.racegood,  {1126.0, -472.0, 20},  60}}
    		end
		elseif GameLocation() == 1 then				--	Staunton Island
			if RaceId() == 0 then 
				pickupdata = {
				{pickup.racebad,  {20.0, -924.0, 26},  60},
				{pickup.racegood,  {-59.0, -691.0, 17},  60},
				{pickup.racebad,  {-92.0, -465.0, 16},  60},
				{pickup.racegood,  {70.0, -247.0, 17},  60},
				{pickup.racebad,  {464.0, -267.0, 21},  60},
				{pickup.racegood,  {296.0, -394.0, 25},  60},
				{pickup.racebad,  {370.0, -151.0, 21},  60},
				{pickup.racegood,  {179.0, -507.0, 27}, 60}}
    		elseif RaceId() == 1 then
				pickupdata = {
				{pickup.racegood,  {-18, -477.0, 19},  60},
				{pickup.racebad,  {-51.0, -293.0, 16},  60},
				{pickup.racegood,  {-77.0, 76.0, 16},  60},
				{pickup.racebad,  {91.0, -17.0, 16},  60},
				{pickup.racegood,  {256.0, -151.0, 21},  60},
				{pickup.racebad,  {373.0, -394.0, 21},  60},
				{pickup.racegood,  {303.0, -690.0, 26},  60},
				{pickup.racebad,  {155.0, -905.0, 26},  60}}
    		elseif RaceId() == 2 then
				pickupdata = {
				{pickup.racegood,  {536.0, -1388.0, 16},  60},
				{pickup.racebad,  {413.0, -1303.0, 26},  60},
				{pickup.racegood,  {170.0, -11.0, 26},  60},
				{pickup.racebad,  {143.0, -979.0, 26},  60},
				{pickup.racegood,  {256.0, -523.0, 26},  60},
				{pickup.racebad,  {106.0, -300.0, 16},  60},
				{pickup.racegood,  {257.0, -122.0, 21},  60},
				{pickup.racebad,  {328.0, -262.0, 21},  60},
				{pickup.racegood,  {440.0, -388.0, 21},  60},
				{pickup.racebad,  {417.0, -667.0, 26},  60}}
    		elseif RaceId() == 3 then
				pickupdata = {
				{pickup.racegood,  {-173.0, -74.0, 16},  60},
				{pickup.racebad,  {100.0, -140.0, 16},  60},
				{pickup.racegood,  {252.0, -284.0, 24},  60},
				{pickup.racebad,  {332.0, -325.0, 23},  60},
				{pickup.racegood,  {251.0, -525.0, 26},  60},
				{pickup.racebad,  {191.0, -61.0, 26},  60},
				{pickup.racegood,  {84.0, -541.0, 26},  60}}
 			elseif RaceId() == 4 then
				pickupdata = {
				{pickup.racegood,  {127.0, -853.0, 26},  60},
				{pickup.racebad,  {32.0, -1051.0, 26},  60},
				{pickup.racegood,  {-147.0, -1309.0, 26},  60},
				{pickup.racebad,  {42.0, -1471.0, 26},  60},
				{pickup.racegood,  {21.0, -1594.0, 26},  60},
				{pickup.racebad,  {186.0, -1396.0, 26},  60},
				{pickup.racegood,  {275.0, -1271.0, 26},  60},
				{pickup.racebad,  {479.0, -595.0, 36},  60},
				{pickup.racegood,  {297.0, -399.0, 25},  60}}
    		elseif RaceId() == 5 then
				pickupdata = {
				{pickup.racegood,  {94.0, -938.0, 26},  60},
				{pickup.racebad,  {146.0, -1141.0, 26},  60},
				{pickup.racegood,  {131.0, -1364.0, 26},  60},
				{pickup.racebad,  {349.0, -1400.0, 26},  60},
				{pickup.racegood,  {274.0, -1180.0, 26},  60},
				{pickup.racebad,  {-49.0, -1013.0, 26},  60},
				{pickup.racegood,  {-138.0, -1159.0, 26},  60},
				{pickup.racebad,  {-165.0, -1352.0, 26},  60},
				{pickup.racegood,  {-143.0, -1543.0, 26},  60}}
    		elseif RaceId() == 6 then
				pickupdata = {
				{pickup.racegood,  {376.0, -898.0, 25},  60},
				{pickup.racebad,  {287.0, -1112.0, 26},  60},
				{pickup.racegood,  {192.0, -1269.0, 26},  60},
				{pickup.racebad,  {128.0, -131.0, 26},  60},
				{pickup.racegood,  {-44.0, -1371.0, 26},  60},
				{pickup.racebad,  {-181.0, -1458.0, 26},  60},
				{pickup.racegood,  {36.0, -1529.0, 26},  60},
				{pickup.racebad,  {160.0, -1588.0, 26},  60},
				{pickup.racegood,  {319.0, -1535.0, 24},  60},
				{pickup.racebad,  {348.0, -1396.0, 26},  60},
				{pickup.racegood,  {401.0, -1237.0, 26},  60}}
    		elseif RaceId() == 7 then
				pickupdata = {
				{pickup.racegood,  {-72.0, -865.0, 26},  60},
				{pickup.racebad,  {89.0, -951.0, 26},  60},
				{pickup.racegood,  {164.0, -806.0, 26},  60},
				{pickup.racebad,  {188.0, -696.0, 26},  60},
				{pickup.racegood,  {192.0, -621.0, 26},  60},
				{pickup.racebad,  {136.0, -541.0, 26},  60},
				{pickup.racegood,  {-12.0, -582.0, 22},  60}}
    		end
		elseif GameLocation() == 2 then				--	Shoreside
			if RaceId() == 0 then 
				pickupdata = {
				{pickup.racebad,  {-433.0, 222.0, 68},  60},
				{pickup.racegood,  {-519.0, 365.0, 79},  60},
				{pickup.racebad,  {-885.0, 452.0, 52},  60},
				{pickup.racegood,  {-1244.0, 382.0, 69},  60},
				{pickup.racebad,  {-1259.0, 93.0, 69},  60},
				{pickup.racegood,  {-1289.0, -115.0, 59},  60},
				{pickup.racebad,  {-1256.0, -214.0, 52},  60},
				{pickup.racegood,  {-894.0, -226.0, 30},  60},
				{pickup.racebad,  {-973.0, -130.0, 34},  60},
				{pickup.racebad,  {-1133.0, -61.0, 49},  60},
				{pickup.racegood,  {-1056.0, 92.0, 49},  60}}
    		elseif RaceId() == 1 then
				pickupdata = {
				{pickup.racebad,  {-1280.0, -12.0, 62},  60},
				{pickup.racegood,  {-1233.0, -217.0, 50},  60},
				{pickup.racebad,  {-997.0, -236.0, 34},  60},
				{pickup.racegood,  {-755.0, -283.0, 19},  60},
				{pickup.racebad,  {-611.0, -191.0, -29},  60},
				{pickup.racegood,  {-607.0, 95.0, -14},  60},
				{pickup.racebad,  {-905.0, 319.0, 35},  60},
				{pickup.racegood,  {-1173.0, 486.0, 68},  60}}
    		elseif RaceId() == 2 then
				pickupdata = {
				{pickup.racegood,  {-550.0, 222.0, 64},  60},
				{pickup.racebad,  {-288.0, 316.0, 73},  60},
				{pickup.racegood,  {-485.0, 583.0, 78},  60},
				{pickup.racebad,  {-940.0, 530.0, 67},  60},
				{pickup.racegood,  {-1238.0, 376.0, 68},  60},
				{pickup.racebad,  {-1141.0, 179.0, 59},  60},
				{pickup.racegood,  {-995.0, 122.0, 49},  60}}
    		elseif RaceId() == 3 then
				pickupdata = {
				{pickup.racegood,  {-1121.0, 165.0, 59},  60},
				{pickup.racebad,  {-1246.0, -223.0, 51},  60},
				{pickup.racegood,  {-975.0, -177.0, 34},  60},
				{pickup.racegood,  {-992.0, -38.0, 40},  60}}
 			elseif RaceId() == 4 then
				pickupdata = {
				{pickup.racegood,  {-991.0, -34.0, 40},  60},
				{pickup.racebad,  {-1067.0, 92.0, 49},  60},
				{pickup.racegood,  {-1092.0, -152.0, 44},  60},
				{pickup.racebad,  {-870.0, -234.0, 29},  60},
				{pickup.racegood,  {-863.0, -120.0, 34},  60},
				{pickup.racebad,  {-992.0, 107.0, 14},  60},
				{pickup.racegood,  {-1107.0, 212.0, 4},  60}}
    		elseif RaceId() == 5 then
				pickupdata = {
				{pickup.racegood,  {-787.0, 164.0, 14},  60},
				{pickup.racebad,  {-654.0, -153.0, 4},  60},
				{pickup.racegood,  {-449.0, -175.0, 4},  60},
				{pickup.racebad,  {-582.0, -32.0, 4},  60},
				{pickup.racegood,  {-605.0, 27.0, 19},  60},
				{pickup.racebad,  {-772.0, 140.0, 29},  60},
				{pickup.racegood,  {-573.0, 175.0, 44},  60},
				{pickup.racebad,  {-581.0, 228.0, 61},  60},
				{pickup.racegood,  {-287.0, 317.0, 74},  60},
				{pickup.racebad,  {-439.0, 540.0, 82},  60},
				{pickup.racegood,  {-723.0, 639.0, 78},  60}}
    		elseif RaceId() == 6 then
				pickupdata = {
				{pickup.racegood,  {-977.0, -166.0, 34},  60},
				{pickup.racebad,  {-914.0, -127.0, 34},  60},
				{pickup.racegood,  {-1117.0, -83.0, 47},  60},
				{pickup.racebad,  {-1268.0, 67.0, 68},  60},
				{pickup.racegood,  {-1129.0, 172.0, 58},  60}}
    		elseif RaceId() == 7 then
				pickupdata = {
				{pickup.racegood,  {-995.0, 122.0, 49},  60},
				{pickup.racebad,  {-974.0, -138.0, 34},  60},
				{pickup.racegood,  {-752.0, -284.0, 19},  60},
				{pickup.racebad,  {-590.0, -375.0, -12},  60},
				{pickup.racegood,  {-414.0, 25.0, -22},  60},
				{pickup.racebad,  {-548.0, 147.0, -22},  60},
				{pickup.racegood,  {-841.0, 203.0, 22},  60},
				{pickup.racebad,  {-708.0, 354.0, 69},  60},
				{pickup.racegood,  {-544.0, 369.0, 78},  60},
				{pickup.racebad,  {-314.0, 263.0, 63},  60},
				{pickup.racegood,  {-569.0, 231.0, 62},  60}}	
    		end		  
		end
		
		-- actually create the pickups
		for _,args in ipairs(pickupdata) do
			table.insert(self.pickups, CreatePickup(unpack(args)))
		end
	end
end


function PickupMgr:AddDTBPickups()
	--only create the pickup on the srver machine
	if IsServer() then

		local pickupdata = {}	

		if GameLocation() == 0 then						--	Portland
			pickupdata = {			
								
				{pickup.tec9, {1228.0414, -135.8676, 14.9326}, 50},		-- inside car showroom
				{pickup.shotgun, {1253.1915, -87.7361, 14.7690}, 12},	-- near bomb garage
				{pickup.det_grenade, {1320.0925, -295.6476, 15.2436}, 3},	-- inside tunnel
				{pickup.glock17, {1208.6989, -141.8298, 14.9326}, 50},	-- in corner of compound just outside the main showroom
				{pickup.ak47, {1254.3368, -56.8413, 10.2011}, 50},		-- at gate leading to bombshop
				{pickup.tec9, {1142.7616, -104.7277, 7.4335}, 50},-- inside petrol station
				{pickup.det_grenade, {1155.3582, -189.5768, 14.9334}, 3},-- in dead end of block/building next to petrol station
				{pickup.ak47, {1069.6420, -27.6567, 7.4525}, 50},		-- corner of fire station near bridge
				{pickup.glock17, {1142.0704, 110.0923, 0.4439}, 50},	-- Inside scrap yard near car crusher
				{pickup.molotov, {1319.9995, -85.2223, 15.0627}, 5},	-- In train yard at bombshop
				{pickup.tec9, {1380.0582, -868.4446, 11.7834}, 50},		-- weapon at docks
				{pickup.det_grenade, {1400.5625, -835.5011, 11.7915}, 3},	-- weapon at docks
				{pickup.ak47, {1331.8387, -828.0793, 14.9858}, 50},		-- weapon just outside the docks across road
				{pickup.tec9, {1364.1409, -761.0011, 14.6399}, 50},		-- Weapon in dock in alleyway leading to supasave				
				
				-- Power ups
				{pickup.invisible, {1004.3003, -65.4076, 20.6257}, 120},  -- Invisability  - on radio station rooftop - requires player to get to it by using the railway track
				{pickup.regenhealth, {968.4836, -280.2070, 4.8816}, 120}}   -- Re-generation - In worksite at hepburn heights
				
				
		elseif GameLocation() == 1 then					--	Staunton Island
			pickupdata = {	
				-- Weapons
				-- carpark first Top Floor
				{pickup.rocket_launcher, {271.9741, -608.0781, 38.0891}, 5},	-- Rocket Launcher
				{pickup.shotgun, {270.2513, -483.1662, 36.2340}, 12},	-- Shotgun
				{pickup.glock17, {343.0322, -483.2989, 33.8327}, 50},	-- Glock17
				{pickup.molotov, {342.5708, -607.2725, 33.8327}, 5},	-- Molotov
				 
				-- carpark - next floor down
				{pickup.ak47, {269.0379, -606.4355, 31.4314}, 50},		-- AK47
				{pickup.glock17, {302.0450, -606.5057, 31.4314}, 50},	-- Glock17
				{pickup.grenade, {303.6243, -484.9482, 31.4314}, 3},	-- Grenade
				{pickup.tec9, {268.6298, -481.6583, 31.4314}, 50},		-- Tec9
				 
				-- outside but nearish base
				{pickup.det_grenade, {380.1846, -577.1170, 26.1359}, 3},-- det_grenades - inside bomb garage
				{pickup.ak47, {216.4322, -629.4075, 26.1275}, 50},		-- AK47 - Shopping mall
				{pickup.shotgun, {189.8765, -519.1747, 26.1547}, 12},	-- Shotgun - opposite respawn point  on streps near shopping mall
				{pickup.chainsaw, {323.3671, -446.6893, 23.4271}, 100},	-- Chainsaw - inside garage just ouside base

				 
				-- Weapons near attackers
				{pickup.glock17, {13.1103, -1101.3253, 26.3553}, 50},	-- Glock17 - Inside Grave yard
				{pickup.molotov, {9.5880, -1108.5825, 26.3542}, 5},		-- Molotov - Inside Grave yard
				{pickup.grenade, {-55.3140, -1053.9421, 26.1282}, 3},	-- Grenade - Just outside graveyard
				{pickup.glock17, {-54.9276, -1024.2247, 26.1281}, 50},	-- Glock17 - Just outside graveyard on corner of block
				{pickup.tec9, {-55.5742, -951.2750, 26.1281}, 300},	  -- Flame Thrower - On NW corner of block north of church
				{pickup.ak47, {29.2100, -1039.7351, 26.1280}, 50},		-- AK47 - On SE corner of block north of church
				 
				-- Power Ups
				{pickup.regenhealth, {48.7810, -636.2261, 28.8969}, 120}, -- Re-generation - on Island in Park
				{pickup.invisible, {175.9549, 196.7919, 11.6633}, 120} }  -- Invisability - at ferryport
				
				
				
		elseif GameLocation() == 2 then					--	Shoreside
			pickupdata = {					
				-- defenders				 
				{pickup.rocket_launcher, {-380.4286, 323.9234, 63.8834}, 5},-- rocket launcher - back steps of house
				{pickup.shotgun, {-334.3311, 289.8972, 62.7943}, 12},		-- shotgun - front east of house
				{pickup.tec9, {-374.8417, 280.0041, 62.4954}, 50},			-- tec9 - in front of driveway planter
				{pickup.glock17, {-389.9324, 297.8649, 62.9237}, 50},		-- glock17 - front of house
				{pickup.molotov, {-428.6427, 288.4900, 62.9132}, 5},		-- molotov - inside garage
				{pickup.ak47, {-356.5946, 246.4536, 60.8734}, 50},			-- ak47 - inside guard house
				{pickup.tec9, {-458.5256, 272.4066, 72.5830}, 50},			-- tec9 - next door's driveway
				{pickup.det_grenade, {-287.3690, 278.9638, 64.8461}, 3},	-- det_grenades - cliff top
				{pickup.shotgun, {-315.8377, 379.1954, 80.2763}, 12},		-- shotgun - road behind house
				{pickup.chainsaw, {-429.9433, 302.8232, 62.8502}, 100},		-- chainsaw - behind garage
				 
				-- midway
				{pickup.shotgun, {-603.3050, 250.2758, 61.1598}, 12},		-- shotgun - for sale house
				{pickup.ak47, {-742.1352, 281.0201, 54.1422}, 50},			-- ak47 - 1st posh house
				{pickup.grenade, {-998.2325, 103.2354, 48.8213}, 3},		-- grenades - on bridge
				 
				-- attackers
				{pickup.tec9, {-1065.0518, 68.7893, 48.9805}, 50},			-- tec9 - bottom by containers
				{pickup.grenade, {-1082.3717, 54.8619, 58.5615}, 3},		-- grenades - in 8 ball's
				{pickup.glock17, {-1142.4456, 75.1201, 58.7872}, 50},		-- glock17 - top, at curve
				{pickup.tec9, {-1131.2750, 116.7242, 58.8049}, 50},			-- flame thrower - across the road
				{pickup.molotov, {-1136.2307, 46.1595, 58.7813}, 5},		-- molotov - by garages
				{pickup.ak47, {-1115.2126, 32.8264, 58.6842}, 50},			-- ak47 - by garages
				  
				-- Powerups
				{pickup.regenhealth, {-646.4016, 634.6223, 78.0683}, 120} }	-- Re-generation - in tunnel
				
		end

		-- actually create the pickups
		for _,args in ipairs(pickupdata) do
			table.insert(self.pickups, CreatePickup(unpack(args)))
		end
		
	end
end

function PickupMgr:AddCTFPickups()
	if IsServer() then
		local pickupdata = {}	

		if GameLocation() == 0 then						--	Portland
			pickupdata = {			
				{pickup.molotov,{1228.0414, -135.8676, 14.9326}, 5},
				{pickup.glock17,{1253.1915, -87.7361, 14.7690}, 50},
				{pickup.rocket_launcher,{1320.0925, -295.6476, 15.2436}, 5},
				{pickup.chainsaw,{1208.6989, -141.8298, 14.9326}, 100},
				{pickup.shotgun,{1254.3368, -56.8413, 10.2011}, 20},
				{pickup.sniper,{1142.7616, -104.7277, 7.4335}, 10},
				{pickup.ak47,{1155.3582, -189.5768, 14.9334}, 50},
				{pickup.tec9,{1069.6420, -27.6567, 7.4525}, 50},
				{pickup.sniper,{1142.0704, 110.0923, 0.4839}, 10},
				{pickup.grenade,{1319.9995, -85.2223, 15.0627}, 5},
				{pickup.sniper,{936.2822, -934.7263, 19.1919}, 10},
				{pickup.shotgun,{946.4348, -848.4921, 14.7965}, 20},
				{pickup.grenade,{776.1117, -880.9234, 14.7052}, 5},
				{pickup.ak47,{847.0340, -978.1246, 5.0137}, 50},
				{pickup.sniper,{850.6971, -824.9781, 27.5371 }, 10},
				{pickup.tec9,{999.6838, -885.3864, 15.3094}, 50},
				{pickup.molotov,{940.3749, -898.1082, 14.9487}, 5},
				{pickup.chainsaw,{906.7311, -879.1930, 19.0427 }, 100},
				{pickup.rocket_launcher,{1007.1986, -733.6248, 14.9316 }, 5},
				{pickup.glock17,{824.4510, -760.0349, 15.0326}, 50},
				
				{pickup.invisible,{1280.6178, -388.5768, 34.0868},120},
				{pickup.regenhealth,{902.9461, -599.2646, 17.2961},120},
				}
		elseif GameLocation() == 1 then					--	Staunton Island
			pickupdata = {
				{pickup.tec9,{232.2829, -996.3204, 22.4038},50},	
				{pickup.grenade,{393.7349, -1005.7920, 26.0778},5},	
				{pickup.shotgun,{377.9637, -1047.2292, 16.0159},20},	
				{pickup.glock17,{236.8234, -1135.9171, 22.1276},50},	
				{pickup.molotov,{329.6372, -1085.4048, 25.9564},5},	
				{pickup.glock17,{341.0371, -1084.4303, 22.4988},50},	
				{pickup.tec9,{350.9466, -1086.2032, 25.9584},50},	
				{pickup.ak47,{398.3732, -1131.4076, 26.1281},50},	
				{pickup.chainsaw,{321.0258, -1177.0170, 15.9656},100},	
				{pickup.tec9,{397.6284, -1214.0190, 26.1281},50},	
				{pickup.det_grenade,{244.0540, -1206.2542, 20.4154},5},	
				{pickup.rocket_launcher,{168.1948, -1256.3303, 26.1008},5},	
				{pickup.ak47,{112.6686, -1228.1096, 26.1281},50},	
				{pickup.chainsaw,{-116.3904, -1286.3976, 26.2612},100},	
				{pickup.det_grenade,{-223.6201, -1401.7869, 20.4690},5},
				{pickup.shotgun,{-47.0532, -1390.7488, 26.1117},20},	
				{pickup.ak47,{79.9428, -1401.7461, 26.1769},50},
				{pickup.grenade,{-50.9731, -1433.7305, 30.3836},5},	
				{pickup.molotov,{-123.1662, -1432.9751, 26.1041},5},	
				{pickup.glock17,{-88.4226, -1430.7816, 26.1041},50},
				{pickup.tec9,{-48.6427, -1495.5454, 26.1041},50},	
				{pickup.rocket_launcher,{106.4159, -1565.7111, 23.7467},5},	
				
				{pickup.regenhealth,{-72.7276, -973.5640, 26.1281},120},
				{pickup.invisible,{323.2275, -1535.8230, 23.6694},120},
				
				}
		elseif GameLocation() == 2 then					--	Shoreside
			pickupdata = {
					{pickup.shotgun,{-648.7451, 67.5690, 18.7067 },20},         -- shotgun - bushes by blue garage
					{pickup.tec9,{-673.3328, 48.2750, 18.7456 },50},			-- tec 9 - building door
					{pickup.rocket_launcher,{-724.5386, 56.5324, 20.1161 },5},        -- rocket launcher - on roadworks
					{pickup.glock17,{-697.1685, 84.1517, 18.7488 },50},         -- glock17 - just west of blue base
					{pickup.tec9,{-688.7280, 110.4186, 21.1928},50},			-- tec 9 - on road between bases
					{pickup.glock17,{-712.7247, 135.4902, 23.5916},50},          -- glock17 - on road between bases
					{pickup.grenade,{-774.2778, 107.8990, 29.08677},5},          -- grenades - on road between bases
					{pickup.det_grenade,{-766.4160, 141.9111, 28.82134},5},          -- det grenades - on road between bases
					{pickup.shotgun,{-687.8658, 144.9858, 32.53361},20},          -- shotgun - on road between bases
					{pickup.tec9,{-706.8055, 192.2223, 28.6714},50},			-- tec 9 - red base
					{pickup.glock17,{-755.7037, 205.0495, 28.6714},50},          -- glock17 - red base
					{pickup.shotgun,{-775.0208, 204.7395, 28.6899},20},          -- shotgun - just west of red base
					{pickup.chainsaw,{-777.0145, 172.6318, 29.15717},100},         -- chainsaw - next to red billboards
					{pickup.tec9,{-595.8806, -50.0766, 18.82129},50},         -- tec 9 - blue respawn
					{pickup.glock17,{-657.9488, -38.5029, 18.82269},50},         -- glock17 - blue respawn
					{pickup.shotgun,{-609.1042, 109.3920, 18.77679},20},         -- shotgun - blue respawn
					{pickup.shotgun,{-751.1454, 215.3735, 49.20685},20},         -- shotgun - red respawn
					{pickup.tec9,{-713.1217, 239.3442, 53.00784},50},         -- tec 9 - red respawn
					{pickup.glock17,{-547.6193, 174.4182, 43.82134},50},         -- glock17 - red respawn
					
					{pickup.invisible,{-757.7564, 147.3491, 10.8511},120},
					
				}
		end		

		-- actually create the pickups
		for _,args in ipairs(pickupdata) do
			table.insert(self.pickups, CreatePickup(unpack(args)))
		end
	end
end