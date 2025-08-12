-- Sixty Seconds Script
-- RossC

require 'gta'
require 'mainloop'
require 'spawn'

require 'PowerUps'
require 'Pickups'
require 'CutscenePlayer'

SixtySeconds = StateMachine{'StateInit'}

SS_ServerLogic = Script{}
SS_MessageDisplay = Script{}



NumCarsInList = 2

CarsToCollect =
{
	car.idaho,
	car.infernus,
	car.cheetah,
	car.esperanto,
	car.hotrod,
	car.banshee,
	car.columbians,
	car.yakuza
}

-- ox00FFFFFF
EVENTMASK_NONE = 16777215 

EVENTMASK_TYPE = 255*256*256
EVENTMASK_PARAM1 = 255*256
EVENTMASK_PARAM2 = 255

EVENTSHIFT_TYPE = 16
EVENTSHIFT_PARAM1 = 8
EVENTSHIFT_PARAM2 = 0

EVENT_ASSIGNED_GARAGE = 1
EVENT_CLIENT_HAS_COLLECTED_CAR = 2
EVENT_GAME_FINISHED = 3
EVENT_UNASSIGNED_GARAGE = 4
EVENT_GARAGE_STATE_CHANGE = 5
EVENT_HIDE_GARAGE = 6
EVENT_SHOW_GARAGE = 7

function SixtySeconds:StateInit()
	-- wait for all clients to join
    while not IsServer() and PlayerId() == 0 do
		Wait(100)
	end
	
	self:InitGameData()
	
	
	
	local player = Player()
	local players = AllPlayers()
	self.NumCarsToCapture = GameScoreLimit()
	self.Garages = {}
	self.GarageState = {}
	--Create the garages. These need to be created on every client, but are only tracked by the server.
	for i=1,table.getn(self.GarageSpawnPoints) do
		print("Creating Garage " .. i)
		self.Garages[i] = CreateGarage(self.GarageSpawnPoints[i][1],self.GarageSpawnPoints[i][2])
		print("self.Garages["..i.."] = ".. self.Garages[i])
		self.GarageState[i] = 1
	end
	
	Wait(2000)
	if IsServer() then
		self:CreateServerObjects()
	end
	
	self.mypickups = PickupMgr()
	self.mypickups:CreatePickups()
	self.carsCaptured = 0
	self.carsDestroyed = 0
	self.carsToBeDeleted = {}
	
	
	--Client variables
	self.MyGarage = nil
	self.MyGarageBlip = nil
	self.gameFinished = false
	self.lastCarHealth = 0
	self.totalCarsCollected = 0
	self.playerscores = {}	
	self.carsCollected = {}
	
	

	if IsServer() then
		self.SS_ServerLogic = SS_ServerLogic()
		self.SS_ServerLogic:Start()
		
		if UsePowerups() then
			local mytimer = PowerupTimer()
			mytimer:Start()
		end
	end
	
	--for _,p in pairs(players) do
	--	p:SetRadarBlipShortRange(true)
	--end
	
	self:DoSpawn()
	
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
	UpdateGameTime(true)
	self.carsRemainingText = TextSprite(player,310,80,0)
	self.carsRemainingText:Style(2)
	self.carsRemainingText:Scale(0.5)
	self.carsRemainingText:Text("^S^Cars remaining: "..(self.NumCarsToCapture-self.totalCarsCollected))
	
	return 'StateRunning'
end

function SS_ServerLogic:Run()
	while 1  do
		main.game:DoServerLogic()
		main.game:UpdateRadar()
		Wait(10)
	end
end

function SixtySeconds:StateRunning()
	local player = Player()
    if self.gameFinished then
		self.state = 'StateGameWon'
    end
    
    if not player:IsPlaying() then   
        main.scores:Show(true)
        Wait(1000)          
        self:DoSpawn()
    end
    
    self:DoClientLogic()
end

function SixtySeconds:CleanUp()

	if self.SS_ServerLogic then
		self.SS_ServerLogic:Stop()
	end
	
	self.mytimer:Stop()
    -- remove the pickups
    self.mypickups:Cleanup()
	
	-- restore the camera if quit early..
	RestoreCamera( 0, newplayer )
end

function SixtySeconds:DoServerLogic()
	
	for i,car in ipairs(self.targetCars) do
		--Check to see if any of the cars have a new driver
		if VehicleIsDrivenByPlayer(car["Vehicle"]) and VehicleIsDrivenByPlayer(car["Vehicle"]) ~= car["HasDriver"] then
			print("Target car " .. i .. " now has a driver " .. VehicleGetDriverPlayerId(car["Vehicle"]))
			
			if (VehicleIsDrivenByPlayer(car["Vehicle"])) then
				car["HasDriver"] = true	
				if (VehicleGetDriverPlayerId(car["Vehicle"]) ~= car["LastDriver"]) then
					--Different driver from last time.
					--Allocate a new garage for delivery
					
					--Unnassign old garage
					if (car["HasGarageAssigned"]) then
						car["HasGarageAssigned"] = false
						self:DoSendEvent(EVENT_UNASSIGNED_GARAGE,car["LastDriver"],car["Garage"])
					end
					
					car["LastDriver"] = VehicleGetDriverPlayerId(car["Vehicle"])
					
					local foundGarage = false
					while(not foundGarage) do
						local targetGarage = math.random(1,table.getn(self.GarageSpawnPoints))
						local garageInUse = false
						print("Random garage "..targetGarage.." being checked")
						for _,carIt in pairs(self.targetCars) do
							if garage == carIt["Garage"] then
								garageInUse = true
							end
						end
						
						if not garageInUse then
							car["Garage"] = targetGarage
							foundGarage = true
						end
					end
					
					
					if car["GarageBlip"] then
						RemoveBlip(car["GarageBlip"])
					end
					car["HasGarageAssigned"] = true
					self:DoSendEvent(EVENT_ASSIGNED_GARAGE,car["LastDriver"],car["Garage"])
				else
					--Same driver has got back in the car, show him the same garage again
					car["HasGarageAssigned"] = true
					self:DoSendEvent(EVENT_SHOW_GARAGE,car["LastDriver"],car["Garage"])
				end
			else
				car["HasDriver"] = false
				print("Sending unassign garage message")
				car["HasGarageAssigned"] = false
				self:DoSendEvent(EVENT_UNASSIGNED_GARAGE,car["LastDriver"],car["Garage"])
			end
		elseif (not VehicleIsDrivenByPlayer(car["Vehicle"])) and car["HasDriver"] then
			car["HasDriver"] = false
			print("Sending hide garage message")
			--Hide the blip for the garage on the players radar, but do not unnassign the garage as it can still be capped
			self:DoSendEvent(EVENT_HIDE_GARAGE,car["LastDriver"],car["Garage"])
		end
		
		--Cull destroyed cars
		if VehicleHealth(car["Vehicle"]) then
			if VehicleHealth(car["Vehicle"]) <= 0 or IsVehicleWrecked(car["Vehicle"]) then
				table.insert(self.carsToBeDeleted,car["Vehicle"])
				print("Create Car in health cull")
				self:CreateTargetCar(i)
				self.carsDestroyed = self.carsDestroyed + 1
			end
		end
	end
	
	if (self.carsCaptured == self.NumCarsToCapture) and not self.gameFinished then
		self:DoSendEvent(EVENT_GAME_FINISHED,0,0)
	end
	
	for i,value in ipairs(self.carsToBeDeleted) do
		
		if not VehicleIsDrivenByPlayer(value) then
			print "Deleting a car!"
			DeleteVehicle(value)
			table.remove(self.carsToBeDeleted,i)
		end
	end
end

function SixtySeconds:DoClientLogic()
	self:ProcessEvents()
	
	if self.MyGarage then
		if (HasGarageAcceptedVehicle(self.Garages[self.MyGarage])) then
			print("Car accepted by garage (local)")
			self:DisplayMessage('^s^ Vehicle Delivered!',2000)
			RemoveBlip(self.MyGarageBlip)
			self.MyGarageBlip = nil
			self.MyGarage = nil
			self:DoSendEvent(EVENT_CLIENT_HAS_COLLECTED_CAR, PlayerId(), self.lastCarHealth/10)
		end
	end
	
	--Check for garage state changes and send them on
	--for i,garage in ipairs(self.Garages) do
	--	if self.GarageState[i] != GetGarageState(garage) then
	--		self.GarageState[i] = GetGarageState(garage)
	--		self:DoSendEvent( EVENT_GARAGE_STATE_CHANGE, i, self.GarageState[i] )
	--	end
	--end
	
	--Keep track of the health of any car you are driving for scoring
	local player = Player()
	if (player:Car()) then
		local vehicle = player:Car()
		self.lastCarHealth = VehicleHealth(vehicle)
	end
end

function SixtySeconds:ProcessEvents()
	local Event = -1
	
	while not IsEventStackEmpty() do
		Event = GetEvent()
		
		print("Got event code "..Event)
		
		local Type = MaskEventNumber( Event, EVENTMASK_TYPE, -EVENTSHIFT_TYPE )
		local Param1 = MaskEventNumber( Event, EVENTMASK_PARAM1, -EVENTSHIFT_PARAM1 )
		local Param2 = MaskEventNumber( Event, EVENTMASK_PARAM2, -EVENTSHIFT_PARAM2 )

		print("Receiving Event "..Type.." "..Param1.." "..Param2)
		
		local action =
		{
			[EVENT_ASSIGNED_GARAGE] = self.HandleAssignedGarage,
			[EVENT_CLIENT_HAS_COLLECTED_CAR] = self.HandleClientHasCollectedCar,
			[EVENT_GAME_FINISHED] = self.HandleEventGameFinished,
			[EVENT_UNASSIGNED_GARAGE] = self.HandleUnassignedGarage,
			[EVENT_GARAGE_STATE_CHANGE] = self.HandleGarageStateChange,
			[EVENT_HIDE_GARAGE] = self.HandleHideGarage,
			[EVENT_SHOW_GARAGE] = self.HandleShowGarage,
		}
		
		action[Type](self, Param1,Param2)
	end
end

function SixtySeconds:HandleAssignedGarage(param1,param2)
	local player = Player()
	if param1 == player:PlayerNum() then
		
		print("I have been assigned a garage of id "..param2)
		if self.MyGarageBlip then
			RemoveBlip(self.MyGarageBlip)
		end
		self.MyGarageBlip = AddBlipForCoord(player,self.GarageSpawnPoints[param2][1],4,pickupicon.base)	
		self.MyGarage = param2
		SetPlayersVehicleForGarage(self.Garages[self.MyGarage])
	end
end

function SixtySeconds:HandleUnassignedGarage(param1,param2)
	local player = Player()
	if param1 == player:PlayerNum() then
		print("I have been unassigned my garage")
		if self.MyGarageBlip then
			RemoveBlip(self.MyGarageBlip)
			self.MyGarageBlip = nil
			self.MyGarage = nil
		end
	end 
end

function SixtySeconds:HandleHideGarage(param1,param2)
	local player = Player()
	if param1 == player:PlayerNum() then
		if self.MyGarageBlip then
			RemoveBlip(self.MyGarageBlip)
			self.MyGarageBlip = nil
		end
	end
end



function SixtySeconds:HandleShowGarage(param1,param2)
	local player = Player()
	if param1 == player:PlayerNum() then
		if self.MyGarageBlip then
			RemoveBlip(self.MyGarageBlip)
		end
		self.MyGarageBlip = AddBlipForCoord(player,self.GarageSpawnPoints[param2][1],4,pickupicon.base)	
	end
end

function SixtySeconds:HandleClientHasCollectedCar(param1,param2)
	if (IsServer()) then
		print("Server handling client has collected car")
		print("Pre handle carsCaptured = " .. self.carsCaptured)
		self.carsCaptured = self.carsCaptured + 1
		for i,car in ipairs(self.targetCars) do
			if (car["LastDriver"] == param1) then
				print("Post inc cars captured = "..self.carsCaptured)
				print("Doing server cleanup for collected car")
				RemoveBlip(car["OwnBlip"])
				print("Create Target Car in HCHCC")
				self:CreateTargetCar(i)
				
			end
		end
	end
	
	
	--Score comes in divided by 10
	local scoreInc = param2 * 10
	print("Incrementing score of player " .. param1 .. " by " .. param2*10)
	self.playerscores[Player(param1)] = self:Score(Player(param1)) + scoreInc
	self.carsCollected[Player(param1)] =  self:Cars(Player(param1)) + 1
	local player = Player()
	if param1 == player:PlayerNum() then
		SetMultiplayerMissionCash(	self:Score(Player(param1)) )				
	end
	self.totalCarsCollected = self.totalCarsCollected + 1
	self.carsRemainingText:Text("^S^Cars remaining: "..(self.NumCarsToCapture-self.totalCarsCollected))
end

function SixtySeconds:HandleEventGameFinished(param1,param2)
	print("Game finished event recieved")
	self.gameFinished = true
end

function SixtySeconds:HandleGarageStateChange(param1,param2)
	--if self.GarageState[param1] != param2 then
	--	self.GarageState[param1] = param2
	--	SetGarageState(self.Garages[param1],param2)
	--end
end

function SixtySeconds:CreateServerObjects()
	--Create the cars
	local allplayers = AllPlayers()
	self.targetCars = {}
	self.carsCreated = 0
	for i=1,self:NumCarsAvailable() do
		print ("Generating Car " .. i)
		self.targetCars[i] = {}
		self:CreateTargetCar(i)
	end
end

function SixtySeconds:CreateTargetCar(carIndex)
	local allplayers = AllPlayers()
	local carToCreate = math.random(1,table.getn(CarsToCollect))
	self.carsCreated = self.carsCreated + 1
	
	--Wrap around the spawn points
	if self.carsCreated > table.getn(self.CarSpawnPoints) then
		self.carsCreated = 1
	end
	
	self.targetCars[carIndex]["Vehicle"] = CreateVehicle(CarsToCollect[carToCreate],self.CarSpawnPoints[self.carsCreated][1],self.CarSpawnPoints[self.carsCreated][2])
	self.targetCars[carIndex]["LastDriver"] = -1 
	self.targetCars[carIndex]["HasDriver"] = false	
	self.targetCars[carIndex]["Garage"] = -1
	if self.targetCars[carIndex]["OwnBlip"] then
		RemoveBlip(self.targetCars[carIndex]["OwnBlip"])
	end
	self.targetCars[carIndex]["OwnBlip"] = AddBlipForCoord(allplayers,self.CarSpawnPoints[self.carsCreated][1],1,pickupicon.objective)
	self.targetCars[carIndex]["GarageBlip"] = nil
	self.targetCars[carIndex]["HasGarageAssigned"] = false
	print("Trying to add 3d marker for car " .. carIndex)
	VehicleAdd3dMarker(self.targetCars[carIndex]["Vehicle"])
end

function SixtySeconds:NumCarsAvailable()
	local players = AllPlayers()
	
	local numplayers = table.getn(players)
	local numCarsAvailable = 0
	
	local action = {
		[1] = function(x) numCarsAvailable = 1 end,
		[2] = function(x) numCarsAvailable = 1 end,
		[3] = function(x) numCarsAvailable = 2 end,
		[4] = function(x) numCarsAvailable = 2 end,
		[5] = function(x) numCarsAvailable = 3 end,
		[6] = function(x) numCarsAvailable = 3 end,
		[7] = function(x) numCarsAvailable = 4 end,
		[8] = function(x) numCarsAvailable = 4 end,
	}
	
	action[numplayers]()
	
	return numCarsAvailable
end

function SixtySeconds:DoSpawn()
	local player = Player()	
	main.vSpawnPoints = self.PlayerSpawnPoints
	DoSpawn()
end

function SixtySeconds:UpdateRadar()
	for i,car in ipairs(self.targetCars) do
		if car["OwnBlip"] and VehiclePosition(car["Vehicle"]) then
			UpdateBlipCoord(car["OwnBlip"],VehiclePosition(car["Vehicle"]))
		end
	end
end


function SixtySeconds:DisplayMessage(theText, length, colour)	

	--setup the message 
	self.Msg = theText
	self.MsgLength = length
	self.MsgColour = colour
	
	
	-- display the message in a seperate thread so we don't slow time everything 
	self.SS_MessageDisplay = SS_MessageDisplay()
	self.SS_MessageDisplay:Start()
end

function SS_MessageDisplay:CleanUp()
	print('Message Display CLEANUP')
end


function SS_MessageDisplay:Run()
	local player = Player()
	local text = TextSprite(player, 385, 70, 2)
	
	text:Scale(0.7)
	text:Style(2)
	--if (main.game.MsgColour) then
	--	text:Colour(main.game.MsgColour)
	--end
	text:Text(main.game.Msg)
	Wait(main.game.MsgLength)
	text:Remove()
end 

function SixtySeconds:Score(player)
	--print("Getting score for player " .. PlayerId(player))
	return self.playerscores[player] or 0
end

function SixtySeconds:Cash(player)
	--print("Getting cash for player " .. PlayerId(player))
	return self.playerscores[player] or 0
end

function SixtySeconds:Cars(player)
	--print("Getting cars for player " .. PlayerId(player))
	return self.carsCollected[player] or 0
end

function SixtySeconds:StateGameWon()
	local players = AllPlayers()
	table.sort(players, 
		function(a, b) 
			return self:Score(a) > self:Score(b)
		end)
	
	
	if (self:Score(players[1]) == self:Score(players[2])) then
		self.winner = nil
	else
		self.winner = players[1]
	end
	
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
    
    txt:Remove()
    
    main.scores:Show(true)
	Wait(12000)
    
    main.scores:Hide()
    main:EndGame()
    
    return 'StateRunning'
end

function SixtySeconds:DoSendEvent( Type, Param1, Param2 )
	print("Sending Event "..Type.." "..Param1.." "..Param2)
	
	local Event = MaskEventNumber( Type, EVENTMASK_NONE, EVENTSHIFT_TYPE )
	Event = Event + MaskEventNumber( Param1, EVENTMASK_NONE, EVENTSHIFT_PARAM1 )
	Event = Event + MaskEventNumber( Param2, EVENTMASK_NONE, EVENTSHIFT_PARAM2 )
	
	SendEvent( Event )
end

function SixtySeconds:Commentate(text)
    main.commentary:Print(text)
end

function SixtySeconds:RegisterPlayerKill(player, killer, headshot)
	if player == killer then
		self:Commentate('^S^'..player:Name()..'^S^ ^T^MPKSELF')
	else
		-- see if they were killed with a headshot
		if headshot then
			self:Commentate('^S^'..killer:Name()..'^S^ ^T^MPK^S^ '..player:Name()..'^S^ ^T^MPKHEAD')		
		else
			self:Commentate('^S^'..killer:Name()..'^S^ ^T^MPK^S^ '..player:Name())
		end
	end
end

function SixtySeconds:InitGameData()
	GameElapsedMs(0)
	
	if GameLocation() == 0 then
	self.CarSpawnPoints = {
		{{878.9880, -810.9239, 13.9327}, 87.7955},
		{{1201.2374, -796.6064, 13.6270}, 318.0812},      
		{{1052.9984, -1039.5879, 13.9009}, 72.1745},      
		{{1171.3418, -663.0435, 17.8591}, 180.0322},      
		{{1160.8433, -448.7596, 21.4234}, 101.5482},      
		{{1176.2535, -95.7773, 6.4335}, 353.1978},        
		{{1098.7910, 44.1015, -1.5353}, 267.3353},        
		{{930.5602, -175.2360, 3.7986}, 184.1712},        
		{{883.0075, -311.7353, 7.6982}, 89.7126} ,        
		{{868.4464, -663.5236, 13.9361}, 244.0882},       
		{{1276.1166, -380.2794, 32.6859}, 101.1004},      
		{{973.2164, -418.2749, 14.0285}, 181.0763},       
	}
	
	self.GarageSpawnPoints = {
		{{1488.4861, -1153.4122, 10.8202}, 270.0},  
		{{1552.8500, -890.2553, 10.7833}, 270.0},    
		{{1313.1111, -109.3289, 15.2500}, 180.0},     
		{{800.5975, 219.7822, 2.7034}, 90.0},      
		{{891.0, -988.0, 4.0}, 0.0},  --dodgy pos   
		{{867.0037, -545.9845, 13.9327}, 90.0},    
		{{1339.5814, -254.3652, 48.7}, 90.0},   
		{{979.1169, -58.6563, 6.2836}, 180.0},     
	}
	
	self.PlayerSpawnPoints = {
		{{1293.8296, -936.3995, 13.9326}, 9.3867}, 
		{{1037.9810, -933.4276, 13.9326}, 307.8666},       
		{{826.0873, -848.7362, 14.0352}, 340.3770},        
		{{1038.0424, -671.6776, 13.9326}, 195.6944},       
		{{1203.4410, -512.1193, 23.9328}, 57.2714},        
		{{843.8878, -507.8421, 13.9326}, 21.4699},         
		{{1133.5897, -194.7319, 13.9326}, 149.1851},       
		{{1356.6787, -290.3170, 48.9329}, 336.6544}      
	}
	
	elseif GameLocation() == 1 then
	self.GarageSpawnPoints = {
		{{453.5533, -1499.5399, 17.6296}, 0},       
		{{-58.4792, -1467.2493, 25.1041}, 90},      
		{{-121.2447, -1169.6348, 14.8282}, 360},    
		{{415.7063, -902.2213, 15.1200}, 270},      
		{{-58.0512, -462.6176, 15.1250}, 90},       
		{{178.2466, 196.3456, 10.6633}, 90},        
		{{301.9552, -9.6347, 15.1777}, 270},        
		{{435.2762, -376.5137, 20.0486}, 180},      
		
	}
	self.CarSpawnPoints = {
		{{228.9560, -1212.6545, 19.4197}, 180.8357},     
		{{245.1146, -959.3138, 25.0420}, 183.1855},      
		{{283.0121, -551.8598, 30.4314}, 271.8552},      
		{{184.5689, -333.0045, 15.1303}, 90.8020},       
		{{63.3943, -588.6461, 24.9365}, 356.0547},       
		{{342.2017, -118.9139, 20.2104}, 267.2394},      
		{{-32.5950, -1121.1775, 25.1773}, 111.2841},     
		{{527.5330, -657.1049, 15.0851}, 349.9874},      
		{{73.4697, -351.3455, 15.1416}, 87.4493},        
		{{110.4819, -1564.4711, 22.7467}, 87.6272},      
		{{259.6042, -789.9781, 26.9062}, 352.1947},      
		{{111.6445, -1233.8260, 25.1281}, 175.1010},     
	}	
	
	self.PlayerSpawnPoints = {
		{{238.6437, -200.0360, 20.3321}, 223.8856},      
		{{-6.6690, -397.4051, 15.1281}, 223.8856},       
		{{228.5130, -618.3199, 24.9751}, 244.0131},      
		{{-73.0186, -807.2783, 25.1281}, 328.6864},      
		{{57.5291, -952.2739, 25.1281}, 19.7356},        
		{{400.3114, -1138.4528, 25.1281}, 243.2736},     
		{{-146.6007, -1346.5632, 25.1281}, 238.3853},    
		{{200.6563, -1411.2737, 25.1281}, 44.9046},      
		}
	else 
	self.GarageSpawnPoints = {
		{{-749.2634, -561.6697, 7.8245}, 180.0},
		{{-919.6650, -204.5945, 32.8057}, 90.0},      
		{{-1234.9210, -10.4976, 58.0798}, 270.0},     
		{{-903.2566, 372.1334, 37.8490}, 0.0},        
		{{-459.3922, 63.0674, 2.8213}, 180.0},        
		{{-468.7532, -201.5039, 2.8213}, 360.0},      
		{{-718.4250, 180.7856, 27.6714}, 280.0},      
		{{-1189.0983, -203.1574, 42.9788}, 90.0},     
	}

	self.CarSpawnPoints = {
		{{-1093.0425, -84.4261, 42.6927}, 180.0},     
		{{-1102.4462, 155.8874, 57.7586}, 63.6874},   
		{{-1000.4736, 108.2794, 13.2361}, 203.7447},  
		{{-1184.2906, 69.9539, 67.6932}, 356.7323},   
		{{-712.0085, 330.6576, 61.8738}, 0.2236},     
		{{-584.8018, 265.1498, 61.3572}, 175.7460},   
		{{-656.5526, 59.7458, 17.7132}, 82.8471},     
		{{-483.2016, -52.7287, 2.8213}, 180.0000},    
		{{-976.7012, 453.4439, 22.4969}, 230.6617},   
		{{-736.0754, -271.7495, 17.4381}, 76.0182},   
		{{-1200.0933, 523.1423, 67.5492}, 212.8388},  
		{{-713.3060, 264.5084, 53.0290}, 182.1571},   
	}

	self.PlayerSpawnPoints = {
		{{-887.7736, 159.0758, 47.8213}, 197.2778},   
		{{-903.0086, 540.2868, 68.9162}, 177.2619},   
		{{-758.3311, 29.6867, 2.8213}, 353.9334},     
		{{-888.3676, -119.2264, 32.8212}, 353.9334},  
		{{-1282.5562, -64.8545, 57.8212}, 136.8653},  
		{{-992.9297, -49.1714, 37.8820}, 136.8653},   
		{{-292.9362, 381.1484, 77.8213}, 212.1673},   
		{{-674.1395, -404.8195, 17.6713}, 225.9362},  
	}
	end
	
	--Now randomise the car spawn position list so we dont get the same car first each time.
	for i,spawnloc in ipairs(self.CarSpawnPoints) do
		local temptarget = spawnloc
		local changetarget = math.random(1, table.getn(self.CarSpawnPoints))
		self.CarSpawnPoints[i] = self.CarSpawnPoints[changetarget]
		self.CarSpawnPoints[changetarget] = temptarget
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
	
	main.game = SixtySeconds():Start()

	main:Start()
end
