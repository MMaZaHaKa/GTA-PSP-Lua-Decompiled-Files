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
L0_1 = 140
CAR_MODELID = L0_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  goto lbl_5
  repeat
    L1_2 = Wait
    L2_2 = 100
    L1_2(L2_2)
    ::lbl_5::
    L1_2 = IsServer
    L1_2 = L1_2()
    if L1_2 then
      break
    end
    L1_2 = PlayerId
    L1_2 = L1_2()
  until L1_2 ~= 0
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
  goto lbl_102
  repeat
    L1_2 = Wait
    L2_2 = 100
    L1_2(L2_2)
    ::lbl_102::
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
  L2_2 = IsServer
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = print
    L3_2 = "Creating Vehicle 1"
    L2_2(L3_2)
    L2_2 = CreateVehicle
    L3_2 = CAR_MODELID
    L4_2 = A0_2.CarDealership1
    L5_2 = A0_2.CarDealership1Heading
    L6_2 = 3
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    A0_2.MissionCar1 = L2_2
    L2_2 = VehicleSetCarDoorLocks
    L3_2 = A0_2.MissionCar1
    L4_2 = CARLOCK_TEAM1_LOCKED
    L2_2(L3_2, L4_2)
    L2_2 = VehicleSetTyresNoBurst
    L3_2 = A0_2.MissionCar1
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = VehicleAdd3dMarker
    L3_2 = A0_2.MissionCar1
    L2_2(L3_2)
    L2_2 = print
    L3_2 = "Creating Vehicle 2"
    L2_2(L3_2)
    L2_2 = CreateVehicle
    L3_2 = CAR_MODELID
    L4_2 = A0_2.CarDealership2
    L5_2 = A0_2.CarDealership2Heading
    L6_2 = 7
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    A0_2.MissionCar2 = L2_2
    L2_2 = VehicleSetCarDoorLocks
    L3_2 = A0_2.MissionCar2
    L4_2 = CARLOCK_TEAM2_LOCKED
    L2_2(L3_2, L4_2)
    L2_2 = VehicleSetTyresNoBurst
    L3_2 = A0_2.MissionCar2
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = VehicleAdd3dMarker
    L3_2 = A0_2.MissionCar2
    L2_2(L3_2)
  end
  L2_2 = Wait
  L3_2 = 2000
  L2_2(L3_2)
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
  L3_2 = L1_2
  L2_2 = L1_2.TeamId
  L2_2 = L2_2(L3_2)
  L3_2 = teamId1
  if L2_2 == L3_2 then
    L2_2 = SetHalo
    L3_2 = A0_2.CarDealershipDrop1
    L4_2 = 0
    L5_2 = teamId1
    L6_2 = A0_2.CarDealershipDrop1
    L6_2 = L6_2[4]
    L6_2 = L6_2 * 2
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
    A0_2.enemyCarWP = L2_2
  else
    L2_2 = SetHalo
    L3_2 = A0_2.CarDealershipDrop2
    L4_2 = 0
    L5_2 = teamId2
    L6_2 = A0_2.CarDealershipDrop2
    L6_2 = L6_2[4]
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
    goto lbl_220
    repeat
      L2_2 = Wait
      L3_2 = 5
      L2_2(L3_2)
      ::lbl_220::
      L2_2 = SyncCutScene
      L2_2 = L2_2()
      L3_2 = false
    until L2_2 ~= L3_2
    L2_2 = RunScriptedCutscene
    L2_2()
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
    goto lbl_234
    repeat
      L2_2 = Wait
      L3_2 = 0
      L2_2(L3_2)
      ::lbl_234::
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
  L2_2 = "StateRunning"
  return L2_2
end
L0_1.StateInit = L1_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = {}
  A0_2.team1WhoInText = L2_2
  L2_2 = TextSprite
  L3_2 = L1_2
  L4_2 = 470
  L5_2 = team1TextY
  L6_2 = 2
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  A0_2.team1WhoInText = L2_2
  L2_2 = A0_2.team1WhoInText
  L3_2 = L2_2
  L2_2 = L2_2.Style
  L4_2 = 1
  L2_2(L3_2, L4_2)
  L2_2 = A0_2.team1WhoInText
  L3_2 = L2_2
  L2_2 = L2_2.Scale
  L4_2 = 0.4084
  L2_2(L3_2, L4_2)
  L2_2 = A0_2.team1WhoInText
  L3_2 = L2_2
  L2_2 = L2_2.Colour
  L4_2 = {}
  L5_2 = 255
  L6_2 = 255
  L7_2 = 255
  L8_2 = 255
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L2_2(L3_2, L4_2)
  L2_2 = A0_2.team1WhoInText
  L3_2 = L2_2
  L2_2 = L2_2.Text
  L4_2 = "^T^MPEMPTY"
  L2_2(L3_2, L4_2)
  L2_2 = {}
  A0_2.team2WhoInText = L2_2
  L2_2 = TextSprite
  L3_2 = L1_2
  L4_2 = 470
  L5_2 = team2TextY
  L6_2 = 2
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  A0_2.team2WhoInText = L2_2
  L2_2 = A0_2.team2WhoInText
  L3_2 = L2_2
  L2_2 = L2_2.Style
  L4_2 = 1
  L2_2(L3_2, L4_2)
  L2_2 = A0_2.team2WhoInText
  L3_2 = L2_2
  L2_2 = L2_2.Scale
  L4_2 = 0.4084
  L2_2(L3_2, L4_2)
  L2_2 = A0_2.team2WhoInText
  L3_2 = L2_2
  L2_2 = L2_2.Colour
  L4_2 = {}
  L5_2 = 255
  L6_2 = 255
  L7_2 = 255
  L8_2 = 255
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L4_2[4] = L8_2
  L2_2(L3_2, L4_2)
  L2_2 = A0_2.team2WhoInText
  L3_2 = L2_2
  L2_2 = L2_2.Text
  L4_2 = "^T^MPEMPTY"
  L2_2(L3_2, L4_2)
end
L0_1.ServerInit = L1_1
L0_1 = CTF
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = {}
  L4_2 = L1_2
  L3_2 = L1_2.TeamId
  L3_2 = L3_2(L4_2)
  L4_2 = teamId1
  if L3_2 == L4_2 then
    L3_2 = AddBlipForCoord
    L4_2 = L1_2
    L5_2 = A0_2.CarDealership1
    L6_2 = team1RadarColour
    L7_2 = pickupicon
    L7_2 = L7_2.base
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.baseBlip = L3_2
    L3_2 = AddBlipForCoord
    L4_2 = L1_2
    L5_2 = A0_2.CarDealership2
    L6_2 = team2RadarColour
    L7_2 = pickupicon
    L7_2 = L7_2.base
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.enemyBaseBlip = L3_2
    L3_2 = TeamPlayers
    L4_2 = teamId2
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
    L3_2 = {}
    A0_2.team1CarNameText = L3_2
    L3_2 = {}
    A0_2.team2CarNameText = L3_2
  else
    L3_2 = AddBlipForCoord
    L4_2 = L1_2
    L5_2 = A0_2.CarDealership2
    L6_2 = team2RadarColour
    L7_2 = pickupicon
    L7_2 = L7_2.base
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.baseBlip = L3_2
    L3_2 = AddBlipForCoord
    L4_2 = L1_2
    L5_2 = A0_2.CarDealership1
    L6_2 = team1RadarColour
    L7_2 = pickupicon
    L7_2 = L7_2.base
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.enemyBaseBlip = L3_2
    L3_2 = TeamPlayers
    L4_2 = teamId1
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
    L3_2 = {}
    A0_2.team1CarNameText = L3_2
    L3_2 = {}
    A0_2.team2CarNameText = L3_2
  end
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L5_2, L6_2 in L3_2, L4_2 do
    L8_2 = L6_2
    L7_2 = L6_2.SetRadarBlipShortRange
    L9_2 = true
    L7_2(L8_2, L9_2)
  end
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
      L2_2 = print
      L3_2 = "Horntest on"
      L2_2(L3_2)
      L2_2 = true
      hornDebounce = L2_2
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
    L6_2 = A0_2.CarDealership1
    L6_2 = L6_2[4]
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
          L5_2 = L3_2
          L6_2 = team1RadarColour
          L7_2 = pickupicon
          L7_2 = L7_2.car
          L4_2 = L4_2(L5_2, L6_2, L7_2)
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
    L6_2 = A0_2.CarDealershipDrop2
    L6_2 = L6_2[4]
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
    L8_2 = A0_2.CarDealership2
    L8_2 = L8_2[4]
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
          L7_2 = L5_2
          L8_2 = team2RadarColour
          L9_2 = pickupicon
          L9_2 = L9_2.car
          L6_2 = L6_2(L7_2, L8_2, L9_2)
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
    L8_2 = A0_2.CarDealershipDrop1
    L8_2 = L8_2[4]
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
      L4_2 = CreateVehicle
      L5_2 = CAR_MODELID
      L6_2 = A0_2.CarDealership2
      L7_2 = A0_2.CarDealership2Heading
      L8_2 = 7
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      A0_2.MissionCar2 = L4_2
      L4_2 = VehicleSetCarDoorLocks
      L5_2 = A0_2.MissionCar2
      L6_2 = CARLOCK_TEAM2_LOCKED
      L4_2(L5_2, L6_2)
      L4_2 = VehicleSetTyresNoBurst
      L5_2 = A0_2.MissionCar2
      L6_2 = true
      L4_2(L5_2, L6_2)
      L4_2 = VehicleAdd3dMarker
      L5_2 = A0_2.MissionCar2
      L4_2(L5_2)
    end
  end
  L4_2 = A0_2.team2CarStolen
  if not L4_2 then
    L4_2 = A0_2.team1CarInEnemyBay
    if L4_2 then
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
      L4_2 = CreateVehicle
      L5_2 = CAR_MODELID
      L6_2 = A0_2.CarDealership1
      L7_2 = A0_2.CarDealership1Heading
      L8_2 = 3
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      A0_2.MissionCar1 = L4_2
      L4_2 = VehicleSetCarDoorLocks
      L5_2 = A0_2.MissionCar1
      L6_2 = CARLOCK_TEAM1_LOCKED
      L4_2(L5_2, L6_2)
      L4_2 = VehicleSetTyresNoBurst
      L5_2 = A0_2.MissionCar1
      L6_2 = true
      L4_2(L5_2, L6_2)
      L4_2 = VehicleAdd3dMarker
      L5_2 = A0_2.MissionCar1
      L4_2(L5_2)
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
      goto lbl_591
    end
  end
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
  A0_2.MissionCar1 = nil
  L4_2 = CreateVehicle
  L5_2 = CAR_MODELID
  L6_2 = A0_2.CarDealership1
  L7_2 = A0_2.CarDealership1Heading
  L8_2 = 3
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  A0_2.MissionCar1 = L4_2
  L4_2 = VehicleAdd3dMarker
  L5_2 = A0_2.MissionCar1
  L4_2(L5_2)
  ::lbl_591::
  L4_2 = VehicleHealth
  L5_2 = A0_2.MissionCar2
  L4_2 = L4_2(L5_2)
  if not (L4_2 <= 0) then
    L4_2 = IsVehicleWrecked
    L5_2 = A0_2.MissionCar2
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      goto lbl_630
    end
  end
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
  A0_2.MissionCar2 = nil
  L4_2 = CreateVehicle
  L5_2 = CAR_MODELID
  L6_2 = A0_2.CarDealership2
  L7_2 = A0_2.CarDealership2Heading
  L8_2 = 7
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  A0_2.MissionCar2 = L4_2
  L4_2 = VehicleAdd3dMarker
  L5_2 = A0_2.MissionCar2
  L4_2(L5_2)
  ::lbl_630::
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
  L3_2 = VehicleGetModelId
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = CAR_MODELID
  if L3_2 == L4_2 then
    L3_2 = LimitVehicleSpeed
    L4_2 = L2_2
    L5_2 = limoVelMaxMag
    L6_2 = limoSpeedCapMod
    L3_2(L4_2, L5_2, L6_2)
  end
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
        L6_2 = "^T^MPRDCAP"
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
        L6_2 = "^T^MPBLCAP"
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
    goto lbl_382
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
          L7_2 = teamId2
          L8_2 = A0_2.CarDealership1
          L8_2 = L8_2[4]
          L8_2 = L8_2 * 2
          L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
          A0_2.team1OwnCarWP = L4_2
        end
        L5_2 = A0_2
        L4_2 = A0_2.DisplayMessage
        L6_2 = "^T^MTN_1"
        L7_2 = "^T^MPBLST"
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
            L7_2 = teamId2
            L8_2 = A0_2.CarDealership1
            L8_2 = L8_2[4]
            L8_2 = L8_2 * 2
            L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
            A0_2.team1OwnCarWP = L4_2
          end
          L5_2 = A0_2
          L4_2 = A0_2.DisplayMessage
          L6_2 = "^T^MTN_1"
          L7_2 = "^T^MPBLPOS"
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
            L7_2 = "^T^MPBLRET"
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
                L7_2 = teamId1
                L8_2 = A0_2.CarDealership2
                L8_2 = L8_2[4]
                L8_2 = L8_2 * 2
                L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
                A0_2.team2OwnCarWP = L4_2
              end
              L5_2 = A0_2
              L4_2 = A0_2.DisplayMessage
              L6_2 = "^T^MTN_2"
              L7_2 = "^T^MPRDST"
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
                  L7_2 = teamId1
                  L8_2 = A0_2.CarDealership2
                  L8_2 = L8_2[4]
                  L8_2 = L8_2 * 2
                  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
                  A0_2.team2OwnCarWP = L4_2
                end
                L5_2 = A0_2
                L4_2 = A0_2.DisplayMessage
                L6_2 = "^T^MTN_2"
                L7_2 = "^T^MPRDPOS"
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
                  L7_2 = "^T^MPRDRET"
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
                        L7_2 = teamId2
                        L8_2 = A0_2.CarDealershipDrop2
                        L8_2 = L8_2[4]
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
                            L7_2 = teamId1
                            L8_2 = A0_2.CarDealershipDrop1
                            L8_2 = L8_2[4]
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
      ::lbl_382::
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
    L6_2 = DoSpawn
    L7_2 = InitialSpawnPoint
    L8_2 = PlayerId
    L8_2 = L8_2()
    L7_2, L8_2 = L7_2(L8_2)
    L6_2(L7_2, L8_2)
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
L0_1 = CTF
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = main
  L2_2 = L2_2.commentary
  L3_2 = L2_2
  L2_2 = L2_2.Print
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
end
L0_1.Commentate = L1_1
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
    L5_2 = A0_2
    L4_2 = A0_2.Commentate
    L6_2 = "^S^"
    L8_2 = A1_2
    L7_2 = A1_2.Name
    L7_2 = L7_2(L8_2)
    L8_2 = "^S^ ^T^MPKSELF"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L4_2(L5_2, L6_2)
  elseif A3_2 then
    L5_2 = A0_2
    L4_2 = A0_2.Commentate
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
    L5_2 = A0_2
    L4_2 = A0_2.Commentate
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
      L9_2 = L6_2
      L10_2 = 470
      L11_2 = team1TextY
      L11_2 = L11_2 - 16
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
        L9_2 = L6_2
        L10_2 = 470
        L11_2 = team2TextY
        L11_2 = L11_2 - 16
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
  L10_2 = 0.4084
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
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = VehicleSetEmergencyStop
  L2_2 = A0_2.carToKickDriverOutOf
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = Wait
  L2_2 = 500
  L1_2(L2_2)
  L1_2 = VehicleForceOutPeds
  L2_2 = A0_2.carToKickDriverOutOf
  L1_2(L2_2)
  L1_2 = 0
  goto lbl_23
  repeat
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
    L1_2 = L1_2 + 1
    if 15 < L1_2 then
      L1_2 = 0
      L2_2 = VehicleForceOutPeds
      L3_2 = A0_2.carToKickDriverOutOf
      L2_2(L3_2)
    end
    ::lbl_23::
    L2_2 = VehicleIsDrivenByPlayer
    L3_2 = A0_2.carToKickDriverOutOf
    L2_2 = L2_2(L3_2)
  until not L2_2
  L2_2 = VehicleSetEmergencyStop
  L3_2 = A0_2.carToKickDriverOutOf
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = true
  A0_2.isDriverKickedOutOfCar = L2_2
end
L0_1.Run = L1_1
L0_1 = CTF
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L6_2 = TeamColour
  L7_2 = 1
  L6_2 = L6_2(L7_2)
  if A4_2 == L6_2 then
    L7_2 = A0_2
    L6_2 = A0_2.Commentate
    L8_2 = "^S^~b~"
    L9_2 = A1_2
    L10_2 = "^S^ ~w~"
    L11_2 = A2_2
    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
    L6_2(L7_2, L8_2)
  else
    L7_2 = A0_2
    L6_2 = A0_2.Commentate
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
      L4_2 = L1_2
      L5_2 = 235
      L6_2 = 86
      L7_2 = 1
      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
      L5_2 = L3_2
      L4_2 = L3_2.Scale
      L6_2 = 1.2
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
      L5_2 = L1_2
      L6_2 = 235
      L7_2 = 125
      L8_2 = 1
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      L6_2 = L4_2
      L5_2 = L4_2.Scale
      L7_2 = 0.4
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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = GameElapsedMs
  L2_2 = 0
  L1_2(L2_2)
  L1_2 = print
  L2_2 = "Game Location Is: "
  L3_2 = GameLocation
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L3_2()
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L1_2 = GameLocation
  L1_2 = L1_2()
  if L1_2 == 0 then
    L1_2 = {}
    L2_2 = 1232.5714
    L3_2 = -87.1016
    L4_2 = 11.7673
    L5_2 = 5
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    L1_2[4] = L5_2
    A0_2.CarDealership1 = L1_2
    A0_2.CarDealership1Heading = 90.0655
    L1_2 = {}
    L2_2 = 1231.7108
    L3_2 = -103.4972
    L4_2 = 13.3987
    L5_2 = 5
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    L1_2[4] = L5_2
    A0_2.CarDealershipDrop1 = L1_2
    L1_2 = {}
    L2_2 = 1244.634
    L3_2 = -94.8901
    L4_2 = 12.2382
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    A0_2.CarDealershipCabin1 = L1_2
    A0_2.CarDealershipCabinHeading1 = 280
    L1_2 = {}
    L2_2 = 907.4211
    L3_2 = -897.7053
    L4_2 = 13.9333
    L5_2 = 5
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    L1_2[4] = L5_2
    A0_2.CarDealership2 = L1_2
    A0_2.CarDealership2Heading = 180.5468
    L1_2 = {}
    L2_2 = 916.7495
    L3_2 = -900.9651
    L4_2 = 13.9333
    L5_2 = 5
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    L1_2[4] = L5_2
    A0_2.CarDealershipDrop2 = L1_2
    L1_2 = {}
    L2_2 = 931.5425
    L3_2 = -901.4952
    L4_2 = 13.5335
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    A0_2.CarDealershipCabin2 = L1_2
    A0_2.CarDealershipCabinHeading2 = 264
    L1_2 = {}
    L2_2 = {}
    L3_2 = {}
    L4_2 = 1245.5764
    L5_2 = -119.3942
    L6_2 = 13.9326
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L4_2 = 49.8267
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L3_2 = {}
    L4_2 = {}
    L5_2 = 1215.7571
    L6_2 = -118.3896
    L7_2 = 13.9326
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L5_2 = 359.5657
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L4_2 = {}
    L5_2 = {}
    L6_2 = 1216.8038
    L7_2 = -65.0373
    L8_2 = 9.5535
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L6_2 = 177.6218
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L5_2 = {}
    L6_2 = {}
    L7_2 = 1238.3368
    L8_2 = -72.7951
    L9_2 = 10.3317
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 141.8636
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = {}
    L7_2 = {}
    L8_2 = 1243.1484
    L9_2 = -85.036
    L10_2 = 12.6
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = 178.4465
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = {}
    L8_2 = {}
    L9_2 = 1214.1349
    L10_2 = -90.6364
    L11_2 = 13.1644
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = 47.1516
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = 1227.0343
    L11_2 = -112.0405
    L12_2 = 14.9456
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L10_2 = 221.1017
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = {}
    L10_2 = {}
    L11_2 = 1208.2361
    L12_2 = -102.8584
    L13_2 = 14.3751
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L11_2 = 32.3911
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    L1_2[4] = L5_2
    L1_2[5] = L6_2
    L1_2[6] = L7_2
    L1_2[7] = L8_2
    L1_2[8] = L9_2
    A0_2.Team1InitSpawns = L1_2
    L1_2 = {}
    L2_2 = {}
    L3_2 = {}
    L4_2 = 1141.7538
    L5_2 = 39.4818
    L6_2 = -1.5354
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L4_2 = 206.0494
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L3_2 = {}
    L4_2 = {}
    L5_2 = 1142.1028
    L6_2 = -92.71
    L7_2 = 6.4345
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L5_2 = 309.8683
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L4_2 = {}
    L5_2 = {}
    L6_2 = 1104.2711
    L7_2 = -108.6361
    L8_2 = 8.334
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L6_2 = 235.2965
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L5_2 = {}
    L6_2 = {}
    L7_2 = 1340.1337
    L8_2 = -29.3839
    L9_2 = 13.6599
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 80.7714
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = {}
    L7_2 = {}
    L8_2 = 1313.1125
    L9_2 = -77.7719
    L10_2 = 16.2475
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = 178.4465
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = {}
    L8_2 = {}
    L9_2 = 1243.0214
    L10_2 = -28.7687
    L11_2 = 8.9407
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = 47.1516
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = 1174.9203
    L11_2 = -68.5446
    L12_2 = 7.4735
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L10_2 = 221.1017
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = {}
    L10_2 = {}
    L11_2 = 1224.4297
    L12_2 = -159.0303
    L13_2 = 18.2364
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L11_2 = 32.3911
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    L1_2[4] = L5_2
    L1_2[5] = L6_2
    L1_2[6] = L7_2
    L1_2[7] = L8_2
    L1_2[8] = L9_2
    A0_2.Team1Spawns = L1_2
    L1_2 = {}
    L2_2 = {}
    L3_2 = {}
    L4_2 = 897.8068
    L5_2 = -904.9676
    L6_2 = 13.9333
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L4_2 = 199.0864
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L3_2 = {}
    L4_2 = {}
    L5_2 = 930.8286
    L6_2 = -894.0044
    L7_2 = 13.934
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L5_2 = 120.1053
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L4_2 = {}
    L5_2 = {}
    L6_2 = 920.5967
    L7_2 = -915.8045
    L8_2 = 13.9334
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L6_2 = 40.9089
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L5_2 = {}
    L6_2 = {}
    L7_2 = 898.8245
    L8_2 = -893.7159
    L9_2 = 13.9333
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 188.5873
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = {}
    L7_2 = {}
    L8_2 = 906.4426
    L9_2 = -929.1682
    L10_2 = 14.9744
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = 331.1504
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = {}
    L8_2 = {}
    L9_2 = 946.033
    L10_2 = -901.1781
    L11_2 = 14.9881
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = 48.1246
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = 945.9496
    L11_2 = -888.2452
    L12_2 = 15.653
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L10_2 = 126.4652
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = {}
    L10_2 = {}
    L11_2 = 919.9361
    L12_2 = -885.5676
    L13_2 = 15.2589
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L11_2 = 170.9446
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    L1_2[4] = L5_2
    L1_2[5] = L6_2
    L1_2[6] = L7_2
    L1_2[7] = L8_2
    L1_2[8] = L9_2
    A0_2.Team2InitSpawns = L1_2
    L1_2 = {}
    L2_2 = {}
    L3_2 = {}
    L4_2 = 1016.6302
    L5_2 = -854.1656
    L6_2 = 13.9298
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L4_2 = 188.5873
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L3_2 = {}
    L4_2 = {}
    L5_2 = 870.8047
    L6_2 = -992.8137
    L7_2 = 4.0137
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L5_2 = 224.8946
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L4_2 = {}
    L5_2 = {}
    L6_2 = 978.1308
    L7_2 = -751.1743
    L8_2 = 13.9329
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L6_2 = 156.1697
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L5_2 = {}
    L6_2 = {}
    L7_2 = 771.5789
    L8_2 = -779.2554
    L9_2 = 13.7052
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 209.5637
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = {}
    L7_2 = {}
    L8_2 = 1029.2559
    L9_2 = -779.0171
    L10_2 = 14.9981
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = 99.7938
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = {}
    L8_2 = {}
    L9_2 = 1025.2542
    L10_2 = -808.6592
    L11_2 = 15.0244
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = 187.9843
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = 976.6887
    L11_2 = -808.5751
    L12_2 = 14.9782
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L10_2 = 153.0549
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = {}
    L10_2 = {}
    L11_2 = 902.7792
    L12_2 = -854.6254
    L13_2 = 14.9733
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L11_2 = 201.6201
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    L1_2[4] = L5_2
    L1_2[5] = L6_2
    L1_2[6] = L7_2
    L1_2[7] = L8_2
    L1_2[8] = L9_2
    A0_2.Team2Spawns = L1_2
  else
    L1_2 = GameLocation
    L1_2 = L1_2()
    if L1_2 == 1 then
      L1_2 = {}
      L2_2 = 340.8907
      L3_2 = -1058.914
      L4_2 = 24.9564
      L5_2 = 5
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      A0_2.CarDealership1 = L1_2
      A0_2.CarDealership1Heading = 90.6019
      L1_2 = {}
      L2_2 = 340.8791
      L3_2 = -1065.6602
      L4_2 = 24.9564
      L5_2 = 5
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      A0_2.CarDealershipDrop1 = L1_2
      L1_2 = {}
      L2_2 = -58.9795
      L3_2 = -1466.4183
      L4_2 = 24.6041
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      A0_2.CarDealershipCabin1 = L1_2
      A0_2.CarDealershipCabinHeading1 = 270
      L1_2 = {}
      L2_2 = -75.5708
      L3_2 = -1458.8881
      L4_2 = 25.1041
      L5_2 = 5
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      A0_2.CarDealership2 = L1_2
      A0_2.CarDealership2Heading = 270.1214
      L1_2 = {}
      L2_2 = -76.6505
      L3_2 = -1466.8876
      L4_2 = 25.1041
      L5_2 = 5
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      A0_2.CarDealershipDrop2 = L1_2
      L1_2 = {}
      L2_2 = 329.064
      L3_2 = -1080
      L4_2 = 24.4564
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      A0_2.CarDealershipCabin2 = L1_2
      A0_2.CarDealershipCabinHeading2 = 180
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = 322.3411
      L5_2 = -1055.8333
      L6_2 = 24.9564
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 220.0321
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = 359.1031
      L6_2 = -1056.7825
      L7_2 = 24.9564
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 117.5816
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = 321.5251
      L7_2 = -1072.3105
      L8_2 = 24.9564
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 264.1837
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = 361.6044
      L8_2 = -1073.0287
      L9_2 = 24.9564
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 64.4156
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = 350.0195
      L9_2 = -1081.4915
      L10_2 = 25.9828
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 13.1181
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = 330.1381
      L10_2 = -1080.3517
      L11_2 = 25.9964
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 344.2704
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = 339.9622
      L11_2 = -1079.3536
      L12_2 = 24.1099
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 338.9399
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = 330.7365
      L12_2 = -1063.7026
      L13_2 = 25.9964
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 43.4321
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      L1_2[5] = L6_2
      L1_2[6] = L7_2
      L1_2[7] = L8_2
      L1_2[8] = L9_2
      A0_2.Team1InitSpawns = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = 202.952
      L5_2 = -1007.3057
      L6_2 = 25.1053
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 70.0448
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = 325.1018
      L6_2 = -1001.0543
      L7_2 = 26.1009
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 133.1441
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = 237.4705
      L7_2 = -1125.2434
      L8_2 = 25.1263
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 181.1538
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = 361.2229
      L8_2 = -1201.7072
      L9_2 = 25.1268
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 184.1448
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = 321.06
      L9_2 = -1214.8745
      L10_2 = 25.5704
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 338.0473
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = 328.522
      L10_2 = -1180.6151
      L11_2 = 25.1363
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 355.6235
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = 394.2084
      L11_2 = -1141.4446
      L12_2 = 24.8964
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 105.4178
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = 296.3605
      L12_2 = -1083.2832
      L13_2 = 27.3182
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 285.3825
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      L1_2[5] = L6_2
      L1_2[6] = L7_2
      L1_2[7] = L8_2
      L1_2[8] = L9_2
      A0_2.Team1Spawns = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = -112.3078
      L5_2 = -1441.3772
      L6_2 = 25.1041
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 219.8633
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -54.32
      L6_2 = -1440.5249
      L7_2 = 25.1041
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 133.8662
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = -57.581
      L7_2 = -1487.8593
      L8_2 = 25.1041
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 41.4029
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = -89.5294
      L8_2 = -1485.616
      L9_2 = 25.1041
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 338.4181
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = -106.2682
      L9_2 = -1461.7526
      L10_2 = 25.1397
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 298.0639
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = -83.0357
      L10_2 = -1483.2728
      L11_2 = 25.1397
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 355.9948
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = -57.1385
      L11_2 = -1473.9656
      L12_2 = 25.1397
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 105.328
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = -79.979
      L12_2 = -1440.5107
      L13_2 = 25.1397
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 138.5269
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      L1_2[5] = L6_2
      L1_2[6] = L7_2
      L1_2[7] = L8_2
      L1_2[8] = L9_2
      A0_2.Team2InitSpawns = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = -101.3633
      L5_2 = -1274.2051
      L6_2 = 25.2598
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 153.1491
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -213.2106
      L6_2 = -1443.8563
      L7_2 = 24.9768
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 328.5909
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = 74.0989
      L7_2 = -1548.3989
      L8_2 = 27.2541
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 88.9048
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = 107.5575
      L8_2 = -1398.7982
      L9_2 = 20.7603
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 265.7173
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = 95.6443
      L9_2 = -1451.393
      L10_2 = 27.9257
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 169.955
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = 63.8127
      L10_2 = -1507.7124
      L11_2 = 24.1237
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 101.7611
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = 21.2943
      L11_2 = -1286.9828
      L12_2 = 25.2497
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 190.2937
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = -177.346
      L12_2 = -1323.4846
      L13_2 = 24.0365
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 230.6843
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      L1_2[5] = L6_2
      L1_2[6] = L7_2
      L1_2[7] = L8_2
      L1_2[8] = L9_2
      A0_2.Team2Spawns = L1_2
    else
      L1_2 = {}
      L2_2 = -661.2014
      L3_2 = 74.7028
      L4_2 = 17.6722
      L5_2 = 5
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      A0_2.CarDealership1 = L1_2
      L1_2 = 271.0901
      A0_2.CarDealership1Heading = L1_2
      L1_2 = {}
      L2_2 = -669.8249
      L3_2 = 87.316
      L4_2 = 17.7343
      L5_2 = 5
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      A0_2.CarDealershipDrop1 = L1_2
      L1_2 = {}
      L2_2 = -671.0649
      L3_2 = 96.5543
      L4_2 = 17.7154
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      A0_2.CarDealershipCabin1 = L1_2
      L1_2 = 90
      A0_2.CarDealershipCabinHeading1 = L1_2
      L1_2 = {}
      L2_2 = -714.7087
      L3_2 = 202.3628
      L4_2 = 27.6714
      L5_2 = 5
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      A0_2.CarDealership2 = L1_2
      L1_2 = 180.6782
      A0_2.CarDealership2Heading = L1_2
      L1_2 = {}
      L2_2 = -723.7484
      L3_2 = 188.9629
      L4_2 = 27.6714
      L5_2 = 5
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      A0_2.CarDealershipDrop2 = L1_2
      L1_2 = {}
      L2_2 = -720.379
      L3_2 = 182.6423
      L4_2 = 27.6714
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      A0_2.CarDealershipCabin2 = L1_2
      A0_2.CarDealershipCabinHeading2 = 180
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = -686.5741
      L5_2 = 76.2871
      L6_2 = 17.8006
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 13.0018
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -688.8741
      L6_2 = 100.6959
      L7_2 = 17.7606
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 226.2985
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = -671.7313
      L7_2 = 63.5963
      L8_2 = 17.7002
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 359.3725
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = -643.748
      L8_2 = 80.1658
      L9_2 = 17.7183
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 62.7505
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = -654.5239
      L9_2 = 94.5877
      L10_2 = 17.7287
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 115.9277
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = -659.2164
      L10_2 = 77.6652
      L11_2 = 17.7168
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 32.6719
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = -682.229
      L11_2 = 84.3535
      L12_2 = 17.827
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 280.8443
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = -680.9987
      L12_2 = 51.1813
      L13_2 = 17.8074
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 347.5601
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      L1_2[5] = L6_2
      L1_2[6] = L7_2
      L1_2[7] = L8_2
      L1_2[8] = L9_2
      A0_2.Team1InitSpawns = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = -644.5105
      L5_2 = -26.6813
      L6_2 = 17.8226
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 58.5638
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -666.1693
      L6_2 = -4.3022
      L7_2 = 17.8226
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 50.484
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = -547.8697
      L7_2 = 123.3818
      L8_2 = 16.9394
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 50.484
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = -552.5445
      L8_2 = -29.7968
      L9_2 = 13.5731
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 100.7629
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = -724.6157
      L9_2 = 53.1869
      L10_2 = 19.1559
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 277.4213
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = -645.9449
      L10_2 = -108.3989
      L11_2 = 8.3931
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 28.282
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = -477.1399
      L11_2 = 122.3857
      L12_2 = 17.2881
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 152.2549
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = -630.005
      L12_2 = -44.0967
      L13_2 = 17.8645
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 31.474
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      L1_2[5] = L6_2
      L1_2[6] = L7_2
      L1_2[7] = L8_2
      L1_2[8] = L9_2
      A0_2.Team1Spawns = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = -707.7809
      L5_2 = 202.219
      L6_2 = 27.6714
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 142.802
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -741.2185
      L6_2 = 201.9469
      L7_2 = 27.6714
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 146.9903
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = -767.7602
      L7_2 = 192.0488
      L8_2 = 27.6727
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 193.4055
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = -757.5176
      L8_2 = 173.7704
      L9_2 = 27.7848
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 297.1597
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = -771.2601
      L9_2 = 176.1161
      L10_2 = 27.7843
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 317.0504
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = -778.9791
      L10_2 = 164.3747
      L11_2 = 27.8598
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 311.0777
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = -725.9549
      L11_2 = 167.6629
      L12_2 = 27.8598
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 352.9944
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = -754.8513
      L12_2 = 186.7145
      L13_2 = 27.7114
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 254.3391
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      L1_2[5] = L6_2
      L1_2[6] = L7_2
      L1_2[7] = L8_2
      L1_2[8] = L9_2
      A0_2.Team2InitSpawns = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = -746.5695
      L5_2 = 273.545
      L6_2 = 53.1422
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 178.825
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -715.1263
      L6_2 = 257.2971
      L7_2 = 52.9928
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 181.9062
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = -597.3809
      L7_2 = 204.71
      L8_2 = 45.0581
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 197.323
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = -575.4649
      L8_2 = 181.0112
      L9_2 = 42.8673
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 148.0049
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = -747.4327
      L9_2 = 112.1068
      L10_2 = 26.1034
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 21.8778
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = -542.0806
      L10_2 = 190.5937
      L11_2 = 44.485
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 106.0352
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = -606.757
      L11_2 = 147.2856
      L12_2 = 39.6848
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 66.8711
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = -767.9937
      L12_2 = 112.1536
      L13_2 = 27.8598
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 344.5143
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      L1_2[5] = L6_2
      L1_2[6] = L7_2
      L1_2[7] = L8_2
      L1_2[8] = L9_2
      A0_2.Team2Spawns = L1_2
    end
  end
  L1_2 = "mypickups"
  L2_2 = PickupMgr
  L2_2 = L2_2()
  A0_2[L1_2] = L2_2
  L1_2 = "mypickups"
  L1_2 = A0_2[L1_2]
  L3_2 = "CreatePickups"
  L2_2 = L1_2
  L1_2 = L1_2[L3_2]
  L1_2(L2_2)
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = UsePowerups
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = PowerUpTimer
      L3_2 = "Start"
      L2_2 = L1_2
      L1_2 = L1_2[L3_2]
      L1_2(L2_2)
      L1_2 = DoesPowerupExist
      L1_2 = L1_2()
      L2_2 = 2
      if L1_2 < L2_2 then
        L1_2 = print
        L2_2 = "Respawning a power up at change sides"
        L1_2(L2_2)
        L1_2 = PowerUpTimer
        L3_2 = "CreateAPowerUp"
        L2_2 = L1_2
        L1_2 = L1_2[L3_2]
        L1_2(L2_2)
      end
      L1_2 = DoesPowerupExist
      L1_2 = L1_2()
      L2_2 = 2
      if L1_2 < L2_2 then
        L1_2 = print
        L2_2 = "Respawning another power up at change sides"
        L1_2(L2_2)
        L1_2 = PowerUpTimer
        L3_2 = "CreateAPowerUp"
        L2_2 = L1_2
        L1_2 = L1_2[L3_2]
        L1_2(L2_2)
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
