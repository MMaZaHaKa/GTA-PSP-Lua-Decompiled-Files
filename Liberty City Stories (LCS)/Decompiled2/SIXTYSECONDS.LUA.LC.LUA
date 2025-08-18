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
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
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
  L2_2 = A0_2
  L1_2 = A0_2.InitGameData
  L1_2(L2_2)
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = table
  L2_2 = L2_2.getn
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = 0
  goto lbl_44
  repeat
    L4_2 = print
    L5_2 = "60 Seconds is sat on its ass waiting for "
    L6_2 = GetExpectedNumberOfPlayers
    L6_2 = L6_2()
    L7_2 = " players, at the minute is has "
    L8_2 = L2_2
    L9_2 = " players"
    L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2
    L4_2(L5_2)
    L4_2 = AllPlayers
    L4_2 = L4_2()
    L1_2 = L4_2
    L4_2 = table
    L4_2 = L4_2.getn
    L5_2 = L1_2
    L4_2 = L4_2(L5_2)
    L2_2 = L4_2
    L4_2 = Wait
    L5_2 = 500
    L4_2(L5_2)
    L3_2 = L3_2 + 1
    ::lbl_44::
    L4_2 = GetExpectedNumberOfPlayers
    L4_2 = L4_2()
  until L2_2 == L4_2 or not (L3_2 < 20)
  L4_2 = GenerateAmbients
  L5_2 = false
  L4_2(L5_2)
  L4_2 = print
  L5_2 = "Creating pickup manager"
  L4_2(L5_2)
  L4_2 = PickupMgr
  L4_2 = L4_2()
  A0_2.mypickups = L4_2
  L4_2 = A0_2.mypickups
  L5_2 = L4_2
  L4_2 = L4_2.CreatePickups
  L4_2(L5_2)
  A0_2.carsCaptured = 0
  A0_2.carsDestroyed = 0
  L4_2 = {}
  A0_2.carsToBeDeleted = L4_2
  L4_2 = print
  L5_2 = "Done creating pickup manager"
  L4_2(L5_2)
  L4_2 = Player
  L4_2 = L4_2()
  L5_2 = AllPlayers
  L5_2 = L5_2()
  L6_2 = {}
  A0_2.Garages = L6_2
  L6_2 = {}
  A0_2.GarageState = L6_2
  L6_2 = 1
  L7_2 = table
  L7_2 = L7_2.getn
  L8_2 = A0_2.GarageSpawnPoints
  L7_2 = L7_2(L8_2)
  L8_2 = 1
  L6_2 = L6_2 - L8_2
  for L6_2 = L6_2, L7_2, L8_2 do
    L9_2 = print
    L10_2 = "Creating Garage "
    L11_2 = L6_2
    L10_2 = L10_2 .. L11_2
    L9_2(L10_2)
    L9_2 = A0_2.Garages
    L10_2 = CreateGarage
    L11_2 = A0_2.GarageSpawnPoints
    L11_2 = L11_2[L6_2]
    L11_2 = L11_2[1]
    L12_2 = A0_2.GarageSpawnPoints
    L12_2 = L12_2[L6_2]
    L12_2 = L12_2[2]
    L10_2 = L10_2(L11_2, L12_2)
    L9_2[L6_2] = L10_2
    L9_2 = print
    L10_2 = "self.Garages["
    L11_2 = L6_2
    L12_2 = "] = "
    L13_2 = A0_2.Garages
    L13_2 = L13_2[L6_2]
    L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2
    L9_2(L10_2)
    L9_2 = A0_2.GarageState
    L9_2[L6_2] = 1
  end
  L6_2 = UseSuperBrakeOnPause
  L7_2 = false
  L6_2(L7_2)
  L6_2 = IsServer
  L6_2 = L6_2()
  if L6_2 then
    L7_2 = A0_2
    L6_2 = A0_2.CreateServerObjects
    L6_2(L7_2)
    L6_2 = print
    L7_2 = "Got out of create server objects."
    L6_2(L7_2)
  end
  if nil == 10 then
    L6_2 = print
    L7_2 = "WASASASASA2!"
    L6_2(L7_2)
  end
  A0_2.MyGarage = nil
  A0_2.MyGarageBlip = nil
  L6_2 = false
  A0_2.gameFinished = L6_2
  A0_2.lastCarHealth = 0
  A0_2.totalCarsCollected = 0
  L6_2 = {}
  A0_2.playerscores = L6_2
  L6_2 = {}
  A0_2.carsCollected = L6_2
  L6_2 = false
  A0_2.targetWasInGarage = L6_2
  L6_2 = false
  A0_2.wasDrivingCar = L6_2
  L6_2 = IsServer
  L6_2 = L6_2()
  if L6_2 then
    L6_2 = print
    L7_2 = "Strarting server logic"
    L6_2(L7_2)
    L6_2 = SS_ServerLogic
    L6_2 = L6_2()
    A0_2.SS_ServerLogic = L6_2
    L6_2 = A0_2.SS_ServerLogic
    L7_2 = L6_2
    L6_2 = L6_2.Start
    L6_2(L7_2)
    L6_2 = UsePowerups
    L6_2 = L6_2()
    if L6_2 then
      L6_2 = PowerUpTimer
      L7_2 = L6_2
      L6_2 = L6_2.Start
      L6_2(L7_2)
      L6_2 = DoesPowerupExist
      L6_2 = L6_2()
      if L6_2 < 2 then
        L6_2 = print
        L7_2 = "Respawning a power up at change sides"
        L6_2(L7_2)
        L6_2 = PowerUpTimer
        L7_2 = L6_2
        L6_2 = L6_2.CreateAPowerUp
        L6_2(L7_2)
      end
      L6_2 = DoesPowerupExist
      L6_2 = L6_2()
      if L6_2 < 2 then
        L6_2 = print
        L7_2 = "Respawning another power up at change sides"
        L6_2(L7_2)
        L6_2 = PowerUpTimer
        L7_2 = L6_2
        L6_2 = L6_2.CreateAPowerUp
        L6_2(L7_2)
      end
    end
  end
  L6_2 = pairs
  L7_2 = L5_2
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L8_2, L9_2 in L6_2, L7_2 do
    L11_2 = L9_2
    L10_2 = L9_2.SetRadarBlipShortRange
    L12_2 = true
    L10_2(L11_2, L12_2)
  end
  L6_2 = print
  L7_2 = "***** ID: "
  L8_2 = PlayerId
  L8_2 = L8_2()
  L9_2 = " Spawn: "
  L10_2 = InitialSpawnPoint
  L11_2 = PlayerId
  L11_2, L12_2, L13_2 = L11_2()
  L10_2 = L10_2(L11_2, L12_2, L13_2)
  L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2
  L6_2(L7_2)
  L7_2 = A0_2
  L6_2 = A0_2.DoSpawn
  L8_2 = InitialSpawnPoint
  L9_2 = PlayerId
  L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2()
  L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L6_2 = RenderHudExtras
  L7_2 = false
  L6_2(L7_2)
  L6_2 = NoFuckingCutscene
  L6_2 = L6_2()
  if not L6_2 then
    L6_2 = main
    L6_2 = L6_2.scores
    L7_2 = L6_2
    L6_2 = L6_2.Hide
    L8_2 = true
    L6_2(L7_2, L8_2)
    L6_2 = Wait
    L7_2 = 0
    L6_2(L7_2)
    goto lbl_227
    repeat
      L6_2 = Wait
      L7_2 = 5
      L6_2(L7_2)
      ::lbl_227::
      L6_2 = SyncCutScene
      L6_2 = L6_2()
      L7_2 = false
    until L6_2 ~= L7_2
    L6_2 = RunScriptedCutscene
    L6_2()
    L6_2 = Wait
    L7_2 = 0
    L6_2(L7_2)
    goto lbl_241
    repeat
      L6_2 = Wait
      L7_2 = 0
      L6_2(L7_2)
      ::lbl_241::
      L6_2 = ProcessScriptedCutscene
      L6_2 = L6_2()
    until not L6_2
    L6_2 = main
    L6_2 = L6_2.scores
    L7_2 = L6_2
    L6_2 = L6_2.Hide
    L8_2 = false
    L6_2(L7_2, L8_2)
  else
    L6_2 = Wait
    L7_2 = 20
    L6_2(L7_2)
    L6_2 = ClearSplashScreen
    L6_2()
  end
  L6_2 = GenerateAmbients
  L7_2 = true
  L6_2(L7_2)
  L6_2 = RenderHudExtras
  L7_2 = true
  L6_2(L7_2)
  L6_2 = UpdateGameTime
  L7_2 = true
  L6_2(L7_2)
  L6_2 = {}
  A0_2.MessageDisplayQueue = L6_2
  L6_2 = SS_MessageDisplay
  L6_2 = L6_2()
  A0_2.SS_MessageDisplay = L6_2
  L6_2 = A0_2.SS_MessageDisplay
  L7_2 = L6_2
  L6_2 = L6_2.Start
  L6_2(L7_2)
  L6_2 = print
  L7_2 = "printing Now Get Cars message"
  L6_2(L7_2)
  L7_2 = A0_2
  L6_2 = A0_2.DisplayMessage
  L8_2 = "^T^MPWLNGC"
  L9_2 = 2000
  L6_2(L7_2, L8_2, L9_2)
  L6_2 = "StateRunning"
  return L6_2
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
      L2_2 = SetPlayersVehicleForGarage
      L3_2 = A0_2.Garages
      L4_2 = A0_2.MyGarage
      L3_2 = L3_2[L4_2]
      L2_2(L3_2)
      A0_2.MyGarage = nil
    end
    L2_2 = DoWasted
    L2_2()
    L3_2 = A0_2
    L2_2 = A0_2.DoSpawn
    L2_2(L3_2)
  end
  L2_2 = IsPlayerPressingHorn
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = hornDebounce
    if not L2_2 then
      L2_2 = print
      L3_2 = "Horntest on"
      L2_2(L3_2)
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
  L1_2 = ipairs
  L2_2 = A0_2.targetCars
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L3_2, L4_2 in L1_2, L2_2 do
    L5_2 = VehicleIsDrivenByPlayer
    L6_2 = L4_2.Vehicle
    L5_2 = L5_2(L6_2)
    if L5_2 then
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
          goto lbl_294
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
    end
    ::lbl_294::
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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = A0_2
  L1_2 = A0_2.ProcessEvents
  L1_2(L2_2)
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = A0_2.MyGarage
  if L2_2 then
    L2_2 = HasGarageAcceptedVehicle
    L3_2 = A0_2.Garages
    L4_2 = A0_2.MyGarage
    L3_2 = L3_2[L4_2]
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = print
      L3_2 = "Car accepted by garage (local)"
      L2_2(L3_2)
      L2_2 = RemoveBlip
      L3_2 = A0_2.MyGarageBlip
      L2_2(L3_2)
      A0_2.MyGarageBlip = nil
      A0_2.MyGarage = nil
      L3_2 = A0_2
      L2_2 = A0_2.DoSendEvent
      L4_2 = EVENT_CLIENT_HAS_COLLECTED_CAR
      L5_2 = PlayerId
      L5_2 = L5_2()
      L6_2 = A0_2.lastCarHealth
      L6_2 = L6_2 / 10
      L2_2(L3_2, L4_2, L5_2, L6_2)
    end
    L2_2 = DoesGarageContainSSVehicle
    L3_2 = A0_2.Garages
    L4_2 = A0_2.MyGarage
    L3_2 = L3_2[L4_2]
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = A0_2.targetWasInGarage
      if not L2_2 then
        L3_2 = A0_2
        L2_2 = A0_2.DisplayMessage
        L4_2 = "^T^MPWLGOC"
        L5_2 = 2000
        L2_2(L3_2, L4_2, L5_2)
      end
      L2_2 = true
      A0_2.targetWasInGarage = L2_2
    else
      L2_2 = false
      A0_2.targetWasInGarage = L2_2
    end
    L2_2 = A0_2.targetWasInGarage
    if L2_2 then
      L2_2 = A0_2.wasDrivingCar
      if L2_2 then
        L3_2 = L1_2
        L2_2 = L1_2.Car
        L2_2 = L2_2(L3_2)
        if not L2_2 then
          L3_2 = A0_2
          L2_2 = A0_2.DisplayMessage
          L4_2 = "^T^MPWLLTC"
          L5_2 = 2000
          L2_2(L3_2, L4_2, L5_2)
        end
      end
    end
  end
  L2_2 = ipairs
  L3_2 = A0_2.Garages
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L4_2, L5_2 in L2_2, L3_2 do
    L6_2 = A0_2.GarageState
    L6_2 = L6_2[L4_2]
    L7_2 = GetGarageState
    L8_2 = L5_2
    L7_2 = L7_2(L8_2)
    if L6_2 ~= L7_2 then
      L6_2 = IsSSGarageStateChanging
      L7_2 = L5_2
      L6_2 = L6_2(L7_2)
      if L6_2 then
        L6_2 = A0_2.GarageState
        L7_2 = GetGarageState
        L8_2 = L5_2
        L7_2 = L7_2(L8_2)
        L6_2[L4_2] = L7_2
        L7_2 = A0_2
        L6_2 = A0_2.DoSendEvent
        L8_2 = EVENT_GARAGE_STATE_CHANGE
        L9_2 = L4_2
        L10_2 = A0_2.GarageState
        L10_2 = L10_2[L4_2]
        L6_2(L7_2, L8_2, L9_2, L10_2)
    end
    else
      L6_2 = A0_2.GarageState
      L7_2 = GetGarageState
      L8_2 = L5_2
      L7_2 = L7_2(L8_2)
      L6_2[L4_2] = L7_2
    end
  end
  L3_2 = L1_2
  L2_2 = L1_2.Car
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L2_2 = true
    A0_2.wasDrivingCar = L2_2
    L3_2 = L1_2
    L2_2 = L1_2.Car
    L2_2 = L2_2(L3_2)
    L3_2 = VehicleHealth
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    A0_2.lastCarHealth = L3_2
  else
    L2_2 = false
    A0_2.wasDrivingCar = L2_2
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
    L5_2 = L3_2
    L6_2 = A0_2.GarageSpawnPoints
    L6_2 = L6_2[A2_2]
    L6_2 = L6_2[1]
    L7_2 = 4
    L8_2 = pickupicon
    L8_2 = L8_2.carlockup
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    A0_2.MyGarageBlip = L4_2
    A0_2.MyGarage = A2_2
    L4_2 = SetPlayersVehicleForGarage
    L5_2 = A0_2.Garages
    L6_2 = A0_2.MyGarage
    L5_2 = L5_2[L6_2]
    L4_2(L5_2)
    L5_2 = A0_2
    L4_2 = A0_2.DisplayMessage
    L6_2 = "^T^MPWLDTC"
    L7_2 = 2000
    L4_2(L5_2, L6_2, L7_2)
  end
  L5_2 = A0_2
  L4_2 = A0_2.Commentate
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
end
L0_1.HandleAssignedGarage = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
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
      L4_2 = A0_2.MyGarage
      if L4_2 then
        L4_2 = SetPlayersVehicleForGarage
        L5_2 = A0_2.Garages
        L6_2 = A0_2.MyGarage
        L5_2 = L5_2[L6_2]
        L4_2(L5_2)
        A0_2.MyGarage = nil
      end
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
      L5_2 = L3_2
      L6_2 = A0_2.GarageSpawnPoints
      L6_2 = L6_2[A2_2]
      L6_2 = L6_2[1]
      L7_2 = 4
      L8_2 = pickupicon
      L8_2 = L8_2.carlockup
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      A0_2.MyGarageBlip = L4_2
    end
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
    L5_2 = A0_2
    L4_2 = A0_2.Commentate
    L6_2 = "^T^MPWLCD"
    L4_2(L5_2, L6_2)
  else
    L5_2 = A0_2
    L4_2 = A0_2.Commentate
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
  L5_2 = L5_2(L6_2, L7_2, L8_2)
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
  L6_2 = L2_2
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
  L5_2 = A0_2
  L4_2 = A0_2.Commentate
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
      L3_2 = L1_2
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
      L6_2 = 0.7
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
L0_1 = SixtySeconds
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
  L4_2 = IsServer
  L4_2 = L4_2()
  if L4_2 then
    L5_2 = A0_2
    L4_2 = A0_2.DoSendEvent
    L6_2 = EVENT_UNASSIGNED_GARAGE
    L8_2 = A1_2
    L7_2 = A1_2.PlayerNum
    L7_2 = L7_2(L8_2)
    L8_2 = 0
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = ipairs
    L5_2 = A0_2.targetCars
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L6_2, L7_2 in L4_2, L5_2 do
      L8_2 = L7_2.LastDriver
      L10_2 = A1_2
      L9_2 = A1_2.PlayerNum
      L9_2 = L9_2(L10_2)
      if L8_2 == L9_2 then
        L8_2 = print
        L9_2 = "Removing car garage assignment due to player death"
        L8_2(L9_2)
        L8_2 = false
        L7_2.HasDriver = L8_2
        L8_2 = false
        L7_2.HasGarageAssigned = L8_2
        L7_2.Garage = -1
        L7_2.LastDriver = -1
      end
    end
  end
end
L0_1.RegisterPlayerKill = L1_1
L0_1 = SixtySeconds
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L1_2 = GameElapsedMs
  L2_2 = 0
  L1_2(L2_2)
  L1_2 = GameLocation
  L1_2 = L1_2()
  if L1_2 == 0 then
    L1_2 = {}
    L2_2 = {}
    L3_2 = {}
    L4_2 = 878.988
    L5_2 = -810.9239
    L6_2 = 13.9327
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L4_2 = 87.7955
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L3_2 = {}
    L4_2 = {}
    L5_2 = 1201.2374
    L6_2 = -796.6064
    L7_2 = 13.627
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L5_2 = 318.0812
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L4_2 = {}
    L5_2 = {}
    L6_2 = 1052.9984
    L7_2 = -1039.5879
    L8_2 = 13.9009
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L6_2 = 72.1745
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L5_2 = {}
    L6_2 = {}
    L7_2 = 1171.3418
    L8_2 = -663.0435
    L9_2 = 17.8591
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 180.0322
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = {}
    L7_2 = {}
    L8_2 = 1160.8433
    L9_2 = -448.7596
    L10_2 = 21.4234
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = 101.5482
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = {}
    L8_2 = {}
    L9_2 = 1176.2535
    L10_2 = -95.7773
    L11_2 = 6.4335
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = 353.1978
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = 1098.791
    L11_2 = 44.1015
    L12_2 = -1.5353
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L10_2 = 267.3353
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = {}
    L10_2 = {}
    L11_2 = 930.5602
    L12_2 = -175.236
    L13_2 = 3.7986
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L11_2 = 184.1712
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L10_2 = {}
    L11_2 = {}
    L12_2 = 883.0075
    L13_2 = -311.7353
    L14_2 = 7.6982
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    L11_2[3] = L14_2
    L12_2 = 89.7126
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L11_2 = {}
    L12_2 = {}
    L13_2 = 868.4464
    L14_2 = -663.5236
    L15_2 = 13.9361
    L12_2[1] = L13_2
    L12_2[2] = L14_2
    L12_2[3] = L15_2
    L13_2 = 244.0882
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    L12_2 = {}
    L13_2 = {}
    L14_2 = 1276.1166
    L15_2 = -380.2794
    L16_2 = 32.6859
    L13_2[1] = L14_2
    L13_2[2] = L15_2
    L13_2[3] = L16_2
    L14_2 = 101.1004
    L12_2[1] = L13_2
    L12_2[2] = L14_2
    L13_2 = {}
    L14_2 = {}
    L15_2 = 973.2164
    L16_2 = -418.2749
    L17_2 = 14.0285
    L14_2[1] = L15_2
    L14_2[2] = L16_2
    L14_2[3] = L17_2
    L15_2 = 181.0763
    L13_2[1] = L14_2
    L13_2[2] = L15_2
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    L1_2[4] = L5_2
    L1_2[5] = L6_2
    L1_2[6] = L7_2
    L1_2[7] = L8_2
    L1_2[8] = L9_2
    L1_2[9] = L10_2
    L1_2[10] = L11_2
    L1_2[11] = L12_2
    L1_2[12] = L13_2
    A0_2.CarSpawnPoints = L1_2
    L1_2 = {}
    L2_2 = {}
    L3_2 = {}
    L4_2 = 1308.1614
    L5_2 = -1153.101
    L6_2 = 10.8202
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L4_2 = 270
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L3_2 = {}
    L4_2 = {}
    L5_2 = 1395.106
    L6_2 = -890.0828
    L7_2 = 10.7833
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L5_2 = 270
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L4_2 = {}
    L5_2 = {}
    L6_2 = 1313.1111
    L7_2 = -109.3289
    L8_2 = 15.25
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L6_2 = 180
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L5_2 = {}
    L6_2 = {}
    L7_2 = 885.0006
    L8_2 = 169.6333
    L9_2 = 2.6534
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 90
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = {}
    L7_2 = {}
    L8_2 = 891
    L9_2 = -988
    L10_2 = 4
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = 0
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = {}
    L8_2 = {}
    L9_2 = 867.0037
    L10_2 = -545.9845
    L11_2 = 13.9327
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = 90
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = 1339.5814
    L11_2 = -254.3652
    L12_2 = 48.7
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L10_2 = 90
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = {}
    L10_2 = {}
    L11_2 = 979.1169
    L12_2 = -58.6563
    L13_2 = 6.2836
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L11_2 = 180
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
    A0_2.GarageSpawnPoints = L1_2
    L1_2 = {}
    L2_2 = {}
    L3_2 = {}
    L4_2 = 1293.8296
    L5_2 = -936.3995
    L6_2 = 13.9326
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L4_2 = 9.3867
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L3_2 = {}
    L4_2 = {}
    L5_2 = 1037.981
    L6_2 = -933.4276
    L7_2 = 13.9326
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L5_2 = 307.8666
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L4_2 = {}
    L5_2 = {}
    L6_2 = 826.0873
    L7_2 = -848.7362
    L8_2 = 14.0352
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L6_2 = 340.377
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L5_2 = {}
    L6_2 = {}
    L7_2 = 1038.0424
    L8_2 = -671.6776
    L9_2 = 13.9326
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 195.6944
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = {}
    L7_2 = {}
    L8_2 = 1203.441
    L9_2 = -512.1193
    L10_2 = 23.9328
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = 57.2714
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = {}
    L8_2 = {}
    L9_2 = 843.8878
    L10_2 = -507.8421
    L11_2 = 13.9326
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = 21.4699
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = 1133.5897
    L11_2 = -194.7319
    L12_2 = 13.9326
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L10_2 = 149.1851
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = {}
    L10_2 = {}
    L11_2 = 1356.6787
    L12_2 = -290.317
    L13_2 = 48.9329
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L11_2 = 336.6544
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
    A0_2.PlayerSpawnPoints = L1_2
  else
    L1_2 = GameLocation
    L1_2 = L1_2()
    if L1_2 == 1 then
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = 453.5533
      L5_2 = -1499.5399
      L6_2 = 17.6296
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 180
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -58.4792
      L6_2 = -1467.2493
      L7_2 = 25.1041
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 270
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = -121.2447
      L7_2 = -1169.6348
      L8_2 = 14.8282
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 180
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = 460.9355
      L8_2 = -871.0115
      L9_2 = 15.12
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 270
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = -58.0512
      L9_2 = -462.6176
      L10_2 = 15.125
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 90
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = 178.2466
      L10_2 = 196.3456
      L11_2 = 10.6633
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 270
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = 301.9552
      L11_2 = -9.6347
      L12_2 = 15.1777
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 270
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = 435.2762
      L12_2 = -376.5137
      L13_2 = 20.0486
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 180
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
      A0_2.GarageSpawnPoints = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = 228.956
      L5_2 = -1212.6545
      L6_2 = 19.4197
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 180.8357
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = 245.1146
      L6_2 = -959.3138
      L7_2 = 25.042
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 183.1855
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = 283.0121
      L7_2 = -551.8598
      L8_2 = 30.4314
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 271.8552
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = 184.5689
      L8_2 = -333.0045
      L9_2 = 15.1303
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 90.802
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = 63.3943
      L9_2 = -588.6461
      L10_2 = 24.9365
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 356.0547
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = 342.2017
      L10_2 = -118.9139
      L11_2 = 20.2104
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 267.2394
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = -32.595
      L11_2 = -1121.1775
      L12_2 = 25.1773
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 111.2841
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = 527.533
      L12_2 = -657.1049
      L13_2 = 15.0851
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 349.9874
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L10_2 = {}
      L11_2 = {}
      L12_2 = 73.4697
      L13_2 = -351.3455
      L14_2 = 15.1416
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L11_2[3] = L14_2
      L12_2 = 87.4493
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L11_2 = {}
      L12_2 = {}
      L13_2 = 101.4819
      L14_2 = -1564.4711
      L15_2 = 22.7467
      L12_2[1] = L13_2
      L12_2[2] = L14_2
      L12_2[3] = L15_2
      L13_2 = 87.6272
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L12_2 = {}
      L13_2 = {}
      L14_2 = 259.6042
      L15_2 = -789.9781
      L16_2 = 26.9062
      L13_2[1] = L14_2
      L13_2[2] = L15_2
      L13_2[3] = L16_2
      L14_2 = 352.1947
      L12_2[1] = L13_2
      L12_2[2] = L14_2
      L13_2 = {}
      L14_2 = {}
      L15_2 = 111.6445
      L16_2 = -1233.826
      L17_2 = 25.1281
      L14_2[1] = L15_2
      L14_2[2] = L16_2
      L14_2[3] = L17_2
      L15_2 = 175.101
      L13_2[1] = L14_2
      L13_2[2] = L15_2
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      L1_2[5] = L6_2
      L1_2[6] = L7_2
      L1_2[7] = L8_2
      L1_2[8] = L9_2
      L1_2[9] = L10_2
      L1_2[10] = L11_2
      L1_2[11] = L12_2
      L1_2[12] = L13_2
      A0_2.CarSpawnPoints = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = 238.6437
      L5_2 = -200.036
      L6_2 = 20.3321
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 223.8856
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -6.669
      L6_2 = -397.4051
      L7_2 = 15.1281
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 223.8856
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = 228.513
      L7_2 = -618.3199
      L8_2 = 24.9751
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 244.0131
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = -73.0186
      L8_2 = -807.2783
      L9_2 = 25.1281
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 328.6864
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = 57.5291
      L9_2 = -952.2739
      L10_2 = 25.1281
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 19.7356
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = 400.3114
      L10_2 = -1138.4528
      L11_2 = 25.1281
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 243.2736
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = -146.6007
      L11_2 = -1346.5632
      L12_2 = 25.1281
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 238.3853
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = 200.6563
      L12_2 = -1411.2737
      L13_2 = 25.1281
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 44.9046
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
      A0_2.PlayerSpawnPoints = L1_2
    else
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = -749.2634
      L5_2 = -561.6697
      L6_2 = 7.8245
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 180
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -919.665
      L6_2 = -204.5945
      L7_2 = 32.8057
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 90
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = -1234.921
      L7_2 = -10.4976
      L8_2 = 58.0798
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 270
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = -912.0541
      L8_2 = 305.3618
      L9_2 = 32.7665
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 90
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = -459.3922
      L9_2 = 63.0674
      L10_2 = 2.8213
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 180
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = -468.7532
      L10_2 = -201.5039
      L11_2 = 2.8213
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 360
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = -718.425
      L11_2 = 180.7856
      L12_2 = 27.6714
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 280
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = -1189.0983
      L12_2 = -203.1574
      L13_2 = 42.9788
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 90
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
      A0_2.GarageSpawnPoints = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = -1093.0425
      L5_2 = -84.4261
      L6_2 = 42.6927
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 180
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -1102.4462
      L6_2 = 155.8874
      L7_2 = 57.7586
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 63.6874
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = -1000.4736
      L7_2 = 108.2794
      L8_2 = 13.2361
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 203.7447
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = -1184.2906
      L8_2 = 69.9539
      L9_2 = 67.6932
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 356.7323
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = -712.0085
      L9_2 = 330.6576
      L10_2 = 61.8738
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 0.2236
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = -584.8018
      L10_2 = 265.1498
      L11_2 = 61.3572
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 175.746
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = -656.5526
      L11_2 = 59.7458
      L12_2 = 17.7132
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 82.8471
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = -483.2016
      L12_2 = -52.7287
      L13_2 = 2.8213
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 180
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L10_2 = {}
      L11_2 = {}
      L12_2 = -976.7012
      L13_2 = 453.4439
      L14_2 = 22.4969
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L11_2[3] = L14_2
      L12_2 = 230.6617
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L11_2 = {}
      L12_2 = {}
      L13_2 = -736.0754
      L14_2 = -271.7495
      L15_2 = 17.4381
      L12_2[1] = L13_2
      L12_2[2] = L14_2
      L12_2[3] = L15_2
      L13_2 = 76.0182
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L12_2 = {}
      L13_2 = {}
      L14_2 = -1200.0933
      L15_2 = 523.1423
      L16_2 = 67.5492
      L13_2[1] = L14_2
      L13_2[2] = L15_2
      L13_2[3] = L16_2
      L14_2 = 212.8388
      L12_2[1] = L13_2
      L12_2[2] = L14_2
      L13_2 = {}
      L14_2 = {}
      L15_2 = -713.306
      L16_2 = 264.5084
      L17_2 = 53.029
      L14_2[1] = L15_2
      L14_2[2] = L16_2
      L14_2[3] = L17_2
      L15_2 = 182.1571
      L13_2[1] = L14_2
      L13_2[2] = L15_2
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      L1_2[5] = L6_2
      L1_2[6] = L7_2
      L1_2[7] = L8_2
      L1_2[8] = L9_2
      L1_2[9] = L10_2
      L1_2[10] = L11_2
      L1_2[11] = L12_2
      L1_2[12] = L13_2
      A0_2.CarSpawnPoints = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = -887.7736
      L5_2 = 159.0758
      L6_2 = 47.8213
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 197.2778
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -903.0086
      L6_2 = 540.2868
      L7_2 = 68.9162
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 177.2619
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = -758.3311
      L7_2 = 29.6867
      L8_2 = 2.8213
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 353.9334
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = -888.3676
      L8_2 = -119.2264
      L9_2 = 32.8212
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 353.9334
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = -1282.5562
      L9_2 = -64.8545
      L10_2 = 57.8212
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 136.8653
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = -992.9297
      L10_2 = -49.1714
      L11_2 = 37.882
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 136.8653
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = -292.9362
      L11_2 = 381.1484
      L12_2 = 77.8213
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 212.1673
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = -674.1395
      L12_2 = -404.8195
      L13_2 = 17.6713
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 225.9362
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
      A0_2.PlayerSpawnPoints = L1_2
    end
  end
  L1_2 = ipairs
  L2_2 = A0_2.CarSpawnPoints
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L3_2, L4_2 in L1_2, L2_2 do
    L5_2 = L4_2
    L6_2 = math
    L7_2 = "random"
    L6_2 = L6_2[L7_2]
    L7_2 = 1
    L8_2 = table
    L9_2 = "getn"
    L8_2 = L8_2[L9_2]
    L9_2 = A0_2.CarSpawnPoints
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2 = L8_2(L9_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
    L7_2 = A0_2.CarSpawnPoints
    L8_2 = A0_2.CarSpawnPoints
    L8_2 = L8_2[L6_2]
    L7_2[L3_2] = L8_2
    L7_2 = A0_2.CarSpawnPoints
    L7_2[L6_2] = L5_2
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
