local L0_1, L1_1, L2_1
L0_1 = require
L1_1 = "gta"
L0_1(L1_1)
L0_1 = require
L1_1 = "mainloop"
L0_1(L1_1)
L0_1 = require
L1_1 = "spawn"
L0_1(L1_1)
L0_1 = require
L1_1 = "PowerUps"
L0_1(L1_1)
L0_1 = require
L1_1 = "Pickups"
L0_1(L1_1)
L0_1 = require
L1_1 = "CutscenePlayer"
L0_1(L1_1)
L0_1 = require
L1_1 = "SharedLib"
L0_1(L1_1)
L0_1 = CoreLib
L0_1 = L0_1()
coreLib = L0_1
L0_1 = PowerupTimer
L0_1 = L0_1()
PowerUpTimer = L0_1
L0_1 = StateMachine
L1_1 = {}
L2_1 = "StateInit"
L1_1[1] = L2_1
L0_1 = L0_1(L1_1)
CTF = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
CTFServerLogic = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
CTFMessageDisplay = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
CTFKickOutOfCar = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
CTFCarDeleteDelay = L0_1
L0_1 = 1
EVENT_TEAM1_CAR_STOLEN = L0_1
L0_1 = 2
EVENT_TEAM1_CAR_RETURNED = L0_1
L0_1 = 3
EVENT_TEAM2_CAR_STOLEN = L0_1
L0_1 = 4
EVENT_TEAM2_CAR_RETURNED = L0_1
L0_1 = 5
EVENT_TEAM1_CAR_ENTERING_ENEMY_BAY = L0_1
L0_1 = 6
EVENT_TEAM2_CAR_ENTERING_ENEMY_BAY = L0_1
L0_1 = 7
EVENT_TEAM1_CAR_LEAVING_ENEMY_BAY = L0_1
L0_1 = 8
EVENT_TEAM2_CAR_LEAVING_ENEMY_BAY = L0_1
L0_1 = 9
EVENT_START_TEAM1_TIMER = L0_1
L0_1 = 10
EVENT_START_TEAM2_TIMER = L0_1
L0_1 = 11
EVENT_STOP_TEAM1_TIMER = L0_1
L0_1 = 12
EVENT_STOP_TEAM2_TIMER = L0_1
L0_1 = 13
EVENT_SHOW_TEAM1_TIMER = L0_1
L0_1 = 14
EVENT_SHOW_TEAM2_TIMER = L0_1
L0_1 = 15
EVENT_HIDE_TEAM1_TIMER = L0_1
L0_1 = 16
EVENT_HIDE_TEAM2_TIMER = L0_1
L0_1 = 17
EVENT_GAME_OVER = L0_1
L0_1 = 18
EVENT_TEAM1_CAR_OOP = L0_1
L0_1 = 19
EVENT_TEAM2_CAR_OOP = L0_1
L0_1 = 5
HALO_RADIUS = L0_1
L0_1 = 0
teamId1 = L0_1
L0_1 = 1
teamId2 = L0_1
L0_1 = 0
team1RadarColour = L0_1
L0_1 = 2
team2RadarColour = L0_1
L0_1 = false
hornDebounce = L0_1
L0_1 = 102
team1TextY = L0_1
L0_1 = 146
team2TextY = L0_1
L0_1 = 0.7
limoVelMaxMag = L0_1
L0_1 = 0.98
limoSpeedCapMod = L0_1
L0_1 = car
L0_1 = L0_1.limo
CAR_MODELID = L0_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.Init
  L1_2(L2_2)
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.WaitForAllPlayersToJoin
  L1_2(L2_2)
  L1_2 = GenerateAmbients
  L2_2 = false
  L1_2(L2_2)
  A0_2.colourTest = 0
  L1_2 = {}
  L2_2 = 0
  L3_2 = 0
  L4_2 = 0
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  A0_2.scores = L1_2
  L1_2 = false
  A0_2.team1CarStolen = L1_2
  L1_2 = false
  A0_2.team2CarStolen = L1_2
  L1_2 = false
  A0_2.team1CarInEnemyBay = L1_2
  L1_2 = false
  A0_2.team2CarInEnemyBay = L1_2
  A0_2.team1CarLastDriverTeam = -1
  A0_2.team2CarLastDriverTeam = -1
  A0_2.team1CarLastDriver = -1
  A0_2.team2CarLastDriver = -1
  L1_2 = false
  A0_2.team1ShortTimerCounting = L1_2
  L1_2 = false
  A0_2.team2ShortTimerCounting = L1_2
  A0_2.carToKickDriverOutOf = nil
  L1_2 = true
  A0_2.isDriverKickedOutofCar = L1_2
  L1_2 = UseSuperBrakeOnPause
  L2_2 = false
  L1_2(L2_2)
  L1_2 = GameScoreLimit
  L1_2 = L1_2()
  if 0 < L1_2 then
    L1_2 = GameScoreLimit
    L1_2 = L1_2()
    A0_2.scorelimit = L1_2
    L1_2 = print
    L2_2 = "Setting game score limit to "
    L3_2 = A0_2.scorelimit
    L2_2 = L2_2 .. L3_2
    L1_2(L2_2)
  else
    A0_2.scorelimit = nil
  end
  L1_2 = {}
  A0_2.carsToBeDeleted = L1_2
  L1_2 = TeamColour
  L2_2 = teamId1
  L1_2 = L1_2(L2_2)
  A0_2.team1Colour = L1_2
  L1_2 = TeamColour
  L2_2 = teamId2
  L1_2 = L1_2(L2_2)
  A0_2.team2Colour = L1_2
  L1_2 = print
  L2_2 = "team1Colour = "
  L3_2 = A0_2.team1Colour
  L1_2(L2_2, L3_2)
  L1_2 = print
  L2_2 = "team2Colour = "
  L3_2 = A0_2.team2Colour
  L1_2(L2_2, L3_2)
  L1_2 = true
  A0_2.ourCarIsSafe = L1_2
  L1_2 = false
  A0_2.weHaveTheirCar = L1_2
  L1_2 = false
  A0_2.showTeamTimer1 = L1_2
  L1_2 = false
  A0_2.showTeamTimer2 = L1_2
  A0_2.team1TimerText = nil
  A0_2.team2TimerText = nil
  A0_2.Msg = nil
  A0_2.MsgLength = nil
  A0_2.MsgColour = nil
  L1_2 = {}
  A0_2.MessageDisplayQueue = L1_2
  L1_2 = false
  A0_2.gameFinishing = L1_2
  A0_2.destructionTimer = 0
  L1_2 = false
  A0_2.destructTimerActive = L1_2
  A0_2.destructionTimerBase = 0
  goto lbl_96
  repeat
    L1_2 = Wait
    L2_2 = 100
    L1_2(L2_2)
    ::lbl_96::
    L1_2 = IsServer
    L1_2 = L1_2()
    if L1_2 then
      break
    end
    L1_2 = PlayerId
    L1_2 = L1_2()
  until L1_2 ~= 0
  L1_2 = print
  L2_2 = "Running CTF:InitGame"
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.InitGame
  L1_2(L2_2)
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = print
  L3_2 = "Calling DoSpawn with true"
  L2_2(L3_2)
  L3_2 = A0_2
  L2_2 = A0_2.DoSpawn
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = print
  L3_2 = "Checking IsServer"
  L2_2(L3_2)
  L2_2 = collectgarbage
  L2_2()
  L2_2 = IsServer
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = 0
    L3_2 = 0
    L4_2 = GetVehicleColour
    L5_2 = 3
    L4_2 = L4_2(L5_2)
    L2_2 = L4_2
    L4_2 = GetVehicleColour
    L5_2 = 7
    L4_2 = L4_2(L5_2)
    L3_2 = L4_2
    L4_2 = print
    L5_2 = "Creating Vehicle 1"
    L4_2(L5_2)
    L4_2 = CreateVehicle
    L5_2 = A0_2.Car1ModelId
    L6_2 = A0_2.CarDealership1
    L7_2 = A0_2.CarDealership1Heading
    L8_2 = L2_2
    L9_2 = nil
    L10_2 = true
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    A0_2.MissionCar1 = L4_2
    L4_2 = VehicleSetTyresNoBurst
    L5_2 = A0_2.MissionCar1
    L6_2 = true
    L4_2(L5_2, L6_2)
    L4_2 = VehicleAdd3dMarker
    L5_2 = A0_2.MissionCar1
    L4_2(L5_2)
    L4_2 = print
    L5_2 = "Creating Vehicle 2"
    L4_2(L5_2)
    L4_2 = CreateVehicle
    L5_2 = A0_2.Car2ModelId
    L6_2 = A0_2.CarDealership2
    L7_2 = A0_2.CarDealership2Heading
    L8_2 = L3_2
    L9_2 = nil
    L10_2 = true
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    A0_2.MissionCar2 = L4_2
    L4_2 = VehicleSetTyresNoBurst
    L5_2 = A0_2.MissionCar2
    L6_2 = true
    L4_2(L5_2, L6_2)
    L4_2 = VehicleAdd3dMarker
    L5_2 = A0_2.MissionCar2
    L4_2(L5_2)
  end
  L2_2 = IsServer
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = ServerReadyToGo
    L3_2 = true
    L2_2(L3_2)
    L2_2 = Wait
    L3_2 = 500
    L2_2(L3_2)
  end
  L2_2 = Wait
  L3_2 = 2000
  L2_2(L3_2)
  L3_2 = L1_2
  L2_2 = L1_2.TeamId
  L2_2 = L2_2(L3_2)
  L3_2 = teamId1
  if L2_2 == L3_2 then
    L2_2 = SetHalo
    L3_2 = A0_2.CarDealershipDrop1
    L4_2 = 0
    L5_2 = teamId2
    L6_2 = HALO_RADIUS
    L6_2 = L6_2 * 2
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    A0_2.enemyCarWP = L2_2
  else
    L2_2 = SetHalo
    L3_2 = A0_2.CarDealershipDrop2
    L4_2 = 0
    L5_2 = teamId1
    L6_2 = HALO_RADIUS
    L6_2 = L6_2 * 2
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    A0_2.enemyCarWP = L2_2
  end
  A0_2.team1FlagBlip = nil
  A0_2.team2FlagBlip = nil
  L2_2 = RenderHudExtras
  L3_2 = false
  L2_2(L3_2)
  L2_2 = NoFuckingCutscene
  L2_2 = L2_2()
  if not L2_2 then
    L2_2 = main
    L2_2 = L2_2.scores
    L3_2 = L2_2
    L2_2 = L2_2.Hide
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
    L2_2 = RunScriptedCutscene
    L2_2()
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
    goto lbl_235
    repeat
      L2_2 = Wait
      L3_2 = 0
      L2_2(L3_2)
      ::lbl_235::
      L2_2 = ProcessScriptedCutscene
      L2_2 = L2_2()
    until not L2_2
    L2_2 = main
    L2_2 = L2_2.scores
    L3_2 = L2_2
    L2_2 = L2_2.Hide
    L4_2 = false
    L2_2(L3_2, L4_2)
  else
    L2_2 = Wait
    L3_2 = 20
    L2_2(L3_2)
    L2_2 = ClearSplashScreen
    L2_2()
  end
  L2_2 = GenerateAmbients
  L3_2 = true
  L2_2(L3_2)
  L2_2 = RenderHudExtras
  L3_2 = true
  L2_2(L3_2)
  L3_2 = A0_2
  L2_2 = A0_2.ClientInit
  L2_2(L3_2)
  L2_2 = IsServer
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = SetTeamScore
    L3_2 = teamId1
    L4_2 = A0_2.scores
    L4_2 = L4_2[1]
    L2_2(L3_2, L4_2)
    L2_2 = SetTeamScore
    L3_2 = teamId2
    L4_2 = A0_2.scores
    L4_2 = L4_2[2]
    L2_2(L3_2, L4_2)
    L2_2 = CTFServerLogic
    L2_2 = L2_2()
    A0_2.CTFServerLogic = L2_2
    L2_2 = A0_2.CTFServerLogic
    L3_2 = L2_2
    L2_2 = L2_2.Start
    L2_2(L3_2)
  end
  L2_2 = CTFMessageDisplay
  L2_2 = L2_2()
  A0_2.CTFMessageDisplay = L2_2
  L2_2 = A0_2.CTFMessageDisplay
  L3_2 = L2_2
  L2_2 = L2_2.Start
  L2_2(L3_2)
  L2_2 = UpdateGameTime
  L3_2 = true
  L2_2(L3_2)
  L2_2 = SetTeamTimer
  L3_2 = teamId1
  L4_2 = 60000
  L2_2(L3_2, L4_2)
  L3_2 = A0_2
  L2_2 = A0_2.DisplayTeamTimer
  L4_2 = teamId1
  L2_2(L3_2, L4_2)
  L2_2 = true
  A0_2.showTeamTimer1 = L2_2
  L2_2 = SetTeamTimer
  L3_2 = teamId2
  L4_2 = 60000
  L2_2(L3_2, L4_2)
  L3_2 = A0_2
  L2_2 = A0_2.DisplayTeamTimer
  L4_2 = teamId2
  L2_2(L3_2, L4_2)
  L2_2 = true
  A0_2.showTeamTimer2 = L2_2
  L2_2 = IsServer
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = print
    L3_2 = "Entering ServerInit()"
    L2_2(L3_2)
    L3_2 = A0_2
    L2_2 = A0_2.ServerInit
    L2_2(L3_2)
  end
  L2_2 = TeamGameEveryoneIn
  L2_2()
  L2_2 = IsServer
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = VehicleSetCarDoorLocks
    L3_2 = A0_2.MissionCar1
    L4_2 = CARLOCK_TEAM1_LOCKED
    L2_2(L3_2, L4_2)
    L2_2 = VehicleSetCarDoorLocks
    L3_2 = A0_2.MissionCar2
    L4_2 = CARLOCK_TEAM2_LOCKED
    L2_2(L3_2, L4_2)
  end
  L2_2 = coreLib
  L3_2 = L2_2
  L2_2 = L2_2.Commentate
  L4_2 = "^T^MPCTFIN"
  L2_2(L3_2, L4_2)
  L2_2 = "StateRunning"
  return L2_2
end
L0_1.StateInit = L1_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = {}
  A0_2.team1WhoInText = L1_2
  L1_2 = TextSprite
  L2_2 = GetEveryonePeerGroupId
  L2_2 = L2_2()
  L3_2 = 470
  L4_2 = team1TextY
  L5_2 = 2
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  A0_2.team1WhoInText = L1_2
  L1_2 = A0_2.team1WhoInText
  L2_2 = L1_2
  L1_2 = L1_2.Style
  L3_2 = 1
  L1_2(L2_2, L3_2)
  L1_2 = A0_2.team1WhoInText
  L2_2 = L1_2
  L1_2 = L1_2.Scale
  L3_2 = 0.8878
  L1_2(L2_2, L3_2)
  L1_2 = A0_2.team1WhoInText
  L2_2 = L1_2
  L1_2 = L1_2.Colour
  L3_2 = {}
  L4_2 = 255
  L5_2 = 255
  L6_2 = 255
  L7_2 = 255
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L1_2(L2_2, L3_2)
  L1_2 = A0_2.team1WhoInText
  L2_2 = L1_2
  L1_2 = L1_2.Text
  L3_2 = "^T^MPEMPTY"
  L1_2(L2_2, L3_2)
  L1_2 = {}
  A0_2.team2WhoInText = L1_2
  L1_2 = TextSprite
  L2_2 = GetEveryonePeerGroupId
  L2_2 = L2_2()
  L3_2 = 470
  L4_2 = team2TextY
  L5_2 = 2
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
  A0_2.team2WhoInText = L1_2
  L1_2 = A0_2.team2WhoInText
  L2_2 = L1_2
  L1_2 = L1_2.Style
  L3_2 = 1
  L1_2(L2_2, L3_2)
  L1_2 = A0_2.team2WhoInText
  L2_2 = L1_2
  L1_2 = L1_2.Scale
  L3_2 = 0.8878
  L1_2(L2_2, L3_2)
  L1_2 = A0_2.team2WhoInText
  L2_2 = L1_2
  L1_2 = L1_2.Colour
  L3_2 = {}
  L4_2 = 255
  L5_2 = 255
  L6_2 = 255
  L7_2 = 255
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L3_2[4] = L7_2
  L1_2(L2_2, L3_2)
  L1_2 = A0_2.team2WhoInText
  L2_2 = L1_2
  L1_2 = L1_2.Text
  L3_2 = "^T^MPEMPTY"
  L1_2(L2_2, L3_2)
end
L0_1.ServerInit = L1_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.TeamId
  L2_2 = L2_2(L3_2)
  L3_2 = teamId1
  if L2_2 == L3_2 then
    L2_2 = AddBlipForCoord
    L4_2 = L1_2
    L3_2 = L1_2.PlayerNum
    L3_2 = L3_2(L4_2)
    L4_2 = A0_2.CarDealership1
    L5_2 = team1RadarColour
    L6_2 = pickupicon
    L6_2 = L6_2.base
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    A0_2.baseBlip = L2_2
    L2_2 = AddBlipForCoord
    L4_2 = L1_2
    L3_2 = L1_2.PlayerNum
    L3_2 = L3_2(L4_2)
    L4_2 = A0_2.CarDealership2
    L5_2 = team2RadarColour
    L6_2 = pickupicon
    L6_2 = L6_2.base
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    A0_2.enemyBaseBlip = L2_2
  else
    L2_2 = AddBlipForCoord
    L4_2 = L1_2
    L3_2 = L1_2.PlayerNum
    L3_2 = L3_2(L4_2)
    L4_2 = A0_2.CarDealership2
    L5_2 = team2RadarColour
    L6_2 = pickupicon
    L6_2 = L6_2.base
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    A0_2.baseBlip = L2_2
    L2_2 = AddBlipForCoord
    L4_2 = L1_2
    L3_2 = L1_2.PlayerNum
    L3_2 = L3_2(L4_2)
    L4_2 = A0_2.CarDealership1
    L5_2 = team1RadarColour
    L6_2 = pickupicon
    L6_2 = L6_2.base
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    A0_2.enemyBaseBlip = L2_2
  end
  L2_2 = coreLib
  L3_2 = L2_2
  L2_2 = L2_2.SetEnemyTeamToShortRangeRadar
  L2_2(L3_2)
end
L0_1.ClientInit = L1_1
L0_1 = CTFServerLogic
function L1_1(A0_2)
  local L1_2, L2_2
  while 1 do
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.DoServerLogic
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.UpdateRadar
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 10
    L1_2(L2_2)
  end
end
L0_1.Run = L1_1
L0_1 = CTFServerLogic
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.mytimer
  L2_2 = L1_2
  L1_2 = L1_2.Stop
  L1_2(L2_2)
  L1_2 = A0_2.mypickups
  L2_2 = L1_2
  L1_2 = L1_2.Cleanup
  L1_2(L2_2)
  L1_2 = RenderHudExtras
  L2_2 = false
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = RenderHudExtras
  L3_2 = false
  L2_2(L3_2)
  L3_2 = L1_2
  L2_2 = L1_2.IsPlaying
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = DoWasted
    L2_2()
    L3_2 = A0_2
    L2_2 = A0_2.DoSpawn
    L2_2(L3_2)
  end
  L2_2 = RenderHudExtras
  L3_2 = true
  L2_2(L3_2)
  L2_2 = IsPlayerPressingHorn
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = hornDebounce
    if not L2_2 then
    end
  end
  L2_2 = IsPlayerPressingHorn
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = false
    hornDebounce = L2_2
  end
  L3_2 = A0_2
  L2_2 = A0_2.DoClientLogic
  L2_2(L3_2)
  L2_2 = collectgarbage
  L2_2()
end
L0_1.StateRunning = L1_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = UpdateGameTime
  L2_2 = false
  L1_2(L2_2)
  L1_2 = nil
  L2_2 = Player
  L2_2 = L2_2()
  L3_2 = nil
  L4_2 = nil
  L5_2 = A0_2.scores
  L5_2 = L5_2[1]
  L6_2 = A0_2.scores
  L6_2 = L6_2[2]
  if L5_2 > L6_2 then
    L1_2 = "^T^MTN_2"
    L6_2 = L2_2
    L5_2 = L2_2.TeamId
    L5_2 = L5_2(L6_2)
    L6_2 = teamId1
    if L5_2 == L6_2 then
      L3_2 = 1
    else
      L3_2 = 2
    end
    L4_2 = teamId1
  else
    L5_2 = A0_2.scores
    L5_2 = L5_2[1]
    L6_2 = A0_2.scores
    L6_2 = L6_2[2]
    if L5_2 < L6_2 then
      L1_2 = "^T^MTN_1"
      L6_2 = L2_2
      L5_2 = L2_2.TeamId
      L5_2 = L5_2(L6_2)
      L6_2 = teamId2
      if L5_2 == L6_2 then
        L3_2 = 1
      else
        L3_2 = 2
      end
      L4_2 = teamId2
    else
      L1_2 = nil
      L3_2 = 0
      goto lbl_48
      repeat
        L5_2 = Wait
        L6_2 = 0
        L5_2(L6_2)
        ::lbl_48::
        L5_2 = table
        L5_2 = L5_2.getn
        L6_2 = A0_2.MessageDisplayQueue
        L5_2 = L5_2(L6_2)
      until not (0 < L5_2)
    end
  end
  L5_2 = DisplayFinalWinLoseMessage
  L6_2 = L3_2
  L7_2 = "^S^"
  L8_2 = L4_2
  L5_2(L6_2, L7_2, L8_2)
  L5_2 = main
  L5_2 = L5_2.scores
  L6_2 = L5_2
  L5_2 = L5_2.ToggleUpdate
  L7_2 = false
  L5_2(L6_2, L7_2)
  L5_2 = main
  L5_2 = L5_2.scores
  L6_2 = L5_2
  L5_2 = L5_2.Show
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = Wait
  L6_2 = 12000
  L5_2(L6_2)
  L5_2 = main
  L5_2 = L5_2.scores
  L6_2 = L5_2
  L5_2 = L5_2.Hide
  L5_2(L6_2)
  L5_2 = main
  L6_2 = L5_2
  L5_2 = L5_2.EndGame
  L5_2(L6_2)
  L5_2 = "StateRunning"
  return L5_2
end
L0_1.StateGameWon = L1_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = GameTimeUp
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = A0_2.gameFinishing
    if not L2_2 then
      L2_2 = SendEvent
      L3_2 = EVENT_GAME_OVER
      L2_2(L3_2)
      L2_2 = true
      A0_2.gameFinishing = L2_2
    end
  end
  L2_2 = VehiclePosition
  L3_2 = A0_2.MissionCar1
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = IsPosInArea
    L4_2 = L2_2
    L5_2 = A0_2.CarDealership1
    L6_2 = HALO_RADIUS
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    if not L3_2 then
      L3_2 = A0_2.team1CarStolen
      if not L3_2 then
        L3_2 = VehicleGetDriverTeam
        L4_2 = A0_2.MissionCar1
        L3_2 = L3_2(L4_2)
        L4_2 = teamId2
        if L3_2 == L4_2 then
          L3_2 = print
          L4_2 = "team1 car stolen"
          L3_2(L4_2)
          L3_2 = SetTeamTimer
          L4_2 = teamId1
          L5_2 = 60000
          L3_2(L4_2, L5_2)
          L3_2 = SendEvent
          L4_2 = EVENT_TEAM1_CAR_STOLEN
          L3_2(L4_2)
        else
          L3_2 = SetTeamTimer
          L4_2 = teamId1
          L5_2 = 10000
          L3_2(L4_2, L5_2)
          L3_2 = true
          A0_2.team1ShortTimerCounting = L3_2
          L3_2 = SetTeamTimerCounting
          L4_2 = teamId1
          L5_2 = true
          L3_2(L4_2, L5_2)
          L3_2 = SendEvent
          L4_2 = EVENT_TEAM1_CAR_OOP
          L3_2(L4_2)
        end
        L3_2 = A0_2.team1FlagBlip
        if L3_2 == nil then
          L3_2 = print
          L4_2 = "Adding team 1 car blip"
          L3_2(L4_2)
          L3_2 = VehiclePosition
          L4_2 = A0_2.MissionCar1
          L3_2 = L3_2(L4_2)
          L4_2 = L3_2[3]
          L4_2 = L4_2 + 1000
          L3_2[3] = L4_2
          L4_2 = AddBlipForCoord
          L5_2 = GetEveryonePeerGroupId
          L5_2 = L5_2()
          L6_2 = L3_2
          L7_2 = team1RadarColour
          L8_2 = pickupicon
          L8_2 = L8_2.car
          L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
          A0_2.team1FlagBlip = L4_2
          L4_2 = VehicleIsDrivenByPlayer
          L5_2 = A0_2.MissionCar1
          L4_2 = L4_2(L5_2)
          if L4_2 then
            L4_2 = A0_2.team1FlagBlip
            if L4_2 then
              L4_2 = SetBlipVisibleForPlayerState
              L5_2 = A0_2.team1FlagBlip
              L6_2 = A0_2.team1CarLastDriver
              L7_2 = false
              L4_2(L5_2, L6_2, L7_2)
            end
          end
        end
        L3_2 = true
        A0_2.team1CarStolen = L3_2
        L3_2 = VehicleSetCarDoorLocks
        L4_2 = A0_2.MissionCar1
        L5_2 = CARLOCK_UNLOCKED
        L3_2(L4_2, L5_2)
        L3_2 = VehicleSetTyresNoBurst
        L4_2 = A0_2.MissionCar1
        L5_2 = false
        L3_2(L4_2, L5_2)
        L3_2 = VehicleSetHealth
        L4_2 = A0_2.MissionCar1
        L5_2 = 1000
        L3_2(L4_2, L5_2)
      end
    else
      L3_2 = A0_2.team1CarStolen
      if L3_2 then
        L3_2 = VehicleGetDriverTeam
        L4_2 = A0_2.MissionCar1
        L3_2 = L3_2(L4_2)
        L4_2 = teamId2
        if L3_2 ~= L4_2 then
          L4_2 = A0_2
          L3_2 = A0_2.KickDriverOutOfCar
          L5_2 = A0_2.MissionCar1
          L3_2(L4_2, L5_2)
          L3_2 = SendEvent
          L4_2 = EVENT_TEAM1_CAR_RETURNED
          L3_2(L4_2)
          L3_2 = SetTeamTimerCounting
          L4_2 = teamId1
          L5_2 = false
          L3_2(L4_2, L5_2)
          L3_2 = VehicleSetEmergencyStop
          L4_2 = A0_2.MissionCar1
          L5_2 = false
          L3_2(L4_2, L5_2)
          L3_2 = VehicleSetCarDoorLocks
          L4_2 = A0_2.MissionCar1
          L5_2 = CARLOCK_TEAM1_LOCKED
          L3_2(L4_2, L5_2)
          L3_2 = VehicleSetTyresNoBurst
          L4_2 = A0_2.MissionCar1
          L5_2 = true
          L3_2(L4_2, L5_2)
          L3_2 = false
          A0_2.team1CarStolen = L3_2
          L3_2 = false
          A0_2.team1ShortTimerCounting = L3_2
          L3_2 = A0_2.team1FlagBlip
          if L3_2 then
            L3_2 = print
            L4_2 = "Removing team 1 car blip(capped)"
            L3_2(L4_2)
            L3_2 = RemoveBlip
            L4_2 = A0_2.team1FlagBlip
            L3_2(L4_2)
            A0_2.team1FlagBlip = nil
          end
      end
      else
        L3_2 = VehicleGetDriverTeam
        L4_2 = A0_2.MissionCar1
        L3_2 = L3_2(L4_2)
        L4_2 = A0_2.team1CarLastDriverTeam
        if L3_2 ~= L4_2 then
          L3_2 = VehicleGetDriverTeam
          L4_2 = A0_2.MissionCar1
          L3_2 = L3_2(L4_2)
          L4_2 = teamId2
          if L3_2 == L4_2 then
            L3_2 = VehicleSetHealth
            L4_2 = A0_2.MissionCar1
            L5_2 = 1000
            L3_2(L4_2, L5_2)
          end
        end
        L3_2 = VehicleGetDriverTeam
        L4_2 = A0_2.MissionCar1
        L3_2 = L3_2(L4_2)
        L4_2 = teamId2
        if L3_2 ~= L4_2 then
          L3_2 = VehicleSetHealth
          L4_2 = A0_2.MissionCar1
          L5_2 = 10000
          L3_2(L4_2, L5_2)
        end
      end
    end
    L3_2 = IsPosInArea
    L4_2 = L2_2
    L5_2 = A0_2.CarDealershipDrop2
    L6_2 = HALO_RADIUS
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    if L3_2 then
      L3_2 = A0_2.team1CarInEnemyBay
      if not L3_2 then
        L3_2 = true
        A0_2.team1CarInEnemyBay = L3_2
        L3_2 = SendEvent
        L4_2 = EVENT_TEAM1_CAR_ENTERING_ENEMY_BAY
        L3_2(L4_2)
      end
    else
      L3_2 = A0_2.team1CarInEnemyBay
      if L3_2 then
        L3_2 = false
        A0_2.team1CarInEnemyBay = L3_2
        L3_2 = SendEvent
        L4_2 = EVENT_TEAM1_CAR_LEAVING_ENEMY_BAY
        L3_2(L4_2)
      end
    end
  end
  L3_2 = VehiclePosition
  L4_2 = A0_2.MissionCar2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L4_2 = VehiclePosition
    L5_2 = A0_2.MissionCar2
    L4_2 = L4_2(L5_2)
    L5_2 = IsPosInArea
    L6_2 = L4_2
    L7_2 = A0_2.CarDealership2
    L8_2 = HALO_RADIUS
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    if not L5_2 then
      L5_2 = A0_2.team2CarStolen
      if not L5_2 then
        L5_2 = VehicleGetDriverTeam
        L6_2 = A0_2.MissionCar2
        L5_2 = L5_2(L6_2)
        L6_2 = teamId1
        if L5_2 == L6_2 then
          L5_2 = print
          L6_2 = "team2 car stolen"
          L5_2(L6_2)
          L5_2 = SetTeamTimer
          L6_2 = teamId2
          L7_2 = 60000
          L5_2(L6_2, L7_2)
          L5_2 = SendEvent
          L6_2 = EVENT_TEAM2_CAR_STOLEN
          L5_2(L6_2)
        else
          L5_2 = SetTeamTimer
          L6_2 = teamId2
          L7_2 = 10000
          L5_2(L6_2, L7_2)
          L5_2 = SetTeamTimerCounting
          L6_2 = teamId2
          L7_2 = true
          L5_2(L6_2, L7_2)
          L5_2 = true
          A0_2.team2ShortTimerCounting = L5_2
          L5_2 = SendEvent
          L6_2 = EVENT_TEAM2_CAR_OOP
          L5_2(L6_2)
        end
        L5_2 = A0_2.team2FlagBlip
        if L5_2 == nil then
          L5_2 = print
          L6_2 = "Adding team 2 car blip"
          L5_2(L6_2)
          L5_2 = VehiclePosition
          L6_2 = A0_2.MissionCar2
          L5_2 = L5_2(L6_2)
          L6_2 = L5_2[3]
          L6_2 = L6_2 + 1000
          L5_2[3] = L6_2
          L6_2 = AddBlipForCoord
          L7_2 = GetEveryonePeerGroupId
          L7_2 = L7_2()
          L8_2 = L5_2
          L9_2 = team2RadarColour
          L10_2 = pickupicon
          L10_2 = L10_2.car
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
          A0_2.team2FlagBlip = L6_2
          L6_2 = VehicleIsDrivenByPlayer
          L7_2 = A0_2.MissionCar2
          L6_2 = L6_2(L7_2)
          if L6_2 then
            L6_2 = A0_2.team2FlagBlip
            if L6_2 then
              L6_2 = SetBlipVisibleForPlayerState
              L7_2 = A0_2.team2FlagBlip
              L8_2 = A0_2.team2CarLastDriver
              L9_2 = false
              L6_2(L7_2, L8_2, L9_2)
            end
          end
        end
        L5_2 = VehicleSetCarDoorLocks
        L6_2 = A0_2.MissionCar2
        L7_2 = CARLOCK_UNLOCKED
        L5_2(L6_2, L7_2)
        L5_2 = VehicleSetTyresNoBurst
        L6_2 = A0_2.MissionCar2
        L7_2 = false
        L5_2(L6_2, L7_2)
        L5_2 = VehicleSetHealth
        L6_2 = A0_2.MissionCar2
        L7_2 = 1000
        L5_2(L6_2, L7_2)
        L5_2 = true
        A0_2.team2CarStolen = L5_2
      end
    else
      L5_2 = A0_2.team2CarStolen
      if L5_2 then
        L5_2 = VehicleGetDriverTeam
        L6_2 = A0_2.MissionCar2
        L5_2 = L5_2(L6_2)
        L6_2 = teamId1
        if L5_2 ~= L6_2 then
          L6_2 = A0_2
          L5_2 = A0_2.KickDriverOutOfCar
          L7_2 = A0_2.MissionCar2
          L5_2(L6_2, L7_2)
          L5_2 = SendEvent
          L6_2 = EVENT_TEAM2_CAR_RETURNED
          L5_2(L6_2)
          L5_2 = VehicleSetEmergencyStop
          L6_2 = A0_2.MissionCar2
          L7_2 = false
          L5_2(L6_2, L7_2)
          L5_2 = SetTeamTimerCounting
          L6_2 = teamId2
          L7_2 = false
          L5_2(L6_2, L7_2)
          L5_2 = VehicleSetCarDoorLocks
          L6_2 = A0_2.MissionCar2
          L7_2 = CARLOCK_TEAM2_LOCKED
          L5_2(L6_2, L7_2)
          L5_2 = VehicleSetTyresNoBurst
          L6_2 = A0_2.MissionCar2
          L7_2 = true
          L5_2(L6_2, L7_2)
          L5_2 = false
          A0_2.team2CarStolen = L5_2
          L5_2 = false
          A0_2.team2ShortTimerCounting = L5_2
          L5_2 = A0_2.team2FlagBlip
          if L5_2 then
            L5_2 = print
            L6_2 = "Removing team 1 car blip(capped)"
            L5_2(L6_2)
            L5_2 = RemoveBlip
            L6_2 = A0_2.team2FlagBlip
            L5_2(L6_2)
            A0_2.team2FlagBlip = nil
          end
      end
      else
        L5_2 = VehicleGetDriverTeam
        L6_2 = A0_2.MissionCar2
        L5_2 = L5_2(L6_2)
        L6_2 = A0_2.team2CarLastDriverTeam
        if L5_2 ~= L6_2 then
          L5_2 = VehicleGetDriverTeam
          L6_2 = A0_2.MissionCar2
          L5_2 = L5_2(L6_2)
          L6_2 = teamId1
          if L5_2 == L6_2 then
            L5_2 = VehicleSetHealth
            L6_2 = A0_2.MissionCar2
            L7_2 = 1000
            L5_2(L6_2, L7_2)
          end
        end
        L5_2 = VehicleGetDriverTeam
        L6_2 = A0_2.MissionCar2
        L5_2 = L5_2(L6_2)
        L6_2 = teamId1
        if L5_2 ~= L6_2 then
          L5_2 = VehicleSetHealth
          L6_2 = A0_2.MissionCar2
          L7_2 = 10000
          L5_2(L6_2, L7_2)
        end
      end
    end
    L5_2 = IsPosInArea
    L6_2 = L4_2
    L7_2 = A0_2.CarDealershipDrop1
    L8_2 = HALO_RADIUS
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    if L5_2 then
      L5_2 = A0_2.team2CarInEnemyBay
      if not L5_2 then
        L5_2 = true
        A0_2.team2CarInEnemyBay = L5_2
        L5_2 = SendEvent
        L6_2 = EVENT_TEAM2_CAR_ENTERING_ENEMY_BAY
        L5_2(L6_2)
      end
    else
      L5_2 = A0_2.team2CarInEnemyBay
      if L5_2 then
        L5_2 = false
        A0_2.team2CarInEnemyBay = L5_2
        L5_2 = SendEvent
        L6_2 = EVENT_TEAM2_CAR_LEAVING_ENEMY_BAY
        L5_2(L6_2)
      end
    end
  end
  L4_2 = A0_2.team1CarStolen
  if not L4_2 then
    L4_2 = A0_2.team2CarInEnemyBay
    if L4_2 then
      L4_2 = print
      L5_2 = "team1Car cap handle"
      L4_2(L5_2)
      L4_2 = SetTeamScore
      L5_2 = teamId1
      L6_2 = GetTeamScore
      L7_2 = teamId1
      L6_2 = L6_2(L7_2)
      L6_2 = L6_2 + 1
      L4_2(L5_2, L6_2)
      L4_2 = A0_2.scorelimit
      if L4_2 then
        L4_2 = print
        L5_2 = "checking team score"
        L4_2(L5_2)
        L4_2 = A0_2.scorelimit
        L5_2 = GetTeamScore
        L6_2 = teamId1
        L5_2 = L5_2(L6_2)
        L4_2 = L4_2 - L5_2
        L5_2 = print
        L6_2 = "scoreleft is "
        L7_2 = L4_2
        L6_2 = L6_2 .. L7_2
        L5_2(L6_2)
        if L4_2 <= 0 then
          L5_2 = A0_2.gameFinishing
          if not L5_2 then
            L5_2 = SendEvent
            L6_2 = EVENT_GAME_OVER
            L5_2(L6_2)
            L5_2 = true
            A0_2.gameFinishing = L5_2
          end
        end
      end
      L5_2 = A0_2
      L4_2 = A0_2.KickDriverOutOfCar
      L6_2 = A0_2.MissionCar2
      L4_2(L5_2, L6_2)
      L4_2 = DeleteVehicle
      L5_2 = A0_2.MissionCar2
      L4_2(L5_2)
      L4_2 = ClearArea
      L5_2 = A0_2.CarDealership2
      L6_2 = 5
      L4_2(L5_2, L6_2)
      L4_2 = A0_2.team2FlagBlip
      if L4_2 then
        L4_2 = RemoveBlip
        L5_2 = A0_2.team2FlagBlip
        L4_2(L5_2)
        A0_2.team2FlagBlip = nil
        L4_2 = print
        L5_2 = "Removing team 2 car blip (during cap)"
        L4_2(L5_2)
      end
      L4_2 = 0
      L5_2 = GetVehicleColour
      L6_2 = 7
      L5_2 = L5_2(L6_2)
      L4_2 = L5_2
      L5_2 = CreateVehicle
      L6_2 = A0_2.Car2ModelId
      L7_2 = A0_2.CarDealership2
      L8_2 = A0_2.CarDealership2Heading
      L9_2 = L4_2
      L10_2 = nil
      L11_2 = true
      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
      A0_2.MissionCar2 = L5_2
      L5_2 = VehicleSetCarDoorLocks
      L6_2 = A0_2.MissionCar2
      L7_2 = CARLOCK_TEAM2_LOCKED
      L5_2(L6_2, L7_2)
      L5_2 = VehicleSetTyresNoBurst
      L6_2 = A0_2.MissionCar2
      L7_2 = true
      L5_2(L6_2, L7_2)
      L5_2 = VehicleAdd3dMarker
      L6_2 = A0_2.MissionCar2
      L5_2(L6_2)
    end
  end
  L4_2 = A0_2.team2CarStolen
  if not L4_2 then
    L4_2 = A0_2.team1CarInEnemyBay
    if L4_2 then
      L4_2 = print
      L5_2 = "team2Car cap handle"
      L4_2(L5_2)
      L4_2 = SetTeamScore
      L5_2 = teamId2
      L6_2 = GetTeamScore
      L7_2 = teamId2
      L6_2 = L6_2(L7_2)
      L6_2 = L6_2 + 1
      L4_2(L5_2, L6_2)
      L4_2 = A0_2.scorelimit
      if L4_2 then
        L4_2 = print
        L5_2 = "checking team score"
        L4_2(L5_2)
        L4_2 = A0_2.scorelimit
        L5_2 = GetTeamScore
        L6_2 = teamId2
        L5_2 = L5_2(L6_2)
        L4_2 = L4_2 - L5_2
        L5_2 = print
        L6_2 = "scoreleft is "
        L7_2 = L4_2
        L6_2 = L6_2 .. L7_2
        L5_2(L6_2)
        if L4_2 <= 0 then
          L5_2 = A0_2.gameFinishing
          if not L5_2 then
            L5_2 = SendEvent
            L6_2 = EVENT_GAME_OVER
            L5_2(L6_2)
            L5_2 = true
            A0_2.gameFinishing = L5_2
          end
        end
      end
      L5_2 = A0_2
      L4_2 = A0_2.KickDriverOutOfCar
      L6_2 = A0_2.MissionCar1
      L4_2(L5_2, L6_2)
      L4_2 = DeleteVehicle
      L5_2 = A0_2.MissionCar1
      L4_2(L5_2)
      L4_2 = ClearArea
      L5_2 = A0_2.CarDealership1
      L6_2 = 5
      L4_2(L5_2, L6_2)
      L4_2 = A0_2.team1FlagBlip
      if L4_2 then
        L4_2 = RemoveBlip
        L5_2 = A0_2.team1FlagBlip
        L4_2(L5_2)
        A0_2.team1FlagBlip = nil
        L4_2 = print
        L5_2 = "Removing team 1 car blip (during cap)"
        L4_2(L5_2)
      end
      L4_2 = 0
      L5_2 = GetVehicleColour
      L6_2 = 3
      L5_2 = L5_2(L6_2)
      L4_2 = L5_2
      L5_2 = CreateVehicle
      L6_2 = A0_2.Car1ModelId
      L7_2 = A0_2.CarDealership1
      L8_2 = A0_2.CarDealership1Heading
      L9_2 = L4_2
      L10_2 = nil
      L11_2 = true
      L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
      A0_2.MissionCar1 = L5_2
      L5_2 = VehicleSetCarDoorLocks
      L6_2 = A0_2.MissionCar1
      L7_2 = CARLOCK_TEAM1_LOCKED
      L5_2(L6_2, L7_2)
      L5_2 = VehicleSetTyresNoBurst
      L6_2 = A0_2.MissionCar1
      L7_2 = true
      L5_2(L6_2, L7_2)
      L5_2 = VehicleAdd3dMarker
      L6_2 = A0_2.MissionCar1
      L5_2(L6_2)
    end
  end
  L4_2 = VehicleHealth
  L5_2 = A0_2.MissionCar1
  L4_2 = L4_2(L5_2)
  if not (L4_2 <= 0) then
    L4_2 = IsVehicleWrecked
    L5_2 = A0_2.MissionCar1
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      goto lbl_638
    end
  end
  L4_2 = print
  L5_2 = "recreating vehicle one due to destruction"
  L4_2(L5_2)
  L4_2 = print
  L5_2 = "VehicleHealth is "
  L6_2 = VehicleHealth
  L7_2 = A0_2.MissionCar1
  L6_2 = L6_2(L7_2)
  L5_2 = L5_2 .. L6_2
  L4_2(L5_2)
  L4_2 = A0_2.team1FlagBlip
  if L4_2 then
    L4_2 = RemoveBlip
    L5_2 = A0_2.team1FlagBlip
    L4_2(L5_2)
    A0_2.team1FlagBlip = nil
    L4_2 = print
    L5_2 = "Removing team 1 car blip (blownup)"
    L4_2(L5_2)
  end
  L4_2 = table
  L4_2 = L4_2.insert
  L5_2 = A0_2.carsToBeDeleted
  L6_2 = A0_2.MissionCar1
  L4_2(L5_2, L6_2)
  L4_2 = VehicleRemove3dMarker
  L5_2 = A0_2.MissionCar1
  L4_2(L5_2)
  L4_2 = DeleteVehicle
  L5_2 = A0_2.MissionCar1
  L4_2(L5_2)
  L4_2 = ClearArea
  L5_2 = A0_2.CarDealership1
  L6_2 = 8
  L4_2(L5_2, L6_2)
  L4_2 = Wait
  L5_2 = 2000
  L4_2(L5_2)
  A0_2.MissionCar1 = nil
  L4_2 = 0
  L5_2 = GetVehicleColour
  L6_2 = 3
  L5_2 = L5_2(L6_2)
  L4_2 = L5_2
  L5_2 = CreateVehicle
  L6_2 = A0_2.Car1ModelId
  L7_2 = A0_2.CarDealership1
  L8_2 = A0_2.CarDealership1Heading
  L9_2 = L4_2
  L10_2 = nil
  L11_2 = true
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  A0_2.MissionCar1 = L5_2
  L5_2 = VehicleAdd3dMarker
  L6_2 = A0_2.MissionCar1
  L5_2(L6_2)
  ::lbl_638::
  L4_2 = VehicleHealth
  L5_2 = A0_2.MissionCar2
  L4_2 = L4_2(L5_2)
  if not (L4_2 <= 0) then
    L4_2 = IsVehicleWrecked
    L5_2 = A0_2.MissionCar2
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      goto lbl_704
    end
  end
  L4_2 = print
  L5_2 = "recreating vehicle two due to destruction"
  L4_2(L5_2)
  L4_2 = print
  L5_2 = "VehicleHealth is "
  L6_2 = VehicleHealth
  L7_2 = A0_2.MissionCar2
  L6_2 = L6_2(L7_2)
  L5_2 = L5_2 .. L6_2
  L4_2(L5_2)
  L4_2 = A0_2.team2FlagBlip
  if L4_2 then
    L4_2 = RemoveBlip
    L5_2 = A0_2.team2FlagBlip
    L4_2(L5_2)
    A0_2.team2FlagBlip = nil
    L4_2 = print
    L5_2 = "Removing team 2 car blip (blownup)"
    L4_2(L5_2)
  end
  L4_2 = table
  L4_2 = L4_2.insert
  L5_2 = A0_2.carsToBeDeleted
  L6_2 = A0_2.MissionCar2
  L4_2(L5_2, L6_2)
  L4_2 = VehicleRemove3dMarker
  L5_2 = A0_2.MissionCar2
  L4_2(L5_2)
  L4_2 = DeleteVehicle
  L5_2 = A0_2.MissionCar2
  L4_2(L5_2)
  L4_2 = ClearArea
  L5_2 = A0_2.CarDealership2
  L6_2 = 8
  L4_2(L5_2, L6_2)
  L4_2 = Wait
  L5_2 = 2000
  L4_2(L5_2)
  A0_2.MissionCar2 = nil
  L4_2 = 0
  L5_2 = GetVehicleColour
  L6_2 = 7
  L5_2 = L5_2(L6_2)
  L4_2 = L5_2
  L5_2 = CreateVehicle
  L6_2 = A0_2.Car2ModelId
  L7_2 = A0_2.CarDealership2
  L8_2 = A0_2.CarDealership2Heading
  L9_2 = L4_2
  L10_2 = nil
  L11_2 = true
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  A0_2.MissionCar2 = L5_2
  L5_2 = VehicleAdd3dMarker
  L6_2 = A0_2.MissionCar2
  L5_2(L6_2)
  ::lbl_704::
  L4_2 = ipairs
  L5_2 = A0_2.carsToBeDeleted
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L6_2, L7_2 in L4_2, L5_2 do
    L8_2 = VehicleGetDriverTeam
    L9_2 = L7_2
    L8_2 = L8_2(L9_2)
    if L8_2 == -1 then
      L8_2 = print
      L9_2 = "Deleting a car!"
      L8_2(L9_2)
      L9_2 = A0_2
      L8_2 = A0_2.DeleteCarWithDelay
      L10_2 = L7_2
      L11_2 = 5000
      L8_2(L9_2, L10_2, L11_2)
      L8_2 = collectgarbage
      L8_2()
      L8_2 = table
      L8_2 = L8_2.remove
      L9_2 = A0_2.carsToBeDeleted
      L10_2 = L6_2
      L8_2(L9_2, L10_2)
    end
  end
  L4_2 = A0_2.team1CarStolen
  if L4_2 then
    L4_2 = GetTeamTimer
    L5_2 = teamId1
    L4_2 = L4_2(L5_2)
    if L4_2 < 0 then
      L5_2 = VehicleHealth
      L6_2 = A0_2.MissionCar1
      L5_2 = L5_2(L6_2)
      if L5_2 ~= 1 then
        L5_2 = VehicleSetHealth
        L6_2 = A0_2.MissionCar1
        L7_2 = 1
        L5_2(L6_2, L7_2)
        L5_2 = SetTeamTimerCounting
        L6_2 = teamId1
        L7_2 = false
        L5_2(L6_2, L7_2)
        L5_2 = SetTeamTimer
        L6_2 = teamId1
        L7_2 = 60000
        L5_2(L6_2, L7_2)
      end
    end
  end
  L4_2 = A0_2.team2CarStolen
  if L4_2 then
    L4_2 = GetTeamTimer
    L5_2 = teamId2
    L4_2 = L4_2(L5_2)
    if L4_2 < 0 then
      L5_2 = VehicleHealth
      L6_2 = A0_2.MissionCar2
      L5_2 = L5_2(L6_2)
      if L5_2 ~= 1 then
        L5_2 = VehicleSetHealth
        L6_2 = A0_2.MissionCar2
        L7_2 = 1
        L5_2(L6_2, L7_2)
        L5_2 = SetTeamTimerCounting
        L6_2 = teamId2
        L7_2 = false
        L5_2(L6_2, L7_2)
        L5_2 = SetTeamTimer
        L6_2 = teamId2
        L7_2 = 60000
        L5_2(L6_2, L7_2)
      end
    end
  end
  L4_2 = VehicleGetDriverTeam
  L5_2 = A0_2.MissionCar1
  L4_2 = L4_2(L5_2)
  L5_2 = A0_2.team1CarLastDriverTeam
  if L4_2 ~= L5_2 then
    L5_2 = print
    L6_2 = "team1 driver team change\n"
    L5_2(L6_2)
    L5_2 = A0_2.team1CarStolen
    if L5_2 then
      L5_2 = teamId2
      if L4_2 == L5_2 then
        L5_2 = SetTeamTimerCounting
        L6_2 = teamId1
        L7_2 = false
        L5_2(L6_2, L7_2)
      else
        L5_2 = SetTeamTimerCounting
        L6_2 = teamId1
        L7_2 = true
        L5_2(L6_2, L7_2)
      end
    end
    A0_2.team1CarLastDriverTeam = L4_2
    L5_2 = A0_2.team1WhoInText
    L6_2 = L5_2
    L5_2 = L5_2.Text
    L7_2 = "^s^"
    L8_2 = VehicleGetDriverName
    L9_2 = A0_2.MissionCar1
    L8_2 = L8_2(L9_2)
    L7_2 = L7_2 .. L8_2
    L5_2(L6_2, L7_2)
    L5_2 = A0_2.team1CarLastDriverTeam
    L6_2 = teamId1
    if L5_2 == L6_2 then
      L5_2 = A0_2.team1WhoInText
      L6_2 = L5_2
      L5_2 = L5_2.Colour
      L7_2 = A0_2.team1Colour
      L5_2(L6_2, L7_2)
      L5_2 = A0_2.team1CarStolen
      if not L5_2 then
        L5_2 = VehicleSetCarDoorLocks
        L6_2 = A0_2.MissionCar1
        L7_2 = CARLOCK_UNLOCKED
        L5_2(L6_2, L7_2)
      end
    else
      L5_2 = A0_2.team1CarLastDriverTeam
      L6_2 = teamId2
      if L5_2 == L6_2 then
        L5_2 = A0_2.team1WhoInText
        L6_2 = L5_2
        L5_2 = L5_2.Colour
        L7_2 = A0_2.team2Colour
        L5_2(L6_2, L7_2)
        L5_2 = A0_2.team1CarStolen
        if not L5_2 then
          L5_2 = VehicleSetCarDoorLocks
          L6_2 = A0_2.MissionCar1
          L7_2 = CARLOCK_UNLOCKED
          L5_2(L6_2, L7_2)
        end
      else
        L5_2 = A0_2.team1WhoInText
        L6_2 = L5_2
        L5_2 = L5_2.Colour
        L7_2 = {}
        L8_2 = 255
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L7_2[1] = L8_2
        L7_2[2] = L9_2
        L7_2[3] = L10_2
        L7_2[4] = L11_2
        L5_2(L6_2, L7_2)
        L5_2 = A0_2.team1CarStolen
        if not L5_2 then
          L5_2 = VehicleSetCarDoorLocks
          L6_2 = A0_2.MissionCar1
          L7_2 = CARLOCK_TEAM1_LOCKED
          L5_2(L6_2, L7_2)
        end
      end
    end
  end
  L5_2 = VehicleGetDriverTeam
  L6_2 = A0_2.MissionCar2
  L5_2 = L5_2(L6_2)
  L6_2 = A0_2.team2CarLastDriverTeam
  if L5_2 ~= L6_2 then
    L6_2 = print
    L7_2 = "team2 driver team change\n"
    L6_2(L7_2)
    L6_2 = A0_2.team2CarStolen
    if L6_2 then
      L6_2 = teamId1
      if L5_2 == L6_2 then
        L6_2 = SetTeamTimerCounting
        L7_2 = teamId2
        L8_2 = false
        L6_2(L7_2, L8_2)
      else
        L6_2 = SetTeamTimerCounting
        L7_2 = teamId2
        L8_2 = true
        L6_2(L7_2, L8_2)
      end
    end
    A0_2.team2CarLastDriverTeam = L5_2
    L6_2 = A0_2.team2WhoInText
    L7_2 = L6_2
    L6_2 = L6_2.Text
    L8_2 = "^s^"
    L9_2 = VehicleGetDriverName
    L10_2 = A0_2.MissionCar2
    L9_2 = L9_2(L10_2)
    L8_2 = L8_2 .. L9_2
    L6_2(L7_2, L8_2)
    L6_2 = A0_2.team2CarLastDriverTeam
    L7_2 = teamId1
    if L6_2 == L7_2 then
      L6_2 = A0_2.team2WhoInText
      L7_2 = L6_2
      L6_2 = L6_2.Colour
      L8_2 = A0_2.team1Colour
      L6_2(L7_2, L8_2)
      L6_2 = A0_2.team1CarStolen
      if not L6_2 then
        L6_2 = VehicleSetCarDoorLocks
        L7_2 = A0_2.MissionCar2
        L8_2 = CARLOCK_UNLOCKED
        L6_2(L7_2, L8_2)
      end
    else
      L6_2 = A0_2.team2CarLastDriverTeam
      L7_2 = teamId2
      if L6_2 == L7_2 then
        L6_2 = A0_2.team2WhoInText
        L7_2 = L6_2
        L6_2 = L6_2.Colour
        L8_2 = A0_2.team2Colour
        L6_2(L7_2, L8_2)
        L6_2 = A0_2.team1CarStolen
        if not L6_2 then
          L6_2 = VehicleSetCarDoorLocks
          L7_2 = A0_2.MissionCar2
          L8_2 = CARLOCK_UNLOCKED
          L6_2(L7_2, L8_2)
        end
      else
        L6_2 = A0_2.team2WhoInText
        L7_2 = L6_2
        L6_2 = L6_2.Colour
        L8_2 = {}
        L9_2 = 255
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L8_2[1] = L9_2
        L8_2[2] = L10_2
        L8_2[3] = L11_2
        L8_2[4] = L12_2
        L6_2(L7_2, L8_2)
        L6_2 = A0_2.team2CarStolen
        if not L6_2 then
          L6_2 = VehicleSetCarDoorLocks
          L7_2 = A0_2.MissionCar2
          L8_2 = CARLOCK_TEAM2_LOCKED
          L6_2(L7_2, L8_2)
        end
      end
    end
  end
  L6_2 = A0_2.team1CarLastDriver
  L7_2 = VehicleGetDriverPlayerId
  L8_2 = A0_2.MissionCar1
  L7_2 = L7_2(L8_2)
  if L6_2 ~= L7_2 then
    L6_2 = A0_2.team1CarLastDriver
    if L6_2 ~= -1 then
      L6_2 = Player
      L7_2 = A0_2.team1CarLastDriver
      L6_2 = L6_2(L7_2)
      L7_2 = L6_2
      L6_2 = L6_2.SetRadarBlipVisibleState
      L8_2 = true
      L6_2(L7_2, L8_2)
      L6_2 = A0_2.team1FlagBlip
      if L6_2 then
        L6_2 = SetBlipVisibleForPlayerState
        L7_2 = A0_2.team1FlagBlip
        L8_2 = A0_2.team1CarLastDriver
        L9_2 = true
        L6_2(L7_2, L8_2, L9_2)
      end
    end
    L6_2 = VehicleGetDriverPlayerId
    L7_2 = A0_2.MissionCar1
    L6_2 = L6_2(L7_2)
    A0_2.team1CarLastDriver = L6_2
    L6_2 = A0_2.team1CarLastDriver
    if L6_2 ~= -1 then
      L6_2 = Player
      L7_2 = A0_2.team1CarLastDriver
      L6_2 = L6_2(L7_2)
      L7_2 = L6_2
      L6_2 = L6_2.SetRadarBlipVisibleState
      L8_2 = false
      L6_2(L7_2, L8_2)
      L6_2 = A0_2.team1FlagBlip
      if L6_2 then
        L6_2 = SetBlipVisibleForPlayerState
        L7_2 = A0_2.team1FlagBlip
        L8_2 = A0_2.team1CarLastDriver
        L9_2 = false
        L6_2(L7_2, L8_2, L9_2)
      end
    end
    L6_2 = A0_2.team1WhoInText
    L7_2 = L6_2
    L6_2 = L6_2.Text
    L8_2 = "^s^"
    L9_2 = VehicleGetDriverName
    L10_2 = A0_2.MissionCar1
    L9_2 = L9_2(L10_2)
    L8_2 = L8_2 .. L9_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = A0_2.team2CarLastDriver
  L7_2 = VehicleGetDriverPlayerId
  L8_2 = A0_2.MissionCar2
  L7_2 = L7_2(L8_2)
  if L6_2 ~= L7_2 then
    L6_2 = A0_2.team2CarLastDriver
    if L6_2 ~= -1 then
      L6_2 = Player
      L7_2 = A0_2.team2CarLastDriver
      L6_2 = L6_2(L7_2)
      L7_2 = L6_2
      L6_2 = L6_2.SetRadarBlipVisibleState
      L8_2 = true
      L6_2(L7_2, L8_2)
      L6_2 = A0_2.team2FlagBlip
      if L6_2 then
        L6_2 = SetBlipVisibleForPlayerState
        L7_2 = A0_2.team2FlagBlip
        L8_2 = A0_2.team2CarLastDriver
        L9_2 = true
        L6_2(L7_2, L8_2, L9_2)
      end
    end
    L6_2 = VehicleGetDriverPlayerId
    L7_2 = A0_2.MissionCar2
    L6_2 = L6_2(L7_2)
    A0_2.team2CarLastDriver = L6_2
    L6_2 = A0_2.team2CarLastDriver
    if L6_2 ~= -1 then
      L6_2 = Player
      L7_2 = A0_2.team2CarLastDriver
      L6_2 = L6_2(L7_2)
      L7_2 = L6_2
      L6_2 = L6_2.SetRadarBlipVisibleState
      L8_2 = false
      L6_2(L7_2, L8_2)
      L6_2 = A0_2.team2FlagBlip
      if L6_2 then
        L6_2 = SetBlipVisibleForPlayerState
        L7_2 = A0_2.team2FlagBlip
        L8_2 = A0_2.team2CarLastDriver
        L9_2 = false
        L6_2(L7_2, L8_2, L9_2)
      end
    end
    L6_2 = A0_2.team2WhoInText
    L7_2 = L6_2
    L6_2 = L6_2.Text
    L8_2 = "^s^"
    L9_2 = VehicleGetDriverName
    L10_2 = A0_2.MissionCar2
    L9_2 = L9_2(L10_2)
    L8_2 = L8_2 .. L9_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = A0_2.team1ShortTimerCounting
  if L6_2 then
    L6_2 = VehicleGetDriverTeam
    L7_2 = A0_2.MissionCar1
    L6_2 = L6_2(L7_2)
    L7_2 = teamId2
    if L6_2 == L7_2 then
      L6_2 = SetTeamTimer
      L7_2 = teamId1
      L8_2 = 60000
      L6_2(L7_2, L8_2)
      L6_2 = false
      A0_2.team1ShortTimerCounting = L6_2
    end
  end
  L6_2 = A0_2.team2ShortTimerCounting
  if L6_2 then
    L6_2 = VehicleGetDriverTeam
    L7_2 = A0_2.MissionCar2
    L6_2 = L6_2(L7_2)
    L7_2 = teamId1
    if L6_2 == L7_2 then
      L6_2 = SetTeamTimer
      L7_2 = teamId2
      L8_2 = 60000
      L6_2(L7_2, L8_2)
      L6_2 = false
      A0_2.team2ShortTimerCounting = L6_2
    end
  end
end
L0_1.DoServerLogic = L1_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.Car
  L2_2 = L2_2(L3_2)
  L3_2 = GetTeamScore
  L4_2 = teamId1
  L3_2 = L3_2(L4_2)
  L4_2 = A0_2.scores
  L4_2 = L4_2[1]
  if L3_2 ~= L4_2 then
    L3_2 = GameScoreLimit
    L3_2 = L3_2()
    if 0 < L3_2 then
      L3_2 = GetTeamScore
      L4_2 = teamId1
      L3_2 = L3_2(L4_2)
      L4_2 = GameScoreLimit
      L4_2 = L4_2()
      if L3_2 < L4_2 then
        L4_2 = A0_2
        L3_2 = A0_2.DisplayMessage
        L5_2 = "^T^MTN_2"
        L6_2 = "^T^MPCAP"
        L7_2 = 750
        L8_2 = TeamColour
        L9_2 = 1
        L8_2 = L8_2(L9_2)
        L9_2 = {}
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L13_2 = 255
        L9_2[1] = L10_2
        L9_2[2] = L11_2
        L9_2[3] = L12_2
        L9_2[4] = L13_2
        L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
      end
    end
    L3_2 = A0_2.scores
    L4_2 = GetTeamScore
    L5_2 = teamId1
    L4_2 = L4_2(L5_2)
    L3_2[1] = L4_2
  end
  L3_2 = GetTeamScore
  L4_2 = teamId2
  L3_2 = L3_2(L4_2)
  L4_2 = A0_2.scores
  L4_2 = L4_2[2]
  if L3_2 ~= L4_2 then
    L3_2 = GameScoreLimit
    L3_2 = L3_2()
    if 0 < L3_2 then
      L3_2 = GetTeamScore
      L4_2 = teamId2
      L3_2 = L3_2(L4_2)
      L4_2 = GameScoreLimit
      L4_2 = L4_2()
      if L3_2 < L4_2 then
        L4_2 = A0_2
        L3_2 = A0_2.DisplayMessage
        L5_2 = "^T^MTN_1"
        L6_2 = "^T^MPCAP"
        L7_2 = 750
        L8_2 = TeamColour
        L9_2 = 0
        L8_2 = L8_2(L9_2)
        L9_2 = {}
        L10_2 = 255
        L11_2 = 255
        L12_2 = 255
        L13_2 = 255
        L9_2[1] = L10_2
        L9_2[2] = L11_2
        L9_2[3] = L12_2
        L9_2[4] = L13_2
        L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
      end
    end
    L3_2 = A0_2.scores
    L4_2 = GetTeamScore
    L5_2 = teamId2
    L4_2 = L4_2(L5_2)
    L3_2[2] = L4_2
    goto lbl_390
    repeat
      L3_2 = print
      L4_2 = "got to switch(ish) statement"
      L3_2(L4_2)
      L3_2 = GetEvent
      L3_2 = L3_2()
      L4_2 = EVENT_TEAM1_CAR_STOLEN
      if L3_2 == L4_2 then
        L5_2 = L1_2
        L4_2 = L1_2.TeamId
        L4_2 = L4_2(L5_2)
        L5_2 = teamId1
        if L4_2 == L5_2 then
          L4_2 = false
          A0_2.ourCarIsSafe = L4_2
          L4_2 = SetHalo
          L5_2 = A0_2.CarDealership1
          L6_2 = 0
          L7_2 = teamId1
          L8_2 = HALO_RADIUS
          L8_2 = L8_2 * 2
          L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
          A0_2.team1OwnCarWP = L4_2
        end
        L5_2 = A0_2
        L4_2 = A0_2.DisplayMessage
        L6_2 = "^T^MTN_1"
        L7_2 = "^T^MPSTOLE"
        L8_2 = 750
        L9_2 = TeamColour
        L10_2 = 0
        L9_2 = L9_2(L10_2)
        L10_2 = {}
        L11_2 = 255
        L12_2 = 255
        L13_2 = 255
        L14_2 = 255
        L10_2[1] = L11_2
        L10_2[2] = L12_2
        L10_2[3] = L13_2
        L10_2[4] = L14_2
        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
      else
        L4_2 = EVENT_TEAM1_CAR_OOP
        if L3_2 == L4_2 then
          L5_2 = L1_2
          L4_2 = L1_2.TeamId
          L4_2 = L4_2(L5_2)
          L5_2 = teamId1
          if L4_2 == L5_2 then
            L4_2 = false
            A0_2.ourCarIsSafe = L4_2
            L4_2 = SetHalo
            L5_2 = A0_2.CarDealership1
            L6_2 = 0
            L7_2 = teamId1
            L8_2 = HALO_RADIUS
            L8_2 = L8_2 * 2
            L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
            A0_2.team1OwnCarWP = L4_2
          end
          L5_2 = A0_2
          L4_2 = A0_2.DisplayMessage
          L6_2 = "^T^MTN_1"
          L7_2 = "^T^MPPOS"
          L8_2 = 750
          L9_2 = TeamColour
          L10_2 = 0
          L9_2 = L9_2(L10_2)
          L10_2 = {}
          L11_2 = 255
          L12_2 = 255
          L13_2 = 255
          L14_2 = 255
          L10_2[1] = L11_2
          L10_2[2] = L12_2
          L10_2[3] = L13_2
          L10_2[4] = L14_2
          L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
        else
          L4_2 = EVENT_TEAM1_CAR_RETURNED
          if L3_2 == L4_2 then
            L5_2 = L1_2
            L4_2 = L1_2.TeamId
            L4_2 = L4_2(L5_2)
            L5_2 = teamId1
            if L4_2 == L5_2 then
              L4_2 = true
              A0_2.ourCarIsSafe = L4_2
              L4_2 = A0_2.team1OwnCarWP
              if L4_2 then
                L4_2 = A0_2.team1OwnCarWP
                L5_2 = L4_2
                L4_2 = L4_2.Remove
                L4_2(L5_2)
              end
            end
            L4_2 = SetTeamTimer
            L5_2 = teamId1
            L6_2 = 60000
            L4_2(L5_2, L6_2)
            L5_2 = A0_2
            L4_2 = A0_2.DisplayMessage
            L6_2 = "^T^MTN_1"
            L7_2 = "^T^MPRET"
            L8_2 = 750
            L9_2 = TeamColour
            L10_2 = 0
            L9_2 = L9_2(L10_2)
            L10_2 = {}
            L11_2 = 255
            L12_2 = 255
            L13_2 = 255
            L14_2 = 255
            L10_2[1] = L11_2
            L10_2[2] = L12_2
            L10_2[3] = L13_2
            L10_2[4] = L14_2
            L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
          else
            L4_2 = EVENT_TEAM2_CAR_STOLEN
            if L3_2 == L4_2 then
              L5_2 = L1_2
              L4_2 = L1_2.TeamId
              L4_2 = L4_2(L5_2)
              L5_2 = teamId2
              if L4_2 == L5_2 then
                L4_2 = false
                A0_2.ourCarIsSafe = L4_2
                L4_2 = SetHalo
                L5_2 = A0_2.CarDealership2
                L6_2 = 0
                L7_2 = teamId2
                L8_2 = HALO_RADIUS
                L8_2 = L8_2 * 2
                L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
                A0_2.team2OwnCarWP = L4_2
              end
              L5_2 = A0_2
              L4_2 = A0_2.DisplayMessage
              L6_2 = "^T^MTN_2"
              L7_2 = "^T^MPSTOLE"
              L8_2 = 750
              L9_2 = TeamColour
              L10_2 = 1
              L9_2 = L9_2(L10_2)
              L10_2 = {}
              L11_2 = 255
              L12_2 = 255
              L13_2 = 255
              L14_2 = 255
              L10_2[1] = L11_2
              L10_2[2] = L12_2
              L10_2[3] = L13_2
              L10_2[4] = L14_2
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
            else
              L4_2 = EVENT_TEAM2_CAR_OOP
              if L3_2 == L4_2 then
                L5_2 = L1_2
                L4_2 = L1_2.TeamId
                L4_2 = L4_2(L5_2)
                L5_2 = teamId2
                if L4_2 == L5_2 then
                  L4_2 = false
                  A0_2.ourCarIsSafe = L4_2
                  L4_2 = SetHalo
                  L5_2 = A0_2.CarDealership2
                  L6_2 = 0
                  L7_2 = teamId2
                  L8_2 = HALO_RADIUS
                  L8_2 = L8_2 * 2
                  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
                  A0_2.team2OwnCarWP = L4_2
                end
                L5_2 = A0_2
                L4_2 = A0_2.DisplayMessage
                L6_2 = "^T^MTN_2"
                L7_2 = "^T^MPPOS"
                L8_2 = 750
                L9_2 = TeamColour
                L10_2 = 1
                L9_2 = L9_2(L10_2)
                L10_2 = {}
                L11_2 = 255
                L12_2 = 255
                L13_2 = 255
                L14_2 = 255
                L10_2[1] = L11_2
                L10_2[2] = L12_2
                L10_2[3] = L13_2
                L10_2[4] = L14_2
                L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
              else
                L4_2 = EVENT_TEAM2_CAR_RETURNED
                if L3_2 == L4_2 then
                  L5_2 = L1_2
                  L4_2 = L1_2.TeamId
                  L4_2 = L4_2(L5_2)
                  L5_2 = teamId2
                  if L4_2 == L5_2 then
                    L4_2 = true
                    A0_2.ourCarIsSafe = L4_2
                    L4_2 = A0_2.team2OwnCarWP
                    if L4_2 then
                      L4_2 = A0_2.team2OwnCarWP
                      L5_2 = L4_2
                      L4_2 = L4_2.Remove
                      L4_2(L5_2)
                    end
                  end
                  L4_2 = SetTeamTimer
                  L5_2 = teamId2
                  L6_2 = 60000
                  L4_2(L5_2, L6_2)
                  L5_2 = A0_2
                  L4_2 = A0_2.DisplayMessage
                  L6_2 = "^T^MTN_2"
                  L7_2 = "^T^MPRET"
                  L8_2 = 750
                  L9_2 = TeamColour
                  L10_2 = 1
                  L9_2 = L9_2(L10_2)
                  L10_2 = {}
                  L11_2 = 255
                  L12_2 = 255
                  L13_2 = 255
                  L14_2 = 255
                  L10_2[1] = L11_2
                  L10_2[2] = L12_2
                  L10_2[3] = L13_2
                  L10_2[4] = L14_2
                  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
                else
                  L4_2 = EVENT_TEAM1_CAR_ENTERING_ENEMY_BAY
                  if L3_2 == L4_2 then
                    L5_2 = L1_2
                    L4_2 = L1_2.TeamId
                    L4_2 = L4_2(L5_2)
                    L5_2 = teamId2
                    if L4_2 == L5_2 then
                      L4_2 = true
                      A0_2.weHaveTheirCar = L4_2
                      L4_2 = print
                      L5_2 = "removing team2 target bay WP"
                      L4_2(L5_2)
                      L4_2 = A0_2.enemyCarWP
                      L5_2 = L4_2
                      L4_2 = L4_2.Remove
                      L4_2(L5_2)
                    end
                  else
                    L4_2 = EVENT_TEAM1_CAR_LEAVING_ENEMY_BAY
                    if L3_2 == L4_2 then
                      L5_2 = L1_2
                      L4_2 = L1_2.TeamId
                      L4_2 = L4_2(L5_2)
                      L5_2 = teamId2
                      if L4_2 == L5_2 then
                        L4_2 = false
                        A0_2.weHaveTheirCar = L4_2
                        L4_2 = SetHalo
                        L5_2 = A0_2.CarDealershipDrop2
                        L6_2 = 0
                        L7_2 = teamId1
                        L8_2 = HALO_RADIUS
                        L8_2 = L8_2 * 2
                        L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
                        A0_2.enemyCarWP = L4_2
                      end
                    else
                      L4_2 = EVENT_TEAM2_CAR_ENTERING_ENEMY_BAY
                      if L3_2 == L4_2 then
                        L5_2 = L1_2
                        L4_2 = L1_2.TeamId
                        L4_2 = L4_2(L5_2)
                        L5_2 = teamId1
                        if L4_2 == L5_2 then
                          L4_2 = true
                          A0_2.weHaveTheirCar = L4_2
                          L4_2 = print
                          L5_2 = "removing team1 target bay WP"
                          L4_2(L5_2)
                          L4_2 = A0_2.enemyCarWP
                          L5_2 = L4_2
                          L4_2 = L4_2.Remove
                          L4_2(L5_2)
                        end
                      else
                        L4_2 = EVENT_TEAM2_CAR_LEAVING_ENEMY_BAY
                        if L3_2 == L4_2 then
                          L5_2 = L1_2
                          L4_2 = L1_2.TeamId
                          L4_2 = L4_2(L5_2)
                          L5_2 = teamId1
                          if L4_2 == L5_2 then
                            L4_2 = false
                            A0_2.weHaveTheirCar = L4_2
                            L4_2 = SetHalo
                            L5_2 = A0_2.CarDealershipDrop1
                            L6_2 = 0
                            L7_2 = teamId2
                            L8_2 = HALO_RADIUS
                            L8_2 = L8_2 * 2
                            L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
                            A0_2.enemyCarWP = L4_2
                          end
                        else
                          L4_2 = EVENT_GAME_OVER
                          if L3_2 == L4_2 then
                            A0_2.state = "StateGameWon"
                            L4_2 = true
                            A0_2.gameFinishing = L4_2
                            L4_2 = false
                            A0_2.showTeamTimer1 = L4_2
                            L5_2 = A0_2
                            L4_2 = A0_2.RemoveTeamTimer
                            L6_2 = teamId1
                            L4_2(L5_2, L6_2)
                            L4_2 = false
                            A0_2.showTeamTimer2 = L4_2
                            L5_2 = A0_2
                            L4_2 = A0_2.RemoveTeamTimer
                            L6_2 = teamId2
                            L4_2(L5_2, L6_2)
                            L4_2 = A0_2.team1WhoInText
                            if L4_2 then
                              L4_2 = A0_2.team1WhoInText
                              L5_2 = L4_2
                              L4_2 = L4_2.Remove
                              L4_2(L5_2)
                            end
                            L4_2 = A0_2.team2WhoInText
                            if L4_2 then
                              L4_2 = A0_2.team2WhoInText
                              L5_2 = L4_2
                              L4_2 = L4_2.Remove
                              L4_2(L5_2)
                            end
                            L4_2 = DrawHudCars
                            L5_2 = false
                            L4_2(L5_2)
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
      ::lbl_390::
      L3_2 = IsEventStackEmpty
      L3_2 = L3_2()
    until L3_2
  end
  L3_2 = A0_2.showTeamTimer1
  L4_2 = true
  if L3_2 == L4_2 then
    L4_2 = A0_2
    L3_2 = A0_2.UpdateTeamTimer
    L5_2 = teamId1
    L3_2(L4_2, L5_2)
  end
  L3_2 = A0_2.showTeamTimer2
  L4_2 = true
  if L3_2 == L4_2 then
    L4_2 = A0_2
    L3_2 = A0_2.UpdateTeamTimer
    L5_2 = teamId2
    L3_2(L4_2, L5_2)
  end
end
L0_1.DoClientLogic = L1_1
L0_1 = CTF
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = Player
  L2_2 = L2_2()
  L3_2 = 1
  L4_2 = nil
  L6_2 = L2_2
  L5_2 = L2_2.TeamId
  L5_2 = L5_2(L6_2)
  if A1_2 then
    L6_2 = teamId1
    if L5_2 == L6_2 then
      L4_2 = A0_2.Team1InitSpawns
    else
      L4_2 = A0_2.Team2InitSpawns
    end
  else
    L6_2 = teamId1
    if L5_2 == L6_2 then
      L4_2 = A0_2.Team1Spawns
    else
      L4_2 = A0_2.Team2Spawns
    end
  end
  L6_2 = main
  L6_2.vSpawnPoints = L4_2
  if A1_2 then
    L6_2 = print
    L7_2 = "Doing initial spawn"
    L6_2(L7_2)
    L6_2 = nil
    L7_2 = InitialSpawnPoint
    L8_2 = PlayerId
    L8_2 = L8_2()
    L7_2 = L7_2(L8_2)
    L6_2 = L7_2
    L7_2 = DoSpawn
    L8_2 = L6_2
    L7_2(L8_2)
  else
    L6_2 = print
    L7_2 = "Doing non initial spawn"
    L6_2(L7_2)
    L6_2 = DoSpawn
    L6_2()
  end
end
L0_1.DoSpawn = L1_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.CTFServerLogic
    L2_2 = L1_2
    L1_2 = L1_2.Stop
    L1_2(L2_2)
  end
  L1_2 = A0_2.CTFMessageDisplay
  L2_2 = L1_2
  L1_2 = L1_2.Stop
  L1_2(L2_2)
  L1_2 = RestoreCamera
  L2_2 = 0
  L3_2 = newplayer
  L1_2(L2_2, L3_2)
  L1_2 = collectgarbage
  L1_2()
end
L0_1.CleanUp = L1_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = {}
  L4_2 = 0
  L5_2 = 0
  L6_2 = 0
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L4_2 = A0_2[1]
  L5_2 = A1_2[1]
  L4_2 = L4_2 - L5_2
  L3_2[1] = L4_2
  L4_2 = A0_2[2]
  L5_2 = A1_2[2]
  L4_2 = L4_2 - L5_2
  L3_2[2] = L4_2
  L4_2 = A0_2[3]
  L5_2 = A1_2[3]
  L4_2 = L4_2 - L5_2
  L3_2[3] = L4_2
  L4_2 = 0
  L5_2 = L3_2[1]
  L6_2 = L3_2[1]
  L5_2 = L5_2 * L6_2
  L4_2 = L4_2 + L5_2
  L5_2 = L3_2[2]
  L6_2 = L3_2[2]
  L5_2 = L5_2 * L6_2
  L4_2 = L4_2 + L5_2
  L5_2 = L3_2[3]
  L6_2 = L3_2[3]
  L5_2 = L5_2 * L6_2
  L4_2 = L4_2 + L5_2
  L5_2 = A2_2 * A2_2
  if L4_2 < L5_2 then
    L5_2 = true
    return L5_2
  else
    L5_2 = false
    return L5_2
  end
end
IsPosInArea = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = print
  L2_2 = string
  L2_2 = L2_2.format
  L3_2 = "X[%f] Y[%f] Z[%f]\n"
  L4_2 = A0_2[1]
  L5_2 = A0_2[2]
  L6_2 = A0_2[3]
  L2_2, L3_2, L4_2, L5_2, L6_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
end
printcoords = L0_1
L0_1 = CTF
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  if A1_2 == A2_2 then
    L4_2 = coreLib
    L5_2 = L4_2
    L4_2 = L4_2.Commentate
    L6_2 = "^S^"
    L8_2 = A1_2
    L7_2 = A1_2.Name
    L7_2 = L7_2(L8_2)
    L8_2 = "^S^ ^T^MPKSELF"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L4_2(L5_2, L6_2)
  elseif A3_2 then
    L4_2 = coreLib
    L5_2 = L4_2
    L4_2 = L4_2.Commentate
    L6_2 = "^S^"
    L8_2 = A2_2
    L7_2 = A2_2.Name
    L7_2 = L7_2(L8_2)
    L8_2 = "^S^ ^T^MPK^S^ "
    L10_2 = A1_2
    L9_2 = A1_2.Name
    L9_2 = L9_2(L10_2)
    L10_2 = "^S^ ^T^MPKHEAD"
    L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2
    L4_2(L5_2, L6_2)
  else
    L4_2 = coreLib
    L5_2 = L4_2
    L4_2 = L4_2.Commentate
    L6_2 = "^S^"
    L8_2 = A2_2
    L7_2 = A2_2.Name
    L7_2 = L7_2(L8_2)
    L8_2 = "^S^ ^T^MPK^S^ "
    L10_2 = A1_2
    L9_2 = A1_2.Name
    L9_2 = L9_2(L10_2)
    L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2
    L4_2(L5_2, L6_2)
  end
end
L0_1.RegisterPlayerKill = L1_1
L0_1 = CTF
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.scores
  L3_2 = A1_2 + 1
  L2_2 = L2_2[L3_2]
  if not L2_2 then
    L2_2 = 0
  end
  return L2_2
end
L0_1.TeamScore = L1_1
L0_1 = CTF
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = GetTeamTimer
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  L3_2 = math
  L3_2 = L3_2.floor
  L4_2 = L2_2 / 1000
  L4_2 = L4_2 / 60
  L3_2 = L3_2(L4_2)
  L4_2 = 1000 * 60
  L4_2 = L3_2 * L4_2
  L2_2 = L2_2 - L4_2
  L4_2 = L2_2 / 1000
  if L3_2 < 0 then
    L3_2 = 0
  end
  if L4_2 < 0 then
    L4_2 = 0
  end
  L5_2 = string
  L5_2 = L5_2.format
  L6_2 = "%d:%02d"
  L7_2 = L3_2
  L8_2 = L4_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = Player
  L6_2 = L6_2()
  L7_2 = nil
  L8_2 = teamId1
  if A1_2 == L8_2 then
    L8_2 = A0_2.team1TimerText
    if not L8_2 then
      L8_2 = TextSprite
      L10_2 = L6_2
      L9_2 = L6_2.PlayerNum
      L9_2 = L9_2(L10_2)
      L10_2 = 475
      L11_2 = team1TextY
      L11_2 = L11_2 - 20
      L12_2 = 2
      L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
      A0_2.team1TimerText = L8_2
      L7_2 = A0_2.team1TimerText
  end
  else
    L8_2 = teamId2
    if A1_2 == L8_2 then
      L8_2 = A0_2.team2TimerText
      if not L8_2 then
        L8_2 = TextSprite
        L10_2 = L6_2
        L9_2 = L6_2.PlayerNum
        L9_2 = L9_2(L10_2)
        L10_2 = 475
        L11_2 = team2TextY
        L11_2 = L11_2 - 20
        L12_2 = 2
        L8_2 = L8_2(L9_2, L10_2, L11_2, L12_2)
        A0_2.team2TimerText = L8_2
        L7_2 = A0_2.team2TimerText
    end
    else
      return
    end
  end
  L9_2 = L7_2
  L8_2 = L7_2.Scale
  L10_2 = 0.8878
  L8_2(L9_2, L10_2)
  L9_2 = L7_2
  L8_2 = L7_2.Style
  L10_2 = 1
  L8_2(L9_2, L10_2)
  L8_2 = teamId1
  if A1_2 == L8_2 then
    L9_2 = L7_2
    L8_2 = L7_2.Colour
    L10_2 = A0_2.team1Colour
    L8_2(L9_2, L10_2)
  else
    L9_2 = L7_2
    L8_2 = L7_2.Colour
    L10_2 = A0_2.team2Colour
    L8_2(L9_2, L10_2)
  end
  L9_2 = L7_2
  L8_2 = L7_2.Text
  L10_2 = "^s^"
  L11_2 = L5_2
  L10_2 = L10_2 .. L11_2
  L8_2(L9_2, L10_2)
end
L0_1.DisplayTeamTimer = L1_1
L0_1 = CTF
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L2_2 = nil
  L3_2 = teamId1
  if A1_2 == L3_2 then
    L2_2 = A0_2.team1TimerText
  else
    L2_2 = A0_2.team2TimerText
  end
  if not L2_2 then
    L3_2 = print
    L4_2 = "trying to update a non existant CTF timer"
    L3_2(L4_2)
    return
  end
  L3_2 = GetTeamTimer
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L4_2 = math
  L4_2 = L4_2.floor
  L5_2 = L3_2 / 1000
  L5_2 = L5_2 / 60
  L4_2 = L4_2(L5_2)
  L5_2 = 1000 * 60
  L5_2 = L4_2 * L5_2
  L3_2 = L3_2 - L5_2
  L5_2 = L3_2 / 1000
  if L4_2 < 0 then
    L4_2 = 0
  end
  if L5_2 < 0 then
    L5_2 = 0
  end
  L6_2 = string
  L6_2 = L6_2.format
  L7_2 = "%d:%02d"
  L8_2 = L4_2
  L9_2 = L5_2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  if 1 < L4_2 then
    L6_2 = ""
  end
  L7_2 = Player
  L7_2 = L7_2()
  L9_2 = L2_2
  L8_2 = L2_2.Text
  L10_2 = "^s^"
  L11_2 = L6_2
  L10_2 = L10_2 .. L11_2
  L8_2(L9_2, L10_2)
end
L0_1.UpdateTeamTimer = L1_1
L0_1 = CTF
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = nil
  L3_2 = teamId1
  if A1_2 == L3_2 then
    L3_2 = A0_2.team1TimerText
    if L3_2 then
      L2_2 = A0_2.team1TimerText
      A0_2.team1TimerText = nil
    end
  else
    L3_2 = A0_2.team2TimerText
    if L3_2 then
      L2_2 = A0_2.team2TimerText
      A0_2.team2TimerText = nil
    end
  end
  if L2_2 then
    L4_2 = L2_2
    L3_2 = L2_2.Remove
    L3_2(L4_2)
    L2_2 = nil
  end
end
L0_1.RemoveTeamTimer = L1_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2.MissionCar1
  if L1_2 then
    L1_2 = VehiclePosition
    L2_2 = A0_2.MissionCar1
    L1_2 = L1_2(L2_2)
    L2_2 = L1_2[3]
    L2_2 = L2_2 + 1000
    L1_2[3] = L2_2
    L2_2 = A0_2.team1FlagBlip
    if L2_2 then
      L2_2 = UpdateBlipCoord
      L3_2 = A0_2.team1FlagBlip
      L4_2 = L1_2
      L2_2(L3_2, L4_2)
    end
  end
  L1_2 = A0_2.MissionCar2
  if L1_2 then
    L1_2 = VehiclePosition
    L2_2 = A0_2.MissionCar2
    L1_2 = L1_2(L2_2)
    L2_2 = L1_2[3]
    L2_2 = L2_2 + 1000
    L1_2[3] = L2_2
    L2_2 = A0_2.team2FlagBlip
    if L2_2 then
      L2_2 = UpdateBlipCoord
      L3_2 = A0_2.team2FlagBlip
      L4_2 = L1_2
      L2_2(L3_2, L4_2)
    end
  end
end
L0_1.UpdateRadar = L1_1
L0_1 = CTFKickOutOfCar
function L1_1(A0_2)
  local L1_2
end
L0_1.Cleanup = L1_1
L0_1 = CTF
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = print
  L3_2 = "Kick driver out of car"
  L2_2(L3_2)
  L2_2 = CTFKickOutOfCar
  L2_2 = L2_2()
  L3_2 = false
  L2_2.isDriverKickedOutOfCar = L3_2
  L2_2.carToKickDriverOutOf = A1_2
  L4_2 = L2_2
  L3_2 = L2_2.Start
  L3_2(L4_2)
  goto lbl_15
  repeat
    L3_2 = Wait
    L4_2 = 0
    L3_2(L4_2)
    ::lbl_15::
    L3_2 = L2_2.isDriverKickedOutOfCar
    L4_2 = false
  until L3_2 ~= L4_2
  A0_2.carToKickDriverOutOf = nil
end
L0_1.KickDriverOutOfCar = L1_1
L0_1 = CTFKickOutOfCar
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = VehicleSetEmergencyStop
  L3_2 = A0_2.carToKickDriverOutOf
  L4_2 = true
  L2_2(L3_2, L4_2)
  L2_2 = Wait
  L3_2 = 500
  L2_2(L3_2)
  L2_2 = VehicleForceOutPeds
  L3_2 = A0_2.carToKickDriverOutOf
  L2_2(L3_2)
  L2_2 = 0
  goto lbl_25
  repeat
    L3_2 = Wait
    L4_2 = 0
    L3_2(L4_2)
    L2_2 = L2_2 + 1
    if 15 < L2_2 then
      L2_2 = 0
      L3_2 = VehicleForceOutPeds
      L4_2 = A0_2.carToKickDriverOutOf
      L3_2(L4_2)
    end
    ::lbl_25::
    L3_2 = VehicleIsDrivenByPlayer
    L4_2 = A0_2.carToKickDriverOutOf
    L3_2 = L3_2(L4_2)
    if not L3_2 then
      break
    end
    L3_2 = IsPlayerDead
    L4_2 = L1_2
    L3_2 = L3_2(L4_2)
    if L3_2 then
      break
    end
    L4_2 = L1_2
    L3_2 = L1_2.IsPlaying
    L3_2 = L3_2(L4_2)
  until not L3_2
  L3_2 = VehicleSetEmergencyStop
  L4_2 = A0_2.carToKickDriverOutOf
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = true
  A0_2.isDriverKickedOutOfCar = L3_2
end
L0_1.Run = L1_1
L0_1 = CTF
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L6_2 = TeamColour
  L7_2 = 1
  L6_2 = L6_2(L7_2)
  if A4_2 == L6_2 then
    L6_2 = coreLib
    L7_2 = L6_2
    L6_2 = L6_2.Commentate
    L8_2 = "^S^~b~"
    L9_2 = A1_2
    L10_2 = "^S^ ~w~"
    L11_2 = A2_2
    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
    L6_2(L7_2, L8_2)
  else
    L6_2 = coreLib
    L7_2 = L6_2
    L6_2 = L6_2.Commentate
    L8_2 = "^S^~r~"
    L9_2 = A1_2
    L10_2 = "^S^ ~w~"
    L11_2 = A2_2
    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
    L6_2(L7_2, L8_2)
  end
end
L0_1.DisplayMessage = L1_1
L0_1 = CTFMessageDisplay
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "Message Display CLEANUP"
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = CTFMessageDisplay
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = Player
  L1_2 = L1_2()
  while 1 do
    L2_2 = table
    L2_2 = L2_2.getn
    L3_2 = main
    L3_2 = L3_2.game
    L3_2 = L3_2.MessageDisplayQueue
    L2_2 = L2_2(L3_2)
    if 0 < L2_2 then
      L2_2 = print
      L3_2 = "PRINTING MESSAGE THROUGH DISPLAY QUEUE"
      L2_2(L3_2)
      L2_2 = table
      L2_2 = L2_2.remove
      L3_2 = main
      L3_2 = L3_2.game
      L3_2 = L3_2.MessageDisplayQueue
      L4_2 = 1
      L2_2 = L2_2(L3_2, L4_2)
      L3_2 = TextSprite
      L5_2 = L1_2
      L4_2 = L1_2.PlayerNum
      L4_2 = L4_2(L5_2)
      L5_2 = 240
      L6_2 = 86
      L7_2 = 1
      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
      L5_2 = L3_2
      L4_2 = L3_2.Scale
      L6_2 = 2.609
      L4_2(L5_2, L6_2)
      L5_2 = L3_2
      L4_2 = L3_2.Style
      L6_2 = 2
      L4_2(L5_2, L6_2)
      L5_2 = L3_2
      L4_2 = L3_2.Colour
      L6_2 = L2_2.topcolour
      L4_2(L5_2, L6_2)
      L5_2 = L3_2
      L4_2 = L3_2.Text
      L6_2 = L2_2.topmsg
      L4_2(L5_2, L6_2)
      L4_2 = TextSprite
      L6_2 = L1_2
      L5_2 = L1_2.PlayerNum
      L5_2 = L5_2(L6_2)
      L6_2 = 240
      L7_2 = 125
      L8_2 = 1
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      L6_2 = L4_2
      L5_2 = L4_2.Scale
      L7_2 = 0.87
      L8_2 = 1
      L5_2(L6_2, L7_2, L8_2)
      L6_2 = L4_2
      L5_2 = L4_2.Style
      L7_2 = 0
      L5_2(L6_2, L7_2)
      L6_2 = L4_2
      L5_2 = L4_2.Colour
      L7_2 = L2_2.botcolour
      L5_2(L6_2, L7_2)
      L6_2 = L4_2
      L5_2 = L4_2.Text
      L7_2 = L2_2.botmsg
      L5_2(L6_2, L7_2)
      L5_2 = Wait
      L6_2 = L2_2.length
      L5_2(L6_2)
      L6_2 = L3_2
      L5_2 = L3_2.Remove
      L5_2(L6_2)
      L6_2 = L4_2
      L5_2 = L4_2.Remove
      L5_2(L6_2)
    end
    L2_2 = Wait
    L3_2 = 10
    L2_2(L3_2)
  end
end
L0_1.Run = L1_1
L0_1 = CTF
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = print
  L4_2 = "Deleting car with delay of "
  L5_2 = A2_2
  L4_2 = L4_2 .. L5_2
  L3_2(L4_2)
  L3_2 = CTFCarDeleteDelay
  L3_2 = L3_2()
  L3_2.delay = A2_2
  L3_2.carToDelete = A1_2
  L5_2 = L3_2
  L4_2 = L3_2.Start
  L4_2(L5_2)
end
L0_1.DeleteCarWithDelay = L1_1
L0_1 = CTFCarDeleteDelay
function L1_1(A0_2)
  local L1_2
end
L0_1.CleanUp = L1_1
L0_1 = CTFCarDeleteDelay
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = Wait
  L2_2 = A0_2.delay
  L1_2(L2_2)
  L1_2 = DeleteVehicle
  L2_2 = A0_2.carToDelete
  L1_2(L2_2)
end
L0_1.Run = L1_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2
  L1_2 = GameElapsedMs
  L2_2 = 0
  L1_2(L2_2)
  L1_2 = print
  L2_2 = "Game Location Is: "
  L3_2 = GameLocation
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L3_2()
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2)
  L1_2 = nil
  L2_2 = UseLCFiles
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = dofile
    L3_2 = GetDiskPrepend
    L3_2 = L3_2()
    L4_2 = "LUA/CaptureTheFlagData.lua.lc"
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  else
    L2_2 = dofile
    L3_2 = GetDiskPrepend
    L3_2 = L3_2()
    L4_2 = "LUA/CaptureTheFlagData.lua"
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  end
  L2_2 = {}
  L3_2 = nil
  L4_2 = {}
  L5_2 = {}
  L6_2 = nil
  L7_2 = {}
  L8_2 = {}
  L9_2 = {}
  L10_2 = {}
  L11_2 = {}
  L12_2 = nil
  L13_2 = nil
  L14_2 = {}
  A0_2.CarDealership1 = L14_2
  A0_2.CarDealership1Heading = nil
  L14_2 = {}
  A0_2.CarDealershipDrop1 = L14_2
  L14_2 = {}
  A0_2.CarDealership2 = L14_2
  A0_2.CarDealership2Heading = nil
  L14_2 = {}
  A0_2.CarDealershipDrop2 = L14_2
  L14_2 = {}
  A0_2.Team1InitSpawns = L14_2
  L14_2 = {}
  A0_2.Team1Spawns = L14_2
  L14_2 = {}
  A0_2.Team2InitSpawns = L14_2
  L14_2 = {}
  A0_2.Team2Spawns = L14_2
  A0_2.Car1ModelId = nil
  A0_2.Car2ModelId = nil
  L14_2 = L1_2
  L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2 = L14_2()
  L13_2 = L25_2
  L12_2 = L24_2
  L11_2 = L23_2
  L10_2 = L22_2
  L9_2 = L21_2
  L8_2 = L20_2
  L7_2 = L19_2
  L6_2 = L18_2
  L5_2 = L17_2
  L4_2 = L16_2
  L3_2 = L15_2
  L2_2 = L14_2
  L14_2 = table
  L14_2 = L14_2.clone
  L15_2 = L2_2
  L14_2 = L14_2(L15_2)
  A0_2.CarDealership1 = L14_2
  A0_2.CarDealership1Heading = L3_2
  L14_2 = table
  L14_2 = L14_2.clone
  L15_2 = L4_2
  L14_2 = L14_2(L15_2)
  A0_2.CarDealershipDrop1 = L14_2
  L14_2 = table
  L14_2 = L14_2.clone
  L15_2 = L5_2
  L14_2 = L14_2(L15_2)
  A0_2.CarDealership2 = L14_2
  A0_2.CarDealership2Heading = L6_2
  L14_2 = table
  L14_2 = L14_2.clone
  L15_2 = L7_2
  L14_2 = L14_2(L15_2)
  A0_2.CarDealershipDrop2 = L14_2
  L14_2 = table
  L14_2 = L14_2.clone
  L15_2 = L8_2
  L14_2 = L14_2(L15_2)
  A0_2.Team1InitSpawns = L14_2
  L14_2 = table
  L14_2 = L14_2.clone
  L15_2 = L9_2
  L14_2 = L14_2(L15_2)
  A0_2.Team1Spawns = L14_2
  L14_2 = table
  L14_2 = L14_2.clone
  L15_2 = L10_2
  L14_2 = L14_2(L15_2)
  A0_2.Team2InitSpawns = L14_2
  L14_2 = table
  L14_2 = L14_2.clone
  L15_2 = L11_2
  L14_2 = L14_2(L15_2)
  A0_2.Team2Spawns = L14_2
  A0_2.Car1ModelId = L12_2
  A0_2.Car2ModelId = L13_2
  L14_2 = PickupMgr
  L14_2 = L14_2()
  A0_2.mypickups = L14_2
  L14_2 = A0_2.mypickups
  L15_2 = L14_2
  L14_2 = L14_2.CreatePickups
  L14_2(L15_2)
  L14_2 = IsServer
  L14_2 = L14_2()
  if L14_2 then
    L14_2 = UsePowerups
    L14_2 = L14_2()
    if L14_2 then
      L14_2 = PowerUpTimer
      L15_2 = L14_2
      L14_2 = L14_2.Start
      L14_2(L15_2)
      L14_2 = DoesPowerupExist
      L14_2 = L14_2()
      if L14_2 < 2 then
        L14_2 = print
        L15_2 = "Respawning a power up at change sides"
        L14_2(L15_2)
        L14_2 = PowerUpTimer
        L15_2 = L14_2
        L14_2 = L14_2.CreateAPowerUp
        L14_2(L15_2)
      end
      L14_2 = DoesPowerupExist
      L14_2 = L14_2()
      if L14_2 < 2 then
        L14_2 = print
        L15_2 = "Respawning another power up at change sides"
        L14_2(L15_2)
        L14_2 = PowerUpTimer
        L15_2 = L14_2
        L14_2 = L14_2.CreateAPowerUp
        L14_2(L15_2)
      end
    end
  end
end
L0_1.InitGame = L1_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = MainLoop
  L1_2 = {}
  L0_2 = L0_2(L1_2)
  main = L0_2
  L0_2 = main
  L1_2 = Commentary
  L2_2 = {}
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.Start
  L1_2 = L1_2(L2_2)
  L0_2.commentary = L1_2
  L0_2 = main
  L1_2 = ScoreSheetScript
  L2_2 = {}
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.Start
  L1_2 = L1_2(L2_2)
  L0_2.scores = L1_2
  L0_2 = InitSpawnPoints
  L0_2()
  L0_2 = 0
  L1_2 = math
  L1_2 = L1_2.random
  L2_2 = 1
  L3_2 = table
  L3_2 = L3_2.getn
  L4_2 = main
  L4_2 = L4_2.vSpawnPoints
  L3_2, L4_2 = L3_2(L4_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2)
  L0_2 = L1_2
  L1_2 = CreatePlayer
  L2_2 = unpack
  L3_2 = main
  L3_2 = L3_2.vSpawnPoints
  L3_2 = L3_2[L0_2]
  L3_2 = L3_2[1]
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  L1_2(L2_2, L3_2, L4_2)
  goto lbl_44
  repeat
    L1_2 = Wait
    L2_2 = 10
    L1_2(L2_2)
    ::lbl_44::
    L1_2 = IsPlayerCreationQueued
    L1_2 = L1_2()
  until not L1_2
  L1_2 = PlayerName
  L2_2 = HostName
  L2_2, L3_2, L4_2 = L2_2()
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = main
  L2_2 = CTF
  L2_2 = L2_2()
  L3_2 = L2_2
  L2_2 = L2_2.Start
  L2_2 = L2_2(L3_2)
  L1_2.game = L2_2
  L1_2 = main
  L2_2 = L1_2
  L1_2 = L1_2.Start
  L1_2(L2_2)
end
Main = L0_1
