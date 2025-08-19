require "gta"
require "mainloop"
require "spawn"
require "PowerUps"
require "Pickups"
require "CutscenePlayer"

PowerUpTimer = PowerupTimer()
CTF = StateMachine{"StateInit"}
CTFServerLogic = Script{}
CTFMessageDisplay = Script{}
CTFKickOutOfCar = Script{}
CTFCarDeleteDelay = Script{}

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
team1RadarColour = 0
team2RadarColour = 2
hornDebounce = false
team1TextY = 102
team2TextY = 146
limoVelMaxMag = 0.7
limoSpeedCapMod = 0.98
CAR_MODELID = 140

function CTF:StateInit()
    while not IsServer() and PlayerId() == 0 do
        Wait(100)
    end

    GenerateAmbients(false)
    self.colourTest = 0
    self.scores = {0, 0, 0}
    self.team1CarStolen = false
    self.team2CarStolen = false
    self.team1CarInEnemyBay = false
    self.team2CarInEnemyBay = false
    self.team1CarLastDriverTeam = -1
    self.team2CarLastDriverTeam = -1
    self.team1CarLastDriver = -1
    self.team2CarLastDriver = -1
    self.team1ShortTimerCounting = false
    self.team2ShortTimerCounting = false
    self.carToKickDriverOutOf = nil
    self.isDriverKickedOutofCar = true
    UseSuperBrakeOnPause(false)

    if GameScoreLimit() > 0 then
        self.scorelimit = GameScoreLimit()
        print("Setting game score limit to " .. self.scorelimit)
    else
        self.scorelimit = nil
    end

    self.carsToBeDeleted = {}
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
    self.gameFinishing = false
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
        self.MissionCar1 = CreateVehicle(CAR_MODELID, self.CarDealership1, self.CarDealership1Heading, 3)
        VehicleSetCarDoorLocks(self.MissionCar1, CARLOCK_TEAM1_LOCKED)
        VehicleSetTyresNoBurst(self.MissionCar1, true)
        VehicleAdd3dMarker(self.MissionCar1)
        print("Creating Vehicle 2")
        self.MissionCar2 = CreateVehicle(CAR_MODELID, self.CarDealership2, self.CarDealership2Heading, 7)
        VehicleSetCarDoorLocks(self.MissionCar2, CARLOCK_TEAM2_LOCKED)
        VehicleSetTyresNoBurst(self.MissionCar2, true)
        VehicleAdd3dMarker(self.MissionCar2)
    end
    
    Wait(2000)
    print("Calling DoSpawn with true")
    self:DoSpawn(true)
    print("Checking IsServer")

    if player:TeamId() == teamId1 then
        self.enemyCarWP = SetHalo(self.CarDealershipDrop1, 0, teamId1, self.CarDealershipDrop1[4] * 2)
    else
        self.enemyCarWP = SetHalo(self.CarDealershipDrop2, 0, teamId2, self.CarDealershipDrop2[4] * 2)
    end
    self.team1FlagBlip = nil
    self.team2FlagBlip = nil
    RenderHudExtras(false)

    if not NoFuckingCutscene() then
        main.scores:Hide(true)
        Wait(0)
        while SyncCutScene() == false do
            Wait(5)
        end
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

    GenerateAmbients(true)
    RenderHudExtras(true)
    self:ClientInit()

    if IsServer() then
        SetTeamScore(teamId1, self.scores[1])
        SetTeamScore(teamId2, self.scores[2])
        self.CTFServerLogic = CTFServerLogic()
        self.CTFServerLogic:Start()
    end
    
    self.CTFMessageDisplay = CTFMessageDisplay()
    self.CTFMessageDisplay:Start()
    UpdateGameTime(true)
    SetTeamTimer(teamId1, 60000)
    self:DisplayTeamTimer(teamId1)
    self.showTeamTimer1 = true
    SetTeamTimer(teamId2, 60000)
    self:DisplayTeamTimer(teamId2)
    self.showTeamTimer2 = true

    if IsServer() then
        print("Entering ServerInit()")
        self:ServerInit()
    end

    TeamGameEveryoneIn()
    return "StateRunning"
end

function CTF:ServerInit()
    local players = AllPlayers()
    self.team1WhoInText = {}
    self.team1WhoInText = TextSprite(players, 470, team1TextY, 2)
    self.team1WhoInText:Style(1)
    self.team1WhoInText:Scale(0.4084)
    self.team1WhoInText:Colour({255, 255, 255, 255})
    self.team1WhoInText:Text("^T^MPEMPTY")
    self.team2WhoInText = {}
    self.team2WhoInText = TextSprite(players, 470, team2TextY, 2)
    self.team2WhoInText:Style(1)
    self.team2WhoInText:Scale(0.4084)
    self.team2WhoInText:Colour({255, 255, 255, 255})
    self.team2WhoInText:Text("^T^MPEMPTY")
end

function CTF:ClientInit()
    local player = Player()
    local opponents = {}

    if player:TeamId() == teamId1 then
        self.baseBlip = AddBlipForCoord(player, self.CarDealership1, team1RadarColour, pickupicon.base)
        self.enemyBaseBlip = AddBlipForCoord(player, self.CarDealership2, team2RadarColour, pickupicon.base)
        opponents = TeamPlayers(teamId2)
        self.team1CarNameText = {}
        self.team2CarNameText = {}
    else
        self.baseBlip = AddBlipForCoord(player, self.CarDealership2, team2RadarColour, pickupicon.base)
        self.enemyBaseBlip = AddBlipForCoord(player, self.CarDealership1, team1RadarColour, pickupicon.base)
        opponents = TeamPlayers(teamId1)
        self.team1CarNameText = {}
        self.team2CarNameText = {}
    end

    for _, opponent in pairs(opponents) do
        opponent:SetRadarBlipShortRange(true)
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
    self.mypickups:Cleanup()
    RenderHudExtras(false)
end

function CTF:StateRunning()
    local player = Player()
    RenderHudExtras(false)

    if not player:IsPlaying() then
        DoWasted()
        self:DoSpawn()
    end

    RenderHudExtras(true)

    if IsPlayerPressingHorn(player) then
        if not hornDebounce then
            print("Horntest on")
            hornDebounce = true
        end
    end

    if not IsPlayerPressingHorn(player) then
        hornDebounce = false
    end

    self:DoClientLogic()
    collectgarbage()
end

function CTF:StateGameWon()
    UpdateGameTime(false)
    local msg = nil
    local player = Player()
    local match_result = nil
    local winner = nil

    if self.scores[1] > self.scores[2] then
        msg = "^T^MTN_2"
        if player:TeamId() == teamId1 then
            match_result = 1
        else
            match_result = 2
        end
        winner = teamId1
    elseif self.scores[1] < self.scores[2] then
        msg = "^T^MTN_1"
        if player:TeamId() == teamId2 then
            match_result = 1
        else
            match_result = 2
        end
        winner = teamId2
    else
        msg = nil
        match_result = 0
    end
    
    while 0 < table.getn(self.MessageDisplayQueue) do
        Wait(0)
    end

    DisplayFinalWinLoseMessage(match_result, "^S^", winner)
    main.scores:ToggleUpdate(false)
    main.scores:Show(true)
    Wait(12000)
    main.scores:Hide()
    main:EndGame()
    return "StateRunning"
end

function CTF:DoServerLogic()
    local unused_lcl = Player()

    if GameTimeUp() then
        if not self.gameFinishing then
            SendEvent(EVENT_GAME_OVER)
            self.gameFinishing = true
        end
    end

    local position1 = VehiclePosition(self.MissionCar1)
    if position1 then
        if not IsPosInArea(position1, self.CarDealership1, self.CarDealership1[4]) then
            if not self.team1CarStolen then
                if VehicleGetDriverTeam(self.MissionCar1) == teamId2 then
                    print("team1 car stolen")
                    SetTeamTimer(teamId1, 60000)
                    SendEvent(EVENT_TEAM1_CAR_STOLEN)
                else
                    SetTeamTimer(teamId1, 10000)
                    self.team1ShortTimerCounting = true
                    SetTeamTimerCounting(teamId1, true)
                    SendEvent(EVENT_TEAM1_CAR_OOP)
                end

                if self.team1FlagBlip == nil then
                    print("Adding team 1 car blip")
                    local position = VehiclePosition(self.MissionCar1)
                    position[3] = position[3] + 1000
                    self.team1FlagBlip = AddBlipForCoord(position, team1RadarColour, pickupicon.car)
                    if VehicleIsDrivenByPlayer(self.MissionCar1) then
                        if self.team1FlagBlip then
                            SetBlipVisibleForPlayerState(self.team1FlagBlip, self.team1CarLastDriver, false)
                        end
                    end
                end
                self.team1CarStolen = true
                VehicleSetCarDoorLocks(self.MissionCar1, CARLOCK_UNLOCKED)
                VehicleSetTyresNoBurst(self.MissionCar1, false)
                VehicleSetHealth(self.MissionCar1, 1000)
            end
        else
            if self.team1CarStolen and VehicleGetDriverTeam(self.MissionCar1) ~= teamId2 then
                self:KickDriverOutOfCar(self.MissionCar1)
                SendEvent(EVENT_TEAM1_CAR_RETURNED)
                SetTeamTimerCounting(teamId1, false)
                VehicleSetEmergencyStop(self.MissionCar1, false)
                VehicleSetCarDoorLocks(self.MissionCar1, CARLOCK_TEAM1_LOCKED)
                VehicleSetTyresNoBurst(self.MissionCar1, true)
                self.team1CarStolen = false
                self.team1ShortTimerCounting = false
                if self.team1FlagBlip then
                    print("Removing team 1 car blip(capped)")
                    RemoveBlip(self.team1FlagBlip)
                    self.team1FlagBlip = nil
                end
            else
                if
                VehicleGetDriverTeam(self.MissionCar1) ~= self.team1CarLastDriverTeam and
                VehicleGetDriverTeam(self.MissionCar1) == teamId2 then
                    VehicleSetHealth(self.MissionCar1, 1000)
                end
                if VehicleGetDriverTeam(self.MissionCar1) ~= teamId2 then
                    VehicleSetHealth(self.MissionCar1, 10000)
                end
            end
        end

        if IsPosInArea(position1, self.CarDealershipDrop2, self.CarDealershipDrop2[4]) then
            if not self.team1CarInEnemyBay then
                self.team1CarInEnemyBay = true
                SendEvent(EVENT_TEAM1_CAR_ENTERING_ENEMY_BAY)
            end
        else
            if self.team1CarInEnemyBay then
                self.team1CarInEnemyBay = false
                SendEvent(EVENT_TEAM1_CAR_LEAVING_ENEMY_BAY)
            end
        end
    end

    local position2 = VehiclePosition(self.MissionCar2)
    if position2 then
        local position2 = VehiclePosition(self.MissionCar2)  -- just can't get enough positions...
        if not IsPosInArea(position2, self.CarDealership2, self.CarDealership2[4]) then
            if not self.team2CarStolen then
                if VehicleGetDriverTeam(self.MissionCar2) == teamId1 then
                    print("team2 car stolen")
                    SetTeamTimer(teamId2, 60000)
                    SendEvent(EVENT_TEAM2_CAR_STOLEN)
                else
                    SetTeamTimer(teamId2, 10000)
                    SetTeamTimerCounting(teamId2, true)
                    self.team2ShortTimerCounting = true
                    SendEvent(EVENT_TEAM2_CAR_OOP)
                end

                if self.team2FlagBlip == nil then
                    print("Adding team 2 car blip")
                    local position = VehiclePosition(self.MissionCar2)
                    position[3] = position[3] + 1000
                    self.team2FlagBlip = AddBlipForCoord(position, team2RadarColour, pickupicon.car)
                    if VehicleIsDrivenByPlayer(self.MissionCar2) then
                        if self.team2FlagBlip then
                            SetBlipVisibleForPlayerState(self.team2FlagBlip, self.team2CarLastDriver, false)
                        end
                    end
                end
                VehicleSetCarDoorLocks(self.MissionCar2, CARLOCK_UNLOCKED)
                VehicleSetTyresNoBurst(self.MissionCar2, false)
                VehicleSetHealth(self.MissionCar2, 1000)
                self.team2CarStolen = true
            end
        else
            if self.team2CarStolen and VehicleGetDriverTeam(self.MissionCar2) ~= teamId1 then
                self:KickDriverOutOfCar(self.MissionCar2)
                SendEvent(EVENT_TEAM2_CAR_RETURNED)
                VehicleSetEmergencyStop(self.MissionCar2, false)
                SetTeamTimerCounting(teamId2, false)
                VehicleSetCarDoorLocks(self.MissionCar2, CARLOCK_TEAM2_LOCKED)
                VehicleSetTyresNoBurst(self.MissionCar2, true)
                self.team2CarStolen = false
                self.team2ShortTimerCounting = false
                if self.team2FlagBlip then
                    print("Removing team 1 car blip(capped)")
                    RemoveBlip(self.team2FlagBlip)
                    self.team2FlagBlip = nil
                end
            else
                if
                VehicleGetDriverTeam(self.MissionCar2) ~= self.team2CarLastDriverTeam and
                VehicleGetDriverTeam(self.MissionCar2) == teamId1 then
                    VehicleSetHealth(self.MissionCar2, 1000)
                end
                if VehicleGetDriverTeam(self.MissionCar2) ~= teamId1 then
                    VehicleSetHealth(self.MissionCar2, 10000)
                end
            end
        end

        if IsPosInArea(position2, self.CarDealershipDrop1, self.CarDealershipDrop1[4]) then
            if not self.team2CarInEnemyBay then
                self.team2CarInEnemyBay = true
                SendEvent(EVENT_TEAM2_CAR_ENTERING_ENEMY_BAY)
            end
        else
            if self.team2CarInEnemyBay then
                self.team2CarInEnemyBay = false
                SendEvent(EVENT_TEAM2_CAR_LEAVING_ENEMY_BAY)
            end
        end
    end

    if not self.team1CarStolen then
        if self.team2CarInEnemyBay then
            SetTeamScore(teamId1, GetTeamScore(teamId1) + 1)
            if self.scorelimit then
                print("checking team score")
                local points_left_to_win = self.scorelimit
                points_left_to_win = points_left_to_win - GetTeamScore(teamId1)
                print("scoreleft is " .. points_left_to_win)
                if points_left_to_win <= 0 then
                    if not self.gameFinishing then
                        SendEvent(EVENT_GAME_OVER)
                        self.gameFinishing = true
                    end
                end
            end

            self:KickDriverOutOfCar(self.MissionCar2)
            DeleteVehicle(self.MissionCar2)
            ClearArea(self.CarDealership2, 5)
            if self.team2FlagBlip then
                RemoveBlip(self.team2FlagBlip)
                self.team2FlagBlip = nil
                print("Removing team 2 car blip (during cap)")
            end
            self.MissionCar2 = CreateVehicle(CAR_MODELID, self.CarDealership2, self.CarDealership2Heading, 7)
            VehicleSetCarDoorLocks(self.MissionCar2, CARLOCK_TEAM2_LOCKED)
            VehicleSetTyresNoBurst(self.MissionCar2, true)
            VehicleAdd3dMarker(self.MissionCar2)
        end
    end

    if not self.team2CarStolen then
        if self.team1CarInEnemyBay then
            SetTeamScore(teamId2, GetTeamScore(teamId2) + 1)
            if self.scorelimit then
                print("checking team score")
                local points_left_to_win = self.scorelimit
                points_left_to_win = points_left_to_win - GetTeamScore(teamId2)
                print("scoreleft is " .. points_left_to_win)
                if points_left_to_win <= 0 then
                    if not self.gameFinishing then
                        SendEvent(EVENT_GAME_OVER)
                        self.gameFinishing = true
                    end
                end
            end
            
            self:KickDriverOutOfCar(self.MissionCar1)
            DeleteVehicle(self.MissionCar1)
            ClearArea(self.CarDealership1, 5)
            if self.team1FlagBlip then
                RemoveBlip(self.team1FlagBlip)
                self.team1FlagBlip = nil
                print("Removing team 1 car blip (during cap)")
            end
            self.MissionCar1 = CreateVehicle(CAR_MODELID, self.CarDealership1, self.CarDealership1Heading, 3)
            VehicleSetCarDoorLocks(self.MissionCar1, CARLOCK_TEAM1_LOCKED)
            VehicleSetTyresNoBurst(self.MissionCar1, true)
            VehicleAdd3dMarker(self.MissionCar1)
        end
    end

    if VehicleHealth(self.MissionCar1) <= 0 or IsVehicleWrecked(self.MissionCar1) then
        if self.team1FlagBlip then
            RemoveBlip(self.team1FlagBlip)
            self.team1FlagBlip = nil
            print("Removing team 1 car blip (blownup)")
        end

        table.insert(self.carsToBeDeleted, self.MissionCar1)
        VehicleRemove3dMarker(self.MissionCar1)
        self.MissionCar1 = nil
        self.MissionCar1 = CreateVehicle(CAR_MODELID, self.CarDealership1, self.CarDealership1Heading, 3)
        VehicleAdd3dMarker(self.MissionCar1)
    end

    if VehicleHealth(self.MissionCar2) <= 0 or IsVehicleWrecked(self.MissionCar2) then
        if self.team2FlagBlip then
            RemoveBlip(self.team2FlagBlip)
            self.team2FlagBlip = nil
            print("Removing team 2 car blip (blownup)")
        end

        table.insert(self.carsToBeDeleted, self.MissionCar2)
        VehicleRemove3dMarker(self.MissionCar2)
        self.MissionCar2 = nil
        self.MissionCar2 = CreateVehicle(CAR_MODELID, self.CarDealership2, self.CarDealership2Heading, 7)
        VehicleAdd3dMarker(self.MissionCar2)
    end

    for index, car in ipairs(self.carsToBeDeleted) do
        if VehicleGetDriverTeam(car) == -1 then
            print("Deleting a car!")
            self:DeleteCarWithDelay(car, 5000)
            collectgarbage()
            table.remove(self.carsToBeDeleted, index)
        end
    end

    if self.team1CarStolen then
        local timer = GetTeamTimer(teamId1)
        if timer < 0 then
            if VehicleHealth(self.MissionCar1) ~= 1 then
                VehicleSetHealth(self.MissionCar1, 1)
                SetTeamTimerCounting(teamId1, false)
                SetTeamTimer(teamId1, 60000)
            end
        end
    end
    if self.team2CarStolen then
        local timer = GetTeamTimer(teamId2)
        if timer < 0 then
            if VehicleHealth(self.MissionCar2) ~= 1 then
                VehicleSetHealth(self.MissionCar2, 1)
                SetTeamTimerCounting(teamId2, false)
                SetTeamTimer(teamId2, 60000)
            end
        end
    end

    local team1 = VehicleGetDriverTeam(self.MissionCar1)
    if team1 ~= self.team1CarLastDriverTeam then
        print("team1 driver team change\n")
        if self.team1CarStolen then
            if team1 == teamId2 then
                SetTeamTimerCounting(teamId1, false)
            else
                SetTeamTimerCounting(teamId1, true)
            end
        end
        self.team1CarLastDriverTeam = team1
        self.team1WhoInText:Text("^s^" .. VehicleGetDriverName(self.MissionCar1))

        if self.team1CarLastDriverTeam == teamId1 then
            self.team1WhoInText:Colour(self.team1Colour)
            if not self.team1CarStolen then
                VehicleSetCarDoorLocks(self.MissionCar1, CARLOCK_UNLOCKED)
            end
        else
            if self.team1CarLastDriverTeam == teamId2 then
                self.team1WhoInText:Colour(self.team2Colour)
                if not self.team1CarStolen then
                    VehicleSetCarDoorLocks(self.MissionCar1, CARLOCK_UNLOCKED)
                end
            else
                self.team1WhoInText:Colour({255, 255, 255, 255})
                if not self.team1CarStolen then
                    VehicleSetCarDoorLocks(self.MissionCar1, CARLOCK_TEAM1_LOCKED)
                end
            end
        end
    end

    local team2 = VehicleGetDriverTeam(self.MissionCar2)
    if team2 ~= self.team2CarLastDriverTeam then
        print("team2 driver team change\n")
        if self.team2CarStolen then
            if team2 == teamId1 then
                SetTeamTimerCounting(teamId2, false)
            else
                SetTeamTimerCounting(teamId2, true)
            end
        end
        self.team2CarLastDriverTeam = team2
        self.team2WhoInText:Text("^s^" .. VehicleGetDriverName(self.MissionCar2))
        
        if self.team2CarLastDriverTeam == teamId1 then
            self.team2WhoInText:Colour(self.team1Colour)
            if not self.team1CarStolen then
                VehicleSetCarDoorLocks(self.MissionCar2, CARLOCK_UNLOCKED)
            end
        else
            if self.team2CarLastDriverTeam == teamId2 then
                self.team2WhoInText:Colour(self.team2Colour)
                if not self.team1CarStolen then
                    VehicleSetCarDoorLocks(self.MissionCar2, CARLOCK_UNLOCKED)
                end
            else
                self.team2WhoInText:Colour({255, 255, 255, 255})
                if not self.team2CarStolen then
                    VehicleSetCarDoorLocks(self.MissionCar2, CARLOCK_TEAM2_LOCKED)
                end
            end
        end
    end
    
    if self.team1CarLastDriver ~= VehicleGetDriverPlayerId(self.MissionCar1) then
        if self.team1CarLastDriver ~= -1 then
            Player(self.team1CarLastDriver):SetRadarBlipVisibleState(true)
            if self.team1FlagBlip then
                SetBlipVisibleForPlayerState(self.team1FlagBlip, self.team1CarLastDriver, true)
            end
        end

        self.team1CarLastDriver = VehicleGetDriverPlayerId(self.MissionCar1)
        if self.team1CarLastDriver ~= -1 then
            Player(self.team1CarLastDriver):SetRadarBlipVisibleState(false)
            if self.team1FlagBlip then
                SetBlipVisibleForPlayerState(self.team1FlagBlip, self.team1CarLastDriver, false)
            end
        end
        self.team1WhoInText:Text("^s^" .. VehicleGetDriverName(self.MissionCar1))
    end
    if self.team2CarLastDriver ~= VehicleGetDriverPlayerId(self.MissionCar2) then
        if self.team2CarLastDriver ~= -1 then
            Player(self.team2CarLastDriver):SetRadarBlipVisibleState(true)
            if self.team2FlagBlip then
                SetBlipVisibleForPlayerState(self.team2FlagBlip, self.team2CarLastDriver, true)
            end
        end

        self.team2CarLastDriver = VehicleGetDriverPlayerId(self.MissionCar2)
        if self.team2CarLastDriver ~= -1 then
            Player(self.team2CarLastDriver):SetRadarBlipVisibleState(false)
            if self.team2FlagBlip then
                SetBlipVisibleForPlayerState(self.team2FlagBlip, self.team2CarLastDriver, false)
            end
        end
        self.team2WhoInText:Text("^s^" .. VehicleGetDriverName(self.MissionCar2))
    end
    
    if self.team1ShortTimerCounting then
        if VehicleGetDriverTeam(self.MissionCar1) == teamId2 then
            SetTeamTimer(teamId1, 60000)
            self.team1ShortTimerCounting = false
        end
    end
    if self.team2ShortTimerCounting then
        if VehicleGetDriverTeam(self.MissionCar2) == teamId1 then
            SetTeamTimer(teamId2, 60000)
            self.team2ShortTimerCounting = false
        end
    end
end

function CTF:DoClientLogic()
    local player = Player()
    local car = player:Car()

    if VehicleGetModelId(car) == CAR_MODELID then
        LimitVehicleSpeed(car, limoVelMaxMag, limoSpeedCapMod)
    end

    if GetTeamScore(teamId1) ~= self.scores[1] then
        if GameScoreLimit() > 0 then
            if GetTeamScore(teamId1) < GameScoreLimit() then
                self:DisplayMessage("^T^MTN_2", "^T^MPRDCAP", 750, TeamColour(1), {255, 255, 255, 255})
            end
        end
        self.scores[1] = GetTeamScore(teamId1)
    end
    if GetTeamScore(teamId2) ~= self.scores[2] then
        if GameScoreLimit() > 0 then
            if GetTeamScore(teamId2) < GameScoreLimit() then
                self:DisplayMessage("^T^MTN_1", "^T^MPBLCAP", 750, TeamColour(0), {255, 255, 255, 255})
            end
        end
        self.scores[2] = GetTeamScore(teamId2)
    end
    
    while not IsEventStackEmpty() do
        print("got to switch(ish) statement")
        local event_code = GetEvent()
        if event_code == EVENT_TEAM1_CAR_STOLEN then
            if player:TeamId() == teamId1 then
                self.ourCarIsSafe = false
                self.team1OwnCarWP = SetHalo(self.CarDealership1, 0, teamId2, self.CarDealership1[4] * 2)
            end
            self:DisplayMessage("^T^MTN_1", "^T^MPBLST", 750, TeamColour(0), {255, 255, 255, 255})
        elseif event_code == EVENT_TEAM1_CAR_OOP then
            if player:TeamId() == teamId1 then
                self.ourCarIsSafe = false
                self.team1OwnCarWP = SetHalo(self.CarDealership1, 0, teamId2, self.CarDealership1[4] * 2)
            end
            self:DisplayMessage("^T^MTN_1", "^T^MPBLPOS", 750, TeamColour(0), {255, 255, 255, 255})
        elseif event_code == EVENT_TEAM1_CAR_RETURNED then
            if player:TeamId() == teamId1 then
                self.ourCarIsSafe = true
                if self.team1OwnCarWP then
                    self.team1OwnCarWP:Remove()
                end
            end
            SetTeamTimer(teamId1, 60000)
            self:DisplayMessage("^T^MTN_1", "^T^MPBLRET", 750, TeamColour(0), {255, 255, 255, 255})
        elseif event_code == EVENT_TEAM2_CAR_STOLEN then
            if player:TeamId() == teamId2 then
                self.ourCarIsSafe = false
                self.team2OwnCarWP = SetHalo(self.CarDealership2, 0, teamId1, self.CarDealership2[4] * 2)
            end
            self:DisplayMessage("^T^MTN_2", "^T^MPRDST", 750, TeamColour(1), {255, 255, 255, 255})
        elseif event_code == EVENT_TEAM2_CAR_OOP then
            if player:TeamId() == teamId2 then
                self.ourCarIsSafe = false
                self.team2OwnCarWP = SetHalo(self.CarDealership2, 0, teamId1, self.CarDealership2[4] * 2)
            end
            self:DisplayMessage("^T^MTN_2", "^T^MPRDPOS", 750, TeamColour(1), {255, 255, 255, 255})
        elseif event_code == EVENT_TEAM2_CAR_RETURNED then
            if player:TeamId() == teamId2 then
                self.ourCarIsSafe = true
                if self.team2OwnCarWP then
                    self.team2OwnCarWP:Remove()
                end
            end
            SetTeamTimer(teamId2, 60000)
            self:DisplayMessage("^T^MTN_2", "^T^MPRDRET", 750, TeamColour(1), {255, 255, 255, 255})
        elseif event_code == EVENT_TEAM1_CAR_ENTERING_ENEMY_BAY then
            if player:TeamId() == teamId2 then
                self.weHaveTheirCar = true
                print("removing team2 target bay WP")
                self.enemyCarWP:Remove()
            end
        elseif event_code == EVENT_TEAM1_CAR_LEAVING_ENEMY_BAY then
            if player:TeamId() == teamId2 then
                self.weHaveTheirCar = false
                self.enemyCarWP = SetHalo(self.CarDealershipDrop2, 0, teamId2, self.CarDealershipDrop2[4] * 2)
            end
        elseif event_code == EVENT_TEAM2_CAR_ENTERING_ENEMY_BAY then
            if player:TeamId() == teamId1 then
                self.weHaveTheirCar = true
                print("removing team1 target bay WP")
                self.enemyCarWP:Remove()
            end
        elseif event_code == EVENT_TEAM2_CAR_LEAVING_ENEMY_BAY then
            if player:TeamId() == teamId1 then
                self.weHaveTheirCar = false
                self.enemyCarWP = SetHalo(self.CarDealershipDrop1, 0, teamId1, self.CarDealershipDrop1[4] * 2)
            end
        elseif event_code == EVENT_GAME_OVER then
            self.state = "StateGameWon"
            self.gameFinishing = true
        end
    end

    if self.showTeamTimer1 == true then
        self:UpdateTeamTimer(teamId1)
    end
    if self.showTeamTimer2 == true then
        self:UpdateTeamTimer(teamId2)
    end
end

function CTF:DoSpawn(is_initial)
    local player = Player()
    local unused_lcl = 1
    local spawns = nil
    local team = player:TeamId()
    if is_initial then
        if team == teamId1 then
            spawns = self.Team1InitSpawns
        else
            spawns = self.Team2InitSpawns
        end
    else
        if team == teamId1 then
            spawns = self.Team1Spawns
        else
            spawns = self.Team2Spawns
        end
    end

    main.vSpawnPoints = spawns
    if is_initial then
        print("Doing initial spawn")
        DoSpawn(InitialSpawnPoint(PlayerId()))
    else
        print("Doing non initial spawn")
        DoSpawn()
    end
end

function CTF:CleanUp()
    if IsServer() then
        self.CTFServerLogic:Stop()
    end

    self.CTFMessageDisplay:Stop()
    RestoreCamera(0, newplayer)
    collectgarbage()
end

function CTF:Commentate(msg)
    main.commentary:Print(msg)
end

function IsPosInArea(position, area, radius)
    local position_to_area = {0, 0, 0}  -- vector
    position_to_area[1] = position[1] - area[1]
    position_to_area[2] = position[2] - area[2]
    position_to_area[3] = position[3] - area[3]
    local distance_sqr = 0
    distance_sqr = distance_sqr + position_to_area[1] * position_to_area[1]
    distance_sqr = distance_sqr + position_to_area[2] * position_to_area[2]
    distance_sqr = distance_sqr + position_to_area[3] * position_to_area[3]
    if distance_sqr < radius * radius then
        return true
    else
        return false
    end
end

function printcoords(coordinates)
    print(string.format("X[%f] Y[%f] Z[%f]\n", coordinates[1], coordinates[2], coordinates[3]))
end

function CTF:RegisterPlayerKill(killed, killer, is_headshot)
    if killed == killer then
        self:Commentate("^S^" .. killed:Name() .. "^S^ ^T^MPKSELF")
    elseif is_headshot then
        self:Commentate("^S^" .. killer:Name() .. "^S^ ^T^MPK^S^ " .. killed:Name() .. "^S^ ^T^MPKHEAD")
    else
        self:Commentate("^S^" .. killer:Name() .. "^S^ ^T^MPK^S^ " .. killed:Name())
    end
end

function CTF:TeamScore(team)
    local score = self.scores[team + 1]
    if not score then
        score = 0
    end
    return score
end

function CTF:DisplayTeamTimer(team)
    local timer = GetTeamTimer(team)
    local minutes = math.floor(timer / 1000 / 60)
    timer = timer - minutes * (1000 * 60)
    local seconds = timer / 1000
    local time_as_str = string.format("%d:%02d", minutes, seconds)
    local player = Player()
    local sprite = nil
    if team == teamId1 and not self.team1TimerText then
        self.team1TimerText = TextSprite(player, 470, team1TextY - 16, 2)
        sprite = self.team1TimerText
    elseif team == teamId2 and not self.team2TimerText then
        self.team2TimerText = TextSprite(player, 470, team2TextY - 16, 2)
        sprite = self.team2TimerText
    else
        return
    end

    sprite:Scale(0.4084)
    sprite:Style(1)

    if team == teamId1 then
        sprite:Colour(self.team1Colour)
    else
        sprite:Colour(self.team2Colour)
    end

    sprite:Text("^s^" .. time_as_str)
end

function CTF:UpdateTeamTimer(team)
    local sprite = nil
    if team == teamId1 then
        sprite = self.team1TimerText
    else
        sprite = self.team2TimerText
    end
    if not sprite then
        print("trying to update a non existant CTF timer")
        return
    end

    local timer = GetTeamTimer(team)
    local minutes = math.floor(timer / 1000 / 60)
    timer = timer - minutes * (1000 * 60)
    local seconds = timer / 1000
    local time_as_str = string.format("%d:%02d", minutes, seconds)
    if 1 < minutes then
        time_as_str = ""
    end

    local unused_lcl = Player()
    sprite:Text("^s^" .. time_as_str)
end

function CTF:RemoveTeamTimer(team)
    local timer = nil
    if team == teamId1 then
        if self.team1TimerText then
            timer = self.team1TimerText
            self.team1TimerText = nil
        end
    else
        if self.team2TimerText then
            timer = self.team2TimerText
            self.team2TimerText = nil
        end
    end
    if timer then
        timer:Remove()
        timer = nil
    end
end

function CTF:UpdateRadar()
    if self.MissionCar1 then
        local position = VehiclePosition(self.MissionCar1)
        position[3] = position[3] + 1000
        if self.team1FlagBlip then
            UpdateBlipCoord(self.team1FlagBlip, position)
        end
    end
    if self.MissionCar2 then
        local position = VehiclePosition(self.MissionCar2)
        position[3] = position[3] + 1000
        if self.team2FlagBlip then
            UpdateBlipCoord(self.team2FlagBlip, position)
        end
    end
end

function CTFKickOutOfCar:Cleanup()
end

function CTF:KickDriverOutOfCar(car)
    print("Kick driver out of car")
    local kick_out = CTFKickOutOfCar()
    kick_out.isDriverKickedOutOfCar = false
    kick_out.carToKickDriverOutOf = car
    kick_out:Start()
    while kick_out.isDriverKickedOutOfCar == false do
        Wait(0)
    end
    self.carToKickDriverOutOf = nil
end

function CTFKickOutOfCar:Run()
    VehicleSetEmergencyStop(self.carToKickDriverOutOf, true)
    Wait(500)
    VehicleForceOutPeds(self.carToKickDriverOutOf)
    local iterations = 0
    while VehicleIsDrivenByPlayer(self.carToKickDriverOutOf) do
        Wait(0)
        iterations = iterations + 1
        if 15 < iterations then
            iterations = 0
            VehicleForceOutPeds(self.carToKickDriverOutOf)
        end
    end
    VehicleSetEmergencyStop(self.carToKickDriverOutOf, false)
    self.isDriverKickedOutOfCar = true
end

function CTF:DisplayMessage(msg1, msg2, unused_arg1, colour, unused_arg2)
    if colour == TeamColour(1) then
        self:Commentate("^S^~b~" .. msg1 .. "^S^ ~w~" .. msg2)
    else
        self:Commentate("^S^~r~" .. msg1 .. "^S^ ~w~" .. msg2)
    end
end

function CTFMessageDisplay:CleanUp()
    print("Message Display CLEANUP")
end

function CTFMessageDisplay:Run()
    local player = Player()
    while 1 do
        if table.getn(main.game.MessageDisplayQueue) > 0 then
            print("PRINTING MESSAGE THROUGH DISPLAY QUEUE")
            local message = table.remove(main.game.MessageDisplayQueue, 1)
            local sprite1 = TextSprite(player, 235, 86, 1)
            sprite1:Scale(1.2)
            sprite1:Style(2)
            sprite1:Colour(message.topcolour)
            sprite1:Text(message.topmsg)
            local sprite2 = TextSprite(player, 235, 125, 1)
            sprite2:Scale(0.4, 1)
            sprite2:Style(0)
            sprite2:Colour(message.botcolour)
            sprite2:Text(message.botmsg)
            Wait(message.length)
            sprite1:Remove()
            sprite2:Remove()
        end
        Wait(10)
    end
end

function CTF:DeleteCarWithDelay(car, delay)
    print("Deleting car with delay of " .. delay)
    local car_delete = CTFCarDeleteDelay()
    car_delete.delay = delay
    car_delete.carToDelete = car
    car_delete:Start()
end

function CTFCarDeleteDelay:CleanUp()
end

function CTFCarDeleteDelay:Run()
    Wait(self.delay)
    DeleteVehicle(self.carToDelete)
end

function CTF:InitGame()
    GameElapsedMs(0)
    print("Game Location Is: ", GameLocation())
    if GameLocation() == 0 then
        self.CarDealership1 = {1232.5714, -87.1016, 11.7673, 5}
        self.CarDealership1Heading = 90.0655
        self.CarDealershipDrop1 = {1231.7108, -103.4972, 13.3987, 5}
        self.CarDealershipCabin1 = {1244.634, -94.8901, 12.2382}
        self.CarDealershipCabinHeading1 = 280
        self.CarDealership2 = {907.4211, -897.7053, 13.9333, 5}
        self.CarDealership2Heading = 180.5468
        self.CarDealershipDrop2 = {916.7495, -900.9651, 13.9333, 5}
        self.CarDealershipCabin2 = {931.5425, -901.4952, 13.5335}
        self.CarDealershipCabinHeading2 = 264
        self.Team1InitSpawns = {
            {{1245.5764, -119.3942, 13.9326}, 49.8267},
            {{1215.7571, -118.3896, 13.9326}, 359.5657},
            {{1216.8038, -65.0373, 9.5535}, 177.6218},
            {{1238.3368, -72.7951, 10.3317}, 141.8636},
            {{1243.1484, -85.036, 12.6}, 178.4465},
            {{1214.1349, -90.6364, 13.1644}, 47.1516},
            {{1227.0343, -112.0405, 14.9456}, 221.1017},
            {{1208.2361, -102.8584, 14.3751}, 32.3911}
        }
        self.Team1Spawns = {
            {{1141.7538, 39.4818, -1.5354}, 206.0494},
            {{1142.1028, -92.71, 6.4345}, 309.8683},
            {{1104.2711, -108.6361, 8.334}, 235.2965},
            {{1340.1337, -29.3839, 13.6599}, 80.7714},
            {{1313.1125, -77.7719, 16.2475}, 178.4465},
            {{1243.0214, -28.7687, 8.9407}, 47.1516},
            {{1174.9203, -68.5446, 7.4735}, 221.1017},
            {{1224.4297, -159.0303, 18.2364}, 32.3911}
        }
        self.Team2InitSpawns = {
            {{897.8068, -904.9676, 13.9333}, 199.0864},
            {{930.8286, -894.0044, 13.934}, 120.1053},
            {{920.5967, -915.8045, 13.9334}, 40.9089},
            {{898.8245, -893.7159, 13.9333}, 188.5873},
            {{906.4426, -929.1682, 14.9744}, 331.1504},
            {{946.033, -901.1781, 14.9881}, 48.1246},
            {{945.9496, -888.2452, 15.653}, 126.4652},
            {{919.9361, -885.5676, 15.2589}, 170.9446}
        }
        self.Team2Spawns = {
            {{1016.6302, -854.1656, 13.9298}, 188.5873},
            {{870.8047, -992.8137, 4.0137}, 224.8946},
            {{978.1308, -751.1743, 13.9329}, 156.1697},
            {{771.5789, -779.2554, 13.7052}, 209.5637},
            {{1029.2559, -779.0171, 14.9981}, 99.7938},
            {{1025.2542, -808.6592, 15.0244}, 187.9843},
            {{976.6887, -808.5751, 14.9782}, 153.0549},
            {{902.7792, -854.6254, 14.9733}, 201.6201}
        }
    elseif GameLocation() == 1 then
        self.CarDealership1 = {340.8907, -1058.914, 24.9564, 5}
        self.CarDealership1Heading = 90.6019
        self.CarDealershipDrop1 = {340.8791, -1065.6602, 24.9564, 5}
        self.CarDealershipCabin1 = {-58.9795, -1466.4183, 24.6041}
        self.CarDealershipCabinHeading1 = 270
        self.CarDealership2 = {-75.5708, -1458.8881, 25.1041, 5}
        self.CarDealership2Heading = 270.1214
        self.CarDealershipDrop2 = {-76.6505, -1466.8876, 25.1041, 5}
        self.CarDealershipCabin2 = {329.064, -1080, 24.4564}
        self.CarDealershipCabinHeading2 = 180
        self.Team1InitSpawns = {
            {{322.3411, -1055.8333, 24.9564}, 220.0321},
            {{359.1031, -1056.7825, 24.9564}, 117.5816},
            {{321.5251, -1072.3105, 24.9564}, 264.1837},
            {{361.6044, -1073.0287, 24.9564}, 64.4156},
            {{350.0195, -1081.4915, 25.9828}, 13.1181},
            {{330.1381, -1080.3517, 25.9964}, 344.2704},
            {{339.9622, -1079.3536, 24.1099}, 338.9399},
            {{330.7365, -1063.7026, 25.9964}, 43.4321}
        }
        self.Team1Spawns = {
            {{202.952, -1007.3057, 25.1053}, 70.0448},
            {{325.1018, -1001.0543, 26.1009}, 133.1441},
            {{237.4705, -1125.2434, 25.1263}, 181.1538},
            {{361.2229, -1201.7072, 25.1268}, 184.1448},
            {{321.06, -1214.8745, 25.5704}, 338.0473},
            {{328.522, -1180.6151, 25.1363}, 355.6235},
            {{394.2084, -1141.4446, 24.8964}, 105.4178},
            {{296.3605, -1083.2832, 27.3182}, 285.3825}
        }
        self.Team2InitSpawns = {
            {{-112.3078, -1441.3772, 25.1041}, 219.8633},
            {{-54.32, -1440.5249, 25.1041}, 133.8662},
            {{-57.581, -1487.8593, 25.1041}, 41.4029},
            {{-89.5294, -1485.616, 25.1041}, 338.4181},
            {{-106.2682, -1461.7526, 25.1397}, 298.0639},
            {{-83.0357, -1483.2728, 25.1397}, 355.9948},
            {{-57.1385, -1473.9656, 25.1397}, 105.328},
            {{-79.979, -1440.5107, 25.1397}, 138.5269}
        }
        self.Team2Spawns = {
            {{-101.3633, -1274.2051, 25.2598}, 153.1491},
            {{-213.2106, -1443.8563, 24.9768}, 328.5909},
            {{74.0989, -1548.3989, 27.2541}, 88.9048},
            {{107.5575, -1398.7982, 20.7603}, 265.7173},
            {{95.6443, -1451.393, 27.9257}, 169.955},
            {{63.8127, -1507.7124, 24.1237}, 101.7611},
            {{21.2943, -1286.9828, 25.2497}, 190.2937},
            {{-177.346, -1323.4846, 24.0365}, 230.6843}
        }
    else
        self.CarDealership1 = {-661.2014, 74.7028, 17.6722, 5}
        self.CarDealership1Heading = 271.0901
        self.CarDealershipDrop1 = {-669.8249, 87.316, 17.7343, 5}
        self.CarDealershipCabin1 = {-671.0649, 96.5543, 17.7154}
        self.CarDealershipCabinHeading1 = 90
        self.CarDealership2 = {-714.7087, 202.3628, 27.6714, 5}
        self.CarDealership2Heading = 180.6782
        self.CarDealershipDrop2 = {-723.7484, 188.9629, 27.6714, 5}
        self.CarDealershipCabin2 = {-720.379, 182.6423, 27.6714}
        self.CarDealershipCabinHeading2 = 180
        self.Team1InitSpawns = {
            {{-686.5741, 76.2871, 17.8006}, 13.0018},
            {{-688.8741, 100.6959, 17.7606}, 226.2985},
            {{-671.7313, 63.5963, 17.7002}, 359.3725},
            {{-643.748, 80.1658, 17.7183}, 62.7505},
            {{-654.5239, 94.5877, 17.7287}, 115.9277},
            {{-659.2164, 77.6652, 17.7168}, 32.6719},
            {{-682.229, 84.3535, 17.827}, 280.8443},
            {{-680.9987, 51.1813, 17.8074}, 347.5601}
        }
        self.Team1Spawns = {
            {{-644.5105, -26.6813, 17.8226}, 58.5638},
            {{-666.1693, -4.3022, 17.8226}, 50.484},
            {{-547.8697, 123.3818, 16.9394}, 50.484},
            {{-552.5445, -29.7968, 13.5731}, 100.7629},
            {{-724.6157, 53.1869, 19.1559}, 277.4213},
            {{-645.9449, -108.3989, 8.3931}, 28.282},
            {{-477.1399, 122.3857, 17.2881}, 152.2549},
            {{-630.005, -44.0967, 17.8645}, 31.474}
        }
        self.Team2InitSpawns = {
            {{-707.7809, 202.219, 27.6714}, 142.802},
            {{-741.2185, 201.9469, 27.6714}, 146.9903},
            {{-767.7602, 192.0488, 27.6727}, 193.4055},
            {{-757.5176, 173.7704, 27.7848}, 297.1597},
            {{-771.2601, 176.1161, 27.7843}, 317.0504},
            {{-778.9791, 164.3747, 27.8598}, 311.0777},
            {{-725.9549, 167.6629, 27.8598}, 352.9944},
            {{-754.8513, 186.7145, 27.7114}, 254.3391}
        }
        self.Team2Spawns = {
            {{-746.5695, 273.545, 53.1422}, 178.825},
            {{-715.1263, 257.2971, 52.9928}, 181.9062},
            {{-597.3809, 204.71, 45.0581}, 197.323},
            {{-575.4649, 181.0112, 42.8673}, 148.0049},
            {{-747.4327, 112.1068, 26.1034}, 21.8778},
            {{-542.0806, 190.5937, 44.485}, 106.0352},
            {{-606.757, 147.2856, 39.6848}, 66.8711},
            {{-767.9937, 112.1536, 27.8598}, 344.5143}
        }
    end

    self.mypickups = PickupMgr()
    self.mypickups:CreatePickups()

    if IsServer() then
        if UsePowerups() then
            PowerUpTimer:Start()
            if DoesPowerupExist() < 2 then
                print("Respawning a power up at change sides")
                PowerUpTimer:CreateAPowerUp()
            end
            if DoesPowerupExist() < 2 then
                print("Respawning another power up at change sides")
                PowerUpTimer:CreateAPowerUp()
            end
        end
    end
end

function Main()
    main = MainLoop{}
    main.commentary = Commentary{}:Start()
    main.scores = ScoreSheetScript{}:Start()
    InitSpawnPoints()
    local spawn_index = 0
    spawn_index = math.random(1, table.getn(main.vSpawnPoints))
    CreatePlayer(unpack(main.vSpawnPoints[spawn_index][1]))
    PlayerName(HostName())
    main.game = CTF():Start()
    main:Start()
end
