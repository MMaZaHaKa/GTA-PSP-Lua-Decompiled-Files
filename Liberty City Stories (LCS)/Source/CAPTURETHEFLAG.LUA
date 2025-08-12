-- CTF script
-- RossC

require 'gta'
require 'mainloop'
require 'spawn'

require 'PowerUps'
require 'Pickups'
require 'CutscenePlayer'

CTF = StateMachine{'StateInit'}

CTFServerLogic = Script{}
CTFMessageDisplay = Script{}
CTFKickOutOfCar = Script{}

EVENT_TEAM1_CAR_STOLEN = 1
EVENT_TEAM1_CAR_RETURNED = 2
EVENT_TEAM2_CAR_STOLEN = 3
EVENT_TEAM2_CAR_RETURNED = 4
EVENT_TEAM1_CAR_ENTERING_ENEMY_BAY = 5
EVENT_TEAM2_CAR_ENTERING_ENEMY_BAY = 6
EVENT_TEAM1_CAR_LEAVING_ENEMY_BAY = 7
EVENT_TEAM2_CAR_LEAVING_ENEMY_BAY = 8
EVENT_START_TEAM1_TIMER = 9
EVENT_START_TEAM2_TIMER = 10
EVENT_STOP_TEAM1_TIMER = 11
EVENT_STOP_TEAM2_TIMER = 12
EVENT_SHOW_TEAM1_TIMER = 13
EVENT_SHOW_TEAM2_TIMER = 14
EVENT_HIDE_TEAM1_TIMER = 15
EVENT_HIDE_TEAM2_TIMER = 16
EVENT_GAME_OVER = 17
EVENT_TEAM1_CAR_OOP = 18
EVENT_TEAM2_CAR_OOP = 19

teamId1 = 0
teamId2 = 1
team1RadarColour = 2
team2RadarColour = 0
hornDebounce = false

function CTF:StateInit()   
	
	-- wait for all clients to join
    while not IsServer() and PlayerId() == 0 do
		Wait(100)
	end
	
	--server variables
	
	self.colourTest = 0
	
	self.scores = {0,0}
	self.team1CarStolen = false;
	self.team2CarStolen = false;
	self.team1CarInEnemyBay = false
	self.team2CarInEnemyBay = false
	self.team1CarLastDriverTeam = -1
	self.team2CarLastDriverTeam = -1
	self.team1ShortTimerCounting = false
	self.team2ShortTimerCounting = false
	self.carToKickDriverOutOf = nil
	self.isDriverKickedOutofCar = true
	
	if (GameScoreLimit() > 0) then
		self.scorelimit = GameScoreLimit()
		print("Setting game score limit to "..self.scorelimit)
	else
		self.scorelimit = nil
	end
	
	self.carsToBeDeleted = {}
	
	--client variables
	self.team1Colour = TeamColour(teamId1)
	self.team2Colour = TeamColour(teamId2)
	print("team1Colour = ", self.team1Colour)
	print("team2Colour = ", self.team2Colour)
	self.ourCarIsSafe = true
	self.weHaveTheirCar = false
	self.showTeamTimer1 = false
	self.showTeamTimer2 = false
	self.team1TimerText = nil
	self.team2TimerText = nil
	self.Msg = nil
	self.MsgLength = nil
	self.MsgColour = nil
	self.MessageDisplayQueue = {}
	
	
	self.destructionTimer = 0
	self.destructTimerActive = false
	self.destructionTimerBase = 0
	
	while not IsServer() and PlayerId() == 0 do
		Wait(100)
	end
	
	print("Running CTF:InitGame")
	self:InitGame()
	local player = Player()

	if IsServer() then		
		print("Creating Vehicle 1")
		self.MissionCar1 = CreateVehicle( 140, self.CarDealership1, self.CarDealership1Heading, 54)
		VehicleSetCarDoorLocks(self.MissionCar1,CARLOCK_TEAM1_LOCKED)
		VehicleSetTyresNoBurst(self.MissionCar1,true)
		print("Creating Vehicle 2")
		self.MissionCar2 = CreateVehicle( 140, self.CarDealership2, self.CarDealership2Heading, 3)
		VehicleSetCarDoorLocks(self.MissionCar2,CARLOCK_TEAM2_LOCKED)	
		VehicleSetTyresNoBurst(self.MissionCar2,true)
	end
	
	Wait(2000)

	self:DoSpawn(true)
	print("Checking IsServer")
	
	if IsServer() then			
		--Initialise other server miscness
		print("Entering ServerInit()")
		self:ServerInit()
	end
	
	self:ClientInit()
	
	
	if (player:TeamId() == teamId1) then
		self.enemyCarWP = SetHalo(self.CarDealershipDrop1, 0, self.team1Colour, self.CarDealershipDrop1[4]*2)
	else
		self.enemyCarWP = SetHalo(self.CarDealershipDrop2, 0, self.team2Colour, self.CarDealershipDrop2[4]*2)
	end
	
	self.team1FlagBlip = nil
	self.team2FlagBlip = nil
	
	
	
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
	
	if IsServer() then
		SetTeamScore(teamId1,self.scores[1])
		SetTeamScore(teamId2,self.scores[2])
		self.CTFServerLogic = CTFServerLogic()
		self.CTFServerLogic:Start()
	end
	
	self.CTFMessageDisplay = CTFMessageDisplay()
	self.CTFMessageDisplay:Start()
	
	UpdateGameTime(true)
	
	
    return 'StateRunning'
end

function CTF:ServerInit()

	--who's in the team car texts
	local allplayers = AllPlayers()
	
	--self.testBlip = AddBlipForCoord(TeamPlayers(teamId1),self.CarDealership1,4,pickupicon.objective)
	--self.testBlip = AddBlipForCoord(allplayers,self.CarDealership1,4,pickupicon.objective)
	
	self.team1WhoInText = {}
	self.team1WhoInText = TextSprite(allplayers,100,20,0)
	self.team1WhoInText:Style(2)
	self.team1WhoInText:Scale(0.5)
	self.team1WhoInText:Colour({255,255,255,255})
	self.team1WhoInText:Text("^T^MPEMPTY")
	
	self.team2WhoInText = {}
	self.team2WhoInText = TextSprite(allplayers,100,35,0)
	self.team2WhoInText:Style(2)
	self.team2WhoInText:Scale(0.5)
	self.team2WhoInText:Colour({255,255,255,255})
	self.team2WhoInText:Text("^T^MPEMPTY")
	

end

function CTF:ClientInit()
	local player = Player()
	local enemyTeam = {}

	if (player:TeamId() == teamId1) then
		self.baseBlip = AddBlipForCoord(player,self.CarDealership1,team1RadarColour,pickupicon.base)
		self.enemyBaseBlip = AddBlipForCoord(player,self.CarDealership2,team2RadarColour,pickupicon.base)
		enemyTeam = TeamPlayers(teamId2)
		self.team1CarNameText = {}
		self.team1CarNameText = TextSprite(player,60,20,1)
		self.team1CarNameText:Style(2)
		self.team1CarNameText:Scale(0.5)
		self.team1CarNameText:Colour(self.team1Colour)
		self.team1CarNameText:Text("^T^MPBLCAR")
		
		self.team2CarNameText = {}
		self.team2CarNameText = TextSprite(player,60,35,1)
		self.team2CarNameText:Style(2)
		self.team2CarNameText:Scale(0.5)
		self.team2CarNameText:Colour(self.team2Colour)
		self.team2CarNameText:Text("^T^MPRDCAR")
	else
		self.baseBlip = AddBlipForCoord(player,self.CarDealership2,team2RadarColour,pickupicon.base)
		self.enemyBaseBlip = AddBlipForCoord(player,self.CarDealership1,team1RadarColour,pickupicon.base)
		enemyTeam = TeamPlayers(teamId1)
		
		self.team1CarNameText = {}
		self.team1CarNameText = TextSprite(player,60,20,1)
		self.team1CarNameText:Style(2)
		self.team1CarNameText:Scale(0.5)
		self.team1CarNameText:Colour(self.team1Colour)
		self.team1CarNameText:Text("^T^MPBLCAR")
		
		self.team2CarNameText = {}
		self.team2CarNameText = TextSprite(player,60,35,1)
		self.team2CarNameText:Style(2)
		self.team2CarNameText:Scale(0.5)
		self.team2CarNameText:Colour(self.team2Colour)
		self.team2CarNameText:Text("^T^MPRDCAR")
	end	
	
	--CreatePortaCabin(self.CarDealershipCabin1, self.CarDealershipCabinHeading1, teamId1)
	--CreatePortaCabin(self.CarDealershipCabin2, self.CarDealershipCabinHeading2, teamId2)
	
	
	for _,p in pairs(enemyTeam) do
		p:SetRadarBlipShortRange(true)
	end
	
end

function CTFServerLogic:Run()
	while 1 do
		main.game:DoServerLogic()
		main.game:UpdateRadar()
		Wait(10)
	end
end

function CTFServerLogic:CleanUp()
	self.mytimer:Stop()
    -- remove the pickups
    self.mypickups:Cleanup()
end

function CTF:StateRunning()
	local player = Player()
    if not player:IsPlaying() then   
        main.scores:Show(true)
        Wait(1000)           
        self:DoSpawn()
    end
    
    		
	if IsPlayerPressingHorn(player) and not hornDebounce then
		print("Horntest on")
		
	
				
		hornDebounce = true
	end
	
	if not IsPlayerPressingHorn(player) then
	
		
		hornDebounce = false
	end
	
	
	self:DoClientLogic()
	
	
	
end

function CTF:StateGameWon()
	UpdateGameTime(false)
	local winner
	if (self.scores[1] > self.scores[2]) then
		winner = "^T^MPBLTM"
	elseif (self.scores[1] < self.scores[2]) then
		winner = "^T^MPRDTM"
	else
		winner = nil
	end	
	
	local txt
	
    if winner then
		txt = AddText{x = 240, y = 110, scale = .9, align = 1, text = "^S^"..winner.."^S^ ^T^MPWIN"}
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

function CTF:DoServerLogic()
	local player = Player()
	
	--check if our time is up
	if GameTimeUp() then
		SendEvent(EVENT_GAME_OVER)
	end
	
	local car1Pos = VehiclePosition(self.MissionCar1)
	if (car1Pos) then
		if not IsPosInArea(car1Pos,self.CarDealership1,self.CarDealership1[4]) then
			if not self.team1CarStolen then
				if VehicleGetDriverTeam(self.MissionCar1) == teamId2 then
					--The car has been stolen
					print("team1 car stolen")
					SetTeamTimer(teamId1,60000)
					SendEvent(EVENT_SHOW_TEAM1_TIMER)
					SendEvent(EVENT_TEAM1_CAR_STOLEN)
				else
					--the car has been moved out of the zone by some other means
					SetTeamTimer(teamId1,10000)
					self.team1ShortTimerCounting = true
					SetTeamTimerCounting(teamId1,true)
					SendEvent(EVENT_SHOW_TEAM1_TIMER)
					SendEvent(EVENT_TEAM1_CAR_OOP)
				end
				
				
				self.team1CarStolen = true
				VehicleSetCarDoorLocks(self.MissionCar1,CARLOCK_UNLOCKED)
				VehicleSetTyresNoBurst(self.MissionCar1,false)
				--make our car NONinvincibubble
				VehicleSetHealth(self.MissionCar1,1000)
			end
		elseif self.team1CarStolen then
			SendEvent(EVENT_TEAM1_CAR_RETURNED)
			self:KickDriverOutOfCar(self.MissionCar1)
			SetTeamTimerCounting(teamId1,false)
			SendEvent(EVENT_HIDE_TEAM1_TIMER)
			VehicleSetEmergencyStop(self.MissionCar1,false)
			--VehicleRepair(self.MissionCar1)
			VehicleSetCarDoorLocks(self.MissionCar1,CARLOCK_TEAM1_LOCKED)
			VehicleSetTyresNoBurst(self.MissionCar1,true)
			self.team1CarStolen = false
			self.team2ShortTimerCounting = false
		else
			if VehicleGetDriverTeam(self.MissionCar1) ~= self.team1CarLastDriverTeam then
				if VehicleGetDriverTeam(self.MissionCar1) == teamId2 then
					VehicleSetHealth(self.MissionCar1,1000)
				end
				--self.team1CarLastDriverTeam = VehicleGetDriverTeam(self.MissionCar1)
			end
			--make our car invincibubble
			if VehicleGetDriverTeam(self.MissionCar1) ~= teamId2 then
				--print("Setting health high for MC1")
				VehicleSetHealth(self.MissionCar1,10000)
			end
		end
		
		if IsPosInArea(car1Pos,self.CarDealershipDrop2,self.CarDealershipDrop2[4]) then
			if not self.team1CarInEnemyBay then
				self.team1CarInEnemyBay = true
				SendEvent(EVENT_TEAM1_CAR_ENTERING_ENEMY_BAY)
			end
		elseif self.team1CarInEnemyBay then
			self.team1CarInEnemyBay = false
			SendEvent(EVENT_TEAM1_CAR_LEAVING_ENEMY_BAY)
		end
	end

	local car2Pos = VehiclePosition(self.MissionCar2)	
	if (car2Pos) then
		local car2Pos = VehiclePosition(self.MissionCar2)
		if not IsPosInArea(car2Pos,self.CarDealership2,self.CarDealership2[4]) then
			if not self.team2CarStolen then
				if VehicleGetDriverTeam(self.MissionCar2) == teamId1 then
					print("team2 car stolen")
					SetTeamTimer(teamId2,60000)
					SendEvent(EVENT_SHOW_TEAM2_TIMER)
					SendEvent(EVENT_TEAM2_CAR_STOLEN)
				else
					SetTeamTimer(teamId2,10000)
					SetTeamTimerCounting(teamId2,true)
					SendEvent(EVENT_SHOW_TEAM2_TIMER)
					self.team2ShortTimerCounting = true
					SendEvent(EVENT_TEAM2_CAR_OOP)
				end
				
				
				VehicleSetCarDoorLocks(self.MissionCar2,CARLOCK_UNLOCKED)
				VehicleSetTyresNoBurst(self.MissionCar2,false)
				--make our car NONinvincibubble
				VehicleSetHealth(self.MissionCar2,1000)
				self.team2CarStolen = true
			end
		elseif self.team2CarStolen then
			SendEvent(EVENT_TEAM2_CAR_RETURNED)
			self:KickDriverOutOfCar(self.MissionCar2)
			VehicleSetEmergencyStop(self.MissionCar2,false)
			SetTeamTimerCounting(teamId2,false)
			SendEvent(EVENT_HIDE_TEAM2_TIMER)
			--VehicleRepair(self.MissionCar2)
			VehicleSetCarDoorLocks(self.MissionCar2,CARLOCK_TEAM2_LOCKED)
			VehicleSetTyresNoBurst(self.MissionCar2,true)
			self.team2CarStolen = false
			self.team2ShortTimerCounting = false
		else
			if VehicleGetDriverTeam(self.MissionCar2) ~= self.team2CarLastDriverTeam then
				if VehicleGetDriverTeam(self.MissionCar2) == teamId1 then
					VehicleSetHealth(self.MissionCar2,1000)
				end
				--self.team2CarLastDriverTeam = VehicleGetDriverTeam(self.MissionCar2)
			end
			--make our car invincibubble
			if VehicleGetDriverTeam(self.MissionCar2) ~= teamId1 then
				--print("Setting health high for MC2 ")
				VehicleSetHealth(self.MissionCar2,10000)
			end
		end
		
		if IsPosInArea(car2Pos,self.CarDealershipDrop1,self.CarDealershipDrop1[4]) then
			if not self.team2CarInEnemyBay then
				self.team2CarInEnemyBay = true
				SendEvent(EVENT_TEAM2_CAR_ENTERING_ENEMY_BAY)
			end
		elseif self.team2CarInEnemyBay then
			self.team2CarInEnemyBay = false
			SendEvent(EVENT_TEAM2_CAR_LEAVING_ENEMY_BAY)
		end
	end
	
	if (not self.team1CarStolen and self.team2CarInEnemyBay) then
		SetTeamScore(teamId1,GetTeamScore(teamId1)+1)
		
		if (self.scorelimit) then
			print ("checking team score")
			local scoreleft = self.scorelimit - GetTeamScore(teamId1)
			print("scoreleft is "..scoreleft)
			if (scoreleft <= 0) then
				SendEvent(EVENT_GAME_OVER)
			end
		end
		 
		SendEvent(EVENT_HIDE_TEAM2_TIMER)
		self:KickDriverOutOfCar(self.MissionCar2)
		--VehicleSetPosition(self.MissionCar2,self.CarDealership2)
		DeleteVehicle(self.MissionCar2)
		self.MissionCar2 = CreateVehicle( 140, self.CarDealership2, self.CarDealership2Heading, 3)
		VehicleSetCarDoorLocks(self.MissionCar2,CARLOCK_TEAM2_LOCKED)
		VehicleSetTyresNoBurst(self.MissionCar2,true)
		
	end
	
	if (not self.team2CarStolen and self.team1CarInEnemyBay) then
		SetTeamScore(teamId2,GetTeamScore(teamId2)+1)
		if (self.scorelimit) then
			print ("checking team score")
			local scoreleft = self.scorelimit - GetTeamScore(teamId2)
			print("scoreleft is "..scoreleft)
			if (scoreleft <= 0) then
				SendEvent(EVENT_GAME_OVER)
			end
		end
		SendEvent(EVENT_HIDE_TEAM1_TIMER)
		self:KickDriverOutOfCar(self.MissionCar1)
		--VehicleSetPosition(self.MissionCar1,self.CarDealership1)
		DeleteVehicle(self.MissionCar1)
		self.MissionCar1 = CreateVehicle( 140, self.CarDealership1, self.CarDealership1Heading, 54)
		VehicleSetCarDoorLocks(self.MissionCar1,CARLOCK_TEAM1_LOCKED)
		VehicleSetTyresNoBurst(self.MissionCar1,true)
		
	end
	
	
	if (VehicleHealth(self.MissionCar1) <= 0 or IsVehicleWrecked(self.MissionCar1)) then
		--DeleteVehicle(self.MissionCar1)
		
		--Add the car to the deletion list
		table.insert(self.carsToBeDeleted,self.MissionCar1)
		self.MissionCar1 = nil
		collectgarbage()
		--Wait(2000)
		self.MissionCar1 = CreateVehicle( 140, self.CarDealership1, self.CarDealership1Heading, 54)
	end
	
	if (VehicleHealth(self.MissionCar2) <= 0 or IsVehicleWrecked(self.MissionCar2)) then
		
		table.insert(self.carsToBeDeleted,self.MissionCar2)
		--DeleteVehicle(self.MissionCar2)
		self.MissionCar2 = nil
		collectgarbage()
		--Wait(2000)
		self.MissionCar2 = CreateVehicle( 140, self.CarDealership2, self.CarDealership2Heading, 3)
	end
	
	
	for i,value in ipairs(self.carsToBeDeleted) do
		
		if VehicleGetDriverTeam(value) == -1 then
			print "Deleting a car!"
			DeleteVehicle(value)
			table.remove(self.carsToBeDeleted,i)
		end
	end
	
		
	--check to see if each cars timer has run out
	if self.team1CarStolen then
		local timeRemaining = GetTeamTimer(teamId1)
		if timeRemaining < 0 then
			if VehicleHealth(self.MissionCar1)  ~= 1 then
				VehicleSetHealth(self.MissionCar1,1)
				SetTeamTimerCounting(teamId1,false)
				SendEvent(EVENT_HIDE_TEAM1_TIMER)
			end
		end
	end
	
	if self.team2CarStolen then
		local timeRemaining = GetTeamTimer(teamId2)
		if timeRemaining < 0 then
			if VehicleHealth(self.MissionCar2) ~= 1 then
				VehicleSetHealth(self.MissionCar2,1)
				SetTeamTimerCounting(teamId2,false)
				SendEvent(EVENT_HIDE_TEAM2_TIMER)
			end
		end
	end
	
	--Handle the driver changing
	local car1DriverTeam = VehicleGetDriverTeam(self.MissionCar1)
	if (car1DriverTeam ~= self.team1CarLastDriverTeam) then
		print("team1 driver team change\n");
		if self.team1CarStolen then
			if car1DriverTeam == teamId2 then
				SetTeamTimerCounting(teamId1,false)
				--SendEvent(EVENT_HIDE_TEAM1_TIMER)
			else
				SetTeamTimerCounting(teamId1,true)
				--SendEvent(EVENT_SHOW_TEAM1_TIMER)
			end
		end
		
		self.team1CarLastDriverTeam = car1DriverTeam
		--Update the driver text
		self.team1WhoInText:Text("^s^".. VehicleGetDriverName(self.MissionCar1))
		
		if (self.team1CarLastDriverTeam == teamId1) then
			self.team1WhoInText:Colour(self.team1Colour)
			if (not self.team1CarStolen) then
				VehicleSetCarDoorLocks(self.MissionCar1,CARLOCK_UNLOCKED)
			end	
		elseif (self.team1CarLastDriverTeam == teamId2) then
			self.team1WhoInText:Colour(self.team2Colour)
			if (not self.team1CarStolen) then
				VehicleSetCarDoorLocks(self.MissionCar1,CARLOCK_UNLOCKED)
			end	
		else
			self.team1WhoInText:Colour({255,255,255,255})
			if (not self.team1CarStolen) then
				VehicleSetCarDoorLocks(self.MissionCar1,CARLOCK_TEAM1_LOCKED)				
			end	
		end
		
		
	end
	
	
	local car2DriverTeam = VehicleGetDriverTeam(self.MissionCar2)
	if (car2DriverTeam ~= self.team2CarLastDriverTeam) then
		print("team2 driver team change\n");
		if self.team2CarStolen then
			if car2DriverTeam == teamId1 then
				SetTeamTimerCounting(teamId2,false)
				--SendEvent(EVENT_HIDE_TEAM2_TIMER)
			else
				SetTeamTimerCounting(teamId2,true)
				--SendEvent(EVENT_SHOW_TEAM1_TIMER)
			end
		end

		self.team2CarLastDriverTeam = car2DriverTeam
		--Update the driver text
		self.team2WhoInText:Text("^s^"..VehicleGetDriverName(self.MissionCar2))
		
		if (self.team2CarLastDriverTeam == teamId1) then
			self.team2WhoInText:Colour(self.team1Colour)	
			if (not self.team1CarStolen) then
				VehicleSetCarDoorLocks(self.MissionCar2,CARLOCK_UNLOCKED)
			end	
		elseif (self.team2CarLastDriverTeam == teamId2) then
			self.team2WhoInText:Colour(self.team2Colour)
			if (not self.team1CarStolen) then
				VehicleSetCarDoorLocks(self.MissionCar2,CARLOCK_UNLOCKED)
			end	
		else
			self.team2WhoInText:Colour({255,255,255,255})
			if (not self.team1CarStolen) then
				VehicleSetCarDoorLocks(self.MissionCar1,CARLOCK_TEAM2_LOCKED)
			end	
		end
		
	end
	
	if self.team1ShortTimerCounting then
		if VehicleGetDriverTeam(self.MissionCar1) == teamId2 then
			SetTeamTimer(teamId1,60000)
			self.team1ShortTimerCounting = false
		end
	end
	
	if self.team2ShortTimerCounting then
		if VehicleGetDriverTeam(self.MissionCar2) == teamId1 then
			SetTeamTimer(teamId2,60000)
			self.team2ShortTimerCounting = false
		end
	end
end


function CTF:DoClientLogic()
	local player = Player()
	if GetTeamScore(teamId1) != self.scores[1] then
		--self:PrintTeamScoreMsg(teamId1)
		--self:DisplayMessage('^s^ ~w~ Red Team\'s ~r~ car ~w~ has been captured!',2000)
		self:DisplayMessage("^T^MPRDCAP",2000)
		self.scores[1] = GetTeamScore(teamId1)
	end
	
	if GetTeamScore(teamId2) != self.scores[2] then
		--self:PrintTeamScoreMsg(teamId2)
		--self:DisplayMessage('^s^ ~w~ Blue Team\'s ~b~ car ~w~ has been captured!',2000)
		self:DisplayMessage("^T^MPBLCAP",2000)
		self.scores[2] = GetTeamScore(teamId2)
	end
	
	while(not IsEventStackEmpty()) do
		print("got to switch(ish) statement")
		local event = GetEvent()
		if(event == EVENT_TEAM1_CAR_STOLEN) then
		--Team 1 car stolen
			if player:TeamId() == teamId1 then
				--Add a waypoint marker to show where the car should be returned
				self.ourCarIsSafe = false
				self.team1OwnCarWP = SetHalo(self.CarDealership1, 0, self.team2Colour, self.CarDealership1[4]*2)
				--CTF:PrintCarStolenMsg();
			end
			--self:DisplayMessage('^s^ ~w~ Blue team\'s ~b~ car ~w~ has been stolen!',2000)
			self:DisplayMessage('^T^MPBLST',2000)
		elseif(event == EVENT_TEAM1_CAR_OOP) then
			if player:TeamId() == teamId1 then
				--Add a waypoint marker to show where the car should be returned
				self.ourCarIsSafe = false
				self.team1OwnCarWP = SetHalo(self.CarDealership1, 0, self.team2Colour, self.CarDealership1[4]*2)
				
			end
			--self:DisplayMessage('^s^ Blue team car is out of position',2000)		
			self:DisplayMessage("^T^MPBLPOS",2000)
		elseif(event == EVENT_TEAM1_CAR_RETURNED) then
		--Team 1 car returned
			if player:TeamId() == teamId1 then
				self.ourCarIsSafe = true
				
				if self.team1OwnCarWP then
					self.team1OwnCarWP:Remove()
					--CTF:PrintCarReturnedMsg();
				end
			end
			self.showTeamTimer1 = false
			self:RemoveTeamTimer(teamId1)
			--self:DisplayMessage('^s^ ~w~ Blue team\'s ~b~ car ~w~ has been returned.',2000)
			self:DisplayMessage("^T^MPBLRET",2000)
		
		elseif(event == EVENT_TEAM2_CAR_STOLEN) then
		--Team 2 car stolen
			if player:TeamId() == teamId2 then
				self.ourCarIsSafe = false
				self.team2OwnCarWP = SetHalo(self.CarDealership2, 0, self.team1Colour, self.CarDealership2[4]*2 )
				--CTF:PrintCarStolenMsg();
			end

			--self:DisplayMessage('^s^ ~w~ Red team\'s ~r~ car ~w~ has been stolen!',2000)
			self:DisplayMessage("^T^MPRDST",2000)
		elseif(event == EVENT_TEAM2_CAR_OOP) then
			if player:TeamId() == teamId2 then
				--Add a waypoint marker to show where the car should be returned
				self.ourCarIsSafe = false
				self.team2OwnCarWP = SetHalo(self.CarDealership2, 0, self.team1Colour, self.CarDealership2[4]*2)
				
			end
--			self:DisplayMessage('^s^ Red team car is out of position',2000)
			self:DisplayMessage("^T^MPRDPOS",2000)
		elseif(event == EVENT_TEAM2_CAR_RETURNED) then
		--Team 2 car returned
			if player:TeamId() == teamId2 then
				self.ourCarIsSafe = true
				
				if self.team2OwnCarWP then
					self.team2OwnCarWP:Remove()
					--CTF:PrintCarReturnedMsg();
				end			
			end
			self.showTeamTimer2 = false
			self:RemoveTeamTimer(teamId2)
			--self:DisplayMessage('^s^ ~w~ Red team\'s ~r~ car ~w~ has been returned.',2000)
			self:DisplayMessage("^T^MPRDRET",2000)
		
		elseif(event == EVENT_TEAM1_CAR_ENTERING_ENEMY_BAY) then
			if player:TeamId() == teamId2 then
				self.weHaveTheirCar = true
				print("removing team2 target bay WP")
				self.enemyCarWP:Remove()
			end
		
		
		elseif(event == EVENT_TEAM1_CAR_LEAVING_ENEMY_BAY) then
			if player:TeamId() == teamId2 then
				self.weHaveTheirCar = false
				self.enemyCarWP = SetHalo(self.CarDealershipDrop2, 0, self.team2Colour, self.CarDealershipDrop2[4]*2)
			end
		
		elseif(event == EVENT_TEAM2_CAR_ENTERING_ENEMY_BAY) then
			if player:TeamId() == teamId1 then
				self.weHaveTheirCar = true
				print("removing team1 target bay WP")
				self.enemyCarWP:Remove()
			end
		
		elseif(event == EVENT_TEAM2_CAR_LEAVING_ENEMY_BAY) then
			if player:TeamId() == teamId1 then
				self.weHaveTheirCar = false
				self.enemyCarWP = SetHalo(self.CarDealershipDrop1, 0, self.team1Colour, self.CarDealershipDrop1[4]*2)
			end
			
		elseif(event == EVENT_SHOW_TEAM1_TIMER) then
			print("Setting show team 1 timer")
			self:DisplayTeamTimer(teamId1)
			self.showTeamTimer1 = true
		
		
		elseif(event == EVENT_SHOW_TEAM2_TIMER) then
			print("Setting show team 2 timer")
			self:DisplayTeamTimer(teamId2)
			self.showTeamTimer2 = true
			
		
		elseif(event == EVENT_HIDE_TEAM1_TIMER) then
			self.showTeamTimer1 = false
			self:RemoveTeamTimer(teamId1)
		
		
		elseif(event == EVENT_HIDE_TEAM2_TIMER) then
			self.showTeamTimer2 = false
			self:RemoveTeamTimer(teamId2)
		
		elseif(event == EVENT_GAME_OVER) then
			self.state = 'StateGameWon'	
		end
		
		
	end
	
	if (self.showTeamTimer1 == true) then
		self:UpdateTeamTimer(teamId1)
	end
	
	if (self.showTeamTimer2 == true) then
		self:UpdateTeamTimer(teamId2)
	end
	
end

function CTF:DoSpawn(initialSpawn)

	local player = Player()	
	local i = 1
	local spawnLocs
	local team = player:TeamId()
	
	if (initialSpawn) then
		if team==teamId1 then 
			spawnLocs = self.Team1InitSpawns
		else 
			spawnLocs = self.Team2InitSpawns
		end
	else
		if team==teamId1 then 
			spawnLocs = self.Team1Spawns
		else 
			spawnLocs = self.Team2Spawns
		end
	end
	 
	main.vSpawnPoints = spawnLocs
	DoSpawn()
	
	-- check to make sure nobody near ere...
	--while LocatePlayer( unpack( spawnLocs ) ) do
	--	print("inside LocatePlayer While")
	--	i = math.random( 1, table.getn(spawnLocs) )
	--end	
	
	--i = math.random(1,table.getn(spawnLocs))
	
	--print("Respawn at point" .. i)
	--local playerpos = spawnLocs[i]
	--print("Spawn Loc X:"..playerpos[1].." Y:"..playerpos[2].." Z:"..playerpos[3])
	--player:Respawn(playerpos,playerpos[4])
end

function CTF:CleanUp()
		
	-- the server needs to terminate its extra thread 
	if IsServer() then
		self.CTFServerLogic:Stop()
	end
	
	self.CTFMessageDisplay:Stop()
	
	-- restore the camera if quit early..
	RestoreCamera( 0, newplayer )
end

function CTF:Commentate(text)
    main.commentary:Print(text)
end


--Function takes a xyz coord for the test object, an xyz coord for the test area, and a radius for the test area
function IsPosInArea(objCoords,areaCoords,radius)
	local relpos = {0,0,0}
	
	relpos[1] = objCoords[1] - areaCoords[1]
	relpos[2] = objCoords[2] - areaCoords[2]
	relpos[3] = objCoords[3] - areaCoords[3]
	
	
	local distSqr = 0;
	distSqr = distSqr + (relpos[1] * relpos[1])
	distSqr = distSqr + (relpos[2] * relpos[2])
	distSqr = distSqr + (relpos[3] * relpos[3])
	
	if distSqr < (radius * radius) then
		return true
	else
		return false
	end
end

function printcoords(coords)
	print(string.format("X[%f] Y[%f] Z[%f]\n",coords[1],coords[2],coords[3]))
end

function CTF:RegisterPlayerKill(player, killer, headshot)
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

function CTF:TeamScore(team)
	return self.scores[team+1] or 0
end

function CTF:DisplayTeamTimer(team)
	
	local timeRemaining = GetTeamTimer(team)
	local minutes = math.floor((timeRemaining / 1000) / 60)
	timeRemaining = timeRemaining - (minutes*(1000*60))
	local seconds = timeRemaining / 1000
	local str = string.format("%.2d:%.2d", minutes, seconds)
	
	local player = Player()
	
	local text
	if team == teamId1 and not self.team1TimerText then
		self.team1TimerText = TextSprite(player, 200, 20, 2)
		text = self.team1TimerText
	elseif team == teamId2 and not self.team2TimerText then
		self.team2TimerText = TextSprite(player, 200, 35, 2)
		text = self.team2TimerText
	else
		--Either there is allready a textsprite assigned, or this is an unknown team
		--we run away and hide in both situations.
		return
	end
	text:Scale(0.5)
	text:Style(1)
	if (team == teamId1) then
		text:Colour(self.team1Colour)
	else
		text:Colour(self.team2Colour)
	end
	text:Text("^s"..str)
	
end

function CTF:UpdateTeamTimer(team)

	local text
	if team == teamId1 then
		text = self.team1TimerText
	else
		text = self.team2TimerText
	end
	
	if not text then
		print("trying to update a non existant CTF timer")
		return
	end
	
	local timeRemaining = GetTeamTimer(team)
	local minutes = math.floor((timeRemaining / 1000) / 60)
	timeRemaining = timeRemaining - (minutes*(1000*60))
	local seconds = timeRemaining / 1000
	local str = string.format("%.2d:%.2d", minutes, seconds)
	
	--Nasty little fix to stopped wrapped timer on CTF display
	if minutes > 1 then
		str = ''
	end
	
	local player = Player()
	
	
	
	text:Text("^s"..str)
	
end

function CTF:RemoveTeamTimer(team)
	local text = nil
	if team == teamId1 then
		if self.team1TimerText then
			text = self.team1TimerText
			self.team1TimerText = nil
		end
	else
		if self.team2TimerText then
			text = self.team2TimerText
			self.team2TimerText = nil
		end
	end
	
	if text then
		text:Remove()
		text = nil
	end
end

--Done by the server thread to update the flag vehicle blip positions
function CTF:UpdateRadar()	
	if self.MissionCar1 then
		local pos = VehiclePosition(self.MissionCar1)
		pos[3] = pos[3] + 1000
		
		if self.team1FlagBlip then
			UpdateBlipCoord(self.team1FlagBlip,pos)
		elseif VehicleHealth(self.MissionCar1) > 0 then
			self.team1FlagBlip = AddBlipForCoord(pos,team1RadarColour,pickupicon.objective)
		end 
	end

	if self.MissionCar2 then
		local pos = VehiclePosition(self.MissionCar2)
		pos[3] = pos[3] + 1000
		
		if self.team2FlagBlip then
			UpdateBlipCoord(self.team2FlagBlip,pos)
		elseif VehicleHealth(self.MissionCar2) > 0 then
			self.team2FlagBlip = AddBlipForCoord(pos,team2RadarColour,pickupicon.objective)
		end 
	end
end


function CTF:DisplayMessage(theText, length, colour)	
	
	--Add the message to the messagwe queue
	local messageData = {}
	messageData["msg"] = theText
	messageData["length"] = length
	messageData["colour"] = colour
	table.insert(self.MessageDisplayQueue,messageData)
end

function CTFKickOutOfCar:Cleanup()
end

function CTF:KickDriverOutOfCar(car)
	print("Kick driver out of car")
	self.carToKickDriverOutOf = car
	self.isDriverKickedOutOfCar = false
	self.KickDriverOutOfCar = CTFKickOutOfCar()
	self.KickDriverOutOfCar:Start()
	while self.isDriverKickedOutOfCar == false do
		Wait(0)
	end
	
	self.carToKickDriverOutOf = nil
end

function CTFKickOutOfCar:Run()
	VehicleSetEmergencyStop(main.game.carToKickDriverOutOf,true)
	Wait(500)
	VehicleForceOutPeds(main.game.carToKickDriverOutOf)
	Wait(3000)
	VehicleSetEmergencyStop(main.game.carToKickDriverOutOf,false)
	main.game.isDriverKickedOutOfCar = true
end

function CTFMessageDisplay:CleanUp()
	print('Message Display CLEANUP')
end


function CTFMessageDisplay:Run()
	local player = Player()
	
	
	while 1 do
		if (table.getn(main.game.MessageDisplayQueue) > 0) then
			local text = TextSprite(player, 385, 70, 2)
			print("PRINTING MESSAGE THROUGH DISPLAY QUEUE")
			local messagedata = table.remove(main.game.MessageDisplayQueue,1)
			text:Scale(0.7)
			text:Style(2)
			--if (main.game.MsgColour) then
			--	text:Colour(main.game.MsgColour)
			--end
			text:Text(messagedata["msg"])
			Wait(messagedata["length"])
			text:Remove()
		end
		Wait(10)
	end
end 

function CTF:InitGame()
	-- reset the game timer 
	GameElapsedMs(0)
	print("Game Location Is: ", GameLocation())
	if GameLocation() == 0 then
	
		self.CarDealership1 = {1232.5714,-87.1016,11.7673,5}
		self.CarDealership1Heading = 90.0655 
		self.CarDealershipDrop1 = {1231.7108,-103.4972,13.3987,5}
		self.CarDealershipCabin1 = {1244.6340, -94.8901, 12.2382}
		self.CarDealershipCabinHeading1 = 280.0
	
		self.CarDealership2 = {907.4211,-897.7053,13.9333,5}
		self.CarDealership2Heading = 180.5468
		self.CarDealershipDrop2 = {916.7495,-900.9651,13.9333,5}
		self.CarDealershipCabin2 = {931.5425, -901.4952, 13.5335}
		self.CarDealershipCabinHeading2 = 264.0
										
		self.Team1InitSpawns = {
							{{1245.5764, -119.3942, 13.9326}, 49.8267},
							{{1215.7571, -118.3896, 13.9326}, 359.5657},
							{{1216.8038, -65.0373, 9.5535}, 177.6218},
							{{1238.3368, -72.7951, 10.3317}, 141.8636},
							}
		self.Team1Spawns = {
							{{1141.7538, 39.4818, -1.5354}, 206.0494},
							{{1142.1028, -92.7100, 6.4345}, 309.8683},
							{{1104.2711, -108.6361, 8.3340}, 235.2965},
							{{1340.1337, -29.3839, 13.6599}, 80.7714},
							}
							
		self.Team2InitSpawns = {
							{{897.8068, -904.9676, 13.9333}, 199.0864},
							{{930.8286, -894.0044, 13.9340}, 120.1053},
							{{920.5967, -915.8045, 13.9334}, 40.9089},
							{{898.8245, -893.7159, 13.9333}, 188.5873},
							}
							
		self.Team2Spawns =  {
							{{1016.6302, -854.1656, 13.9298}, 188.5873},
							{{870.8047, -992.8137, 4.0137}, 224.8946},
							{{978.1308, -740.1743, 13.9329}, 156.1697},
							{{771.5789, -779.2554, 13.7052}, 209.5637 },
							}
									
	elseif GameLocation() == 1 then
		self.CarDealership1 = {340.8907, -1058.9139, 24.9564,5}
		self.CarDealership1Heading =  90.6019
		self.CarDealershipDrop1 = {340.8791, -1065.6602, 24.9564,5}
		self.CarDealershipCabin1 = {-58.9795, -1466.4183, 24.6041 }
		self.CarDealershipCabinHeading1 = 270.0
	
		self.CarDealership2 = {-75.5708, -1458.8881, 25.1041,5}
		self.CarDealership2Heading = 270.1214
		self.CarDealershipDrop2 = {-76.6505, -1466.8876, 25.1041,5}
		self.CarDealershipCabin2 = {329.0640, -1080.0, 24.4564}
		self.CarDealershipCabinHeading2 = 180.0
		
		
		self.Team1InitSpawns =  {
							{{322.3411, -1055.8333, 24.9564}, 220.0321},
							{{359.1031, -1056.7825, 24.9564}, 117.5816},
							{{321.5251, -1072.3105, 24.9564}, 264.1837},
							{{361.6044, -1073.0287, 24.9564}, 64.4156}, 
								}
								
		self.Team1Spawns =  {
							{{202.9520, -1007.3057, 25.1053}, 70.0448}, 
							{{327.8558, -1000.6812, 25.0521}, 133.1441},
							{{237.4705, -1125.2434, 25.1263}, 181.1538},
							{{361.2229, -1201.7072, 25.1268}, 184.1448},						
							}
							
		self.Team2InitSpawns =  {
							{{-112.3078, -1441.3772, 25.1041}, 219.8633},
							{{-54.3200, -1440.5249, 25.1041}, 133.8662}, 
							{{-57.5810, -1487.8593, 25.1041}, 41.4029}, 
							{{-89.5294, -1485.6160, 25.1041}, 338.4181}, 
								}
								
		self.Team2Spawns =  {
							{{-101.3633, -1274.2051, 25.2598}, 153.1491},
							{{-213.2106, -1443.8563, 24.9768}, 328.5909},
							{{74.0989, -1548.3989, 27.2541}, 88.9048},  
							{{107.5575, -1398.7982, 20.7603}, 265.7173}, 
							}
	else
		

		self.CarDealership1 = {-661.2014, 74.7028, 17.6722,5} 
		self.CarDealership1Heading = 271.0901             
		self.CarDealershipDrop1 = {-669.8249, 87.3160, 17.7343,5}
		self.CarDealershipCabin1 = {-671.0649, 96.5543, 17.7154} 
		self.CarDealershipCabinHeading1 = 90.000              

		self.CarDealership2 = {-714.7087, 202.3628, 27.6714,5}
		self.CarDealership2Heading = 180.6782             
		self.CarDealershipDrop2 = {-723.7484, 188.9629, 27.6714,5}
		self.CarDealershipCabin2 = {-720.3790, 182.6423, 27.6714} 
		self.CarDealershipCabinHeading2 = 180.0000           
		
		self.Team1InitSpawns =  {
			{{-686.5741, 76.2871, 17.8006}, 13.0018},     
			{{-688.8741, 100.6959, 17.7606}, 226.2985},   
			{{-671.7313, 63.5963, 17.7002}, 359.3725},    
			{{-643.7480, 80.1658, 17.7183}, 62.7505},     
		}
		
		self.Team1Spawns =  {
			{{-644.5105, -26.6813, 17.8226}, 58.5638},    
			{{-666.1693, -4.3022, 17.8226}, 50.4840},     
			{{-547.8697, 123.3818, 16.9394}, 50.4840},    
			{{-552.5445, -29.7968, 13.5731}, 100.7629},   
		}
		
		self.Team2InitSpawns =  {
			{{-707.7809, 202.2190, 27.6714}, 142.8020},
			{{-741.2185, 201.9469, 27.6714}, 146.9903},
			{{-767.7602, 192.0488, 27.6727}, 193.4055},
			{{-757.5176, 173.7704, 27.7848}, 297.1597},
		}
		
		self.Team2Spawns =  {
			{{-746.5695, 273.5450, 53.1422}, 178.8250},
			{{-715.1263, 257.2971, 52.9928}, 181.9062},
			{{-597.3809, 204.7100, 45.0581}, 197.3230},
			{{-575.4649, 181.0112, 42.8673}, 148.0049},
		}
	end
	
	self.mypickups = PickupMgr()
	self.mypickups:CreatePickups()
	
	if IsServer() then
		if UsePowerups() then
			local mytimer = PowerupTimer()
			mytimer:Start()
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
	
	main.game = CTF():Start()
	
	main:Start()
end
