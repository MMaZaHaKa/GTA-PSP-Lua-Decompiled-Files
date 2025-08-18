local L0_1, L1_1, L2_1, L3_1
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
L0_1 = StateMachine
L1_1 = {}
L2_1 = "StateInit"
L1_1[1] = L2_1
L0_1 = L0_1(L1_1)
SixtySeconds = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
SS_ServerLogic = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
SS_MessageDisplay = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
SSKickOutOfCar = L0_1
L0_1 = PowerupTimer
L0_1 = L0_1()
PowerUpTimer = L0_1
L0_1 = false
hornDebounce = L0_1
L0_1 = 1
testSpawnPoint = L0_1
L0_1 = 2
NumCarsInList = L0_1
L0_1 = {}
L1_1 = car
L1_1 = L1_1.esperanto
L2_1 = car
L2_1 = L2_1.stinger
L3_1 = car
L3_1 = L3_1.banshee
L0_1[1] = L1_1
L0_1[2] = L2_1
L0_1[3] = L3_1
CarsToCollect = L0_1
L0_1 = 16777215
EVENTMASK_NONE = L0_1
L0_1 = 255 * 256
L0_1 = L0_1 * 256
EVENTMASK_TYPE = L0_1
L0_1 = 255 * 256
EVENTMASK_PARAM1 = L0_1
L0_1 = 255
EVENTMASK_PARAM2 = L0_1
L0_1 = 16
EVENTSHIFT_TYPE = L0_1
L0_1 = 8
EVENTSHIFT_PARAM1 = L0_1
L0_1 = 0
EVENTSHIFT_PARAM2 = L0_1
L0_1 = 1
EVENT_ASSIGNED_GARAGE = L0_1
L0_1 = 2
EVENT_CLIENT_HAS_COLLECTED_CAR = L0_1
L0_1 = 3
EVENT_GAME_FINISHED = L0_1
L0_1 = 4
EVENT_UNASSIGNED_GARAGE = L0_1
L0_1 = 5
EVENT_GARAGE_STATE_CHANGE = L0_1
L0_1 = 6
EVENT_HIDE_GARAGE = L0_1
L0_1 = 7
EVENT_SHOW_GARAGE = L0_1
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
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = DbgPrintAllOptions
  L1_2()
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.Init
  L1_2(L2_2)
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.WaitForAllPlayersToJoin
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.InitGameData
  L1_2(L2_2)
  L1_2 = GenerateAmbients
  L2_2 = false
  L1_2(L2_2)
  L1_2 = print
  L2_2 = "Creating pickup manager"
  L1_2(L2_2)
  L1_2 = PickupMgr
  L1_2 = L1_2()
  A0_2.mypickups = L1_2
  L1_2 = A0_2.mypickups
  L2_2 = L1_2
  L1_2 = L1_2.CreatePickups
  L1_2(L2_2)
  A0_2.carsCaptured = 0
  A0_2.carsDestroyed = 0
  L1_2 = {}
  A0_2.carsToBeDeleted = L1_2
  L1_2 = print
  L2_2 = "Done creating pickup manager"
  L1_2(L2_2)
  L1_2 = false
  A0_2.waitNextServerUpdate = L1_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = AllPlayers
  L2_2 = L2_2()
  L3_2 = {}
  A0_2.Garages = L3_2
  L3_2 = {}
  A0_2.GarageState = L3_2
  L3_2 = 1
  L4_2 = table
  L4_2 = L4_2.getn
  L5_2 = A0_2.GarageSpawnPoints
  L4_2 = L4_2(L5_2)
  L5_2 = 1
  L3_2 = L3_2 - L5_2
  for L3_2 = L3_2, L4_2, L5_2 do
  end
  L3_2 = UseSuperBrakeOnPause
  L4_2 = false
  L3_2(L4_2)
  L3_2 = IsServer
  L3_2 = L3_2()
  if L3_2 then
    L4_2 = A0_2
    L3_2 = A0_2.CreateServerObjects
    L3_2(L4_2)
    L3_2 = print
    L4_2 = "Got out of create server objects."
    L3_2(L4_2)
  end
  if nil == 10 then
    L3_2 = print
    L4_2 = "WASASASASA2!"
    L3_2(L4_2)
  end
  A0_2.MyGarage = nil
  A0_2.MyGarageBlip = nil
  A0_2.MyGarageHalo = nil
  L3_2 = {}
  A0_2.MyGaragePos = L3_2
  A0_2.CarToCollect = nil
  L3_2 = false
  A0_2.IsInTargetCar = L3_2
  L3_2 = false
  A0_2.gameFinished = L3_2
  A0_2.lastCarHealth = 0
  A0_2.totalCarsCollected = 0
  L3_2 = {}
  A0_2.playerscores = L3_2
  L3_2 = {}
  A0_2.carsCollected = L3_2
  L3_2 = false
  A0_2.targetWasInGarage = L3_2
  L3_2 = false
  A0_2.wasDrivingCar = L3_2
  A0_2.garageTest = 1
  L3_2 = IsServer
  L3_2 = L3_2()
  if L3_2 then
    L3_2 = UsePowerups
    L3_2 = L3_2()
    if L3_2 then
      L3_2 = PowerUpTimer
      L4_2 = L3_2
      L3_2 = L3_2.Start
      L3_2(L4_2)
      L3_2 = DoesPowerupExist
      L3_2 = L3_2()
      if L3_2 < 2 then
        L3_2 = print
        L4_2 = "Respawning a power up at change sides"
        L3_2(L4_2)
        L3_2 = PowerUpTimer
        L4_2 = L3_2
        L3_2 = L3_2.CreateAPowerUp
        L3_2(L4_2)
      end
      L3_2 = DoesPowerupExist
      L3_2 = L3_2()
      if L3_2 < 2 then
        L3_2 = print
        L4_2 = "Respawning another power up at change sides"
        L3_2(L4_2)
        L3_2 = PowerUpTimer
        L4_2 = L3_2
        L3_2 = L3_2.CreateAPowerUp
        L3_2(L4_2)
      end
    end
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
  L3_2 = IsServer
  L3_2 = L3_2()
  if L3_2 then
    L3_2 = ServerReadyToGo
    L4_2 = true
    L3_2(L4_2)
    L3_2 = Wait
    L4_2 = 500
    L3_2(L4_2)
  end
  L3_2 = IsServer
  L3_2 = L3_2()
  if L3_2 then
    L3_2 = print
    L4_2 = "Strarting server logic"
    L3_2(L4_2)
    L3_2 = SS_ServerLogic
    L3_2 = L3_2()
    A0_2.SS_ServerLogic = L3_2
    L3_2 = A0_2.SS_ServerLogic
    L4_2 = L3_2
    L3_2 = L3_2.Start
    L3_2(L4_2)
  end
  L3_2 = print
  L4_2 = "***** ID: "
  L5_2 = PlayerId
  L5_2 = L5_2()
  L6_2 = " Spawn: "
  L7_2 = InitialSpawnPoint
  L8_2 = PlayerId
  L8_2, L9_2 = L8_2()
  L7_2 = L7_2(L8_2, L9_2)
  L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
  L3_2(L4_2)
  L4_2 = A0_2
  L3_2 = A0_2.DoSpawn
  L5_2 = InitialSpawnPoint
  L6_2 = PlayerId
  L6_2, L7_2, L8_2, L9_2 = L6_2()
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L3_2 = RenderHudExtras
  L4_2 = false
  L3_2(L4_2)
  L3_2 = NoFuckingCutscene
  L3_2 = L3_2()
  if not L3_2 then
    L3_2 = main
    L3_2 = L3_2.scores
    L4_2 = L3_2
    L3_2 = L3_2.Hide
    L5_2 = true
    L3_2(L4_2, L5_2)
    L3_2 = Wait
    L4_2 = 0
    L3_2(L4_2)
    goto lbl_186
    repeat
      L3_2 = Wait
      L4_2 = 5
      L3_2(L4_2)
      ::lbl_186::
      L3_2 = SyncCutScene
      L3_2 = L3_2()
      L4_2 = false
    until L3_2 ~= L4_2
    L3_2 = RunScriptedCutscene
    L3_2()
    L3_2 = Wait
    L4_2 = 0
    L3_2(L4_2)
    goto lbl_200
    repeat
      L3_2 = Wait
      L4_2 = 0
      L3_2(L4_2)
      ::lbl_200::
      L3_2 = ProcessScriptedCutscene
      L3_2 = L3_2()
    until not L3_2
    L3_2 = main
    L3_2 = L3_2.scores
    L4_2 = L3_2
    L3_2 = L3_2.Hide
    L5_2 = false
    L3_2(L4_2, L5_2)
  else
    L3_2 = Wait
    L4_2 = 20
    L3_2(L4_2)
    L3_2 = ClearSplashScreen
    L3_2()
  end
  L3_2 = GenerateAmbients
  L4_2 = true
  L3_2(L4_2)
  L3_2 = RenderHudExtras
  L4_2 = true
  L3_2(L4_2)
  L3_2 = UpdateGameTime
  L4_2 = true
  L3_2(L4_2)
  L3_2 = {}
  A0_2.MessageDisplayQueue = L3_2
  L3_2 = SS_MessageDisplay
  L3_2 = L3_2()
  A0_2.SS_MessageDisplay = L3_2
  L3_2 = A0_2.SS_MessageDisplay
  L4_2 = L3_2
  L3_2 = L3_2.Start
  L3_2(L4_2)
  L3_2 = print
  L4_2 = "printing Now Get Cars message"
  L3_2(L4_2)
  L4_2 = A0_2
  L3_2 = A0_2.DisplayMessage
  L5_2 = "^T^MPWLNGC"
  L6_2 = 2000
  L3_2(L4_2, L5_2, L6_2)
  L3_2 = "StateRunning"
  return L3_2
end
L0_1.StateInit = L1_1
L0_1 = SS_ServerLogic
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
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = RenderHudExtras
  L3_2 = false
  L2_2(L3_2)
  L2_2 = A0_2.gameFinished
  if L2_2 then
    A0_2.state = "StateGameWon"
  end
  L2_2 = RenderHudExtras
  L3_2 = true
  L2_2(L3_2)
  L3_2 = L1_2
  L2_2 = L1_2.IsPlaying
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = A0_2.MyGarage
    if L2_2 then
      A0_2.MyGarage = nil
    end
    L2_2 = DoWasted
    L2_2()
    L3_2 = A0_2
    L2_2 = A0_2.DoSpawn
    L2_2(L3_2)
    L3_2 = L1_2
    L2_2 = L1_2.SetRadarBlipVisibleState
    L4_2 = true
    L2_2(L3_2, L4_2)
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
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2.SS_ServerLogic
  if L1_2 then
    L1_2 = A0_2.SS_ServerLogic
    L2_2 = L1_2
    L1_2 = L1_2.Stop
    L1_2(L2_2)
  end
  L1_2 = A0_2.mytimer
  L2_2 = L1_2
  L1_2 = L1_2.Stop
  L1_2(L2_2)
  L1_2 = A0_2.mypickups
  L2_2 = L1_2
  L1_2 = L1_2.Cleanup
  L1_2(L2_2)
  L1_2 = RestoreCamera
  L2_2 = 0
  L3_2 = newplayer
  L1_2(L2_2, L3_2)
  L1_2 = collectgarbage
  L1_2()
  L1_2 = RenderHudExtras
  L2_2 = false
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = A0_2.waitNextServerUpdate
  if L1_2 then
    L1_2 = Wait
    L2_2 = 4
    L1_2(L2_2)
  end
  L1_2 = false
  A0_2.waitNextServerUpdate = L1_2
  L1_2 = ipairs
  L2_2 = A0_2.targetCars
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L3_2, L4_2 in L1_2, L2_2 do
    L5_2 = VehicleIsDrivenByPlayer
    L6_2 = L4_2.Vehicle
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = Player
      L6_2 = L4_2.LastDriver
      L5_2 = L5_2(L6_2)
      L6_2 = L5_2
      L5_2 = L5_2.IsDead
      L5_2 = L5_2(L6_2)
      if L5_2 then
        L6_2 = A0_2
        L5_2 = A0_2.DoSendEvent
        L7_2 = EVENT_UNASSIGNED_GARAGE
        L8_2 = L4_2.LastDriver
        L9_2 = 0
        L5_2(L6_2, L7_2, L8_2, L9_2)
        L5_2 = false
        L4_2.HasDriver = L5_2
        L5_2 = false
        L4_2.HasGarageAssigned = L5_2
        L4_2.Garage = -1
        L5_2 = Player
        L6_2 = L4_2.LastDriver
        L5_2 = L5_2(L6_2)
        L6_2 = L5_2
        L5_2 = L5_2.SetRadarBlipVisibleState
        L7_2 = true
        L5_2(L6_2, L7_2)
        L5_2 = SetBlipVisibleForPlayerState
        L6_2 = L4_2.OwnBlip
        L7_2 = L4_2.LastDriver
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L4_2.LastDriver = -1
      end
    end
    L5_2 = IsVehicleWrecked
    L6_2 = L4_2.Vehicle
    L5_2 = L5_2(L6_2)
    if not L5_2 then
      L5_2 = VehicleHealth
      L6_2 = L4_2.Vehicle
      L5_2 = L5_2(L6_2)
      if 0 < L5_2 then
        L5_2 = VehicleIsDrivenByPlayer
        L6_2 = L4_2.Vehicle
        L5_2 = L5_2(L6_2)
        if L5_2 then
          L5_2 = Player
          L6_2 = VehicleGetDriverPlayerId
          L7_2 = L4_2.Vehicle
          L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L6_2(L7_2)
          L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
          L6_2 = L5_2
          L5_2 = L5_2.IsDead
          L5_2 = L5_2(L6_2)
          if not L5_2 then
            L5_2 = VehicleIsDrivenByPlayer
            L6_2 = L4_2.Vehicle
            L5_2 = L5_2(L6_2)
            L6_2 = L4_2.HasDriver
            if L5_2 ~= L6_2 then
              L5_2 = print
              L6_2 = "Target car "
              L7_2 = L3_2
              L8_2 = " now has a driver "
              L9_2 = VehicleGetDriverPlayerId
              L10_2 = L4_2.Vehicle
              L9_2 = L9_2(L10_2)
              L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2
              L5_2(L6_2)
              L5_2 = print
              L6_2 = "Target car has health "
              L7_2 = VehicleHealth
              L8_2 = L4_2.Vehicle
              L7_2 = L7_2(L8_2)
              L6_2 = L6_2 .. L7_2
              L5_2(L6_2)
              L5_2 = SetRadarBlipColour
              L6_2 = L4_2.OwnBlip
              L7_2 = VehicleGetDriverPlayerColour
              L8_2 = L4_2.Vehicle
              L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L7_2(L8_2)
              L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
              L5_2 = VehicleIsDrivenByPlayer
              L6_2 = L4_2.Vehicle
              L5_2 = L5_2(L6_2)
              if L5_2 then
                L5_2 = true
                L4_2.HasDriver = L5_2
                L5_2 = VehicleGetDriverPlayerId
                L6_2 = L4_2.Vehicle
                L5_2 = L5_2(L6_2)
                L6_2 = L4_2.LastDriver
                if L5_2 ~= L6_2 then
                  L5_2 = L4_2.HasGarageAssigned
                  if L5_2 then
                    L5_2 = false
                    L4_2.HasGarageAssigned = L5_2
                    L5_2 = L4_2.LastDriver
                    if L5_2 ~= -1 then
                      L6_2 = A0_2
                      L5_2 = A0_2.DoSendEvent
                      L7_2 = EVENT_UNASSIGNED_GARAGE
                      L8_2 = L4_2.LastDriver
                      L9_2 = L4_2.Garage
                      L5_2(L6_2, L7_2, L8_2, L9_2)
                    end
                  end
                  L5_2 = L4_2.LastDriver
                  if L5_2 ~= -1 then
                    L5_2 = Player
                    L6_2 = L4_2.LastDriver
                    L5_2 = L5_2(L6_2)
                    L6_2 = L5_2
                    L5_2 = L5_2.SetRadarBlipVisibleState
                    L7_2 = true
                    L5_2(L6_2, L7_2)
                    L5_2 = SetBlipVisibleForPlayerState
                    L6_2 = L4_2.OwnBlip
                    L7_2 = L4_2.LastDriver
                    L8_2 = true
                    L5_2(L6_2, L7_2, L8_2)
                  end
                  L5_2 = VehicleGetDriverPlayerId
                  L6_2 = L4_2.Vehicle
                  L5_2 = L5_2(L6_2)
                  L4_2.LastDriver = L5_2
                  L5_2 = L4_2.LastDriver
                  if L5_2 ~= -1 then
                    L5_2 = Player
                    L6_2 = L4_2.LastDriver
                    L5_2 = L5_2(L6_2)
                    L6_2 = L5_2
                    L5_2 = L5_2.SetRadarBlipVisibleState
                    L7_2 = false
                    L5_2(L6_2, L7_2)
                    L5_2 = SetBlipVisibleForPlayerState
                    L6_2 = L4_2.OwnBlip
                    L7_2 = L4_2.LastDriver
                    L8_2 = false
                    L5_2(L6_2, L7_2, L8_2)
                  end
                  L5_2 = false
                  L6_2 = 0
                  while not L5_2 do
                    L7_2 = math
                    L7_2 = L7_2.random
                    L8_2 = 1
                    L9_2 = table
                    L9_2 = L9_2.getn
                    L10_2 = A0_2.GarageSpawnPoints
                    L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L9_2(L10_2)
                    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
                    L8_2 = false
                    L9_2 = print
                    L10_2 = "Random garage "
                    L11_2 = L7_2
                    L12_2 = " being checked"
                    L10_2 = L10_2 .. L11_2 .. L12_2
                    L9_2(L10_2)
                    L9_2 = pairs
                    L10_2 = A0_2.targetCars
                    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
                    for L11_2, L12_2 in L9_2, L10_2 do
                      L13_2 = print
                      L14_2 = "Cars garage "
                      L15_2 = L12_2.Garage
                      L16_2 = "\n"
                      L14_2 = L14_2 .. L15_2 .. L16_2
                      L13_2(L14_2)
                      L13_2 = L12_2.Garage
                      if L7_2 == L13_2 then
                        L13_2 = print
                        L14_2 = "garage is in use."
                        L13_2(L14_2)
                        L8_2 = true
                      end
                    end
                    if not L8_2 or 10 < L6_2 then
                      L4_2.Garage = L7_2
                      L5_2 = true
                    end
                    L6_2 = L6_2 + 1
                  end
                  L7_2 = L4_2.GarageBlip
                  if L7_2 then
                    L7_2 = RemoveBlip
                    L8_2 = L4_2.GarageBlip
                    L7_2(L8_2)
                  end
                  L7_2 = true
                  L4_2.HasGarageAssigned = L7_2
                  L7_2 = print
                  L8_2 = "SENDING ASSIGNMENT MESSAGE!"
                  L7_2(L8_2)
                  L8_2 = A0_2
                  L7_2 = A0_2.DoSendEvent
                  L9_2 = EVENT_ASSIGNED_GARAGE
                  L10_2 = L4_2.LastDriver
                  L11_2 = L4_2.Garage
                  L7_2(L8_2, L9_2, L10_2, L11_2)
                else
                  L5_2 = L4_2.LastDriver
                  if L5_2 ~= -1 then
                    L5_2 = Player
                    L6_2 = L4_2.LastDriver
                    L5_2 = L5_2(L6_2)
                    L6_2 = L5_2
                    L5_2 = L5_2.SetRadarBlipVisibleState
                    L7_2 = false
                    L5_2(L6_2, L7_2)
                    L5_2 = SetBlipVisibleForPlayerState
                    L6_2 = L4_2.OwnBlip
                    L7_2 = L4_2.LastDriver
                    L8_2 = false
                    L5_2(L6_2, L7_2, L8_2)
                  end
                  L5_2 = true
                  L4_2.HasGarageAssigned = L5_2
                  L6_2 = A0_2
                  L5_2 = A0_2.DoSendEvent
                  L7_2 = EVENT_SHOW_GARAGE
                  L8_2 = L4_2.LastDriver
                  L9_2 = L4_2.Garage
                  L5_2(L6_2, L7_2, L8_2, L9_2)
                end
              else
                L5_2 = print
                L6_2 = "Got to weird if point."
                L5_2(L6_2)
                L5_2 = false
                L4_2.HasDriver = L5_2
                L5_2 = print
                L6_2 = "Sending unassign garage message"
                L5_2(L6_2)
                L5_2 = false
                L4_2.HasGarageAssigned = L5_2
                L4_2.Garage = -1
                L5_2 = L4_2.LastDriver
                if L5_2 ~= -1 then
                  L6_2 = A0_2
                  L5_2 = A0_2.DoSendEvent
                  L7_2 = EVENT_UNASSIGNED_GARAGE
                  L8_2 = L4_2.LastDriver
                  L9_2 = L4_2.Garage
                  L5_2(L6_2, L7_2, L8_2, L9_2)
                end
                L5_2 = L4_2.LastDriver
                if L5_2 ~= -1 then
                  L5_2 = Player
                  L6_2 = L4_2.LastDriver
                  L5_2 = L5_2(L6_2)
                  L6_2 = L5_2
                  L5_2 = L5_2.SetRadarBlipVisibleState
                  L7_2 = true
                  L5_2(L6_2, L7_2)
                  L5_2 = SetBlipVisibleForPlayerState
                  L6_2 = L4_2.OwnBlip
                  L7_2 = L4_2.LastDriver
                  L8_2 = true
                  L5_2(L6_2, L7_2, L8_2)
                end
                L4_2.LastDriver = -1
              end
          end
        end
      end
    end
    else
      L5_2 = VehicleIsDrivenByPlayer
      L6_2 = L4_2.Vehicle
      L5_2 = L5_2(L6_2)
      if not L5_2 then
        L5_2 = L4_2.HasDriver
        if L5_2 then
          L5_2 = SetRadarBlipColour
          L6_2 = L4_2.OwnBlip
          L7_2 = 3
          L5_2(L6_2, L7_2)
          L5_2 = false
          L4_2.HasDriver = L5_2
          L5_2 = print
          L6_2 = "Sending hide garage message"
          L5_2(L6_2)
          L5_2 = L4_2.LastDriver
          if L5_2 ~= -1 then
            L5_2 = Player
            L6_2 = L4_2.LastDriver
            L5_2 = L5_2(L6_2)
            L6_2 = L5_2
            L5_2 = L5_2.SetRadarBlipVisibleState
            L7_2 = true
            L5_2(L6_2, L7_2)
            L5_2 = SetBlipVisibleForPlayerState
            L6_2 = L4_2.OwnBlip
            L7_2 = L4_2.LastDriver
            L8_2 = true
            L5_2(L6_2, L7_2, L8_2)
          end
          L6_2 = A0_2
          L5_2 = A0_2.DoSendEvent
          L7_2 = EVENT_HIDE_GARAGE
          L8_2 = L4_2.LastDriver
          L9_2 = L4_2.Garage
          L5_2(L6_2, L7_2, L8_2, L9_2)
        end
      end
    end
    L5_2 = L4_2.Vehicle
    if L5_2 then
      L5_2 = VehiclePosition
      L6_2 = L4_2.Vehicle
      L5_2 = L5_2(L6_2)
      if L5_2 then
        L5_2 = PointInActivityZone
        L6_2 = VehiclePosition
        L7_2 = L4_2.Vehicle
        L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L6_2(L7_2)
        L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
        if not L5_2 then
          L5_2 = VehicleHealth
          L6_2 = L4_2.Vehicle
          L5_2 = L5_2(L6_2)
          if 100 < L5_2 then
            L5_2 = VehicleSetHealth
            L6_2 = L4_2.Vehicle
            L7_2 = 100
            L5_2(L6_2, L7_2)
          end
        end
      end
    end
    L5_2 = VehicleHealth
    L6_2 = L4_2.Vehicle
    L5_2 = L5_2(L6_2)
    if L5_2 then
      L5_2 = VehicleHealth
      L6_2 = L4_2.Vehicle
      L5_2 = L5_2(L6_2)
      if not (L5_2 <= 0) then
        L5_2 = IsVehicleWrecked
        L6_2 = L4_2.Vehicle
        L5_2 = L5_2(L6_2)
        if not L5_2 then
          goto lbl_397
        end
      end
      L5_2 = print
      L6_2 = "culling car"
      L5_2(L6_2)
      L5_2 = L4_2.LastDriver
      if L5_2 ~= -1 then
        L5_2 = Player
        L6_2 = L4_2.LastDriver
        L5_2 = L5_2(L6_2)
        L6_2 = L5_2
        L5_2 = L5_2.SetRadarBlipVisibleState
        L7_2 = true
        L5_2(L6_2, L7_2)
        L5_2 = SetBlipVisibleForPlayerState
        L6_2 = L4_2.OwnBlip
        L7_2 = L4_2.LastDriver
        L8_2 = true
        L5_2(L6_2, L7_2, L8_2)
        L5_2 = print
        L6_2 = "sending unassign garage message with params "
        L7_2 = L4_2.LastDriver
        L8_2 = L4_2.Garage
        L6_2 = L6_2 .. L7_2 .. L8_2
        L5_2(L6_2)
        L6_2 = A0_2
        L5_2 = A0_2.DoSendEvent
        L7_2 = EVENT_UNASSIGNED_GARAGE
        L8_2 = L4_2.LastDriver
        L9_2 = L4_2.Garage
        L5_2(L6_2, L7_2, L8_2, L9_2)
      end
      L5_2 = table
      L5_2 = L5_2.insert
      L6_2 = A0_2.carsToBeDeleted
      L7_2 = L4_2.Vehicle
      L5_2(L6_2, L7_2)
      L5_2 = print
      L6_2 = "Create Car in health cull"
      L5_2(L6_2)
      L6_2 = A0_2
      L5_2 = A0_2.CreateTargetCar
      L7_2 = L3_2
      L5_2(L6_2, L7_2)
      L5_2 = A0_2.carsDestroyed
      L5_2 = L5_2 + 1
      A0_2.carsDestroyed = L5_2
      L5_2 = Wait
      L6_2 = 0
      L5_2(L6_2)
    end
    ::lbl_397::
  end
  L1_2 = ipairs
  L2_2 = A0_2.carsToBeDeleted
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L3_2, L4_2 in L1_2, L2_2 do
    L5_2 = VehicleIsDrivenByPlayer
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if not L5_2 then
      L5_2 = print
      L6_2 = "Deleting a car!"
      L5_2(L6_2)
      L5_2 = DeleteVehicle
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = table
      L5_2 = L5_2.remove
      L6_2 = A0_2.carsToBeDeleted
      L7_2 = L3_2
      L5_2(L6_2, L7_2)
    end
  end
end
L0_1.DoServerLogic = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = A0_2
  L1_2 = A0_2.ProcessEvents
  L1_2(L2_2)
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.Car
  L2_2 = L2_2(L3_2)
  L3_2 = A0_2.MyGarage
  if L3_2 then
    L3_2 = IsPosInArea
    L5_2 = L1_2
    L4_2 = L1_2.Position
    L4_2 = L4_2(L5_2)
    L5_2 = A0_2.MyGaragePos
    L6_2 = 5
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    if L3_2 then
      L3_2 = A0_2.IsInTargetCar
      if L3_2 then
        L3_2 = print
        L4_2 = "Driver is in halo"
        L3_2(L4_2)
        L4_2 = A0_2
        L3_2 = A0_2.KickDriverOutOfCar
        L5_2 = L2_2
        L3_2(L4_2, L5_2)
        L3_2 = print
        L4_2 = "Attempting to delete car"
        L3_2(L4_2)
        L3_2 = DeleteVehicle
        L4_2 = L2_2
        L3_2(L4_2)
        L3_2 = RemoveBlip
        L4_2 = A0_2.MyGarageBlip
        L3_2(L4_2)
        L3_2 = RemoveHalo
        L4_2 = A0_2.MyGarageHalo
        L3_2(L4_2)
        A0_2.MyGarageBlip = nil
        A0_2.MyGarage = nil
        L3_2 = {}
        A0_2.MyGaragePos = L3_2
        L4_2 = L1_2
        L3_2 = L1_2.SetRadarBlipVisibleState
        L5_2 = true
        L3_2(L4_2, L5_2)
        L4_2 = A0_2
        L3_2 = A0_2.DoSendEvent
        L5_2 = EVENT_CLIENT_HAS_COLLECTED_CAR
        L6_2 = PlayerId
        L6_2 = L6_2()
        L7_2 = A0_2.lastCarHealth
        L7_2 = L7_2 / 10
        L3_2(L4_2, L5_2, L6_2, L7_2)
      end
    end
  end
  L4_2 = L1_2
  L3_2 = L1_2.Car
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = true
    A0_2.wasDrivingCar = L3_2
    L4_2 = L1_2
    L3_2 = L1_2.Car
    L3_2 = L3_2(L4_2)
    L4_2 = VehicleHealth
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    A0_2.lastCarHealth = L4_2
  else
    L3_2 = false
    A0_2.wasDrivingCar = L3_2
  end
end
L0_1.DoClientLogic = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = -1
  goto lbl_65
  repeat
    L2_2 = GetEvent
    L2_2 = L2_2()
    L1_2 = L2_2
    L2_2 = print
    L3_2 = "Got event code "
    L4_2 = L1_2
    L3_2 = L3_2 .. L4_2
    L2_2(L3_2)
    L2_2 = MaskEventNumber
    L3_2 = L1_2
    L4_2 = EVENTMASK_TYPE
    L5_2 = EVENTSHIFT_TYPE
    L5_2 = -L5_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L3_2 = MaskEventNumber
    L4_2 = L1_2
    L5_2 = EVENTMASK_PARAM1
    L6_2 = EVENTSHIFT_PARAM1
    L6_2 = -L6_2
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L4_2 = MaskEventNumber
    L5_2 = L1_2
    L6_2 = EVENTMASK_PARAM2
    L7_2 = EVENTSHIFT_PARAM2
    L7_2 = -L7_2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L5_2 = print
    L6_2 = "Receiving Event "
    L7_2 = L2_2
    L8_2 = " "
    L9_2 = L3_2
    L10_2 = " "
    L11_2 = L4_2
    L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
    L5_2(L6_2)
    L5_2 = {}
    L6_2 = EVENT_ASSIGNED_GARAGE
    L7_2 = A0_2.HandleAssignedGarage
    L5_2[L6_2] = L7_2
    L6_2 = EVENT_CLIENT_HAS_COLLECTED_CAR
    L7_2 = A0_2.HandleClientHasCollectedCar
    L5_2[L6_2] = L7_2
    L6_2 = EVENT_GAME_FINISHED
    L7_2 = A0_2.HandleEventGameFinished
    L5_2[L6_2] = L7_2
    L6_2 = EVENT_UNASSIGNED_GARAGE
    L7_2 = A0_2.HandleUnassignedGarage
    L5_2[L6_2] = L7_2
    L6_2 = EVENT_GARAGE_STATE_CHANGE
    L7_2 = A0_2.HandleGarageStateChange
    L5_2[L6_2] = L7_2
    L6_2 = EVENT_HIDE_GARAGE
    L7_2 = A0_2.HandleHideGarage
    L5_2[L6_2] = L7_2
    L6_2 = EVENT_SHOW_GARAGE
    L7_2 = A0_2.HandleShowGarage
    L5_2[L6_2] = L7_2
    L6_2 = L5_2[L2_2]
    L7_2 = A0_2
    L8_2 = L3_2
    L9_2 = L4_2
    L6_2(L7_2, L8_2, L9_2)
    ::lbl_65::
    L2_2 = IsEventStackEmpty
    L2_2 = L2_2()
  until L2_2
end
L0_1.ProcessEvents = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = Player
  L3_2 = L3_2()
  L5_2 = L3_2
  L4_2 = L3_2.PlayerNum
  L4_2 = L4_2(L5_2)
  if A1_2 == L4_2 then
    L4_2 = print
    L5_2 = "I have been assigned a garage of id "
    L6_2 = A2_2
    L5_2 = L5_2 .. L6_2
    L4_2(L5_2)
    L4_2 = A0_2.MyGarageBlip
    if L4_2 then
      L4_2 = RemoveBlip
      L5_2 = A0_2.MyGarageBlip
      L4_2(L5_2)
    end
    L4_2 = AddBlipForCoord
    L6_2 = L3_2
    L5_2 = L3_2.PlayerNum
    L5_2 = L5_2(L6_2)
    L6_2 = A0_2.GarageSpawnPoints
    L6_2 = L6_2[A2_2]
    L6_2 = L6_2[1]
    L7_2 = 5
    L8_2 = pickupicon
    L8_2 = L8_2.carlockup
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    A0_2.MyGarageBlip = L4_2
    A0_2.MyGarage = A2_2
    L4_2 = A0_2.MyGarageHalo
    if L4_2 then
      L4_2 = RemoveHalo
      L5_2 = A0_2.MyGarageHalo
      L4_2(L5_2)
    end
    L4_2 = SetHalo
    L5_2 = A0_2.GarageSpawnPoints
    L5_2 = L5_2[A2_2]
    L5_2 = L5_2[1]
    L6_2 = 0
    L7_2 = 6
    L8_2 = 10
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    A0_2.MyGarageHalo = L4_2
    L4_2 = A0_2.GarageSpawnPoints
    L4_2 = L4_2[A2_2]
    L4_2 = L4_2[1]
    A0_2.MyGaragePos = L4_2
    L5_2 = A0_2
    L4_2 = A0_2.DisplayMessage
    L6_2 = "^T^MPWLDTC"
    L7_2 = 2000
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = true
    A0_2.IsInTargetCar = L4_2
  end
  L4_2 = coreLib
  L5_2 = L4_2
  L4_2 = L4_2.Commentate
  L6_2 = "^S^"
  L7_2 = Player
  L8_2 = A1_2
  L7_2 = L7_2(L8_2)
  L8_2 = L7_2
  L7_2 = L7_2.Name
  L7_2 = L7_2(L8_2)
  L8_2 = " ^T^MPWLPAC"
  L6_2 = L6_2 .. L7_2 .. L8_2
  L4_2(L5_2, L6_2)
  L5_2 = L3_2
  L4_2 = L3_2.PlayerNum
  L4_2 = L4_2(L5_2)
  if A1_2 == L4_2 then
    goto lbl_74
    repeat
      L4_2 = Wait
      L5_2 = 0
      L4_2(L5_2)
      ::lbl_74::
      L5_2 = L3_2
      L4_2 = L3_2.Car
      L4_2 = L4_2(L5_2)
    until L4_2 ~= nil
    L5_2 = L3_2
    L4_2 = L3_2.Car
    L4_2 = L4_2(L5_2)
    A0_2.CarToCollect = L4_2
  end
end
L0_1.HandleAssignedGarage = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = Player
  L3_2 = L3_2()
  L5_2 = L3_2
  L4_2 = L3_2.PlayerNum
  L4_2 = L4_2(L5_2)
  if A1_2 == L4_2 then
    L4_2 = A0_2.MyGarage
    if A2_2 == L4_2 then
      L4_2 = print
      L5_2 = "I have been unassigned my garage"
      L4_2(L5_2)
      L4_2 = A0_2.MyGarageBlip
      if L4_2 then
        L4_2 = RemoveBlip
        L5_2 = A0_2.MyGarageBlip
        L4_2(L5_2)
        A0_2.MyGarageBlip = nil
      end
      L4_2 = A0_2.MyGarageHalo
      if L4_2 then
        L4_2 = RemoveHalo
        L5_2 = A0_2.MyGarageHalo
        L4_2(L5_2)
        A0_2.MyGarageHalo = nil
      end
      L4_2 = A0_2.MyGarage
      if L4_2 then
        A0_2.MyGarage = nil
      end
      A0_2.CarToCollect = nil
      L4_2 = {}
      A0_2.MyGaragePos = L4_2
      L4_2 = false
      A0_2.IsInTargetCar = L4_2
    end
  end
end
L0_1.HandleUnassignedGarage = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = Player
  L3_2 = L3_2()
  L5_2 = L3_2
  L4_2 = L3_2.PlayerNum
  L4_2 = L4_2(L5_2)
  if A1_2 == L4_2 then
    L4_2 = A0_2.MyGarageBlip
    if L4_2 then
      L4_2 = RemoveBlip
      L5_2 = A0_2.MyGarageBlip
      L4_2(L5_2)
      A0_2.MyGarageBlip = nil
    end
    L4_2 = A0_2.MyGarageHalo
    if L4_2 then
      L4_2 = RemoveHalo
      L5_2 = A0_2.MyGarageHalo
      L4_2(L5_2)
      A0_2.MyGarageHalo = nil
    end
    L4_2 = false
    A0_2.IsInTargetCar = L4_2
  end
end
L0_1.HandleHideGarage = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = Player
  L3_2 = L3_2()
  L5_2 = L3_2
  L4_2 = L3_2.PlayerNum
  L4_2 = L4_2(L5_2)
  if A1_2 == L4_2 then
    L4_2 = A0_2.MyGarageBlip
    if L4_2 then
      L4_2 = RemoveBlip
      L5_2 = A0_2.MyGarageBlip
      L4_2(L5_2)
    end
    L4_2 = A0_2.MyGarageBlip
    if L4_2 == nil and A2_2 ~= 0 then
      L4_2 = AddBlipForCoord
      L6_2 = L3_2
      L5_2 = L3_2.PlayerNum
      L5_2 = L5_2(L6_2)
      L6_2 = A0_2.GarageSpawnPoints
      L6_2 = L6_2[A2_2]
      L6_2 = L6_2[1]
      L7_2 = 5
      L8_2 = pickupicon
      L8_2 = L8_2.carlockup
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      A0_2.MyGarageBlip = L4_2
    end
    L4_2 = A0_2.MyGarageHalo
    if L4_2 then
      L4_2 = RemoveHalo
      L5_2 = A0_2.MyGarageHalo
      L4_2(L5_2)
    end
    L4_2 = A0_2.MyGarageHalo
    if L4_2 == nil and A2_2 ~= 0 then
      L4_2 = SetHalo
      L5_2 = A0_2.GarageSpawnPoints
      L5_2 = L5_2[A2_2]
      L5_2 = L5_2[1]
      L6_2 = 0
      L7_2 = 6
      L8_2 = 10
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      A0_2.MyGarageHalo = L4_2
    end
    L4_2 = true
    A0_2.IsInTargetCar = L4_2
  end
end
L0_1.HandleShowGarage = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = IsServer
  L3_2 = L3_2()
  if L3_2 then
    L3_2 = print
    L4_2 = "Server handling client has collected car"
    L3_2(L4_2)
    L3_2 = print
    L4_2 = "Pre handle carsCaptured = "
    L5_2 = A0_2.carsCaptured
    L4_2 = L4_2 .. L5_2
    L3_2(L4_2)
    L3_2 = A0_2.carsCaptured
    L3_2 = L3_2 + 1
    A0_2.carsCaptured = L3_2
    L3_2 = ipairs
    L4_2 = A0_2.targetCars
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L5_2, L6_2 in L3_2, L4_2 do
      L7_2 = L6_2.LastDriver
      if L7_2 == A1_2 then
        L7_2 = print
        L8_2 = "Post inc cars captured = "
        L9_2 = A0_2.carsCaptured
        L8_2 = L8_2 .. L9_2
        L7_2(L8_2)
        L7_2 = print
        L8_2 = "Doing server cleanup for collected car"
        L7_2(L8_2)
        L7_2 = RemoveBlip
        L8_2 = L6_2.OwnBlip
        L7_2(L8_2)
        L7_2 = print
        L8_2 = "Create Target Car in HCHCC"
        L7_2(L8_2)
        L8_2 = A0_2
        L7_2 = A0_2.CreateTargetCar
        L9_2 = L5_2
        L7_2(L8_2, L9_2)
      end
    end
  end
  L3_2 = Player
  L3_2 = L3_2()
  L5_2 = L3_2
  L4_2 = L3_2.PlayerNum
  L4_2 = L4_2(L5_2)
  if L4_2 == A1_2 then
    L4_2 = coreLib
    L5_2 = L4_2
    L4_2 = L4_2.Commentate
    L6_2 = "^T^MPWLCD"
    L4_2(L5_2, L6_2)
  else
    L4_2 = coreLib
    L5_2 = L4_2
    L4_2 = L4_2.Commentate
    L6_2 = "^S^"
    L7_2 = Player
    L8_2 = A1_2
    L7_2 = L7_2(L8_2)
    L8_2 = L7_2
    L7_2 = L7_2.Name
    L7_2 = L7_2(L8_2)
    L8_2 = " ^T^MPWLDAC"
    L6_2 = L6_2 .. L7_2 .. L8_2
    L4_2(L5_2, L6_2)
  end
  L4_2 = A2_2 * 10
  L5_2 = print
  L6_2 = "Incrementing score of player "
  L7_2 = A1_2
  L8_2 = " by "
  L9_2 = A2_2 * 10
  L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2
  L5_2(L6_2)
  L5_2 = A0_2.playerscores
  L6_2 = Player
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  L8_2 = A0_2
  L7_2 = A0_2.Score
  L9_2 = Player
  L10_2 = A1_2
  L9_2, L10_2 = L9_2(L10_2)
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L7_2 = L7_2 + L4_2
  L5_2[L6_2] = L7_2
  L5_2 = A0_2.carsCollected
  L6_2 = Player
  L7_2 = A1_2
  L6_2 = L6_2(L7_2)
  L8_2 = A0_2
  L7_2 = A0_2.Cars
  L9_2 = Player
  L10_2 = A1_2
  L9_2, L10_2 = L9_2(L10_2)
  L7_2 = L7_2(L8_2, L9_2, L10_2)
  L7_2 = L7_2 + 1
  L5_2[L6_2] = L7_2
  L5_2 = Player
  L5_2 = L5_2()
  L7_2 = L5_2
  L6_2 = L5_2.PlayerNum
  L6_2 = L6_2(L7_2)
  if A1_2 == L6_2 then
    L6_2 = SetMultiplayerMissionCash
    L8_2 = A0_2
    L7_2 = A0_2.Score
    L9_2 = Player
    L10_2 = A1_2
    L9_2, L10_2 = L9_2(L10_2)
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2, L9_2, L10_2)
    L6_2(L7_2, L8_2, L9_2, L10_2)
  end
  L6_2 = A0_2.totalCarsCollected
  L6_2 = L6_2 + 1
  A0_2.totalCarsCollected = L6_2
  L6_2 = IsServer
  L6_2 = L6_2()
  if L6_2 then
    L7_2 = A0_2
    L6_2 = A0_2.Score
    L8_2 = Player
    L9_2 = A1_2
    L8_2, L9_2, L10_2 = L8_2(L9_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    L7_2 = GameScoreLimit
    L7_2 = L7_2()
    if L6_2 >= L7_2 then
      L7_2 = A0_2
      L6_2 = A0_2.DoSendEvent
      L8_2 = EVENT_GAME_FINISHED
      L9_2 = 0
      L10_2 = 0
      L6_2(L7_2, L8_2, L9_2, L10_2)
    end
  end
end
L0_1.HandleClientHasCollectedCar = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2
  L3_2 = print
  L4_2 = "Game finished event recieved"
  L3_2(L4_2)
  L3_2 = true
  A0_2.gameFinished = L3_2
end
L0_1.HandleEventGameFinished = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = A0_2.GarageState
  L3_2 = L3_2[A1_2]
  if L3_2 ~= A2_2 then
    L3_2 = A0_2.GarageState
    L3_2[A1_2] = A2_2
    L3_2 = SetGarageState
    L4_2 = A0_2.Garages
    L4_2 = L4_2[A1_2]
    L5_2 = A2_2
    L3_2(L4_2, L5_2)
  end
end
L0_1.HandleGarageStateChange = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = {}
  A0_2.targetCars = L2_2
  A0_2.carsCreated = 0
  L2_2 = 1
  L4_2 = A0_2
  L3_2 = A0_2.NumCarsAvailable
  L3_2 = L3_2(L4_2)
  L4_2 = 1
  L2_2 = L2_2 - L4_2
  for L2_2 = L2_2, L3_2, L4_2 do
    L5_2 = print
    L6_2 = "Generating Car "
    L7_2 = L2_2
    L6_2 = L6_2 .. L7_2
    L5_2(L6_2)
    L5_2 = A0_2.targetCars
    L6_2 = {}
    L5_2[L2_2] = L6_2
    L6_2 = A0_2
    L5_2 = A0_2.CreateTargetCar
    L7_2 = L2_2
    L5_2(L6_2, L7_2)
  end
end
L0_1.CreateServerObjects = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L2_2 = AllPlayers
  L2_2 = L2_2()
  L3_2 = math
  L3_2 = L3_2.random
  L4_2 = 1
  L5_2 = table
  L5_2 = L5_2.getn
  L6_2 = CarsToCollect
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L5_2(L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L4_2 = A0_2.carsCreated
  L4_2 = L4_2 + 1
  A0_2.carsCreated = L4_2
  L4_2 = A0_2.carsCreated
  L5_2 = table
  L5_2 = L5_2.getn
  L6_2 = A0_2.CarSpawnPoints
  L5_2 = L5_2(L6_2)
  if L4_2 > L5_2 then
    A0_2.carsCreated = 1
  end
  L4_2 = A0_2.targetCars
  L4_2 = L4_2[A1_2]
  L5_2 = CreateVehicle
  L6_2 = CarsToCollect
  L6_2 = L6_2[L3_2]
  L7_2 = A0_2.CarSpawnPoints
  L8_2 = A0_2.carsCreated
  L7_2 = L7_2[L8_2]
  L7_2 = L7_2[1]
  L8_2 = A0_2.CarSpawnPoints
  L9_2 = A0_2.carsCreated
  L8_2 = L8_2[L9_2]
  L8_2 = L8_2[2]
  L9_2 = nil
  L10_2 = nil
  L11_2 = true
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
  L4_2.Vehicle = L5_2
  L4_2 = print
  L5_2 = "Creating car number "
  L6_2 = A0_2.carsCreated
  L7_2 = "at "
  L8_2 = A0_2.CarSpawnPoints
  L9_2 = A0_2.carsCreated
  L8_2 = L8_2[L9_2]
  L8_2 = L8_2[1]
  L8_2 = L8_2[1]
  L9_2 = " "
  L10_2 = A0_2.CarSpawnPoints
  L11_2 = A0_2.carsCreated
  L10_2 = L10_2[L11_2]
  L10_2 = L10_2[1]
  L10_2 = L10_2[2]
  L11_2 = " "
  L12_2 = A0_2.CarSpawnPoints
  L13_2 = A0_2.carsCreated
  L12_2 = L12_2[L13_2]
  L12_2 = L12_2[1]
  L12_2 = L12_2[3]
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
  L4_2(L5_2)
  L4_2 = A0_2.targetCars
  L4_2 = L4_2[A1_2]
  L4_2.LastDriver = -1
  L4_2 = A0_2.targetCars
  L4_2 = L4_2[A1_2]
  L5_2 = false
  L4_2.HasDriver = L5_2
  L4_2 = A0_2.targetCars
  L4_2 = L4_2[A1_2]
  L4_2.Garage = -1
  L4_2 = A0_2.targetCars
  L4_2 = L4_2[A1_2]
  L4_2 = L4_2.OwnBlip
  if L4_2 then
    L4_2 = RemoveBlip
    L5_2 = A0_2.targetCars
    L5_2 = L5_2[A1_2]
    L5_2 = L5_2.OwnBlip
    L4_2(L5_2)
  end
  L4_2 = A0_2.targetCars
  L4_2 = L4_2[A1_2]
  L5_2 = AddBlipForCoord
  L6_2 = GetEveryonePeerGroupId
  L6_2 = L6_2()
  L7_2 = A0_2.CarSpawnPoints
  L8_2 = A0_2.carsCreated
  L7_2 = L7_2[L8_2]
  L7_2 = L7_2[1]
  L8_2 = 3
  L9_2 = pickupicon
  L9_2 = L9_2.car
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
  L4_2.OwnBlip = L5_2
  L4_2 = A0_2.targetCars
  L4_2 = L4_2[A1_2]
  L4_2.GarageBlip = nil
  L4_2 = A0_2.targetCars
  L4_2 = L4_2[A1_2]
  L5_2 = false
  L4_2.HasGarageAssigned = L5_2
  L4_2 = print
  L5_2 = "Trying to add 3d marker for car "
  L6_2 = A1_2
  L5_2 = L5_2 .. L6_2
  L4_2(L5_2)
  L4_2 = VehicleAdd3dMarker
  L5_2 = A0_2.targetCars
  L5_2 = L5_2[A1_2]
  L5_2 = L5_2.Vehicle
  L4_2(L5_2)
end
L0_1.CreateTargetCar = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = table
  L2_2 = L2_2.getn
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = 0
  L4_2 = {}
  function L5_2(A0_3)
    local L1_3
    L1_3 = 1
    L3_2 = L1_3
  end
  L4_2[1] = L5_2
  function L5_2(A0_3)
    local L1_3
    L1_3 = 1
    L3_2 = L1_3
  end
  L4_2[2] = L5_2
  function L5_2(A0_3)
    local L1_3
    L1_3 = 2
    L3_2 = L1_3
  end
  L4_2[3] = L5_2
  function L5_2(A0_3)
    local L1_3
    L1_3 = 2
    L3_2 = L1_3
  end
  L4_2[4] = L5_2
  function L5_2(A0_3)
    local L1_3
    L1_3 = 3
    L3_2 = L1_3
  end
  L4_2[5] = L5_2
  function L5_2(A0_3)
    local L1_3
    L1_3 = 3
    L3_2 = L1_3
  end
  L4_2[6] = L5_2
  function L5_2(A0_3)
    local L1_3
    L1_3 = 4
    L3_2 = L1_3
  end
  L4_2[7] = L5_2
  function L5_2(A0_3)
    local L1_3
    L1_3 = 4
    L3_2 = L1_3
  end
  L4_2[8] = L5_2
  L5_2 = L4_2[L2_2]
  L5_2()
  return L3_2
end
L0_1.NumCarsAvailable = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if not A1_2 then
    A1_2 = -1
  end
  L2_2 = Player
  L2_2 = L2_2()
  L3_2 = main
  L4_2 = A0_2.PlayerSpawnPoints
  L3_2.vSpawnPoints = L4_2
  L3_2 = DoSpawn
  L4_2 = A1_2
  L3_2(L4_2)
end
L0_1.DoSpawn = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = ipairs
  L2_2 = A0_2.targetCars
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L3_2, L4_2 in L1_2, L2_2 do
    L5_2 = L4_2.OwnBlip
    if L5_2 then
      L5_2 = VehiclePosition
      L6_2 = L4_2.Vehicle
      L5_2 = L5_2(L6_2)
      if L5_2 then
        L5_2 = UpdateBlipCoord
        L6_2 = L4_2.OwnBlip
        L7_2 = VehiclePosition
        L8_2 = L4_2.Vehicle
        L7_2, L8_2 = L7_2(L8_2)
        L5_2(L6_2, L7_2, L8_2)
      end
    end
  end
end
L0_1.UpdateRadar = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2
  L4_2 = coreLib
  L5_2 = L4_2
  L4_2 = L4_2.Commentate
  L6_2 = "^S^"
  L7_2 = A1_2
  L6_2 = L6_2 .. L7_2
  L4_2(L5_2, L6_2)
end
L0_1.DisplayMessage = L1_1
L0_1 = SS_MessageDisplay
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "Message Display CLEANUP"
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = SS_MessageDisplay
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
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
      L2_2 = TextSprite
      L4_2 = L1_2
      L3_2 = L1_2.PlayerNum
      L3_2 = L3_2(L4_2)
      L4_2 = 240
      L5_2 = 130
      L6_2 = 1
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
      L3_2 = print
      L4_2 = "PRINTING MESSAGE THROUGH DISPLAY QUEUE"
      L3_2(L4_2)
      L3_2 = table
      L3_2 = L3_2.remove
      L4_2 = main
      L4_2 = L4_2.game
      L4_2 = L4_2.MessageDisplayQueue
      L5_2 = 1
      L3_2 = L3_2(L4_2, L5_2)
      L5_2 = L2_2
      L4_2 = L2_2.Scale
      L6_2 = 1.52
      L4_2(L5_2, L6_2)
      L5_2 = L2_2
      L4_2 = L2_2.Style
      L6_2 = 2
      L4_2(L5_2, L6_2)
      L5_2 = L2_2
      L4_2 = L2_2.Text
      L6_2 = L3_2.msg
      L4_2(L5_2, L6_2)
      L4_2 = Wait
      L5_2 = L3_2.length
      L4_2(L5_2)
      L5_2 = L2_2
      L4_2 = L2_2.Remove
      L4_2(L5_2)
    end
    L2_2 = Wait
    L3_2 = 10
    L2_2(L3_2)
  end
end
L0_1.Run = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.playerscores
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L2_2 = 0
  end
  return L2_2
end
L0_1.Score = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.playerscores
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L2_2 = 0
  end
  return L2_2
end
L0_1.Cash = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.carsCollected
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L2_2 = 0
  end
  return L2_2
end
L0_1.Cars = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = AllPlayers
  L2_2 = L2_2()
  L3_2 = table
  L3_2 = L3_2.sort
  L4_2 = L2_2
  function L5_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3, L5_3
    L2_3 = A0_2
    L3_3 = L2_3
    L2_3 = L2_3.Score
    L4_3 = A0_3
    L2_3 = L2_3(L3_3, L4_3)
    L3_3 = A0_2
    L4_3 = L3_3
    L3_3 = L3_3.Score
    L5_3 = A1_3
    L3_3 = L3_3(L4_3, L5_3)
    L2_3 = L2_3 > L3_3
    return L2_3
  end
  L3_2(L4_2, L5_2)
  L4_2 = A0_2
  L3_2 = A0_2.Score
  L5_2 = L2_2[1]
  L3_2 = L3_2(L4_2, L5_2)
  L5_2 = A0_2
  L4_2 = A0_2.Score
  L6_2 = L2_2[2]
  L4_2 = L4_2(L5_2, L6_2)
  if L3_2 == L4_2 then
    A0_2.winner = nil
  else
    L3_2 = L2_2[1]
    A0_2.winner = L3_2
  end
  L3_2 = Player
  L3_2 = L3_2()
  L4_2 = nil
  L5_2 = A0_2.winner
  if L5_2 then
    L5_2 = A0_2.winner
    L6_2 = L5_2
    L5_2 = L5_2.PlayerNum
    L5_2 = L5_2(L6_2)
    L7_2 = L3_2
    L6_2 = L3_2.PlayerNum
    L6_2 = L6_2(L7_2)
    if L5_2 == L6_2 then
      L4_2 = 1
    else
      L4_2 = 2
    end
  else
    L6_2 = A0_2
    L5_2 = A0_2.Score
    L7_2 = L3_2
    L5_2 = L5_2(L6_2, L7_2)
    L7_2 = A0_2
    L6_2 = A0_2.Score
    L8_2 = L2_2[1]
    L6_2 = L6_2(L7_2, L8_2)
    if L5_2 < L6_2 then
      L4_2 = 2
    else
      L4_2 = 0
    end
  end
  L5_2 = DisplayFinalWinLoseMessage
  L6_2 = L4_2
  L7_2 = ""
  L5_2(L6_2, L7_2)
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
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = print
  L5_2 = "Sending Event "
  L6_2 = A1_2
  L7_2 = " "
  L8_2 = A2_2
  L9_2 = " "
  L10_2 = A3_2
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2
  L4_2(L5_2)
  L4_2 = MaskEventNumber
  L5_2 = A1_2
  L6_2 = EVENTMASK_NONE
  L7_2 = EVENTSHIFT_TYPE
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  L5_2 = MaskEventNumber
  L6_2 = A2_2
  L7_2 = EVENTMASK_NONE
  L8_2 = EVENTSHIFT_PARAM1
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L4_2 = L4_2 + L5_2
  L5_2 = MaskEventNumber
  L6_2 = A3_2
  L7_2 = EVENTMASK_NONE
  L8_2 = EVENTSHIFT_PARAM2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L4_2 = L4_2 + L5_2
  L5_2 = SendEvent
  L6_2 = L4_2
  L5_2(L6_2)
end
L0_1.DoSendEvent = L1_1
L0_1 = SixtySeconds
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
  L5_2 = A1_2
  L4_2 = A1_2.PlayerNum
  L4_2 = L4_2(L5_2)
  L5_2 = Player
  L5_2 = L5_2()
  L6_2 = L5_2
  L5_2 = L5_2.PlayerNum
  L5_2 = L5_2(L6_2)
  if L4_2 == L5_2 then
    L4_2 = A0_2.MyGarageBlip
    if L4_2 then
      L4_2 = RemoveBlip
      L5_2 = A0_2.MyGarageBlip
      L4_2(L5_2)
      A0_2.MyGarageBlip = nil
    end
    L4_2 = A0_2.MyGarageHalo
    if L4_2 then
      L4_2 = RemoveHalo
      L5_2 = A0_2.MyGarageHalo
      L4_2(L5_2)
      A0_2.MyGarageHalo = nil
    end
  end
end
L0_1.RegisterPlayerKill = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = GameElapsedMs
  L2_2 = 0
  L1_2(L2_2)
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L4_2 = nil
  L5_2 = UseLCFiles
  L5_2 = L5_2()
  if L5_2 then
    L5_2 = dofile
    L6_2 = GetDiskPrepend
    L6_2 = L6_2()
    L7_2 = "LUA/SixtySecondsData.lua.lc"
    L6_2 = L6_2 .. L7_2
    L5_2 = L5_2(L6_2)
    L4_2 = L5_2
  else
    L5_2 = dofile
    L6_2 = GetDiskPrepend
    L6_2 = L6_2()
    L7_2 = "LUA/SixtySecondsData.lua"
    L6_2 = L6_2 .. L7_2
    L5_2 = L5_2(L6_2)
    L4_2 = L5_2
  end
  L5_2 = L4_2
  L5_2, L6_2, L7_2 = L5_2()
  L3_2 = L7_2
  L2_2 = L6_2
  L1_2 = L5_2
  L5_2 = table
  L5_2 = L5_2.clone
  L6_2 = L1_2
  L5_2 = L5_2(L6_2)
  A0_2.PlayerSpawnPoints = L5_2
  L5_2 = table
  L5_2 = L5_2.clone
  L6_2 = L2_2
  L5_2 = L5_2(L6_2)
  A0_2.CarSpawnPoints = L5_2
  L5_2 = table
  L5_2 = L5_2.clone
  L6_2 = L3_2
  L5_2 = L5_2(L6_2)
  A0_2.GarageSpawnPoints = L5_2
  L4_2 = nil
  L5_2 = collectgarbage
  L5_2()
  L5_2 = ipairs
  L6_2 = A0_2.CarSpawnPoints
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L7_2, L8_2 in L5_2, L6_2 do
    L9_2 = L8_2
    L10_2 = math
    L10_2 = L10_2.random
    L11_2 = 1
    L12_2 = table
    L12_2 = L12_2.getn
    L13_2 = A0_2.CarSpawnPoints
    L12_2, L13_2 = L12_2(L13_2)
    L10_2 = L10_2(L11_2, L12_2, L13_2)
    L11_2 = A0_2.CarSpawnPoints
    L12_2 = A0_2.CarSpawnPoints
    L12_2 = L12_2[L10_2]
    L11_2[L7_2] = L12_2
    L11_2 = A0_2.CarSpawnPoints
    L11_2[L10_2] = L9_2
  end
end
L0_1.InitGameData = L1_1
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
  L2_2 = SixtySeconds
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
L0_1 = SSKickOutOfCar
function L1_1(A0_2)
  local L1_2
end
L0_1.Cleanup = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = print
  L3_2 = "Kick driver out of car"
  L2_2(L3_2)
  L2_2 = SSKickOutOfCar
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
L0_1 = SSKickOutOfCar
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = print
  L3_2 = "forcing ped out of car"
  L2_2(L3_2)
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
  goto lbl_31
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
      L3_2 = print
      L4_2 = "kicking player in loop"
      L3_2(L4_2)
    end
    ::lbl_31::
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
