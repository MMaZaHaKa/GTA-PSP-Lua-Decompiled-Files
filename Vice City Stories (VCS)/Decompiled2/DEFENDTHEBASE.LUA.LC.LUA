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
L1_1 = "Pickups"
L0_1(L1_1)
L0_1 = require
L1_1 = "PowerUps"
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
DTB = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
MessageDisplay = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
ServerLogic = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
MessagePump = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
KickOutOfCar = L0_1
L0_1 = PowerupTimer
L0_1 = L0_1()
PowerUpTimer = L0_1
L0_1 = 16777215
DTBEVENTMASK_NONE = L0_1
L0_1 = 14680064
DTBEVENTMASK_TYPE = L0_1
L0_1 = 1966080
DTBEVENTMASK_PARAM1 = L0_1
L0_1 = 131008
DTBEVENTMASK_PARAM2 = L0_1
L0_1 = 127
DTBEVENTMASK_PARAM3 = L0_1
L0_1 = 21
DTBEVENTSHIFT_TYPE = L0_1
L0_1 = 17
DTBEVENTSHIFT_PARAM1 = L0_1
L0_1 = 7
DTBEVENTSHIFT_PARAM2 = L0_1
L0_1 = 0
DTBEVENTSHIFT_PARAM3 = L0_1
L0_1 = 1
MSG_END_GAME = L0_1
L0_1 = 2
MSG_TIMEUPDATE = L0_1
L0_1 = 3
MSG_CAR_LOST = L0_1
L0_1 = 4
MSG_NUM_CARS = L0_1
L0_1 = 5
MSG_SWAP_TEAM = L0_1
L0_1 = 6
MSG_START_NEXT_ROUND = L0_1
L0_1 = car
L0_1 = L0_1.limo
LIMO_MODEL_INDEX = L0_1
L0_1 = car
L0_1 = L0_1.idaho
IDAHO_MODEL_INDEX = L0_1
L0_1 = car
L0_1 = L0_1.stinger
STINGER_MODEL_INDEX = L0_1
L0_1 = car
L0_1 = L0_1.pony
PONY_MODEL_INDEX = L0_1
L0_1 = 10000
SHORCUT_VEHICLE_RESPAWN_TIME = L0_1
L0_1 = 0
teamId1 = L0_1
L0_1 = 1
teamId2 = L0_1
L0_1 = 0
team1RadarColour = L0_1
L0_1 = 2
team2RadarColour = L0_1
L0_1 = {}
L1_1 = 0
L2_1 = 2
L0_1[1] = L1_1
L0_1[2] = L2_1
radarColours = L0_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2
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
  L1_2 = GenerateAmbients
  L2_2 = false
  L1_2(L2_2)
  L1_2 = PickupMgr
  L1_2 = L1_2()
  A0_2.mypickups = L1_2
  L1_2 = A0_2.mypickups
  L2_2 = L1_2
  L1_2 = L1_2.CreatePickups
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.InitGame
  L1_2(L2_2)
  L1_2 = {}
  A0_2.scores = L1_2
  L1_2 = {}
  A0_2.teamscores = L1_2
  L1_2 = A0_2.teamscores
  L1_2[1] = 0
  L1_2 = A0_2.teamscores
  L1_2[2] = 0
  L1_2 = UseSuperBrakeOnPause
  L2_2 = false
  L1_2(L2_2)
  L1_2 = false
  A0_2.gameUnderway = L1_2
  L1_2 = TeamGameEveryoneIn
  L1_2()
  L1_2 = MessagePump
  L1_2 = L1_2()
  A0_2.myMessagePump = L1_2
  L1_2 = A0_2.myMessagePump
  L2_2 = L1_2
  L1_2 = L1_2.Start
  L1_2(L2_2)
  L1_2 = "StateRunning"
  return L1_2
end
L0_1.StateInit = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "DTB Cleanup"
  L1_2(L2_2)
  L1_2 = A0_2.DefenceTimer
  if L1_2 ~= nil then
    L1_2 = A0_2.DefenceTimer
    L2_2 = L1_2
    L1_2 = L1_2.Remove
    L1_2(L2_2)
    A0_2.DefenceTimer = nil
  end
  L1_2 = A0_2.carsLeftText
  if L1_2 ~= nil then
    L1_2 = A0_2.carsLeftText
    L2_2 = L1_2
    L1_2 = L1_2.Remove
    L1_2(L2_2)
    A0_2.carsLeftText = nil
  end
  L1_2 = A0_2.myMessagePump
  L2_2 = L1_2
  L1_2 = L1_2.Stop
  L1_2(L2_2)
  L1_2 = collectgarbage
  L1_2()
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.ServerLogic
    L2_2 = L1_2
    L1_2 = L1_2.Stop
    L1_2(L2_2)
  end
  L1_2 = RenderHudExtras
  L2_2 = false
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  L1_2 = {}
  A0_2.CarDealerships = L1_2
  L1_2 = {}
  A0_2.DefenceStartPoints = L1_2
  L1_2 = {}
  A0_2.DefenceSpawnPoints = L1_2
  L1_2 = {}
  A0_2.AttackSpawnPoints = L1_2
  L1_2 = {}
  A0_2.ShortcutVehiclePoints = L1_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L4_2 = {}
  L5_2 = {}
  L6_2 = nil
  L7_2 = nil
  L8_2 = nil
  L9_2 = nil
  L10_2 = nil
  L11_2 = UseLCFiles
  L11_2 = L11_2()
  if L11_2 then
    L11_2 = dofile
    L12_2 = GetDiskPrepend
    L12_2 = L12_2()
    L13_2 = "LUA/DefendTheBaseData.lua.lc"
    L12_2 = L12_2 .. L13_2
    L11_2 = L11_2(L12_2)
    L10_2 = L11_2
  else
    L11_2 = dofile
    L12_2 = GetDiskPrepend
    L12_2 = L12_2()
    L13_2 = "LUA/DefendTheBaseData.lua"
    L12_2 = L12_2 .. L13_2
    L11_2 = L11_2(L12_2)
    L10_2 = L11_2
  end
  L11_2 = L10_2
  L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L11_2()
  L9_2 = L19_2
  L8_2 = L18_2
  L7_2 = L17_2
  L6_2 = L16_2
  L5_2 = L15_2
  L4_2 = L14_2
  L3_2 = L13_2
  L2_2 = L12_2
  L1_2 = L11_2
  L11_2 = table
  L11_2 = L11_2.clone
  L12_2 = L1_2
  L11_2 = L11_2(L12_2)
  A0_2.CarDealerships = L11_2
  L11_2 = table
  L11_2 = L11_2.clone
  L12_2 = L2_2
  L11_2 = L11_2(L12_2)
  A0_2.DefenceStartPoints = L11_2
  L11_2 = table
  L11_2 = L11_2.clone
  L12_2 = L3_2
  L11_2 = L11_2(L12_2)
  A0_2.DefenceSpawnPoints = L11_2
  L11_2 = table
  L11_2 = L11_2.clone
  L12_2 = L4_2
  L11_2 = L11_2(L12_2)
  A0_2.AttackSpawnPoints = L11_2
  L11_2 = table
  L11_2 = L11_2.clone
  L12_2 = L5_2
  L11_2 = L11_2(L12_2)
  A0_2.ShortcutVehiclePoints = L11_2
  A0_2.TargetVehicleId1 = L6_2
  A0_2.TargetVehicleId2 = L7_2
  A0_2.TargetVehicleId3 = L8_2
  A0_2.TargetVehicleId4 = L9_2
  L10_2 = nil
  L11_2 = collectgarbage
  L11_2()
  L11_2 = IsTeamGame
  L12_2 = true
  L11_2(L12_2)
  L11_2 = GameElapsedMs
  L12_2 = 0
  L11_2(L12_2)
  L11_2 = DisablePlayer
  L12_2 = true
  L11_2(L12_2)
  L11_2 = DefendingTeam
  L12_2 = 1
  L11_2(L12_2)
  L11_2 = true
  A0_2.InitialSpawn = L11_2
  L11_2 = false
  A0_2.finalSyncCarsSent = L11_2
  A0_2.gameseconds = 0
  A0_2.hours = 0
  A0_2.mins = 0
  A0_2.seconds = 0
  A0_2.winningTeam = 1
  A0_2.MissionVehicle1 = nil
  A0_2.MissionVehicle2 = nil
  A0_2.MissionVehicle3 = nil
  A0_2.MissionVehicle4 = nil
  A0_2.ShortcutVehicle1 = nil
  A0_2.ShortcutVehicle2 = nil
  L11_2 = SHORCUT_VEHICLE_RESPAWN_TIME
  A0_2.ShortcutRespawnTimer = L11_2
  L11_2 = GameElapsedMs
  L11_2 = L11_2()
  A0_2.ShortcutRespawnLastUpdate = L11_2
  L11_2 = false
  A0_2.Car1Destroyed = L11_2
  L11_2 = false
  A0_2.Car2Destroyed = L11_2
  L11_2 = false
  A0_2.Car3Destroyed = L11_2
  L11_2 = false
  A0_2.Car4Destroyed = L11_2
  A0_2.TimeToBeat = 0
  L11_2 = false
  A0_2.FinalRound = L11_2
  A0_2.RoundsPlayed = 0
  L11_2 = false
  A0_2.timeRanOut = L11_2
  A0_2.BaseBlip = nil
  A0_2.VehiclesLeftThisRound = 4
  L11_2 = true
  A0_2.ChangeSides = L11_2
  L11_2 = false
  A0_2.startNextRound = L11_2
  L11_2 = coreLib
  L12_2 = L11_2
  L11_2 = L11_2.ToggleEndOfGame
  L13_2 = false
  L11_2(L12_2, L13_2)
  L11_2 = Player
  L11_2 = L11_2()
  A0_2.DefenceTimer = nil
  A0_2.carsLeftText = nil
  L13_2 = A0_2
  L12_2 = A0_2.ShowHUD
  L14_2 = false
  L12_2(L13_2, L14_2)
  L12_2 = IsServer
  L12_2 = L12_2()
  if L12_2 then
    L12_2 = UsePowerups
    L12_2 = L12_2()
    if L12_2 then
      L12_2 = PowerUpTimer
      L13_2 = L12_2
      L12_2 = L12_2.Start
      L12_2(L13_2)
    end
  end
  L12_2 = coreLib
  L13_2 = L12_2
  L12_2 = L12_2.SetEnemyTeamToShortRangeRadar
  L12_2(L13_2)
  L12_2 = IsServer
  L12_2 = L12_2()
  if L12_2 then
    L12_2 = ServerLogic
    L12_2 = L12_2()
    A0_2.ServerLogic = L12_2
    L12_2 = A0_2.ServerLogic
    L13_2 = L12_2
    L12_2 = L12_2.Start
    L12_2(L13_2)
    L12_2 = ServerReadyToGo
    L13_2 = true
    L12_2(L13_2)
  end
  L12_2 = Wait
  L13_2 = 1000
  L12_2(L13_2)
end
L0_1.InitGame = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.IsEndOfGame
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.CheckChangeSides
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.CheckForRespawn
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.UpdateScores
    L1_2(L2_2)
    L1_2 = collectgarbage
    L1_2()
    L1_2 = Wait
    L2_2 = 1
    L1_2(L2_2)
  end
  L2_2 = A0_2
  L1_2 = A0_2.CheckIfEndOfGame
  L1_2(L2_2)
end
L0_1.StateRunning = L1_1
L0_1 = ServerLogic
function L1_1(A0_2)
  local L1_2, L2_2
  while 1 do
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.UpdateMissionVehicles
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.SwapAttackDefend
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.UpdateShortcutVehicles
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.UpdateTimers
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 1
    L1_2(L2_2)
  end
  L1_2 = print
  L2_2 = "out of server loop"
  L1_2(L2_2)
end
L0_1.Run = L1_1
L0_1 = ServerLogic
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "Server Logic Cleanup"
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.IsEndOfGame
  L1_2 = L1_2(L2_2)
  if L1_2 then
    return
  end
  L1_2 = GameElapsedMs
  L1_2 = L1_2()
  L2_2 = A0_2.gameseconds
  L2_2 = L1_2 - L2_2
  if 1000 <= L2_2 then
    A0_2.gameseconds = L1_2
    L2_2 = A0_2.seconds
    L2_2 = L2_2 + 1
    A0_2.seconds = L2_2
    L2_2 = A0_2.seconds
    if L2_2 == 60 then
      A0_2.seconds = 0
      L2_2 = A0_2.mins
      L2_2 = L2_2 + 1
      A0_2.mins = L2_2
      L2_2 = A0_2.mins
      if 60 <= L2_2 then
        A0_2.mins = 0
        L2_2 = A0_2.hours
        L2_2 = L2_2 + 1
        A0_2.hours = L2_2
      end
    end
    L2_2 = A0_2.hours
    if 10 <= L2_2 then
      L2_2 = print
      L3_2 = "10 Hour Game. Deleteing Vehicles"
      L2_2(L3_2)
      A0_2.hours = 10
      A0_2.mins = 0
      A0_2.seconds = 0
      L2_2 = DeleteVehicle
      L3_2 = A0_2.MissionVehicle1
      L2_2(L3_2)
      L2_2 = DeleteVehicle
      L3_2 = A0_2.MissionVehicle2
      L2_2(L3_2)
      L2_2 = DeleteVehicle
      L3_2 = A0_2.MissionVehicle3
      L2_2(L3_2)
      L2_2 = DeleteVehicle
      L3_2 = A0_2.MissionVehicle4
      L2_2(L3_2)
    end
    L3_2 = A0_2
    L2_2 = A0_2.DoSendEvent
    L4_2 = MSG_TIMEUPDATE
    L5_2 = A0_2.hours
    L6_2 = A0_2.mins
    L7_2 = A0_2.seconds
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    L3_2 = A0_2
    L2_2 = A0_2.DoSendEvent
    L4_2 = MSG_NUM_CARS
    L5_2 = 0
    L6_2 = A0_2.VehiclesLeftThisRound
    L7_2 = 0
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
end
L0_1.UpdateTimers = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.IsPlaying
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = DoWasted
    L2_2()
    L3_2 = A0_2
    L2_2 = A0_2.GetPlayerRespawnPosition
    L2_2 = L2_2(L3_2)
    L4_2 = L1_2
    L3_2 = L1_2.Respawn
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.ChangeSides
    L4_2 = false
    if L3_2 == L4_2 then
      L4_2 = A0_2
      L3_2 = A0_2.DisplayAttackDefendMessage
      L3_2(L4_2)
    end
  end
end
L0_1.CheckForRespawn = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.MissionVehicle1
    if L1_2 ~= nil then
      L1_2 = A0_2.Car1Destroyed
      L2_2 = false
      if L1_2 == L2_2 then
        L1_2 = VehicleHealth
        L2_2 = A0_2.MissionVehicle1
        L1_2 = L1_2(L2_2)
        if L1_2 <= 0 then
          L1_2 = VehicleRemove3dMarker
          L2_2 = A0_2.MissionVehicle1
          L1_2(L2_2)
          L1_2 = A0_2.Car1Destroyed
          L2_2 = false
          if L1_2 == L2_2 then
            L1_2 = A0_2.VehiclesLeftThisRound
            L1_2 = L1_2 - 1
            A0_2.VehiclesLeftThisRound = L1_2
            L2_2 = A0_2
            L1_2 = A0_2.DoSendEvent
            L3_2 = MSG_CAR_LOST
            L4_2 = 0
            L5_2 = 0
            L6_2 = 0
            L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
            L1_2 = true
            A0_2.Car1Destroyed = L1_2
          end
        end
      end
    end
    L1_2 = A0_2.MissionVehicle2
    if L1_2 ~= nil then
      L1_2 = A0_2.Car2Destroyed
      L2_2 = false
      if L1_2 == L2_2 then
        L1_2 = VehicleHealth
        L2_2 = A0_2.MissionVehicle2
        L1_2 = L1_2(L2_2)
        if L1_2 <= 0 then
          L1_2 = VehicleRemove3dMarker
          L2_2 = A0_2.MissionVehicle2
          L1_2(L2_2)
          L1_2 = A0_2.Car2Destroyed
          L2_2 = false
          if L1_2 == L2_2 then
            L1_2 = A0_2.VehiclesLeftThisRound
            L1_2 = L1_2 - 1
            A0_2.VehiclesLeftThisRound = L1_2
            L2_2 = A0_2
            L1_2 = A0_2.DoSendEvent
            L3_2 = MSG_CAR_LOST
            L4_2 = 0
            L5_2 = 0
            L6_2 = 0
            L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
            L1_2 = true
            A0_2.Car2Destroyed = L1_2
          end
        end
      end
    end
    L1_2 = A0_2.MissionVehicle3
    if L1_2 ~= nil then
      L1_2 = A0_2.Car3Destroyed
      L2_2 = false
      if L1_2 == L2_2 then
        L1_2 = VehicleHealth
        L2_2 = A0_2.MissionVehicle3
        L1_2 = L1_2(L2_2)
        if L1_2 <= 0 then
          L1_2 = VehicleRemove3dMarker
          L2_2 = A0_2.MissionVehicle3
          L1_2(L2_2)
          L1_2 = A0_2.Car3Destroyed
          L2_2 = false
          if L1_2 == L2_2 then
            L1_2 = A0_2.VehiclesLeftThisRound
            L1_2 = L1_2 - 1
            A0_2.VehiclesLeftThisRound = L1_2
            L2_2 = A0_2
            L1_2 = A0_2.DoSendEvent
            L3_2 = MSG_CAR_LOST
            L4_2 = 0
            L5_2 = 0
            L6_2 = 0
            L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
            L1_2 = true
            A0_2.Car3Destroyed = L1_2
          end
        end
      end
    end
    L1_2 = A0_2.MissionVehicle4
    if L1_2 ~= nil then
      L1_2 = A0_2.Car4Destroyed
      L2_2 = false
      if L1_2 == L2_2 then
        L1_2 = VehicleHealth
        L2_2 = A0_2.MissionVehicle4
        L1_2 = L1_2(L2_2)
        if L1_2 <= 0 then
          L1_2 = VehicleRemove3dMarker
          L2_2 = A0_2.MissionVehicle4
          L1_2(L2_2)
          L1_2 = A0_2.Car4Destroyed
          L2_2 = false
          if L1_2 == L2_2 then
            L1_2 = A0_2.VehiclesLeftThisRound
            L1_2 = L1_2 - 1
            A0_2.VehiclesLeftThisRound = L1_2
            L2_2 = A0_2
            L1_2 = A0_2.DoSendEvent
            L3_2 = MSG_CAR_LOST
            L4_2 = 0
            L5_2 = 0
            L6_2 = 0
            L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
            L1_2 = true
            A0_2.Car4Destroyed = L1_2
          end
        end
      end
    end
  end
end
L0_1.UpdateMissionVehicles = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = coreLib
    L2_2 = L1_2
    L1_2 = L1_2.IsEndOfGame
    L1_2 = L1_2(L2_2)
    if L1_2 then
      return
    end
    L1_2 = IsVehicleWrecked
    L2_2 = A0_2.ShortcutVehicle1
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = A0_2.ShortcutVehicle1
      if L1_2 ~= nil then
        A0_2.ShortcutVehicle1 = nil
      end
    end
    L1_2 = IsVehicleWrecked
    L2_2 = A0_2.ShortcutVehicle2
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = A0_2.ShortcutVehicle2
      if L1_2 ~= nil then
        A0_2.ShortcutVehicle2 = nil
      end
    end
    L1_2 = A0_2.ShortcutVehicle1
    if L1_2 ~= nil then
      L1_2 = A0_2.ShortcutVehicle2
      if L1_2 ~= nil then
        goto lbl_73
      end
    end
    L1_2 = A0_2.ShortcutRespawnTimer
    L2_2 = GameElapsedMs
    L2_2 = L2_2()
    L3_2 = A0_2.ShortcutRespawnLastUpdate
    L2_2 = L2_2 - L3_2
    L1_2 = L1_2 - L2_2
    A0_2.ShortcutRespawnTimer = L1_2
    L1_2 = A0_2.ShortcutRespawnTimer
    if L1_2 <= 0 then
      L1_2 = A0_2.ShortcutVehicle1
      if L1_2 == nil then
        L1_2 = A0_2.ShortcutVehicle2
        if L1_2 == nil then
          L2_2 = A0_2
          L1_2 = A0_2.SpawnShortcutVehicles
          L3_2 = true
          L4_2 = true
          L1_2(L2_2, L3_2, L4_2)
      end
      else
        L1_2 = A0_2.ShortcutVehicle1
        if L1_2 == nil then
          L2_2 = A0_2
          L1_2 = A0_2.SpawnShortcutVehicles
          L3_2 = true
          L4_2 = false
          L1_2(L2_2, L3_2, L4_2)
        else
          L1_2 = A0_2.ShortcutVehicle2
          if L1_2 == nil then
            L2_2 = A0_2
            L1_2 = A0_2.SpawnShortcutVehicles
            L3_2 = false
            L4_2 = true
            L1_2(L2_2, L3_2, L4_2)
          end
        end
      end
      L1_2 = SHORCUT_VEHICLE_RESPAWN_TIME
      A0_2.ShortcutRespawnTimer = L1_2
    end
    ::lbl_73::
    L1_2 = GameElapsedMs
    L1_2 = L1_2()
    A0_2.ShortcutRespawnLastUpdate = L1_2
  end
end
L0_1.UpdateShortcutVehicles = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.BaseBlip
    if L1_2 == nil then
      L1_2 = {}
      L2_2 = A0_2.CarDealerships
      L2_2 = L2_2[2]
      L2_2 = L2_2[1]
      L2_2 = L2_2[1]
      L1_2[1] = L2_2
      L2_2 = A0_2.CarDealerships
      L2_2 = L2_2[2]
      L2_2 = L2_2[1]
      L2_2 = L2_2[2]
      L1_2[2] = L2_2
      L2_2 = A0_2.CarDealerships
      L2_2 = L2_2[2]
      L2_2 = L2_2[1]
      L2_2 = L2_2[3]
      L1_2[3] = L2_2
      L2_2 = AddBlipForCoord
      L3_2 = GetEveryonePeerGroupId
      L3_2 = L3_2()
      L4_2 = L1_2
      L5_2 = radarColours
      L6_2 = DefendingTeam
      L6_2 = L6_2()
      L5_2 = L5_2[L6_2]
      L6_2 = pickupicon
      L6_2 = L6_2.base
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
      A0_2.BaseBlip = L2_2
    end
  end
end
L0_1.UpdateRadar = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = 1
    L2_2 = 0
    L3_2 = 0
    L4_2 = DefendingTeam
    L4_2 = L4_2()
    if L4_2 == 1 then
      L4_2 = GetVehicleColour
      L5_2 = 3
      L4_2 = L4_2(L5_2)
      L2_2 = L4_2
      L4_2 = GetVehicleColour
      L5_2 = 0
      L4_2 = L4_2(L5_2)
      L3_2 = L4_2
    else
      L4_2 = GetVehicleColour
      L5_2 = 7
      L4_2 = L4_2(L5_2)
      L2_2 = L4_2
      L4_2 = GetVehicleColour
      L5_2 = 0
      L4_2 = L4_2(L5_2)
      L3_2 = L4_2
    end
    L4_2 = {}
    L5_2 = A0_2.CarDealerships
    L5_2 = L5_2[L1_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[1]
    L4_2[1] = L5_2
    L5_2 = A0_2.CarDealerships
    L5_2 = L5_2[L1_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[2]
    L4_2[2] = L5_2
    L5_2 = A0_2.CarDealerships
    L5_2 = L5_2[L1_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[3]
    L4_2[3] = L5_2
    L5_2 = print
    L6_2 = "data check for vehicle 1"
    L5_2(L6_2)
    L5_2 = print
    L6_2 = A0_2.TargetVehicleId1
    L5_2(L6_2)
    L5_2 = print
    L6_2 = L4_2[1]
    L5_2(L6_2)
    L5_2 = print
    L6_2 = L4_2[2]
    L5_2(L6_2)
    L5_2 = print
    L6_2 = L4_2[3]
    L5_2(L6_2)
    L5_2 = print
    L6_2 = A0_2.CarDealerships
    L6_2 = L6_2[L1_2]
    L6_2 = L6_2[2]
    L5_2(L6_2)
    L5_2 = print
    L6_2 = L2_2
    L5_2(L6_2)
    L5_2 = print
    L6_2 = L3_2
    L5_2(L6_2)
    L5_2 = CreateVehicle
    L6_2 = A0_2.TargetVehicleId1
    L7_2 = L4_2
    L8_2 = A0_2.CarDealerships
    L8_2 = L8_2[L1_2]
    L8_2 = L8_2[2]
    L9_2 = L2_2
    L10_2 = L3_2
    L11_2 = true
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    A0_2.MissionVehicle1 = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 1
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[1]
    L4_2[1] = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 1
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[2]
    L4_2[2] = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 1
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[3]
    L4_2[3] = L5_2
    L5_2 = CreateVehicle
    L6_2 = A0_2.TargetVehicleId2
    L7_2 = L4_2
    L8_2 = A0_2.CarDealerships
    L9_2 = L1_2 + 1
    L8_2 = L8_2[L9_2]
    L8_2 = L8_2[2]
    L9_2 = L2_2
    L10_2 = L3_2
    L11_2 = true
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    A0_2.MissionVehicle2 = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 2
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[1]
    L4_2[1] = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 2
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[2]
    L4_2[2] = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 2
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[3]
    L4_2[3] = L5_2
    L5_2 = CreateVehicle
    L6_2 = A0_2.TargetVehicleId3
    L7_2 = L4_2
    L8_2 = A0_2.CarDealerships
    L9_2 = L1_2 + 2
    L8_2 = L8_2[L9_2]
    L8_2 = L8_2[2]
    L9_2 = L2_2
    L10_2 = L3_2
    L11_2 = true
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    A0_2.MissionVehicle3 = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 3
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[1]
    L4_2[1] = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 3
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[2]
    L4_2[2] = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 3
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[3]
    L4_2[3] = L5_2
    L5_2 = CreateVehicle
    L6_2 = A0_2.TargetVehicleId4
    L7_2 = L4_2
    L8_2 = A0_2.CarDealerships
    L9_2 = L1_2 + 3
    L8_2 = L8_2[L9_2]
    L8_2 = L8_2[2]
    L9_2 = L2_2
    L10_2 = L3_2
    L11_2 = true
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    A0_2.MissionVehicle4 = L5_2
    L5_2 = Wait
    L6_2 = 500
    L5_2(L6_2)
    L5_2 = VehicleAdd3dMarker
    L6_2 = A0_2.MissionVehicle1
    L5_2(L6_2)
    L5_2 = VehicleAdd3dMarker
    L6_2 = A0_2.MissionVehicle2
    L5_2(L6_2)
    L5_2 = VehicleAdd3dMarker
    L6_2 = A0_2.MissionVehicle3
    L5_2(L6_2)
    L5_2 = VehicleAdd3dMarker
    L6_2 = A0_2.MissionVehicle4
    L5_2(L6_2)
    L5_2 = false
    A0_2.Car1Destroyed = L5_2
    L5_2 = false
    A0_2.Car2Destroyed = L5_2
    L5_2 = false
    A0_2.Car3Destroyed = L5_2
    L5_2 = false
    A0_2.Car4Destroyed = L5_2
    L5_2 = Wait
    L6_2 = 500
    L5_2(L6_2)
    L5_2 = VehicleSetCarDoorLocks
    L6_2 = A0_2.MissionVehicle1
    L7_2 = CARLOCK_LOCKED
    L5_2(L6_2, L7_2)
    L5_2 = VehicleSetCarDoorLocks
    L6_2 = A0_2.MissionVehicle2
    L7_2 = CARLOCK_LOCKED
    L5_2(L6_2, L7_2)
    L5_2 = VehicleSetCarDoorLocks
    L6_2 = A0_2.MissionVehicle3
    L7_2 = CARLOCK_LOCKED
    L5_2(L6_2, L7_2)
    L5_2 = VehicleSetCarDoorLocks
    L6_2 = A0_2.MissionVehicle4
    L7_2 = CARLOCK_LOCKED
    L5_2(L6_2, L7_2)
  end
end
L0_1.SpawnMissionVehicles = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = IsServer
  L3_2 = L3_2()
  if L3_2 then
    L3_2 = nil
    L4_2 = nil
    L5_2 = {}
    L3_2 = IDAHO_MODEL_INDEX
    L4_2 = STINGER_MODEL_INDEX
    L6_2 = true
    if A1_2 == L6_2 then
      L6_2 = A0_2.ShortcutVehicle1
      if L6_2 == nil then
        L6_2 = A0_2.ShortcutVehiclePoints
        L6_2 = L6_2[1]
        L6_2 = L6_2[1]
        L6_2 = L6_2[1]
        L5_2[1] = L6_2
        L6_2 = A0_2.ShortcutVehiclePoints
        L6_2 = L6_2[1]
        L6_2 = L6_2[1]
        L6_2 = L6_2[2]
        L5_2[2] = L6_2
        L6_2 = A0_2.ShortcutVehiclePoints
        L6_2 = L6_2[1]
        L6_2 = L6_2[1]
        L6_2 = L6_2[3]
        L5_2[3] = L6_2
        L6_2 = ClearArea
        L7_2 = L5_2
        L8_2 = 5
        L6_2(L7_2, L8_2)
        L6_2 = Wait
        L7_2 = 10
        L6_2(L7_2)
        L6_2 = CreateVehicle
        L7_2 = L3_2
        L8_2 = L5_2
        L9_2 = A0_2.ShortcutVehiclePoints
        L9_2 = L9_2[1]
        L9_2 = L9_2[2]
        L10_2 = nil
        L11_2 = nil
        L12_2 = true
        L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        A0_2.ShortcutVehicle1 = L6_2
      end
    end
    L6_2 = true
    if A2_2 == L6_2 then
      L6_2 = A0_2.ShortcutVehicle2
      if L6_2 == nil then
        L6_2 = A0_2.ShortcutVehiclePoints
        L6_2 = L6_2[2]
        L6_2 = L6_2[1]
        L6_2 = L6_2[1]
        L5_2[1] = L6_2
        L6_2 = A0_2.ShortcutVehiclePoints
        L6_2 = L6_2[2]
        L6_2 = L6_2[1]
        L6_2 = L6_2[2]
        L5_2[2] = L6_2
        L6_2 = A0_2.ShortcutVehiclePoints
        L6_2 = L6_2[2]
        L6_2 = L6_2[1]
        L6_2 = L6_2[3]
        L5_2[3] = L6_2
        L6_2 = ClearArea
        L7_2 = L5_2
        L8_2 = 5
        L6_2(L7_2, L8_2)
        L6_2 = Wait
        L7_2 = 10
        L6_2(L7_2)
        L6_2 = CreateVehicle
        L7_2 = L4_2
        L8_2 = L5_2
        L9_2 = A0_2.ShortcutVehiclePoints
        L9_2 = L9_2[2]
        L9_2 = L9_2[2]
        L10_2 = nil
        L11_2 = nil
        L12_2 = true
        L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        A0_2.ShortcutVehicle2 = L6_2
      end
    end
    A0_2.ShortcutRespawnTimer = 0
    L6_2 = GameElapsedMs
    L6_2 = L6_2()
    A0_2.ShortcutRespawnLastUpdate = L6_2
  end
end
L0_1.SpawnShortcutVehicles = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = nil
  L3_2 = nil
  L4_2 = A0_2.RoundsPlayed
  if L4_2 == 1 then
    L5_2 = A0_2
    L4_2 = A0_2.DefenceTimeInMs
    L4_2 = L4_2(L5_2)
    L2_2 = L4_2
  else
    L4_2 = A0_2.TimeToBeat
    L6_2 = A0_2
    L5_2 = A0_2.DefenceTimeInMs
    L5_2 = L5_2(L6_2)
    L2_2 = L4_2 - L5_2
    if L2_2 < 0 then
      L2_2 = 0
    end
  end
  L4_2 = coreLib
  L5_2 = L4_2
  L4_2 = L4_2.FormatMsValueToHHMMSS
  L6_2 = L2_2
  L4_2 = L4_2(L5_2, L6_2)
  L3_2 = L4_2
  L4_2 = A0_2.DefenceTimer
  if L4_2 ~= nil then
    L4_2 = A0_2.DefenceTimer
    L5_2 = L4_2
    L4_2 = L4_2.Text
    L6_2 = "^S^"
    L7_2 = L3_2
    L6_2 = L6_2 .. L7_2
    L4_2(L5_2, L6_2)
  end
  L4_2 = A0_2.carsLeftText
  if L4_2 ~= nil then
    L4_2 = DefendingTeam
    L4_2 = L4_2()
    if L4_2 == 1 then
      L4_2 = A0_2.carsLeftText
      L5_2 = L4_2
      L4_2 = L4_2.Colour
      L6_2 = GameColour
      L7_2 = teamId1
      L6_2, L7_2 = L6_2(L7_2)
      L4_2(L5_2, L6_2, L7_2)
    else
      L4_2 = A0_2.carsLeftText
      L5_2 = L4_2
      L4_2 = L4_2.Colour
      L6_2 = GameColour
      L7_2 = teamId2
      L6_2, L7_2 = L6_2(L7_2)
      L4_2(L5_2, L6_2, L7_2)
    end
    L4_2 = A0_2.carsLeftText
    L5_2 = L4_2
    L4_2 = L4_2.Text
    L6_2 = "^S^"
    L7_2 = A0_2.VehiclesLeftThisRound
    L6_2 = L6_2 .. L7_2
    L4_2(L5_2, L6_2)
  end
end
L0_1.DisplayDefenceTimer = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = 0
  L2_2 = A0_2.seconds
  L2_2 = L2_2 * 1000
  L3_2 = A0_2.mins
  L3_2 = L3_2 * 60000
  L2_2 = L2_2 + L3_2
  L3_2 = A0_2.hours
  L3_2 = L3_2 * 3600000
  L2_2 = L2_2 + L3_2
  L3_2 = print
  L4_2 = "GetTheWiningTeam TIME == "
  L5_2 = L2_2
  L4_2 = L4_2 .. L5_2
  L3_2(L4_2)
  L3_2 = print
  L4_2 = "GetTheWiningTeam DEF TIME == "
  L5_2 = A0_2.TimeToBeat
  L4_2 = L4_2 .. L5_2
  L3_2(L4_2)
  L3_2 = A0_2.TimeToBeat
  if L2_2 == L3_2 then
    L1_2 = 0
  else
    L3_2 = A0_2.TimeToBeat
    if L2_2 > L3_2 then
      L3_2 = DefendingTeam
      L3_2 = L3_2()
      L1_2 = L3_2
    else
      L3_2 = DefendingTeam
      L3_2 = L3_2()
      if L3_2 == 1 then
        L1_2 = 2
      else
        L1_2 = 1
      end
    end
  end
  if L1_2 == 0 then
    L3_2 = print
    L4_2 = "Draw"
    L3_2(L4_2)
  elseif L1_2 == 1 then
    L3_2 = print
    L4_2 = "Blue Team Wins"
    L3_2(L4_2)
  else
    L3_2 = print
    L4_2 = "Red Team Wins"
    L3_2(L4_2)
  end
  return L1_2
end
L0_1.GetTheWiningTeam = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.IsEndOfGame
  L1_2 = L1_2(L2_2)
  L2_2 = true
  if L1_2 == L2_2 then
    L1_2 = print
    L2_2 = "End Of Game Reached"
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.DisplayDefenceTimer
    L1_2(L2_2)
    L1_2 = collectgarbage
    L1_2()
    L1_2 = UpdateGameTime
    L2_2 = false
    L1_2(L2_2)
    L1_2 = DisablePlayer
    L2_2 = true
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L1_2.state = "StateGameWon"
    L1_2 = A0_2.winningTeam
    L2_2 = Player
    L2_2 = L2_2()
    L3_2 = nil
    L5_2 = L2_2
    L4_2 = L2_2.TeamId
    L4_2 = L4_2(L5_2)
    L5_2 = L1_2 - 1
    if L4_2 == L5_2 then
      L3_2 = 1
    else
      L3_2 = 2
    end
    L4_2 = DisplayFinalWinLoseMessage
    L5_2 = L3_2
    L6_2 = "^S^"
    L7_2 = L1_2 - 1
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = main
    L4_2 = L4_2.scores
    L5_2 = L4_2
    L4_2 = L4_2.ToggleUpdate
    L6_2 = false
    L4_2(L5_2, L6_2)
    L4_2 = main
    L4_2 = L4_2.scores
    L5_2 = L4_2
    L4_2 = L4_2.Show
    L6_2 = true
    L4_2(L5_2, L6_2)
    L4_2 = Wait
    L5_2 = 12000
    L4_2(L5_2)
    L4_2 = main
    L4_2 = L4_2.scores
    L5_2 = L4_2
    L4_2 = L4_2.Hide
    L4_2(L5_2)
    L4_2 = main
    L5_2 = L4_2
    L4_2 = L4_2.EndGame
    L4_2(L5_2)
    L5_2 = A0_2
    L4_2 = A0_2.CleanUp
    L4_2(L5_2)
  end
end
L0_1.CheckIfEndOfGame = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = coreLib
    L2_2 = L1_2
    L1_2 = L1_2.IsEndOfGame
    L1_2 = L1_2(L2_2)
    if L1_2 then
      return
    end
    L1_2 = Player
    L1_2 = L1_2()
    L2_2 = false
    L3_2 = false
    L4_2 = A0_2.MissionVehicle1
    if L4_2 ~= nil then
      L4_2 = IsVehicleWrecked
      L5_2 = A0_2.MissionVehicle1
      L4_2 = L4_2(L5_2)
      L5_2 = true
      if L4_2 == L5_2 then
        L4_2 = A0_2.MissionVehicle2
        if L4_2 ~= nil then
          L4_2 = IsVehicleWrecked
          L5_2 = A0_2.MissionVehicle2
          L4_2 = L4_2(L5_2)
          L5_2 = true
          if L4_2 == L5_2 then
            L4_2 = A0_2.MissionVehicle3
            if L4_2 ~= nil then
              L4_2 = IsVehicleWrecked
              L5_2 = A0_2.MissionVehicle3
              L4_2 = L4_2(L5_2)
              L5_2 = true
              if L4_2 == L5_2 then
                L4_2 = A0_2.MissionVehicle4
                if L4_2 ~= nil then
                  L4_2 = IsVehicleWrecked
                  L5_2 = A0_2.MissionVehicle4
                  L4_2 = L4_2(L5_2)
                  L5_2 = true
                  if L4_2 == L5_2 then
                    L3_2 = true
                    L4_2 = UpdateGameTime
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
    L4_2 = A0_2.RoundsPlayed
    if L4_2 == 2 then
      L5_2 = A0_2
      L4_2 = A0_2.DefenceTimeInMs
      L4_2 = L4_2(L5_2)
      L5_2 = A0_2.TimeToBeat
      if L4_2 > L5_2 then
        L2_2 = true
        L4_2 = true
        A0_2.timeRanOut = L4_2
        L4_2 = UpdateGameTime
        L5_2 = false
        L4_2(L5_2)
      end
    end
    if not L3_2 then
      L4_2 = true
      if L2_2 ~= L4_2 then
        goto lbl_253
      end
    end
    L4_2 = coreLib
    L5_2 = L4_2
    L4_2 = L4_2.IsEndOfGame
    L4_2 = L4_2(L5_2)
    if not L4_2 then
      L4_2 = A0_2.finalSyncCarsSent
      L5_2 = true
      if L4_2 == L5_2 then
        L4_2 = print
        L5_2 = "Sync Num Cars At Change Sides"
        L4_2(L5_2)
        A0_2.VehiclesLeftThisRound = 0
        L5_2 = A0_2
        L4_2 = A0_2.DoSendEvent
        L6_2 = MSG_NUM_CARS
        L7_2 = 0
        L8_2 = A0_2.VehiclesLeftThisRound
        L9_2 = 0
        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
        L4_2 = true
        A0_2.finalSyncCarsSent = L4_2
        L4_2 = Wait
        L5_2 = 100
        L4_2(L5_2)
      end
    end
    L4_2 = IsLocalPlayerEnteringAVehicle
    L4_2 = L4_2()
    if not L4_2 then
      L5_2 = L1_2
      L4_2 = L1_2.IsPlaying
      L4_2 = L4_2(L5_2)
      L5_2 = false
      if L4_2 ~= L5_2 then
        goto lbl_108
      end
    end
    do return end
    ::lbl_108::
    L4_2 = IsLocalPlayerInVehicle
    L4_2 = L4_2()
    if L4_2 then
      L4_2 = print
      L5_2 = "Ped is in a vehicle, get the f*ck out !!!"
      L4_2(L5_2)
      L5_2 = A0_2
      L4_2 = A0_2.KickDriverOutOfCar
      L6_2 = GetLocalPlayersVehicle
      L6_2, L7_2, L8_2, L9_2, L10_2 = L6_2()
      L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    end
    L4_2 = A0_2.ShortcutVehicle1
    if L4_2 ~= nil then
      L4_2 = VehicleIsDrivenByPlayer
      L5_2 = A0_2.ShortcutVehicle1
      L4_2 = L4_2(L5_2)
      L5_2 = true
      if L4_2 == L5_2 then
        L5_2 = A0_2
        L4_2 = A0_2.KickDriverOutOfCar
        L6_2 = A0_2.ShortcutVehicle1
        L4_2(L5_2, L6_2)
      end
    end
    L4_2 = A0_2.ShortcutVehicle2
    if L4_2 ~= nil then
      L4_2 = VehicleIsDrivenByPlayer
      L5_2 = A0_2.ShortcutVehicle2
      L4_2 = L4_2(L5_2)
      L5_2 = true
      if L4_2 == L5_2 then
        L5_2 = A0_2
        L4_2 = A0_2.KickDriverOutOfCar
        L6_2 = A0_2.ShortcutVehicle2
        L4_2(L5_2, L6_2)
      end
    end
    L4_2 = A0_2.FinalRound
    L5_2 = false
    if L4_2 == L5_2 then
      L4_2 = true
      A0_2.FinalRound = L4_2
      L4_2 = A0_2.BaseBlip
      if L4_2 ~= nil then
        L4_2 = RemoveBlip
        L5_2 = A0_2.BaseBlip
        L4_2(L5_2)
        A0_2.BaseBlip = nil
      end
      L4_2 = VehicleRemove3dMarker
      L5_2 = A0_2.MissionVehicle1
      L4_2(L5_2)
      L4_2 = VehicleRemove3dMarker
      L5_2 = A0_2.MissionVehicle2
      L4_2(L5_2)
      L4_2 = VehicleRemove3dMarker
      L5_2 = A0_2.MissionVehicle3
      L4_2(L5_2)
      L4_2 = VehicleRemove3dMarker
      L5_2 = A0_2.MissionVehicle4
      L4_2(L5_2)
      L4_2 = {}
      L5_2 = 0
      L6_2 = 0
      L7_2 = 0
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = ClearArea
      L6_2 = L4_2
      L7_2 = 99999
      L5_2(L6_2, L7_2)
      L5_2 = Wait
      L6_2 = 1000
      L5_2(L6_2)
      L5_2 = DeleteVehicle
      L6_2 = A0_2.MissionVehicle1
      L5_2(L6_2)
      L5_2 = DeleteVehicle
      L6_2 = A0_2.MissionVehicle2
      L5_2(L6_2)
      L5_2 = DeleteVehicle
      L6_2 = A0_2.MissionVehicle3
      L5_2(L6_2)
      L5_2 = DeleteVehicle
      L6_2 = A0_2.MissionVehicle4
      L5_2(L6_2)
      A0_2.MissionVehicle1 = nil
      A0_2.MissionVehicle2 = nil
      A0_2.MissionVehicle3 = nil
      A0_2.MissionVehicle4 = nil
      L5_2 = DeleteVehicle
      L6_2 = A0_2.ShortcutVehicle1
      L5_2(L6_2)
      L5_2 = DeleteVehicle
      L6_2 = A0_2.ShortcutVehicle2
      L5_2(L6_2)
      A0_2.ShortcutVehicle1 = nil
      A0_2.ShortcutVehicle2 = nil
      L5_2 = print
      L6_2 = "Sending MSG_SWAP_TEAM"
      L5_2(L6_2)
      L6_2 = A0_2
      L5_2 = A0_2.DoSendEvent
      L7_2 = MSG_SWAP_TEAM
      L8_2 = A0_2.hours
      L9_2 = A0_2.mins
      L10_2 = A0_2.seconds
      L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    else
      L4_2 = coreLib
      L5_2 = L4_2
      L4_2 = L4_2.IsEndOfGame
      L4_2 = L4_2(L5_2)
      if not L4_2 then
        L4_2 = A0_2.RoundsPlayed
        if 2 <= L4_2 then
          L4_2 = print
          L5_2 = "Sending END Rounds =="
          L6_2 = A0_2.RoundsPlayed
          L5_2 = L5_2 .. L6_2
          L4_2(L5_2)
          L4_2 = nil
          L6_2 = A0_2
          L5_2 = A0_2.GetTheWiningTeam
          L5_2 = L5_2(L6_2)
          L4_2 = L5_2
          L5_2 = print
          L6_2 = "winningTeam == "
          L7_2 = L4_2
          L6_2 = L6_2 .. L7_2
          L5_2(L6_2)
          L5_2 = A0_2.timeRanOut
          L6_2 = true
          if L5_2 == L6_2 then
            L6_2 = A0_2
            L5_2 = A0_2.DoSendEvent
            L7_2 = MSG_END_GAME
            L8_2 = 0
            L9_2 = L4_2
            L10_2 = 1
            L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
          else
            L6_2 = A0_2
            L5_2 = A0_2.DoSendEvent
            L7_2 = MSG_END_GAME
            L8_2 = 0
            L9_2 = L4_2
            L10_2 = 0
            L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
          end
        end
      end
    end
  end
  ::lbl_253::
end
L0_1.SwapAttackDefend = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = A0_2.ChangeSides
  L2_2 = true
  if L1_2 == L2_2 then
    L1_2 = IsLocalPlayerEnteringAVehicle
    L1_2 = L1_2()
    if L1_2 then
      return
    end
    L1_2 = IsLocalPlayerInVehicle
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = print
      L2_2 = "Ped is in a vehicle, get the f*ck out !!!"
      L1_2(L2_2)
      L2_2 = A0_2
      L1_2 = A0_2.KickDriverOutOfCar
      L3_2 = GetLocalPlayersVehicle
      L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L3_2()
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    end
    L1_2 = print
    L2_2 = "Changing Sides"
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.DisplayDefenceTimer
    L1_2(L2_2)
    L1_2 = collectgarbage
    L1_2()
    L1_2 = RenderHudExtras
    L2_2 = false
    L1_2(L2_2)
    L1_2 = DisablePlayer
    L2_2 = true
    L1_2(L2_2)
    L1_2 = false
    A0_2.ChangeSides = L1_2
    L1_2 = true
    A0_2.InitialSpawn = L1_2
    L2_2 = A0_2
    L1_2 = A0_2.DefenceTimeInMs
    L1_2 = L1_2(L2_2)
    A0_2.TimeToBeat = L1_2
    L1_2 = print
    L2_2 = "Time To Beat == "
    L3_2 = A0_2.TimeToBeat
    L2_2 = L2_2 .. L3_2
    L1_2(L2_2)
    L1_2 = A0_2.gameUnderway
    L2_2 = true
    if L1_2 == L2_2 then
      L2_2 = A0_2
      L1_2 = A0_2.ShowHUD
      L3_2 = false
      L1_2(L2_2, L3_2)
      L1_2 = main
      L1_2 = L1_2.scores
      L2_2 = L1_2
      L1_2 = L1_2.Hide
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = RenderPauseScreenStuffNoBox
      L2_2 = true
      L1_2(L2_2)
      L1_2 = SetPauseScreenSelection
      L2_2 = -1
      L1_2(L2_2)
      L1_2 = Player
      L1_2 = L1_2()
      L2_2 = TextSprite
      L4_2 = L1_2
      L3_2 = L1_2.PlayerNum
      L3_2 = L3_2(L4_2)
      L4_2 = 240
      L5_2 = 90
      L6_2 = 1
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
      L4_2 = L2_2
      L3_2 = L2_2.Order
      L5_2 = -1
      L3_2(L4_2, L5_2)
      L4_2 = L2_2
      L3_2 = L2_2.Scale
      L5_2 = 1.304
      L3_2(L4_2, L5_2)
      L4_2 = L2_2
      L3_2 = L2_2.Style
      L5_2 = 0
      L3_2(L4_2, L5_2)
      L3_2 = TextSprite
      L5_2 = L1_2
      L4_2 = L1_2.PlayerNum
      L4_2 = L4_2(L5_2)
      L5_2 = 240
      L6_2 = 120
      L7_2 = 1
      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
      L5_2 = L3_2
      L4_2 = L3_2.Order
      L6_2 = -1
      L4_2(L5_2, L6_2)
      L5_2 = L3_2
      L4_2 = L3_2.Scale
      L6_2 = 1.304
      L4_2(L5_2, L6_2)
      L5_2 = L3_2
      L4_2 = L3_2.Style
      L6_2 = 0
      L4_2(L5_2, L6_2)
      L4_2 = TextSprite
      L6_2 = L1_2
      L5_2 = L1_2.PlayerNum
      L5_2 = L5_2(L6_2)
      L6_2 = 240
      L7_2 = 150
      L8_2 = 1
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      L6_2 = L4_2
      L5_2 = L4_2.Order
      L7_2 = -1
      L5_2(L6_2, L7_2)
      L6_2 = L4_2
      L5_2 = L4_2.Scale
      L7_2 = 1.304
      L5_2(L6_2, L7_2)
      L6_2 = L4_2
      L5_2 = L4_2.Style
      L7_2 = 0
      L5_2(L6_2, L7_2)
      L5_2 = nil
      L6_2 = nil
      L8_2 = A0_2
      L7_2 = A0_2.DefenceTimeInMs
      L7_2 = L7_2(L8_2)
      L5_2 = L7_2
      L7_2 = coreLib
      L8_2 = L7_2
      L7_2 = L7_2.FormatMsValueToHHMMSS
      L9_2 = L5_2
      L7_2 = L7_2(L8_2, L9_2)
      L6_2 = L7_2
      L8_2 = L1_2
      L7_2 = L1_2.TeamId
      L7_2 = L7_2(L8_2)
      L7_2 = L7_2 + 1
      L8_2 = DefendingTeam
      L8_2 = L8_2()
      if L7_2 == L8_2 then
        L8_2 = L2_2
        L7_2 = L2_2.Colour
        L9_2 = GameColour
        L10_2 = teamId2
        L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
        L8_2 = L4_2
        L7_2 = L4_2.Colour
        L9_2 = GameColour
        L10_2 = teamId2
        L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
        L8_2 = L3_2
        L7_2 = L3_2.Colour
        L9_2 = GameColour
        L10_2 = teamId2
        L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
        L8_2 = L2_2
        L7_2 = L2_2.Text
        L9_2 = "^T^DTBSWPA"
        L7_2(L8_2, L9_2)
        L8_2 = L3_2
        L7_2 = L3_2.Text
        L9_2 = "^S^"
        L10_2 = L6_2
        L9_2 = L9_2 .. L10_2
        L7_2(L8_2, L9_2)
        L8_2 = L4_2
        L7_2 = L4_2.Text
        L9_2 = "^T^DTBSWPB"
        L7_2(L8_2, L9_2)
      else
        L8_2 = L2_2
        L7_2 = L2_2.Colour
        L9_2 = GameColour
        L10_2 = teamId1
        L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
        L8_2 = L4_2
        L7_2 = L4_2.Colour
        L9_2 = GameColour
        L10_2 = teamId1
        L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
        L8_2 = L3_2
        L7_2 = L3_2.Colour
        L9_2 = GameColour
        L10_2 = teamId1
        L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
        L8_2 = L2_2
        L7_2 = L2_2.Text
        L9_2 = "^T^DTBSWPC"
        L7_2(L8_2, L9_2)
        L8_2 = L3_2
        L7_2 = L3_2.Text
        L9_2 = "^S^"
        L10_2 = L6_2
        L9_2 = L9_2 .. L10_2
        L7_2(L8_2, L9_2)
        L8_2 = L4_2
        L7_2 = L4_2.Text
        L9_2 = "^T^DTBSWPD"
        L7_2(L8_2, L9_2)
      end
      L7_2 = IsServer
      L7_2 = L7_2()
      if L7_2 then
        L7_2 = 0
        while L7_2 < 200 do
          L8_2 = DisablePlayer
          L9_2 = true
          L8_2(L9_2)
          L8_2 = ClearMessages
          L8_2()
          L8_2 = Wait
          L9_2 = 1
          L8_2(L9_2)
          L7_2 = L7_2 + 1
        end
        L9_2 = A0_2
        L8_2 = A0_2.DoSendEvent
        L10_2 = MSG_START_NEXT_ROUND
        L11_2 = 0
        L12_2 = 0
        L13_2 = 0
        L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
        goto lbl_218
        goto lbl_214
        repeat
          L7_2 = print
          L8_2 = "Waiting for server to signal start of round"
          L7_2(L8_2)
          L7_2 = Wait
          L8_2 = 5
          L7_2(L8_2)
          ::lbl_214::
          L7_2 = A0_2.startNextRound
          L8_2 = false
        until L7_2 ~= L8_2
      end
      ::lbl_218::
      L8_2 = L2_2
      L7_2 = L2_2.Remove
      L7_2(L8_2)
      L8_2 = L4_2
      L7_2 = L4_2.Remove
      L7_2(L8_2)
      L8_2 = L3_2
      L7_2 = L3_2.Remove
      L7_2(L8_2)
      L7_2 = RenderPauseScreenStuffNoBox
      L8_2 = false
      L7_2(L8_2)
      L8_2 = A0_2
      L7_2 = A0_2.ShowHUD
      L9_2 = true
      L7_2(L8_2, L9_2)
      L7_2 = main
      L7_2 = L7_2.scores
      L8_2 = L7_2
      L7_2 = L7_2.Hide
      L9_2 = false
      L7_2(L8_2, L9_2)
    end
    L1_2 = CameraFadeOut
    L2_2 = 3
    L1_2(L2_2)
    L1_2 = RegenerateAllPickups
    L1_2()
    L1_2 = IsServer
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = UsePowerups
      L1_2 = L1_2()
      if L1_2 then
        L1_2 = DoesPowerupExist
        L1_2 = L1_2()
        if L1_2 < 2 then
          L1_2 = print
          L2_2 = "Respawning a power up at change sides"
          L1_2(L2_2)
          L1_2 = PowerUpTimer
          L2_2 = L1_2
          L1_2 = L1_2.CreateAPowerUp
          L1_2(L2_2)
        end
        L1_2 = DoesPowerupExist
        L1_2 = L1_2()
        if L1_2 < 2 then
          L1_2 = print
          L2_2 = "Respawning another power up at change sides"
          L1_2(L2_2)
          L1_2 = PowerUpTimer
          L2_2 = L1_2
          L1_2 = L1_2.CreateAPowerUp
          L1_2(L2_2)
        end
      end
    end
    A0_2.VehiclesLeftThisRound = 4
    L1_2 = DefendingTeam
    L1_2 = L1_2()
    if L1_2 == 1 then
      L1_2 = DefendingTeam
      L2_2 = 2
      L1_2(L2_2)
    else
      L1_2 = DefendingTeam
      L2_2 = 1
      L1_2(L2_2)
    end
    L2_2 = A0_2
    L1_2 = A0_2.UpdateRadar
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 1200
    L1_2(L2_2)
    L1_2 = Player
    L1_2 = L1_2()
    L3_2 = A0_2
    L2_2 = A0_2.GetPlayerRespawnPosition
    L2_2 = L2_2(L3_2)
    L4_2 = L1_2
    L3_2 = L1_2.Respawn
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
    L4_2 = A0_2
    L3_2 = A0_2.SpawnMissionVehicles
    L3_2(L4_2)
    L4_2 = A0_2
    L3_2 = A0_2.SpawnShortcutVehicles
    L5_2 = true
    L6_2 = true
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = A0_2.gameUnderway
    L4_2 = false
    if L3_2 == L4_2 then
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
        L4_2 = 5
        L3_2(L4_2)
        goto lbl_318
        repeat
          L3_2 = Wait
          L4_2 = 5
          L3_2(L4_2)
          ::lbl_318::
          L3_2 = SyncCutScene
          L3_2 = L3_2()
          L4_2 = false
        until L3_2 ~= L4_2
        L3_2 = RunScriptedCutscene
        L3_2()
        L3_2 = Wait
        L4_2 = 0
        L3_2(L4_2)
        goto lbl_332
        repeat
          L3_2 = Wait
          L4_2 = 0
          L3_2(L4_2)
          ::lbl_332::
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
      L3_2 = true
      A0_2.gameUnderway = L3_2
      L4_2 = A0_2
      L3_2 = A0_2.ShowHUD
      L5_2 = true
      L3_2(L4_2, L5_2)
    end
    L3_2 = GenerateAmbients
    L4_2 = true
    L3_2(L4_2)
    L3_2 = RenderHudExtras
    L4_2 = true
    L3_2(L4_2)
    L3_2 = IsServer
    L3_2 = L3_2()
    if L3_2 then
      L3_2 = Wait
      L4_2 = 1000
      L3_2(L4_2)
    end
    L3_2 = GameElapsedMs
    L4_2 = 0
    L3_2(L4_2)
    A0_2.gameseconds = 0
    A0_2.hours = 0
    A0_2.mins = 0
    A0_2.seconds = 0
    L3_2 = UpdateGameTime
    L4_2 = true
    L3_2(L4_2)
    L4_2 = A0_2
    L3_2 = A0_2.DisplayDefenceTimer
    L3_2(L4_2)
    L3_2 = A0_2.RoundsPlayed
    L3_2 = L3_2 + 1
    A0_2.RoundsPlayed = L3_2
    L3_2 = ExtinguishAllFires
    L3_2()
    L4_2 = A0_2
    L3_2 = A0_2.DisplayAttackDefendMessage
    L3_2(L4_2)
    L3_2 = DisablePlayer
    L4_2 = false
    L3_2(L4_2)
  end
end
L0_1.CheckChangeSides = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = print
  L3_2 = "Kick driver out of car"
  L2_2(L3_2)
  L2_2 = KickOutOfCar
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
L0_1 = KickOutOfCar
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
    if not L2_2 then
      break
    end
    L2_2 = IsPlayerDead
    L3_2 = Player
    L3_2, L4_2 = L3_2()
    L2_2 = L2_2(L3_2, L4_2)
  until L2_2
  L2_2 = VehicleSetEmergencyStop
  L3_2 = A0_2.carToKickDriverOutOf
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = true
  A0_2.isDriverKickedOutOfCar = L2_2
end
L0_1.Run = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.TeamId
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2 + 1
  L3_2 = DefendingTeam
  L3_2 = L3_2()
  if L2_2 == L3_2 then
    L3_2 = A0_2
    L2_2 = A0_2.DisplayMessage
    L4_2 = "^t^DTB01"
    L2_2(L3_2, L4_2)
  else
    L3_2 = A0_2
    L2_2 = A0_2.DisplayMessage
    L4_2 = "^t^DTB02"
    L2_2(L3_2, L4_2)
  end
end
L0_1.DisplayAttackDefendMessage = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = Player
  L2_2 = L2_2()
  L4_2 = L2_2
  L3_2 = L2_2.TeamId
  L3_2 = L3_2(L4_2)
  if L3_2 == 1 then
    L3_2 = coreLib
    L4_2 = L3_2
    L3_2 = L3_2.Commentate
    L5_2 = "^S^~b~"
    L6_2 = A1_2
    L5_2 = L5_2 .. L6_2
    L3_2(L4_2, L5_2)
  else
    L3_2 = coreLib
    L4_2 = L3_2
    L3_2 = L3_2.Commentate
    L5_2 = "^S^~r~"
    L6_2 = A1_2
    L5_2 = L5_2 .. L6_2
    L3_2(L4_2, L5_2)
  end
end
L0_1.DisplayMessage = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = {}
  L4_2 = L1_2
  L3_2 = L1_2.TeamId
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 + 1
  L4_2 = DefendingTeam
  L4_2 = L4_2()
  if L3_2 == L4_2 then
    L3_2 = A0_2.InitialSpawn
    L4_2 = true
    if L3_2 == L4_2 then
      L3_2 = false
      A0_2.InitialSpawn = L3_2
      L3_2 = main
      L4_2 = A0_2.DefenceStartPoints
      L3_2.vSpawnPoints = L4_2
      L3_2 = print
      L4_2 = "Doing initial spawn"
      L3_2(L4_2)
      L3_2 = DoSpawn
      L4_2 = InitialSpawnPoint
      L5_2 = PlayerId
      L5_2 = L5_2()
      L4_2 = L4_2(L5_2)
      L5_2 = false
      L3_2 = L3_2(L4_2, L5_2)
      L2_2 = L3_2
    else
      L3_2 = main
      L4_2 = A0_2.DefenceSpawnPoints
      L3_2.vSpawnPoints = L4_2
      L3_2 = DoSpawn
      L4_2 = nil
      L5_2 = false
      L3_2 = L3_2(L4_2, L5_2)
      L2_2 = L3_2
    end
  else
    L3_2 = main
    L4_2 = A0_2.AttackSpawnPoints
    L3_2.vSpawnPoints = L4_2
    L3_2 = A0_2.InitialSpawn
    if L3_2 then
      L3_2 = print
      L4_2 = "Doing initial spawn"
      L3_2(L4_2)
      L3_2 = DoSpawn
      L4_2 = InitialSpawnPoint
      L5_2 = PlayerId
      L5_2 = L5_2()
      L4_2 = L4_2(L5_2)
      L5_2 = false
      L3_2 = L3_2(L4_2, L5_2)
      L2_2 = L3_2
    else
      L3_2 = DoSpawn
      L4_2 = nil
      L5_2 = false
      L3_2 = L3_2(L4_2, L5_2)
      L2_2 = L3_2
    end
  end
  return L2_2
end
L0_1.GetPlayerRespawnPosition = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2.teamscores
  L2_2 = DefendingTeam
  L2_2 = L2_2()
  L4_2 = A0_2
  L3_2 = A0_2.DefenceTimeInMs
  L3_2 = L3_2(L4_2)
  L1_2[L2_2] = L3_2
end
L0_1.UpdateScores = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.teamscores
  L3_2 = A1_2 + 1
  L2_2 = L2_2[L3_2]
  return L2_2
end
L0_1.TeamScore = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.seconds
  L1_2 = L1_2 * 1000
  L2_2 = A0_2.mins
  L2_2 = L2_2 * 60000
  L1_2 = L1_2 + L2_2
  L2_2 = A0_2.hours
  L2_2 = L2_2 * 3600000
  L1_2 = L1_2 + L2_2
  return L1_2
end
L0_1.DefenceTimeInMs = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2
  L1_2 = A0_2.timeRanOut
  return L1_2
end
L0_1.DidWinBecauseTimeRanOut = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.DefenceTimer
  if L2_2 ~= nil then
    L2_2 = A0_2.DefenceTimer
    L3_2 = L2_2
    L2_2 = L2_2.Remove
    L2_2(L3_2)
    A0_2.DefenceTimer = nil
  end
  L2_2 = A0_2.carsLeftText
  if L2_2 ~= nil then
    L2_2 = A0_2.carsLeftText
    L3_2 = L2_2
    L2_2 = L2_2.Remove
    L2_2(L3_2)
    A0_2.carsLeftText = nil
  end
  L2_2 = true
  if A1_2 == L2_2 then
    L2_2 = Player
    L2_2 = L2_2()
    L3_2 = TextSprite
    L5_2 = L2_2
    L4_2 = L2_2.PlayerNum
    L4_2 = L4_2(L5_2)
    L5_2 = 470
    L6_2 = 75
    L7_2 = 2
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.DefenceTimer = L3_2
    L3_2 = A0_2.DefenceTimer
    L4_2 = L3_2
    L3_2 = L3_2.Scale
    L5_2 = 0.8878
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.DefenceTimer
    L4_2 = L3_2
    L3_2 = L3_2.Style
    L5_2 = 1
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.DefenceTimer
    L4_2 = L3_2
    L3_2 = L3_2.Colour
    L5_2 = 255
    L6_2 = 255
    L7_2 = 255
    L8_2 = 255
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L3_2 = A0_2.DefenceTimer
    L4_2 = L3_2
    L3_2 = L3_2.Text
    L5_2 = "^S^    "
    L3_2(L4_2, L5_2)
    L3_2 = TextSprite
    L5_2 = L2_2
    L4_2 = L2_2.PlayerNum
    L4_2 = L4_2(L5_2)
    L5_2 = 470
    L6_2 = 98
    L7_2 = 2
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.carsLeftText = L3_2
    L3_2 = A0_2.carsLeftText
    L4_2 = L3_2
    L3_2 = L3_2.Scale
    L5_2 = 0.8878
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.carsLeftText
    L4_2 = L3_2
    L3_2 = L3_2.Style
    L5_2 = 1
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.carsLeftText
    L4_2 = L3_2
    L3_2 = L3_2.Text
    L5_2 = "^S^    "
    L3_2(L4_2, L5_2)
  end
end
L0_1.ShowHUD = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = A2_2
  L4_2 = A2_2.Name
  L4_2 = L4_2(L5_2)
  L6_2 = A1_2
  L5_2 = A1_2.Name
  L5_2 = L5_2(L6_2)
  if A1_2 == A2_2 then
    L6_2 = coreLib
    L7_2 = L6_2
    L6_2 = L6_2.Commentate
    L8_2 = "^S^"
    L9_2 = L5_2
    L10_2 = "^S^ ^T^MPKSELF"
    L8_2 = L8_2 .. L9_2 .. L10_2
    L6_2(L7_2, L8_2)
  elseif A3_2 then
    L6_2 = coreLib
    L7_2 = L6_2
    L6_2 = L6_2.Commentate
    L8_2 = "^S^"
    L9_2 = L4_2
    L10_2 = "^S^ ^T^MPK^S^ "
    L11_2 = L5_2
    L12_2 = "^S^ ^T^MPKHEAD"
    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
    L6_2(L7_2, L8_2)
    L6_2 = A0_2.headshots
    L6_2 = L6_2 + 1
    A0_2.headshots = L6_2
  else
    L6_2 = coreLib
    L7_2 = L6_2
    L6_2 = L6_2.Commentate
    L8_2 = "^S^"
    L9_2 = L4_2
    L10_2 = "^S^ ^T^MPK^S^ "
    L11_2 = L5_2
    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
    L6_2(L7_2, L8_2)
  end
end
L0_1.RegisterPlayerKill = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L5_2 = print
  L6_2 = "Sending event "
  L7_2 = A1_2
  L8_2 = " "
  L9_2 = A2_2
  L10_2 = " "
  L11_2 = A3_2
  L12_2 = " "
  L13_2 = A4_2
  L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
  L5_2(L6_2)
  L5_2 = MaskEventNumber
  L6_2 = A1_2
  L7_2 = DTBEVENTMASK_NONE
  L8_2 = DTBEVENTSHIFT_TYPE
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = MaskEventNumber
  L7_2 = A2_2
  L8_2 = DTBEVENTMASK_NONE
  L9_2 = DTBEVENTSHIFT_PARAM1
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2 + L6_2
  L6_2 = MaskEventNumber
  L7_2 = A3_2
  L8_2 = DTBEVENTMASK_NONE
  L9_2 = DTBEVENTSHIFT_PARAM2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2 + L6_2
  L6_2 = MaskEventNumber
  L7_2 = A4_2
  L8_2 = DTBEVENTMASK_NONE
  L9_2 = DTBEVENTSHIFT_PARAM3
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2 + L6_2
  L6_2 = SendEvent
  L7_2 = L5_2
  L6_2(L7_2)
end
L0_1.DoSendEvent = L1_1
L0_1 = MessagePump
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "MESAGE PUMP CLEANUP"
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = MessagePump
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  while 1 do
    L1_2 = Wait
    L2_2 = 10
    L1_2(L2_2)
    L1_2 = IsEventStackEmpty
    L1_2 = L1_2()
    L2_2 = false
    if L1_2 == L2_2 then
      L1_2 = Player
      L1_2 = L1_2()
      L2_2 = GetEvent
      L2_2 = L2_2()
      L3_2 = MaskEventNumber
      L4_2 = L2_2
      L5_2 = DTBEVENTMASK_TYPE
      L6_2 = DTBEVENTSHIFT_TYPE
      L6_2 = -L6_2
      L3_2 = L3_2(L4_2, L5_2, L6_2)
      L4_2 = MaskEventNumber
      L5_2 = L2_2
      L6_2 = DTBEVENTMASK_PARAM1
      L7_2 = DTBEVENTSHIFT_PARAM1
      L7_2 = -L7_2
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L5_2 = MaskEventNumber
      L6_2 = L2_2
      L7_2 = DTBEVENTMASK_PARAM2
      L8_2 = DTBEVENTSHIFT_PARAM2
      L8_2 = -L8_2
      L5_2 = L5_2(L6_2, L7_2, L8_2)
      L6_2 = MaskEventNumber
      L7_2 = L2_2
      L8_2 = DTBEVENTMASK_PARAM3
      L9_2 = DTBEVENTSHIFT_PARAM3
      L9_2 = -L9_2
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L7_2 = MSG_SWAP_TEAM
      if L3_2 == L7_2 then
        L7_2 = print
        L8_2 = "MSG_SWAP_TEAM"
        L7_2(L8_2)
        L7_2 = main
        L7_2 = L7_2.game
        L7_2.hours = L4_2
        L7_2 = main
        L7_2 = L7_2.game
        L7_2.mins = L5_2
        L7_2 = main
        L7_2 = L7_2.game
        L7_2.seconds = L6_2
        L7_2 = print
        L8_2 = "Time To Beat = "
        L9_2 = main
        L9_2 = L9_2.game
        L9_2 = L9_2.TimeToBeat
        L8_2 = L8_2 .. L9_2
        L7_2(L8_2)
        L7_2 = print
        L8_2 = "Final Time : Hours =="
        L9_2 = L4_2
        L10_2 = " Mins == "
        L11_2 = L5_2
        L12_2 = " Seconds == "
        L13_2 = L6_2
        L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
        L7_2(L8_2)
        L7_2 = main
        L7_2 = L7_2.game
        L8_2 = true
        L7_2.ChangeSides = L8_2
      else
        L7_2 = MSG_TIMEUPDATE
        if L3_2 == L7_2 then
          L7_2 = main
          L7_2 = L7_2.game
          L7_2 = L7_2.ChangeSides
          L8_2 = false
          if L7_2 == L8_2 then
            L7_2 = main
            L7_2 = L7_2.game
            L7_2.hours = L4_2
            L7_2 = main
            L7_2 = L7_2.game
            L7_2.mins = L5_2
            L7_2 = main
            L7_2 = L7_2.game
            L7_2.seconds = L6_2
            L7_2 = main
            L7_2 = L7_2.game
            L8_2 = L7_2
            L7_2 = L7_2.DisplayDefenceTimer
            L7_2(L8_2)
          end
        else
          L7_2 = MSG_END_GAME
          if L3_2 == L7_2 then
            L7_2 = print
            L8_2 = "MSG_END_GAME"
            L7_2(L8_2)
            L7_2 = main
            L7_2 = L7_2.game
            L7_2.winningTeam = L5_2
            L7_2 = print
            L8_2 = "Time To Beat = "
            L9_2 = main
            L9_2 = L9_2.game
            L9_2 = L9_2.TimeToBeat
            L8_2 = L8_2 .. L9_2
            L7_2(L8_2)
            L7_2 = print
            L8_2 = "Current Defence Time = "
            L9_2 = main
            L9_2 = L9_2.game
            L10_2 = L9_2
            L9_2 = L9_2.DefenceTimeInMs
            L9_2 = L9_2(L10_2)
            L8_2 = L8_2 .. L9_2
            L7_2(L8_2)
            L7_2 = coreLib
            L8_2 = L7_2
            L7_2 = L7_2.ToggleEndOfGame
            L9_2 = true
            L7_2(L8_2, L9_2)
            L7_2 = main
            L7_2 = L7_2.game
            L8_2 = L7_2
            L7_2 = L7_2.DisplayDefenceTimer
            L7_2(L8_2)
            if L6_2 == 0 then
              L7_2 = print
              L8_2 = "Time Did Not Run Out"
              L7_2(L8_2)
              L7_2 = main
              L7_2 = L7_2.game
              L8_2 = false
              L7_2.timeRanOut = L8_2
            else
              L7_2 = print
              L8_2 = "Time Ran Out"
              L7_2(L8_2)
              L7_2 = main
              L7_2 = L7_2.game
              L8_2 = true
              L7_2.timeRanOut = L8_2
            end
          else
            L7_2 = MSG_CAR_LOST
            if L3_2 == L7_2 then
              L7_2 = print
              L8_2 = "MSG_CAR_LOST"
              L7_2(L8_2)
              L8_2 = L1_2
              L7_2 = L1_2.TeamId
              L7_2 = L7_2(L8_2)
              L7_2 = L7_2 + 1
              L8_2 = DefendingTeam
              L8_2 = L8_2()
              if L7_2 == L8_2 then
                L7_2 = main
                L7_2 = L7_2.game
                L8_2 = L7_2
                L7_2 = L7_2.DisplayMessage
                L9_2 = "^t^DTB03"
                L7_2(L8_2, L9_2)
              else
                L7_2 = main
                L7_2 = L7_2.game
                L8_2 = L7_2
                L7_2 = L7_2.DisplayMessage
                L9_2 = "^t^DTB04"
                L7_2(L8_2, L9_2)
              end
              L7_2 = main
              L7_2 = L7_2.game
              L8_2 = L7_2
              L7_2 = L7_2.DisplayDefenceTimer
              L7_2(L8_2)
            else
              L7_2 = MSG_NUM_CARS
              if L3_2 == L7_2 then
                L7_2 = IsServer
                L7_2 = L7_2()
                L8_2 = false
                if L7_2 == L8_2 then
                  L7_2 = main
                  L7_2 = L7_2.game
                  L7_2.VehiclesLeftThisRound = L5_2
                end
              else
                L7_2 = MSG_START_NEXT_ROUND
                if L3_2 == L7_2 then
                  L7_2 = print
                  L8_2 = "MSG_START_NEXT_ROUND"
                  L7_2(L8_2)
                  L7_2 = main
                  L7_2 = L7_2.game
                  L8_2 = true
                  L7_2.startNextRound = L8_2
                end
              end
            end
          end
        end
      end
    end
  end
end
L0_1.Run = L1_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = print
  L1_2 = "lua Main()"
  L0_2(L1_2)
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
  L1_2 = print
  L2_2 = "lua CreatePlayer()"
  L1_2(L2_2)
  L1_2 = CreatePlayer
  L2_2 = unpack
  L3_2 = main
  L3_2 = L3_2.vSpawnPoints
  L3_2 = L3_2[L0_2]
  L3_2 = L3_2[1]
  L2_2, L3_2, L4_2 = L2_2(L3_2)
  L1_2(L2_2, L3_2, L4_2)
  goto lbl_50
  repeat
    L1_2 = Wait
    L2_2 = 10
    L1_2(L2_2)
    ::lbl_50::
    L1_2 = IsPlayerCreationQueued
    L1_2 = L1_2()
  until not L1_2
  L1_2 = PlayerName
  L2_2 = HostName
  L2_2, L3_2, L4_2 = L2_2()
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = main
  L2_2 = DTB
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
