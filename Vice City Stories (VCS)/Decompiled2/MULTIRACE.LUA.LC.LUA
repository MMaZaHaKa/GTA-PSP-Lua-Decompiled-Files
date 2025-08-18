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
L1_1 = "Pickups"
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
Turismo = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
RaceMessagePump = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
MessageDisplay = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
RaceKickOutOfCar = L0_1
L0_1 = Script
L1_1 = {}
L2_1 = {}
L3_1 = "thisplayer"
L2_1[1] = L3_1
L1_1._init = L2_1
L0_1 = L0_1(L1_1)
MultiRaceClient = L0_1
L0_1 = 1
MSG_GOOD_RACE_POWERUP = L0_1
L0_1 = 2
MSG_BAD_RACE_POWERUP = L0_1
L0_1 = 3
MSG_RACE_CHECKPOINT_HIT = L0_1
L0_1 = 4
MSG_RACE_OVER = L0_1
L0_1 = 5
MSG_GRID_SHUFFLE = L0_1
L0_1 = 12
MSG_LAP_COMPLETED = L0_1
L0_1 = 13
MSG_RACE_POSITION_CHANGED = L0_1
L0_1 = 14
MSG_RACE_START = L0_1
L0_1 = 15
MSG_REQUEST_RESPAWN = L0_1
L0_1 = 16
MSG_RESPAWN_OK = L0_1
L0_1 = 17
MSG_RESPAWN_DONE = L0_1
L0_1 = 2500
POSITION_HEART_BEAT_FREQUENCY = L0_1
L0_1 = 20500
RESPOT_TIME = L0_1
L0_1 = RaceMessagePump
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  while 1 do
    L1_2 = Wait
    L2_2 = 10
    L1_2(L2_2)
    L1_2 = IsEventStackEmpty
    L1_2 = L1_2()
    L2_2 = false
    if L1_2 == L2_2 then
      L1_2 = GetEvent
      L1_2 = L1_2()
      L2_2 = MaskEventNumber
      L3_2 = L1_2
      L4_2 = 63
      L5_2 = 0
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      L3_2 = MaskEventNumber
      L4_2 = L1_2
      L5_2 = 448
      L6_2 = -6
      L3_2 = L3_2(L4_2, L5_2, L6_2)
      L4_2 = MaskEventNumber
      L5_2 = L1_2
      L6_2 = 130560
      L7_2 = -9
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L5_2 = MSG_RACE_CHECKPOINT_HIT
      if L2_2 == L5_2 then
        L5_2 = main
        L5_2 = L5_2.game
        L6_2 = L5_2
        L5_2 = L5_2.IncrementCheckpointsCompleted
        L7_2 = L3_2
        L5_2(L6_2, L7_2)
        L5_2 = PlayerId
        L5_2 = L5_2()
        if L3_2 == L5_2 then
          L5_2 = print
          L6_2 = "SERVER TELLS ME IVE HIT CHECKPOINT "
          L7_2 = L4_2
          L6_2 = L6_2 .. L7_2
          L5_2(L6_2)
          L5_2 = main
          L5_2 = L5_2.game
          L5_2.myLastWaypoint = L4_2
          L5_2 = main
          L5_2 = L5_2.game
          L6_2 = L5_2
          L5_2 = L5_2.UpdateWaypointBlips
          L5_2(L6_2)
        end
      else
        L5_2 = MSG_RACE_POSITION_CHANGED
        if L2_2 == L5_2 then
          if L3_2 == nil then
            return
          end
          L5_2 = main
          L5_2 = L5_2.game
          L5_2 = L5_2.allRacePositions
          L6_2 = L3_2 + 1
          L5_2[L6_2] = L4_2
          L5_2 = ToggleLocalPlayerControls
          L6_2 = true
          L5_2(L6_2)
          L5_2 = PlayerId
          L5_2 = L5_2()
          if L3_2 == L5_2 then
            L5_2 = main
            L5_2 = L5_2.game
            L5_2.currentRacePosition = L4_2
          end
        else
          L5_2 = MSG_LAP_COMPLETED
          if L2_2 == L5_2 then
            L5_2 = main
            L5_2 = L5_2.game
            L6_2 = L5_2
            L5_2 = L5_2.IncrementCurrentLapNumber
            L7_2 = L3_2
            L5_2(L6_2, L7_2)
            L5_2 = PlayerId
            L5_2 = L5_2()
            if L3_2 == L5_2 then
              L5_2 = print
              L6_2 = "Processing Lap Completed Msg"
              L5_2(L6_2)
              L5_2 = main
              L5_2 = L5_2.game
              L6_2 = main
              L6_2 = L6_2.game
              L6_2 = L6_2.lapNumber
              L6_2 = L6_2 + 1
              L5_2.lapNumber = L6_2
              L5_2 = main
              L5_2 = L5_2.game
              L5_2 = L5_2.lapNumber
              L6_2 = GameScoreLimit
              L6_2 = L6_2()
              if L5_2 > L6_2 then
                L5_2 = main
                L5_2 = L5_2.game
                L6_2 = GameScoreLimit
                L6_2 = L6_2()
                L5_2.lapNumber = L6_2
              end
            end
          else
            L5_2 = MSG_RACE_OVER
            if L2_2 == L5_2 then
              L5_2 = print
              L6_2 = "RACE OVER TIME TO CLOSE DOWN"
              L5_2(L6_2)
              L5_2 = main
              L5_2 = L5_2.game
              L5_2.raceWinner = L3_2
              L5_2 = main
              L5_2 = L5_2.game
              L6_2 = true
              L5_2.raceOver = L6_2
            else
              L5_2 = MSG_GRID_SHUFFLE
              if L2_2 == L5_2 then
                L5_2 = print
                L6_2 = "MSG_GRID_SHUFFLE : "
                L7_2 = L4_2
                L6_2 = L6_2 .. L7_2
                L5_2(L6_2)
                L5_2 = main
                L5_2 = L5_2.game
                L6_2 = L5_2
                L5_2 = L5_2.SetGridShuffle
                L7_2 = L4_2
                L5_2(L6_2, L7_2)
              else
                L5_2 = MSG_RACE_START
                if L2_2 == L5_2 then
                  L5_2 = print
                  L6_2 = "MSG_RACE_START"
                  L5_2(L6_2)
                  L5_2 = main
                  L5_2 = L5_2.game
                  L6_2 = true
                  L5_2.raceStarted = L6_2
                  L5_2 = main
                  L5_2 = L5_2.game
                  L6_2 = L5_2
                  L5_2 = L5_2.ShowHUD
                  L7_2 = true
                  L5_2(L6_2, L7_2)
                  L5_2 = GameElapsedMs
                  L6_2 = 0
                  L5_2(L6_2)
                  L5_2 = GenerateAmbients
                  L6_2 = true
                  L5_2(L6_2)
                  L5_2 = VehicleSetEmergencyStop
                  L6_2 = GetLocalPlayersVehicle
                  L6_2 = L6_2()
                  L7_2 = false
                  L5_2(L6_2, L7_2)
                else
                  L5_2 = MSG_REQUEST_RESPAWN
                  if L2_2 == L5_2 then
                    L5_2 = IsServer
                    L5_2 = L5_2()
                    if L5_2 then
                      L5_2 = GameElapsedMs
                      L5_2 = L5_2()
                      L6_2 = main
                      L6_2 = L6_2.game
                      L6_2 = L6_2.lastRespawnTime
                      L5_2 = L5_2 - L6_2
                      L6_2 = print
                      L7_2 = "timeSinceLastRespawn == "
                      L8_2 = L5_2
                      L7_2 = L7_2 .. L8_2
                      L6_2(L7_2)
                      L6_2 = main
                      L6_2 = L6_2.game
                      L6_2 = L6_2.blockRespawn
                      L7_2 = false
                      if L6_2 == L7_2 or 4000 < L5_2 then
                        L6_2 = main
                        L6_2 = L6_2.game
                        L7_2 = true
                        L6_2.blockRespawn = L7_2
                        L6_2 = main
                        L6_2 = L6_2.game
                        L7_2 = L6_2
                        L6_2 = L6_2.SendOkToRespawnMessage
                        L8_2 = L3_2
                        L6_2(L7_2, L8_2)
                        L6_2 = main
                        L6_2 = L6_2.game
                        L7_2 = GameElapsedMs
                        L7_2 = L7_2()
                        L6_2.lastRespawnTime = L7_2
                      end
                    end
                  else
                    L5_2 = MSG_RESPAWN_DONE
                    if L2_2 == L5_2 then
                      L5_2 = IsServer
                      L5_2 = L5_2()
                      if L5_2 then
                        L5_2 = main
                        L5_2 = L5_2.game
                        L6_2 = false
                        L5_2.blockRespawn = L6_2
                      end
                    else
                      L5_2 = MSG_RESPAWN_OK
                      if L2_2 == L5_2 then
                        L5_2 = PlayerId
                        L5_2 = L5_2()
                        if L3_2 == L5_2 then
                          L5_2 = main
                          L5_2 = L5_2.game
                          L6_2 = true
                          L5_2.canRespawn = L6_2
                        end
                      else
                        L5_2 = print
                        L6_2 = "UNKNOWN MESSAGE IN EVENT STACK!"
                        L5_2(L6_2)
                        L5_2 = print
                        L6_2 = "FULL = "
                        L7_2 = L1_2
                        L8_2 = " X"
                        L6_2 = L6_2 .. L7_2 .. L8_2
                        L5_2(L6_2)
                        L5_2 = print
                        L6_2 = "TYPE = "
                        L7_2 = L2_2
                        L8_2 = " X"
                        L6_2 = L6_2 .. L7_2 .. L8_2
                        L5_2(L6_2)
                        L5_2 = print
                        L6_2 = "OWNER = "
                        L7_2 = L3_2
                        L8_2 = " X"
                        L6_2 = L6_2 .. L7_2 .. L8_2
                        L5_2(L6_2)
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
  L1_2 = print
  L2_2 = "ELVIS HAS LEFT THE MESSAGE PUMP!"
  L1_2(L2_2)
end
L0_1.Run = L1_1
L0_1 = RaceMessagePump
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "MESAGE PUMP CLEANUP"
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
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
  L1_2 = {}
  A0_2.clientThread = L1_2
  L1_2 = false
  A0_2.canRespawn = L1_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = false
    A0_2.blockRespawn = L1_2
    A0_2.lastRespawnTime = 0
  end
  L1_2 = {}
  A0_2.track = L1_2
  A0_2.currentLegVehicle = 1
  A0_2.gridShuffle = nil
  L1_2 = Player
  L1_2 = L1_2()
  A0_2.carToKickDriverOutOf = nil
  L2_2 = true
  A0_2.isDriverKickedOutofCar = L2_2
  L2_2 = PlayerId
  L2_2 = L2_2()
  L2_2 = L2_2 + 1
  A0_2.currentRacePosition = L2_2
  L2_2 = {}
  A0_2.allCheckPointsCompleted = L2_2
  L2_2 = A0_2.allCheckPointsCompleted
  L2_2[1] = 0
  L2_2 = A0_2.allCheckPointsCompleted
  L2_2[2] = 0
  L2_2 = A0_2.allCheckPointsCompleted
  L2_2[3] = 0
  L2_2 = A0_2.allCheckPointsCompleted
  L2_2[4] = 0
  L2_2 = A0_2.allCheckPointsCompleted
  L2_2[5] = 0
  L2_2 = A0_2.allCheckPointsCompleted
  L2_2[6] = 0
  L2_2 = A0_2.allCheckPointsCompleted
  L2_2[7] = 0
  L2_2 = A0_2.allCheckPointsCompleted
  L2_2[8] = 0
  L2_2 = {}
  A0_2.allCurrentLap = L2_2
  L2_2 = A0_2.allCurrentLap
  L2_2[1] = 1
  L2_2 = A0_2.allCurrentLap
  L2_2[2] = 1
  L2_2 = A0_2.allCurrentLap
  L2_2[3] = 1
  L2_2 = A0_2.allCurrentLap
  L2_2[4] = 1
  L2_2 = A0_2.allCurrentLap
  L2_2[5] = 1
  L2_2 = A0_2.allCurrentLap
  L2_2[6] = 1
  L2_2 = A0_2.allCurrentLap
  L2_2[7] = 1
  L2_2 = A0_2.allCurrentLap
  L2_2[8] = 1
  L2_2 = {}
  A0_2.allRacePositions = L2_2
  L2_2 = A0_2.allRacePositions
  L2_2[1] = 1
  L2_2 = A0_2.allRacePositions
  L2_2[2] = 2
  L2_2 = A0_2.allRacePositions
  L2_2[3] = 3
  L2_2 = A0_2.allRacePositions
  L2_2[4] = 4
  L2_2 = A0_2.allRacePositions
  L2_2[5] = 5
  L2_2 = A0_2.allRacePositions
  L2_2[6] = 6
  L2_2 = A0_2.allRacePositions
  L2_2[7] = 7
  L2_2 = A0_2.allRacePositions
  L2_2[8] = 8
  L2_2 = IsIronManRace
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = {}
    A0_2.myLegVehicles = L2_2
  end
  L2_2 = {}
  A0_2.rankhud = L2_2
  L2_2 = GameElapsedMs
  L2_2 = L2_2()
  A0_2.currentRankHeartBeat = L2_2
  L2_2 = SetMaxAmbientCars
  L3_2 = 1
  L2_2(L3_2)
  L2_2 = false
  A0_2.trafficNormal = L2_2
  L2_2 = UseSuperBrakeOnPause
  L3_2 = false
  L2_2(L3_2)
  L2_2 = ScriptControlsMpCarLimit
  L3_2 = true
  L2_2(L3_2)
  L2_2 = false
  A0_2.raceStarted = L2_2
  L2_2 = false
  A0_2.raceOver = L2_2
  L3_2 = A0_2
  L2_2 = A0_2.InitTrack
  L2_2(L3_2)
  A0_2.myLastWaypoint = 1
  L2_2 = PickupMgr
  L2_2 = L2_2()
  A0_2.mypickups = L2_2
  L2_2 = A0_2.mypickups
  L3_2 = L2_2
  L2_2 = L2_2.CreatePickups
  L2_2(L3_2)
  L2_2 = {}
  A0_2.scores = L2_2
  L2_2 = IsServer
  L2_2 = L2_2()
  if L2_2 then
    L3_2 = A0_2
    L2_2 = A0_2.ToggleRoadsAtStartLine
    L4_2 = true
    L2_2(L3_2, L4_2)
  end
  A0_2.respotCounter = 0
  A0_2.respotLastUpdate = 0
  A0_2.respotText = nil
  A0_2.numPlayersFinished = 0
  L2_2 = GameElapsedMs
  L3_2 = 0
  L2_2(L3_2)
  L2_2 = UpdateGameTime
  L3_2 = true
  L2_2(L3_2)
  A0_2.lapNumber = 1
  A0_2.blip = nil
  A0_2.nextblip = nil
  L3_2 = A0_2
  L2_2 = A0_2.UpdateWaypointBlips
  L2_2(L3_2)
  L2_2 = false
  A0_2.SplashTextIsOnScreen = L2_2
  A0_2.currentLapSprite = nil
  A0_2.poshud = nil
  A0_2.lapTitle = nil
  L2_2 = RaceMessagePump
  L2_2 = L2_2()
  A0_2.myMessagePump = L2_2
  L2_2 = A0_2.myMessagePump
  L3_2 = L2_2
  L2_2 = L2_2.Start
  L2_2(L3_2)
  A0_2.raceWinner = -1
  goto lbl_165
  repeat
    L2_2 = print
    L3_2 = "waiting for grid shuffle msg"
    L2_2(L3_2)
    L2_2 = Wait
    L3_2 = 5
    L2_2(L3_2)
    ::lbl_165::
    L2_2 = A0_2.gridShuffle
  until L2_2 ~= nil
  L3_2 = A0_2
  L2_2 = A0_2.CreatePlayerinCarAtTrackNode
  L4_2 = 1
  L5_2 = true
  L2_2(L3_2, L4_2, L5_2)
  L2_2 = SetVectorForSinglePlayerScript
  L3_2 = A0_2.track
  L3_2 = L3_2[1]
  L3_2 = L3_2[1]
  L2_2(L3_2)
  L2_2 = RaceArrowVisible
  L3_2 = false
  L2_2(L3_2)
  L2_2 = "StateRunning"
  return L2_2
end
L0_1.StateInit = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.StartTheRace
    L1_2(L2_2)
  else
    L2_2 = A0_2
    L1_2 = A0_2.CheckForRespawn
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.CheckForRespot
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.DrawHUD
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.SetTrafficNormal
    L1_2(L2_2)
    L1_2 = IsIronManRace
    L1_2 = L1_2()
    if L1_2 then
      L2_2 = A0_2
      L1_2 = A0_2.UpdateIronManRace
      L1_2(L2_2)
    end
  end
  L1_2 = A0_2.raceWinner
  if L1_2 ~= -1 then
    L2_2 = A0_2
    L1_2 = A0_2.DisplayWinnerMsg
    L3_2 = A0_2.raceWinner
    L1_2(L2_2, L3_2)
  end
  L1_2 = Wait
  L2_2 = 50
  L1_2(L2_2)
  L1_2 = collectgarbage
  L1_2()
end
L0_1.StateRunning = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = print
  L2_2 = "turismo cleanup"
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.ShowHUD
  L3_2 = false
  L1_2(L2_2, L3_2)
  L1_2 = collectgarbage
  L1_2()
  L1_2 = A0_2.myMessagePump
  L2_2 = L1_2
  L1_2 = L1_2.Stop
  L1_2(L2_2)
  L1_2 = RestoreCamera
  L2_2 = 0
  L3_2 = newplayer
  L1_2(L2_2, L3_2)
  L1_2 = A0_2.mypickups
  L2_2 = L1_2
  L1_2 = L1_2.CleanUp
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  L3_2 = print
  L4_2 = "CreatePlayerinCarAtTrackNode"
  L3_2(L4_2)
  L3_2 = A0_2.track
  L4_2 = A2_2
  L5_2 = IsIronManRace
  L5_2 = L5_2()
  if L5_2 then
    L5_2 = A0_2.numWPLeg1
    L6_2 = A0_2.numWPLeg2
    L5_2 = L5_2 + L6_2
    L6_2 = A0_2.numWPLeg3
    L5_2 = L5_2 + L6_2
    if A1_2 == L5_2 then
      A1_2 = A1_2 + 1
    else
      L5_2 = A0_2.numWPLeg1
      L6_2 = A0_2.numWPLeg2
      L5_2 = L5_2 + L6_2
      if A1_2 == L5_2 then
        A1_2 = A1_2 + 1
      else
        L5_2 = A0_2.numWPLeg1
        if A1_2 == L5_2 then
          A1_2 = A1_2 + 1
        end
      end
    end
  end
  L5_2 = A1_2
  L6_2 = A1_2 + 1
  L7_2 = table
  L7_2 = L7_2.getn
  L8_2 = L3_2
  L7_2 = L7_2(L8_2)
  if L6_2 > L7_2 then
    L7_2 = table
    L7_2 = L7_2.getn
    L8_2 = L3_2
    L7_2 = L7_2(L8_2)
    L6_2 = L6_2 - L7_2
  end
  if L5_2 == nil then
    L5_2 = 1
  end
  if L6_2 == nil then
    L6_2 = 2
  end
  L7_2 = nil
  L8_2 = nil
  L9_2 = RaceCar
  L9_2 = L9_2()
  L10_2 = 15
  L11_2 = IsIronManRace
  L11_2 = L11_2()
  if L11_2 then
    L12_2 = A0_2
    L11_2 = A0_2.GetIronmanModelId
    L13_2 = L5_2
    L11_2 = L11_2(L12_2, L13_2)
    L9_2 = L11_2
    L12_2 = A0_2
    L11_2 = A0_2.GetIronManWaterZ
    L13_2 = L5_2
    L11_2 = L11_2(L12_2, L13_2)
    L10_2 = L11_2
  end
  L11_2 = {}
  L12_2 = {}
  L13_2 = IsIronManRace
  L13_2 = L13_2()
  if L13_2 and L4_2 then
    L13_2 = A0_2.myLegVehicles
    L13_2 = L13_2[1]
    L13_2 = L13_2[2]
    L13_2 = L13_2[1]
    L11_2[1] = L13_2
    L13_2 = A0_2.myLegVehicles
    L13_2 = L13_2[1]
    L13_2 = L13_2[2]
    L13_2 = L13_2[2]
    L11_2[2] = L13_2
    L13_2 = A0_2.myLegVehicles
    L13_2 = L13_2[1]
    L13_2 = L13_2[2]
    L13_2 = L13_2[3]
    L11_2[3] = L13_2
    L13_2 = L11_2[1]
    if L13_2 == nil then
      L13_2 = print
      L14_2 = "startPos[1] is nil!!!"
      L13_2(L14_2)
    end
    L13_2 = L11_2[2]
    if L13_2 == nil then
      L13_2 = print
      L14_2 = "startPos[2] is nil!!!"
      L13_2(L14_2)
    end
    L13_2 = L11_2[3]
    if L13_2 == nil then
      L13_2 = print
      L14_2 = "startPos[3] is nil!!!"
      L13_2(L14_2)
    end
    L13_2 = A0_2.myLegVehicles
    L13_2 = L13_2[1]
    L7_2 = L13_2[3]
    L13_2 = print
    L14_2 = "start heading for leg 1 vehicle is "
    L15_2 = L7_2
    L14_2 = L14_2 .. L15_2
    L13_2(L14_2)
    L13_2 = CreateVehicle
    L14_2 = L9_2
    L15_2 = L11_2
    L16_2 = L7_2
    L17_2 = nil
    L18_2 = nil
    L19_2 = true
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    L8_2 = L13_2
    L13_2 = A0_2.myLegVehicles
    L13_2 = L13_2[1]
    L13_2[1] = L8_2
    L13_2 = VehicleSetColours
    L14_2 = L8_2
    L15_2 = MapPlayerColourToCarColour
    L16_2 = PlayerId
    L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L16_2()
    L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
    L16_2 = MapPlayerColourToCarColour
    L17_2 = PlayerId
    L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2()
    L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
    L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
    L13_2 = Player
    L13_2 = L13_2()
    L15_2 = L13_2
    L14_2 = L13_2.Respawn
    L16_2 = L11_2
    L14_2(L15_2, L16_2)
    L14_2 = Wait
    L15_2 = 1
    L14_2(L15_2)
    L14_2 = SetPosition
    L15_2 = Player
    L16_2 = PlayerId
    L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L16_2()
    L15_2 = L15_2(L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
    L16_2 = L11_2
    L14_2(L15_2, L16_2)
    L14_2 = Wait
    L15_2 = 1
    L14_2(L15_2)
    L14_2 = WarpPlayerIntoCar
    L15_2 = PlayerId
    L15_2 = L15_2()
    L16_2 = L8_2
    L14_2(L15_2, L16_2)
    L14_2 = Wait
    L15_2 = 10
    L14_2(L15_2)
    L14_2 = VehicleSetEmergencyStop
    L15_2 = GetLocalPlayersVehicle
    L15_2 = L15_2()
    L16_2 = true
    L14_2(L15_2, L16_2)
  else
    if L4_2 then
      L13_2 = {}
      L14_2 = L3_2[L5_2]
      L14_2 = L14_2[1]
      L14_2 = L14_2[1]
      L15_2 = L3_2[L6_2]
      L15_2 = L15_2[1]
      L15_2 = L15_2[1]
      L14_2 = L14_2 - L15_2
      L13_2[1] = L14_2
      L14_2 = L3_2[L5_2]
      L14_2 = L14_2[1]
      L14_2 = L14_2[2]
      L15_2 = L3_2[L6_2]
      L15_2 = L15_2[1]
      L15_2 = L15_2[2]
      L14_2 = L14_2 - L15_2
      L13_2[2] = L14_2
      L13_2[3] = 0
      L14_2 = VecNormalise
      L15_2 = L13_2
      L14_2 = L14_2(L15_2)
      L13_2 = L14_2
      L14_2 = {}
      L15_2 = 0
      L16_2 = 0
      L17_2 = 1
      L14_2[1] = L15_2
      L14_2[2] = L16_2
      L14_2[3] = L17_2
      L15_2 = CrossProduct
      L16_2 = L13_2
      L17_2 = L14_2
      L15_2 = L15_2(L16_2, L17_2)
      L16_2 = {}
      L17_2 = A0_2.currentRacePosition
      L17_2 = L17_2 - 1
      L18_2 = print
      L19_2 = "Grid Slot == "
      L20_2 = L17_2
      L19_2 = L19_2 .. L20_2
      L18_2(L19_2)
      L18_2 = 0
      L19_2 = 0
      L18_2 = 20
      while 1 < L17_2 do
        L17_2 = L17_2 - 2
        L18_2 = L18_2 + 8
      end
      if L17_2 <= 0 then
        L19_2 = -2.5
      else
        L19_2 = 2.5
      end
      L20_2 = Wait
      L21_2 = 2000
      L20_2(L21_2)
      L20_2 = L3_2[L5_2]
      L20_2 = L20_2[1]
      L20_2 = L20_2[1]
      L21_2 = L15_2[1]
      L21_2 = L21_2 * L19_2
      L20_2 = L20_2 + L21_2
      L21_2 = L13_2[1]
      L21_2 = L21_2 * L18_2
      L20_2 = L20_2 + L21_2
      L11_2[1] = L20_2
      L20_2 = L3_2[L5_2]
      L20_2 = L20_2[1]
      L20_2 = L20_2[2]
      L21_2 = L15_2[2]
      L21_2 = L21_2 * L19_2
      L20_2 = L20_2 + L21_2
      L21_2 = L13_2[2]
      L21_2 = L21_2 * L18_2
      L20_2 = L20_2 + L21_2
      L11_2[2] = L20_2
      L20_2 = L3_2[L5_2]
      L20_2 = L20_2[2]
      L11_2[3] = L20_2
      L20_2 = FindGroundZFor3DCoord
      L21_2 = L11_2
      L20_2 = L20_2(L21_2)
      if 100 < L20_2 then
        L11_2[3] = L10_2
      else
        L11_2[3] = L20_2
      end
      L21_2 = L11_2[1]
      L12_2[1] = L21_2
      L21_2 = L11_2[2]
      L12_2[2] = L21_2
      L21_2 = L11_2[3]
      L12_2[3] = L21_2
      L21_2 = GetAngleBetweenPoints
      L22_2 = L3_2[L6_2]
      L22_2 = L22_2[1]
      L22_2 = L22_2[1]
      L23_2 = L3_2[L6_2]
      L23_2 = L23_2[1]
      L23_2 = L23_2[2]
      L24_2 = L3_2[L5_2]
      L24_2 = L24_2[1]
      L24_2 = L24_2[1]
      L25_2 = L3_2[L5_2]
      L25_2 = L25_2[1]
      L25_2 = L25_2[2]
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2)
      L7_2 = L21_2
      L21_2 = print
      L22_2 = "creating vehicle at X = "
      L23_2 = L11_2[1]
      L24_2 = " Y = "
      L25_2 = L11_2[2]
      L26_2 = " Z = "
      L27_2 = L11_2[3]
      L22_2 = L22_2 .. L23_2 .. L24_2 .. L25_2 .. L26_2 .. L27_2
      L21_2(L22_2)
      L21_2 = print
      L22_2 = "Model index "
      L23_2 = L9_2
      L22_2 = L22_2 .. L23_2
      L21_2(L22_2)
      L21_2 = CreateVehicle
      L22_2 = L9_2
      L23_2 = L11_2
      L24_2 = L7_2
      L25_2 = nil
      L26_2 = nil
      L27_2 = true
      L21_2 = L21_2(L22_2, L23_2, L24_2, L25_2, L26_2, L27_2)
      L8_2 = L21_2
      L21_2 = VehicleSetColours
      L22_2 = L8_2
      L23_2 = MapPlayerColourToCarColour
      L24_2 = PlayerId
      L24_2, L25_2, L26_2, L27_2, L28_2 = L24_2()
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L24_2 = MapPlayerColourToCarColour
      L25_2 = PlayerId
      L25_2, L26_2, L27_2, L28_2 = L25_2()
      L24_2, L25_2, L26_2, L27_2, L28_2 = L24_2(L25_2, L26_2, L27_2, L28_2)
      L21_2(L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
      L21_2 = Player
      L21_2 = L21_2()
      L22_2 = print
      L23_2 = [[

Respawning at ]]
      L24_2 = L12_2[1]
      L25_2 = " "
      L26_2 = L12_2[2]
      L27_2 = " "
      L28_2 = L12_2[3]
      L23_2 = L23_2 .. L24_2 .. L25_2 .. L26_2 .. L27_2 .. L28_2
      L22_2(L23_2)
      L23_2 = L21_2
      L22_2 = L21_2.Respawn
      L24_2 = L12_2
      L22_2(L23_2, L24_2)
      L22_2 = Wait
      L23_2 = 1
      L22_2(L23_2)
      L22_2 = SetPosition
      L23_2 = Player
      L24_2 = PlayerId
      L24_2, L25_2, L26_2, L27_2, L28_2 = L24_2()
      L23_2 = L23_2(L24_2, L25_2, L26_2, L27_2, L28_2)
      L24_2 = L12_2
      L22_2(L23_2, L24_2)
      L22_2 = Wait
      L23_2 = 1
      L22_2(L23_2)
      L22_2 = WarpPlayerIntoCar
      L23_2 = PlayerId
      L23_2 = L23_2()
      L24_2 = L8_2
      L22_2(L23_2, L24_2)
      L22_2 = Wait
      L23_2 = 10
      L22_2(L23_2)
      L22_2 = VehicleSetEmergencyStop
      L23_2 = GetLocalPlayersVehicle
      L23_2 = L23_2()
      L24_2 = true
      L22_2(L23_2, L24_2)
      goto lbl_472
      goto lbl_362
      repeat
        L14_2 = A0_2
        L13_2 = A0_2.SendRequestRespawnMessage
        L15_2 = PlayerId
        L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L15_2()
        L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
        L13_2 = Wait
        L14_2 = 500
        L13_2(L14_2)
        L13_2 = print
        L14_2 = "Respawn Blocked, Waiting ..."
        L13_2(L14_2)
        ::lbl_362::
        L13_2 = A0_2.canRespawn
        L14_2 = false
      until L13_2 ~= L14_2
    end
    L13_2 = false
    goto lbl_460
    repeat
      L8_2 = nil
      L15_2 = A0_2
      L14_2 = A0_2.GenerateCarRespawnPos
      L16_2 = A1_2
      L14_2 = L14_2(L15_2, L16_2)
      L12_2 = L14_2
      L14_2 = L12_2[1]
      L11_2[1] = L14_2
      L14_2 = L12_2[2]
      L11_2[2] = L14_2
      L14_2 = L12_2[3]
      L11_2[3] = L14_2
      L14_2 = GetAngleBetweenPoints
      L15_2 = L3_2[L6_2]
      L15_2 = L15_2[1]
      L15_2 = L15_2[1]
      L16_2 = L3_2[L6_2]
      L16_2 = L16_2[1]
      L16_2 = L16_2[2]
      L17_2 = L3_2[L5_2]
      L17_2 = L17_2[1]
      L17_2 = L17_2[1]
      L18_2 = L3_2[L5_2]
      L18_2 = L18_2[1]
      L18_2 = L18_2[2]
      L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2)
      L7_2 = L14_2
      L14_2 = IsVehicleWrecked
      L15_2 = L8_2
      L14_2 = L14_2(L15_2)
      if L14_2 then
        L14_2 = DeleteVehicle
        L15_2 = L8_2
        L14_2(L15_2)
        L8_2 = nil
      end
      if L8_2 == nil then
        L14_2 = CreateVehicle
        L15_2 = L9_2
        L16_2 = L11_2
        L17_2 = L7_2
        L18_2 = nil
        L19_2 = nil
        L20_2 = true
        L14_2 = L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
        L8_2 = L14_2
      end
      L14_2 = VehicleSetColours
      L15_2 = L8_2
      L16_2 = MapPlayerColourToCarColour
      L17_2 = PlayerId
      L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2()
      L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
      L17_2 = MapPlayerColourToCarColour
      L18_2 = PlayerId
      L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L18_2()
      L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2(L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
      L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
      L14_2 = Player
      L14_2 = L14_2()
      L15_2 = print
      L16_2 = [[

Respawning at ]]
      L17_2 = L12_2[1]
      L18_2 = " "
      L19_2 = L12_2[2]
      L20_2 = " "
      L21_2 = L12_2[3]
      L16_2 = L16_2 .. L17_2 .. L18_2 .. L19_2 .. L20_2 .. L21_2
      L15_2(L16_2)
      L16_2 = L14_2
      L15_2 = L14_2.Respawn
      L17_2 = L12_2
      L15_2(L16_2, L17_2)
      L15_2 = Wait
      L16_2 = 1
      L15_2(L16_2)
      L15_2 = SetPosition
      L16_2 = Player
      L17_2 = PlayerId
      L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L17_2()
      L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
      L17_2 = L12_2
      L15_2(L16_2, L17_2)
      L15_2 = Wait
      L16_2 = 1
      L15_2(L16_2)
      L15_2 = WarpPlayerIntoCar
      L16_2 = PlayerId
      L16_2 = L16_2()
      L17_2 = L8_2
      L15_2 = L15_2(L16_2, L17_2)
      L16_2 = true
      if L15_2 == L16_2 then
        L13_2 = true
      end
      ::lbl_460::
      L14_2 = false
    until L13_2 ~= L14_2
    L14_2 = false
    A0_2.canRespawn = L14_2
    L14_2 = Wait
    L15_2 = 500
    L14_2(L15_2)
    L15_2 = A0_2
    L14_2 = A0_2.SendRespawnDoneMessage
    L16_2 = PlayerId
    L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L16_2()
    L14_2(L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2)
  end
  ::lbl_472::
  if L4_2 then
    L13_2 = PlayerCarControl
    L14_2 = Player
    L14_2 = L14_2()
    L15_2 = L14_2
    L14_2 = L14_2.PlayerNum
    L14_2 = L14_2(L15_2)
    L15_2 = false
    L13_2(L14_2, L15_2)
    L13_2 = Wait
    L14_2 = 250
    L13_2(L14_2)
    L13_2 = NoFuckingCutscene
    L13_2 = L13_2()
    if not L13_2 then
      L13_2 = main
      L13_2 = L13_2.scores
      L14_2 = L13_2
      L13_2 = L13_2.Hide
      L15_2 = true
      L13_2(L14_2, L15_2)
      L13_2 = RunScriptedCutscene
      L13_2()
      L13_2 = Wait
      L14_2 = 0
      L13_2(L14_2)
      goto lbl_502
      repeat
        L13_2 = Wait
        L14_2 = 0
        L13_2(L14_2)
        ::lbl_502::
        L13_2 = ProcessScriptedCutscene
        L13_2 = L13_2()
      until not L13_2
      L13_2 = main
      L13_2 = L13_2.scores
      L14_2 = L13_2
      L13_2 = L13_2.Hide
      L15_2 = false
      L13_2(L14_2, L15_2)
    else
      L13_2 = Wait
      L14_2 = 750
      L13_2(L14_2)
      L13_2 = ClearSplashScreen
      L13_2()
    end
    L13_2 = GameElapsedMs
    L14_2 = 0
    L13_2(L14_2)
    L13_2 = PlayerCarControl
    L14_2 = Player
    L14_2 = L14_2()
    L15_2 = L14_2
    L14_2 = L14_2.PlayerNum
    L14_2 = L14_2(L15_2)
    L15_2 = false
    L13_2(L14_2, L15_2)
  end
end
L0_1.CreatePlayerinCarAtTrackNode = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = {}
  L3_2 = {}
  L4_2 = A0_2.track
  L4_2 = L4_2[1]
  L4_2 = L4_2[1]
  L4_2 = L4_2[1]
  L4_2 = L4_2 - 25
  L2_2[1] = L4_2
  L4_2 = A0_2.track
  L4_2 = L4_2[1]
  L4_2 = L4_2[1]
  L4_2 = L4_2[2]
  L4_2 = L4_2 - 25
  L2_2[2] = L4_2
  L4_2 = A0_2.track
  L4_2 = L4_2[1]
  L4_2 = L4_2[1]
  L4_2 = L4_2[3]
  L4_2 = L4_2 - 25
  L2_2[3] = L4_2
  L4_2 = A0_2.track
  L4_2 = L4_2[1]
  L4_2 = L4_2[1]
  L4_2 = L4_2[1]
  L4_2 = L4_2 + 25
  L3_2[1] = L4_2
  L4_2 = A0_2.track
  L4_2 = L4_2[1]
  L4_2 = L4_2[1]
  L4_2 = L4_2[2]
  L4_2 = L4_2 + 25
  L3_2[2] = L4_2
  L4_2 = A0_2.track
  L4_2 = L4_2[1]
  L4_2 = L4_2[1]
  L4_2 = L4_2[3]
  L4_2 = L4_2 + 25
  L3_2[3] = L4_2
  L4_2 = EnableRoads
  L5_2 = L2_2
  L6_2 = L3_2
  L7_2 = A1_2
  L4_2(L5_2, L6_2, L7_2)
end
L0_1.ToggleRoadsAtStartLine = L1_1
L0_1 = MultiRaceClient
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2
  L1_2 = print
  L2_2 = "MULTIRACE CLIENT RUNNING"
  L1_2(L2_2)
  L1_2 = A0_2.thisplayer
  L2_2 = 0
  A0_2.totalWaypointCounter = 0
  A0_2.newRacePosition = 1
  A0_2.racePosition = 1
  A0_2.waypoint = 2
  L3_2 = main
  L3_2 = L3_2.game
  L3_2 = L3_2.track
  goto lbl_212
  repeat
    L4_2 = A0_2.waypoint
    if L4_2 == nil then
      A0_2.waypoint = 1
    end
    L4_2 = A0_2.waypoint
    L4_2 = L3_2[L4_2]
    L4_2 = L4_2[1]
    L5_2 = A0_2.waypoint
    L5_2 = L3_2[L5_2]
    L5_2 = L5_2[2]
    L6_2 = A0_2.waypoint
    L6_2 = L6_2 + 1
    L7_2 = table
    L7_2 = L7_2.getn
    L8_2 = L3_2
    L7_2 = L7_2(L8_2)
    if L6_2 > L7_2 then
      L7_2 = IsIronManRace
      L7_2 = L7_2()
      if L7_2 then
        L7_2 = A0_2.waypoint
        L6_2 = L7_2 - 1
      else
        L7_2 = L2_2 + 1
        L8_2 = GameScoreLimit
        L8_2 = L8_2()
        if L7_2 == L8_2 then
          L6_2 = A0_2.waypoint
        else
          L6_2 = 1
        end
      end
    end
    if L6_2 == nil then
      L6_2 = 1
    end
    L7_2 = {}
    L8_2 = unpack
    L9_2 = L3_2[L6_2]
    L9_2 = L9_2[1]
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L8_2(L9_2)
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L7_2[4] = L11_2
    L7_2[5] = L12_2
    L7_2[6] = L13_2
    L7_2[7] = L14_2
    L7_2[8] = L15_2
    L7_2[9] = L16_2
    L7_2[10] = L17_2
    L7_2[11] = L18_2
    L7_2[12] = L19_2
    L7_2[13] = L20_2
    L7_2[14] = L21_2
    L7_2[15] = L22_2
    L8_2 = L4_2[3]
    L8_2 = L8_2 + 7
    L7_2[3] = L8_2
    L8_2 = 10
    L9_2 = waypointtype
    L9_2 = L9_2.land
    L10_2 = IsIronManRace
    L10_2 = L10_2()
    if L10_2 then
      L10_2 = IsModelIdHeli
      L11_2 = main
      L11_2 = L11_2.game
      L12_2 = L11_2
      L11_2 = L11_2.GetIronmanModelId
      L13_2 = A0_2.waypoint
      L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L11_2(L12_2, L13_2)
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      if L10_2 then
        L10_2 = waypointtype
        L9_2 = L10_2.air
      end
    end
    L10_2 = A0_2.waypoint
    L11_2 = table
    L11_2 = L11_2.getn
    L12_2 = L3_2
    L11_2 = L11_2(L12_2)
    if L10_2 == L11_2 then
      L10_2 = main
      L10_2 = L10_2.game
      L11_2 = L10_2
      L10_2 = L10_2.GetCurrentLapNumber
      L13_2 = L1_2
      L12_2 = L1_2.PlayerNum
      L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2(L13_2)
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      L11_2 = GameScoreLimit
      L11_2 = L11_2()
      if L10_2 == L11_2 then
        L10_2 = SetWaypoint
        L12_2 = L1_2
        L11_2 = L1_2.PlayerNum
        L11_2 = L11_2(L12_2)
        L12_2 = L4_2
        L13_2 = L7_2
        L14_2 = 10
        L15_2 = 95
        L16_2 = 160
        L17_2 = 106
        L18_2 = 128
        L19_2 = 7 / 8
        L19_2 = L8_2 * L19_2
        L20_2 = L5_2
        L21_2 = false
        L22_2 = L9_2
        L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        A0_2.wp = L10_2
    end
    else
      L10_2 = SetWaypoint
      L12_2 = L1_2
      L11_2 = L1_2.PlayerNum
      L11_2 = L11_2(L12_2)
      L12_2 = L4_2
      L13_2 = L7_2
      L14_2 = L8_2
      L15_2 = 237
      L16_2 = 130
      L17_2 = 180
      L18_2 = 255
      L19_2 = 7 / 8
      L19_2 = L8_2 * L19_2
      L20_2 = L5_2
      L21_2 = true
      L22_2 = L9_2
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
      A0_2.wp = L10_2
      goto lbl_146
      repeat
        L10_2 = Wait
        L11_2 = 10
        L10_2(L11_2)
        L10_2 = A0_2.newRacePosition
        L11_2 = A0_2.racePosition
        if L10_2 ~= L11_2 then
          L10_2 = A0_2.newRacePosition
          A0_2.racePosition = L10_2
          L10_2 = main
          L10_2 = L10_2.game
          L11_2 = L10_2
          L10_2 = L10_2.SendRacePositionChangedMessage
          L13_2 = L1_2
          L12_2 = L1_2.PlayerNum
          L12_2 = L12_2(L13_2)
          L13_2 = A0_2.racePosition
          L10_2(L11_2, L12_2, L13_2)
        end
        ::lbl_146::
        L10_2 = A0_2.wp
        L11_2 = L10_2
        L10_2 = L10_2.HasBeenHit
        L10_2 = L10_2(L11_2)
        if L10_2 then
          break
        end
        L10_2 = PlayerCar
        L11_2 = L1_2
        L10_2 = L10_2(L11_2)
      until not L10_2
    end
    L10_2 = A0_2.wp
    L11_2 = L10_2
    L10_2 = L10_2.Remove
    L10_2(L11_2)
    L10_2 = PlayerCar
    L11_2 = L1_2
    L10_2 = L10_2(L11_2)
    if not L10_2 then
      goto lbl_168
      repeat
        L10_2 = Wait
        L11_2 = 100
        L10_2(L11_2)
        ::lbl_168::
        L10_2 = PlayerCar
        L11_2 = L1_2
        L10_2 = L10_2(L11_2)
      until L10_2
    else
      L10_2 = main
      L10_2 = L10_2.game
      L11_2 = L10_2
      L10_2 = L10_2.SendCheckpointHitMessage
      L13_2 = L1_2
      L12_2 = L1_2.PlayerNum
      L12_2 = L12_2(L13_2)
      L13_2 = A0_2.waypoint
      L10_2(L11_2, L12_2, L13_2)
      L10_2 = A0_2.waypoint
      L10_2 = L10_2 + 1
      A0_2.waypoint = L10_2
      L10_2 = A0_2.totalWaypointCounter
      L10_2 = L10_2 + 1
      A0_2.totalWaypointCounter = L10_2
      L10_2 = A0_2.waypoint
      L11_2 = table
      L11_2 = L11_2.getn
      L12_2 = L3_2
      L11_2 = L11_2(L12_2)
      if L10_2 > L11_2 then
        L2_2 = L2_2 + 1
        L10_2 = main
        L10_2 = L10_2.game
        L11_2 = L10_2
        L10_2 = L10_2.SendLapCompleteMessage
        L13_2 = L1_2
        L12_2 = L1_2.PlayerNum
        L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L12_2(L13_2)
        L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
        L10_2 = print
        L11_2 = "lap "
        L12_2 = L2_2
        L13_2 = " complete !"
        L11_2 = L11_2 .. L12_2 .. L13_2
        L10_2(L11_2)
        L10_2 = GameScoreLimit
        L10_2 = L10_2()
        if L2_2 < L10_2 then
          A0_2.waypoint = 1
        end
      end
    end
    ::lbl_212::
    L4_2 = A0_2.waypoint
    L5_2 = table
    L5_2 = L5_2.getn
    L6_2 = L3_2
    L5_2 = L5_2(L6_2)
  until not (L4_2 <= L5_2)
  L4_2 = main
  L4_2 = L4_2.game
  L5_2 = main
  L5_2 = L5_2.game
  L5_2 = L5_2.numPlayersFinished
  L5_2 = L5_2 + 1
  L4_2.numPlayersFinished = L5_2
  L4_2 = main
  L4_2 = L4_2.game
  L4_2 = L4_2.raceOver
  L5_2 = false
  if L4_2 == L5_2 then
    L4_2 = main
    L4_2 = L4_2.game
    L5_2 = L4_2
    L4_2 = L4_2.SendRaceOverMessage
    L7_2 = L1_2
    L6_2 = L1_2.PlayerNum
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2 = L6_2(L7_2)
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2)
  end
end
L0_1.Run = L1_1
L0_1 = MultiRaceClient
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "MultiRaceClient:CleanUp"
  L1_2(L2_2)
  L1_2 = A0_2.wp
  if L1_2 then
    L1_2 = A0_2.wp
    L2_2 = L1_2
    L1_2 = L1_2.Remove
    L1_2(L2_2)
  end
  L1_2 = RemoveWaypoint
  L2_2 = A0_2.thisplayer
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = A0_2.track
  L2_2 = {}
  L3_2 = AllPlayers
  L3_2 = L3_2()
  L4_2 = PlayerCarControl
  L5_2 = GetEveryonePeerGroupId
  L5_2 = L5_2()
  L6_2 = false
  L4_2(L5_2, L6_2)
  L4_2 = RestoreCamera
  L5_2 = 0
  L6_2 = player
  L4_2(L5_2, L6_2)
  L4_2 = TextSprite
  L5_2 = GetEveryonePeerGroupId
  L5_2 = L5_2()
  L6_2 = 480 / 2
  L7_2 = 50
  L8_2 = 1
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L6_2 = L4_2
  L5_2 = L4_2.Scale
  L7_2 = 1.5
  L5_2(L6_2, L7_2)
  L6_2 = L4_2
  L5_2 = L4_2.Style
  L7_2 = 2
  L5_2(L6_2, L7_2)
  L6_2 = L4_2
  L5_2 = L4_2.Colour
  L7_2 = 255
  L8_2 = 255
  L9_2 = 255
  L10_2 = 255
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
  L6_2 = L4_2
  L5_2 = L4_2.Text
  L7_2 = "^S^3"
  L5_2(L6_2, L7_2)
  L5_2 = Wait
  L6_2 = 1000
  L5_2(L6_2)
  L6_2 = L4_2
  L5_2 = L4_2.Text
  L7_2 = "^S^2"
  L5_2(L6_2, L7_2)
  L5_2 = Wait
  L6_2 = 1000
  L5_2(L6_2)
  L6_2 = L4_2
  L5_2 = L4_2.Text
  L7_2 = "^S^1"
  L5_2(L6_2, L7_2)
  L5_2 = Wait
  L6_2 = 1000
  L5_2(L6_2)
  L5_2 = PlayerCarControl
  L6_2 = GetEveryonePeerGroupId
  L6_2 = L6_2()
  L7_2 = true
  L5_2(L6_2, L7_2)
  L6_2 = L4_2
  L5_2 = L4_2.Text
  L7_2 = "MRACEGO"
  L5_2(L6_2, L7_2)
  L5_2 = Wait
  L6_2 = 500
  L5_2(L6_2)
  L6_2 = L4_2
  L5_2 = L4_2.Remove
  L5_2(L6_2)
  L5_2 = SendEvent
  L6_2 = MSG_RACE_START
  L5_2(L6_2)
  L5_2 = false
  L6_2 = pairs
  L7_2 = L3_2
  L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
  for L8_2, L9_2 in L6_2, L7_2 do
    L10_2 = print
    L11_2 = "STARTING CLIENT "
    L12_2 = L8_2
    L11_2 = L11_2 .. L12_2
    L10_2(L11_2)
    if L9_2 ~= nil then
      L10_2 = A0_2.clientThread
      L11_2 = MultiRaceClient
      L12_2 = {}
      L13_2 = L9_2
      L12_2[1] = L13_2
      L11_2 = L11_2(L12_2)
      L12_2 = L11_2
      L11_2 = L11_2.Start
      L11_2 = L11_2(L12_2)
      L10_2[L9_2] = L11_2
    end
  end
  L6_2 = false
  while not L6_2 do
    L7_2 = Wait
    L8_2 = 10
    L7_2(L8_2)
    L7_2 = ipairs
    L8_2 = L3_2
    L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
    for L9_2, L10_2 in L7_2, L8_2 do
      L11_2 = IsConnected
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      if L11_2 then
        L11_2 = IsDead
        L12_2 = L10_2
        L11_2 = L11_2(L12_2)
        if not L11_2 then
          goto lbl_125
        end
      end
      if L10_2 ~= nil then
        L11_2 = A0_2.clientThread
        L11_2 = L11_2[L10_2]
        L12_2 = L11_2
        L11_2 = L11_2.Stop
        L11_2(L12_2)
      end
      L11_2 = main
      L11_2 = L11_2.game
      L11_2 = L11_2.allRacePositions
      L11_2[L9_2] = 9999
      L11_2 = table
      L11_2 = L11_2.remove
      L12_2 = L3_2
      L13_2 = L9_2
      L11_2(L12_2, L13_2)
      do break end
      ::lbl_125::
    end
    L7_2 = L3_2
    L8_2 = table
    L8_2 = L8_2.sort
    L9_2 = L7_2
    L10_2 = SortPlayersByPosition
    L8_2(L9_2, L10_2)
    L8_2 = false
    L9_2 = GameElapsedMs
    L9_2 = L9_2()
    L10_2 = A0_2.currentRankHeartBeat
    L9_2 = L9_2 - L10_2
    L10_2 = POSITION_HEART_BEAT_FREQUENCY
    if L9_2 >= L10_2 then
      L9_2 = GameElapsedMs
      L9_2 = L9_2()
      A0_2.currentRankHeartBeat = L9_2
      L8_2 = true
    end
    L9_2 = ipairs
    L10_2 = L7_2
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L11_2, L12_2 in L9_2, L10_2 do
      if L12_2 ~= nil then
        L13_2 = A0_2.clientThread
        L13_2 = L13_2[L12_2]
        L13_2.newRacePosition = L11_2
        L13_2 = true
        if L8_2 == L13_2 then
          L13_2 = main
          L13_2 = L13_2.game
          L14_2 = L13_2
          L13_2 = L13_2.SendRacePositionChangedMessage
          L16_2 = L12_2
          L15_2 = L12_2.PlayerNum
          L15_2 = L15_2(L16_2)
          L16_2 = L11_2
          L13_2(L14_2, L15_2, L16_2)
        end
      end
    end
    L9_2 = table
    L9_2 = L9_2.getn
    L10_2 = L3_2
    L9_2 = L9_2(L10_2)
    L10_2 = A0_2.raceWinner
    if L10_2 ~= -1 then
      L11_2 = A0_2
      L10_2 = A0_2.DisplayWinnerMsg
      L12_2 = A0_2.raceWinner
      L10_2(L11_2, L12_2)
      L5_2 = true
    end
    L10_2 = true
    if L5_2 == L10_2 then
      L10_2 = main
      L10_2 = L10_2.game
      L10_2 = L10_2.numPlayersFinished
      L11_2 = math
      L11_2 = L11_2.min
      L12_2 = 1
      L13_2 = L9_2
      L11_2 = L11_2(L12_2, L13_2)
      if L10_2 >= L11_2 then
        L10_2 = print
        L11_2 = "race finished"
        L10_2(L11_2)
        L6_2 = true
      end
    end
    L11_2 = A0_2
    L10_2 = A0_2.CheckForRespawn
    L10_2(L11_2)
    L11_2 = A0_2
    L10_2 = A0_2.CheckForRespot
    L10_2(L11_2)
    L11_2 = A0_2
    L10_2 = A0_2.DrawHUD
    L10_2(L11_2)
    L11_2 = A0_2
    L10_2 = A0_2.SetTrafficNormal
    L10_2(L11_2)
    L10_2 = IsIronManRace
    L10_2 = L10_2()
    if L10_2 then
      L11_2 = A0_2
      L10_2 = A0_2.UpdateIronManRace
      L10_2(L11_2)
    end
  end
  L7_2 = pairs
  L8_2 = L3_2
  L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
  for L9_2, L10_2 in L7_2, L8_2 do
    if L10_2 ~= nil then
      L11_2 = A0_2.clientThread
      L11_2 = L11_2[L10_2]
      L12_2 = L11_2
      L11_2 = L11_2.Stop
      L11_2(L12_2)
    end
  end
  while true do
    L7_2 = Wait
    L8_2 = 1
    L7_2(L8_2)
  end
  return
end
L0_1.StartTheRace = L1_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = IsConnected
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  if not L2_2 or A0_2 == nil then
    L2_2 = false
    return L2_2
  end
  L2_2 = IsConnected
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  if not L2_2 or A1_2 == nil then
    L2_2 = true
    return L2_2
  end
  L2_2 = main
  L2_2 = L2_2.game
  L2_2 = L2_2.clientThread
  L2_2 = L2_2[A0_2]
  L2_2 = L2_2.totalWaypointCounter
  L3_2 = main
  L3_2 = L3_2.game
  L3_2 = L3_2.clientThread
  L3_2 = L3_2[A1_2]
  L3_2 = L3_2.totalWaypointCounter
  if L2_2 ~= L3_2 then
    L4_2 = L2_2 > L3_2
    return L4_2
  end
  L4_2 = main
  L4_2 = L4_2.game
  L4_2 = L4_2.clientThread
  L4_2 = L4_2[A0_2]
  L4_2 = L4_2.waypoint
  L5_2 = main
  L5_2 = L5_2.game
  L5_2 = L5_2.clientThread
  L5_2 = L5_2[A1_2]
  L5_2 = L5_2.waypoint
  if L4_2 ~= L5_2 or L4_2 == 100 or L4_2 == -1 then
    L6_2 = L4_2 > L5_2
    return L6_2
  end
  if L4_2 ~= nil then
    L6_2 = main
    L6_2 = L6_2.game
    L6_2 = L6_2.track
    L6_2 = L6_2[L4_2]
    L6_2 = L6_2[1]
    L7_2 = Distance
    L8_2 = PlayerPosition
    L9_2 = A0_2
    L8_2 = L8_2(L9_2)
    L9_2 = L6_2
    L7_2 = L7_2(L8_2, L9_2)
    L8_2 = Distance
    L9_2 = PlayerPosition
    L10_2 = A1_2
    L9_2 = L9_2(L10_2)
    L10_2 = L6_2
    L8_2 = L8_2(L9_2, L10_2)
    L7_2 = L7_2 < L8_2
    return L7_2
  end
end
SortPlayersByPosition = L0_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2
  L2_2 = A0_2
  L1_2 = A0_2.GetNumIronManLegChanges
  L1_2 = L1_2(L2_2)
  L2_2 = 1
  L3_2 = 1
  L4_2 = L1_2
  L5_2 = 1
  L3_2 = L3_2 - L5_2
  for L3_2 = L3_2, L4_2, L5_2 do
    L6_2 = IsVehicleWrecked
    L7_2 = A0_2.myLegVehicles
    L7_2 = L7_2[L3_2]
    L7_2 = L7_2[1]
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L6_2 = A0_2.myLegVehicles
      L6_2 = L6_2[L3_2]
      L6_2[1] = nil
    end
    L6_2 = A0_2.myLegVehicles
    L6_2 = L6_2[L3_2]
    L6_2 = L6_2[1]
    if L6_2 == nil then
      L6_2 = A0_2.myLastWaypoint
      L7_2 = nil
      if L3_2 == 1 then
        L7_2 = A0_2.leg1Veh
      elseif L3_2 == 2 then
        L7_2 = A0_2.leg2Veh
      elseif L3_2 == 3 then
        L7_2 = A0_2.leg3Veh
      else
        L7_2 = A0_2.leg4Veh
      end
      L8_2 = print
      L9_2 = "Creating a leg vehicle"
      L8_2(L9_2)
      L8_2 = {}
      L9_2 = A0_2.myLegVehicles
      L9_2 = L9_2[L3_2]
      L9_2 = L9_2[2]
      L9_2 = L9_2[1]
      L8_2[1] = L9_2
      L9_2 = A0_2.myLegVehicles
      L9_2 = L9_2[L3_2]
      L9_2 = L9_2[2]
      L9_2 = L9_2[2]
      L8_2[2] = L9_2
      L9_2 = A0_2.myLegVehicles
      L9_2 = L9_2[L3_2]
      L9_2 = L9_2[2]
      L9_2 = L9_2[3]
      L8_2[3] = L9_2
      L9_2 = A0_2.myLegVehicles
      L9_2 = L9_2[L3_2]
      L9_2 = L9_2[3]
      L10_2 = A0_2.myLegVehicles
      L10_2 = L10_2[L3_2]
      L11_2 = CreateVehicle
      L12_2 = L7_2
      L13_2 = L8_2
      L14_2 = L9_2
      L15_2 = nil
      L16_2 = nil
      L17_2 = true
      L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2)
      L10_2[1] = L11_2
      L10_2 = VehicleAdd3dMarker
      L11_2 = A0_2.myLegVehicles
      L11_2 = L11_2[L3_2]
      L11_2 = L11_2[1]
      L10_2(L11_2)
    end
  end
  L3_2 = A0_2.myLastWaypoint
  L4_2 = A0_2.numWPLeg1
  if L3_2 == L4_2 then
    L4_2 = A0_2.currentLegVehicle
    if L4_2 == 1 then
      A0_2.currentLegVehicle = 2
      L5_2 = A0_2
      L4_2 = A0_2.DoIronManLegChange
      L4_2(L5_2)
  end
  else
    L4_2 = A0_2.numWPLeg1
    L5_2 = A0_2.numWPLeg2
    L4_2 = L4_2 + L5_2
    if L3_2 == L4_2 then
      L4_2 = A0_2.currentLegVehicle
      if L4_2 == 2 then
        A0_2.currentLegVehicle = 3
        L5_2 = A0_2
        L4_2 = A0_2.DoIronManLegChange
        L4_2(L5_2)
    end
    else
      L4_2 = A0_2.numWPLeg1
      L5_2 = A0_2.numWPLeg2
      L4_2 = L4_2 + L5_2
      L5_2 = A0_2.numWPLeg3
      L4_2 = L4_2 + L5_2
      if L3_2 == L4_2 then
        L4_2 = A0_2.currentLegVehicle
        if L4_2 == 3 then
          A0_2.currentLegVehicle = 4
          L5_2 = A0_2
          L4_2 = A0_2.DoIronManLegChange
          L4_2(L5_2)
        end
      end
    end
  end
end
L0_1.UpdateIronManRace = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2.trafficNormal
  L2_2 = false
  if L1_2 == L2_2 then
    L1_2 = A0_2.raceStarted
    L2_2 = true
    if L1_2 == L2_2 then
      L1_2 = GameElapsedMs
      L1_2 = L1_2()
      if 10000 < L1_2 then
        L1_2 = true
        A0_2.trafficNormal = L1_2
        L1_2 = GenerateAmbients
        L2_2 = true
        L1_2(L2_2)
        L1_2 = IsServer
        L1_2 = L1_2()
        if L1_2 then
          L1_2 = print
          L2_2 = "Enabling Road Nodes"
          L1_2(L2_2)
          L2_2 = A0_2
          L1_2 = A0_2.ToggleRoadsAtStartLine
          L3_2 = false
          L1_2(L2_2, L3_2)
        end
    end
  end
  else
    L1_2 = A0_2.trafficNormal
    L2_2 = true
    if L1_2 == L2_2 then
      L2_2 = A0_2
      L1_2 = A0_2.AmILeadingTheRace
      L1_2 = L1_2(L2_2)
      L2_2 = true
      if L1_2 == L2_2 then
        L1_2 = SetMaxAmbientCars
        L2_2 = 6
        L1_2(L2_2)
      else
        L1_2 = SetMaxAmbientCars
        L2_2 = 3
        L1_2(L2_2)
      end
    end
  end
end
L0_1.SetTrafficNormal = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = A0_2.myLastWaypoint
  if L1_2 == nil then
    return
  end
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = A0_2.track
  L3_2 = A0_2.myLastWaypoint
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2[1]
  L3_2 = A0_2.respotText
  if L3_2 ~= nil then
    L3_2 = A0_2.respotText
    L4_2 = L3_2
    L3_2 = L3_2.Remove
    L3_2(L4_2)
    A0_2.respotText = nil
  end
  L4_2 = L1_2
  L3_2 = L1_2.IsPlaying
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = Wait
    L4_2 = 600
    L3_2(L4_2)
    L3_2 = CameraFadeOut
    L4_2 = 3
    L3_2(L4_2)
    L3_2 = Wait
    L4_2 = 200
    L3_2(L4_2)
    L4_2 = A0_2
    L3_2 = A0_2.CreatePlayerinCarAtTrackNode
    L5_2 = A0_2.myLastWaypoint
    L6_2 = false
    L3_2(L4_2, L5_2, L6_2)
    L3_2 = Wait
    L4_2 = 200
    L3_2(L4_2)
    L3_2 = CameraFadeIn
    L4_2 = 3
    L3_2(L4_2)
  end
end
L0_1.CheckForRespawn = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = IsLocalPlayerInVehicle
  L1_2 = L1_2()
  L2_2 = true
  if L1_2 ~= L2_2 then
    L1_2 = IsLocalPlayerEnteringAVehicle
    L1_2 = L1_2()
    L2_2 = true
    if L1_2 ~= L2_2 then
      goto lbl_20
    end
  end
  A0_2.respotCounter = 0
  L1_2 = A0_2.respotText
  if L1_2 ~= nil then
    L1_2 = A0_2.respotText
    L2_2 = L1_2
    L1_2 = L1_2.Remove
    L1_2(L2_2)
    A0_2.respotText = nil
    goto lbl_146
    ::lbl_20::
    L1_2 = A0_2.respotCounter
    L2_2 = GameElapsedMs
    L2_2 = L2_2()
    L3_2 = A0_2.respotLastUpdate
    L2_2 = L2_2 - L3_2
    L1_2 = L1_2 + L2_2
    A0_2.respotCounter = L1_2
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.GetTimeBeforeRespot
    L1_2 = L1_2(L2_2)
    if L1_2 <= 1 then
      L1_2 = collectgarbage
      L1_2()
      L2_2 = A0_2
      L1_2 = A0_2.CreatePlayerinCarAtTrackNode
      L3_2 = A0_2.myLastWaypoint
      L4_2 = false
      L1_2(L2_2, L3_2, L4_2)
      L1_2 = A0_2.respotText
      if L1_2 then
        L1_2 = A0_2.respotText
        L2_2 = L1_2
        L1_2 = L1_2.Remove
        L1_2(L2_2)
        A0_2.respotText = nil
      end
    else
      L1_2 = A0_2.respotText
      if L1_2 == nil then
        L1_2 = ShowRadar
        L1_2 = L1_2()
        if L1_2 then
          L1_2 = TextSprite
          L2_2 = Player
          L2_2 = L2_2()
          L3_2 = L2_2
          L2_2 = L2_2.PlayerNum
          L2_2 = L2_2(L3_2)
          L3_2 = 240 + 50
          L4_2 = 210
          L5_2 = 1
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          A0_2.respotText = L1_2
        else
          L1_2 = TextSprite
          L2_2 = Player
          L2_2 = L2_2()
          L3_2 = L2_2
          L2_2 = L2_2.PlayerNum
          L2_2 = L2_2(L3_2)
          L3_2 = 240
          L4_2 = 210
          L5_2 = 1
          L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2)
          A0_2.respotText = L1_2
        end
        L1_2 = A0_2.respotText
        L2_2 = L1_2
        L1_2 = L1_2.Scale
        L3_2 = 0.75
        L1_2(L2_2, L3_2)
        L1_2 = A0_2.respotText
        L2_2 = L1_2
        L1_2 = L1_2.Style
        L3_2 = 1
        L1_2(L2_2, L3_2)
        L1_2 = A0_2.respotText
        L2_2 = L1_2
        L1_2 = L1_2.Colour
        L3_2 = {}
        L4_2 = 0
        L5_2 = 106
        L6_2 = 164
        L7_2 = 255
        L3_2[1] = L4_2
        L3_2[2] = L5_2
        L3_2[3] = L6_2
        L3_2[4] = L7_2
        L1_2(L2_2, L3_2)
      end
      L1_2 = "^S^ "
      L2_2 = IsJetskiRace
      L2_2 = L2_2()
      if L2_2 then
        L2_2 = main
        L2_2 = L2_2.game
        L3_2 = L2_2
        L2_2 = L2_2.GetTimeBeforeRespot
        L2_2 = L2_2(L3_2)
        if L2_2 < 2 then
          L1_2 = "^T^MRACE12^S^ 1 ^T^MRJSFR1"
        else
          L2_2 = string
          L2_2 = L2_2.format
          L3_2 = "%.0d"
          L4_2 = main
          L4_2 = L4_2.game
          L5_2 = L4_2
          L4_2 = L4_2.GetTimeBeforeRespot
          L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
          L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
          L1_2 = L2_2
          L2_2 = "^T^MRACE12^S^ "
          L3_2 = L1_2
          L4_2 = "^S^ ^T^MRJSFR2"
          L1_2 = L2_2 .. L3_2 .. L4_2
        end
      else
        L2_2 = main
        L2_2 = L2_2.game
        L3_2 = L2_2
        L2_2 = L2_2.GetTimeBeforeRespot
        L2_2 = L2_2(L3_2)
        if L2_2 < 2 then
          L1_2 = "^T^MRACE12^S^ 1 ^T^MRACE14"
        else
          L2_2 = string
          L2_2 = L2_2.format
          L3_2 = "%.0d"
          L4_2 = main
          L4_2 = L4_2.game
          L5_2 = L4_2
          L4_2 = L4_2.GetTimeBeforeRespot
          L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
          L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
          L1_2 = L2_2
          L2_2 = "^T^MRACE12^S^ "
          L3_2 = L1_2
          L4_2 = "^S^ ^T^MRACE13"
          L1_2 = L2_2 .. L3_2 .. L4_2
        end
      end
      L2_2 = A0_2.respotText
      L3_2 = L2_2
      L2_2 = L2_2.Text
      L4_2 = "^S^"
      L5_2 = L1_2
      L4_2 = L4_2 .. L5_2
      L2_2(L3_2, L4_2)
    end
  end
  ::lbl_146::
  L1_2 = GameElapsedMs
  L1_2 = L1_2()
  A0_2.respotLastUpdate = L1_2
end
L0_1.CheckForRespot = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  A0_2.gridShuffle = A1_2
  L2_2 = A0_2.gridShuffle
  if L2_2 == nil then
    A0_2.gridShuffle = 0
  end
  L2_2 = A0_2.currentRacePosition
  L2_2 = L2_2 + A1_2
  A0_2.currentRacePosition = L2_2
  L2_2 = AllPlayers
  L2_2 = L2_2()
  L3_2 = table
  L3_2 = L3_2.getn
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  L4_2 = A0_2.currentRacePosition
  if L3_2 < L4_2 then
    L4_2 = A0_2.currentRacePosition
    L4_2 = L4_2 - L3_2
    A0_2.currentRacePosition = L4_2
  end
  L4_2 = 0
  L5_2 = 1
  L6_2 = L3_2
  L7_2 = 1
  L5_2 = L5_2 - L7_2
  for L5_2 = L5_2, L6_2, L7_2 do
    if L5_2 == nil then
      L5_2 = 1
    end
    L8_2 = A0_2.allRacePositions
    L9_2 = A0_2.allRacePositions
    L9_2 = L9_2[L5_2]
    L9_2 = L9_2 + A1_2
    L8_2[L5_2] = L9_2
    L8_2 = A0_2.allRacePositions
    L8_2 = L8_2[L5_2]
    if L3_2 < L8_2 then
      L8_2 = A0_2.allRacePositions
      L9_2 = A0_2.allRacePositions
      L9_2 = L9_2[L5_2]
      L9_2 = L9_2 - L3_2
      L8_2[L5_2] = L9_2
    end
  end
  L5_2 = print
  L6_2 = "Grid Shuffle =="
  L7_2 = A0_2.gridShuffle
  L6_2 = L6_2 .. L7_2
  L5_2(L6_2)
end
L0_1.SetGridShuffle = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = A0_2.blip
  if L1_2 ~= nil then
    L1_2 = RemoveLocalRadarBlip
    L2_2 = A0_2.blip
    L1_2(L2_2)
    A0_2.blip = nil
  end
  L1_2 = A0_2.nextblip
  if L1_2 ~= nil then
    L1_2 = RemoveLocalRadarBlip
    L2_2 = A0_2.nextblip
    L1_2(L2_2)
    A0_2.nextblip = nil
  end
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = true
  L4_2 = A0_2
  L3_2 = A0_2.GetCurrentLapNumber
  L6_2 = L1_2
  L5_2 = L1_2.PlayerNum
  L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2)
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  L4_2 = GameScoreLimit
  L4_2 = L4_2()
  if L3_2 > L4_2 then
    L2_2 = false
    L3_2 = RaceArrowVisible
    L4_2 = false
    L3_2(L4_2)
  end
  L3_2 = true
  if L2_2 == L3_2 then
    L4_2 = A0_2
    L3_2 = A0_2.GetCheckpointsCompletedThisLap
    L5_2 = PlayerId
    L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2()
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    L3_2 = L3_2 + 2
    L5_2 = A0_2
    L4_2 = A0_2.GetNumberOfCheckpointsInLap
    L4_2 = L4_2(L5_2)
    if L3_2 > L4_2 then
      L5_2 = A0_2
      L4_2 = A0_2.GetNumberOfCheckpointsInLap
      L4_2 = L4_2(L5_2)
      L3_2 = L3_2 - L4_2
    end
    if L3_2 == nil then
      L3_2 = 1
    end
    if L3_2 <= 0 then
      L3_2 = 1
    end
    L4_2 = {}
    L5_2 = A0_2.track
    L5_2 = L5_2[L3_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[1]
    L4_2[1] = L5_2
    L5_2 = A0_2.track
    L5_2 = L5_2[L3_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[2]
    L4_2[2] = L5_2
    L5_2 = A0_2.track
    L5_2 = L5_2[L3_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[3]
    L4_2[3] = L5_2
    L5_2 = {}
    L6_2 = L4_2[1]
    L5_2[1] = L6_2
    L6_2 = L4_2[2]
    L5_2[2] = L6_2
    L6_2 = L4_2[3]
    L6_2 = L6_2 + 1000
    L5_2[3] = L6_2
    L7_2 = A0_2
    L6_2 = A0_2.GetCurrentLapNumber
    L9_2 = L1_2
    L8_2 = L1_2.PlayerNum
    L8_2, L9_2 = L8_2(L9_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = GameScoreLimit
    L7_2 = L7_2()
    if not (L6_2 > L7_2) then
      L7_2 = A0_2
      L6_2 = A0_2.GetCurrentLapNumber
      L9_2 = L1_2
      L8_2 = L1_2.PlayerNum
      L8_2, L9_2 = L8_2(L9_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L7_2 = GameScoreLimit
      L7_2 = L7_2()
      if L6_2 ~= L7_2 then
        goto lbl_106
      end
      L6_2 = A0_2.myLastWaypoint
      L8_2 = A0_2
      L7_2 = A0_2.GetNumberOfCheckpointsInLap
      L7_2 = L7_2(L8_2)
      L7_2 = L7_2 - 1
      if L6_2 ~= L7_2 then
        goto lbl_106
      end
    end
    L2_2 = FALSE
    L6_2 = AddLocalBlipForCoord
    L7_2 = L5_2
    L8_2 = 1
    L9_2 = pickupicon
    L9_2 = L9_2.checkpoint
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    A0_2.blip = L6_2
    goto lbl_113
    ::lbl_106::
    L6_2 = AddLocalBlipForCoord
    L7_2 = L5_2
    L8_2 = 5
    L9_2 = pickupicon
    L9_2 = L9_2.checkpoint
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    A0_2.blip = L6_2
    ::lbl_113::
    L6_2 = true
    if L2_2 == L6_2 then
      L6_2 = table
      L6_2 = L6_2.getn
      L7_2 = A0_2.track
      L6_2 = L6_2(L7_2)
      if L3_2 < L6_2 then
        L6_2 = A0_2.track
        L7_2 = L3_2 + 1
        L6_2 = L6_2[L7_2]
        L6_2 = L6_2[1]
        L6_2 = L6_2[1]
        L5_2[1] = L6_2
        L6_2 = A0_2.track
        L7_2 = L3_2 + 1
        L6_2 = L6_2[L7_2]
        L6_2 = L6_2[1]
        L6_2 = L6_2[2]
        L5_2[2] = L6_2
        L6_2 = A0_2.track
        L7_2 = L3_2 + 1
        L6_2 = L6_2[L7_2]
        L6_2 = L6_2[1]
        L6_2 = L6_2[3]
        L6_2 = L6_2 + 1000
        L5_2[3] = L6_2
      else
        L6_2 = A0_2.track
        L6_2 = L6_2[1]
        L6_2 = L6_2[1]
        L6_2 = L6_2[1]
        L5_2[1] = L6_2
        L6_2 = A0_2.track
        L6_2 = L6_2[1]
        L6_2 = L6_2[1]
        L6_2 = L6_2[2]
        L5_2[2] = L6_2
        L6_2 = A0_2.track
        L6_2 = L6_2[1]
        L6_2 = L6_2[1]
        L6_2 = L6_2[3]
        L6_2 = L6_2 + 1000
        L5_2[3] = L6_2
      end
      L6_2 = AddLocalBlipForCoord
      L7_2 = L5_2
      L8_2 = 7
      L9_2 = pickupicon
      L9_2 = L9_2.checkpoint
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      A0_2.nextblip = L6_2
    end
  end
end
L0_1.UpdateWaypointBlips = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = Player
  L2_2 = L2_2()
  L3_2 = true
  if A1_2 == L3_2 then
    L3_2 = A0_2.currentLapSprite
    if L3_2 == nil then
      L3_2 = A0_2.poshud
      if L3_2 == nil then
        L3_2 = A0_2.lapTitle
        if L3_2 == nil then
          L3_2 = TextSprite
          L5_2 = L2_2
          L4_2 = L2_2.PlayerNum
          L4_2 = L4_2(L5_2)
          L5_2 = 470
          L6_2 = 95
          L7_2 = 2
          L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
          A0_2.currentLapSprite = L3_2
          L3_2 = A0_2.currentLapSprite
          L4_2 = L3_2
          L3_2 = L3_2.Scale
          L5_2 = 0.8878
          L3_2(L4_2, L5_2)
          L3_2 = A0_2.currentLapSprite
          L4_2 = L3_2
          L3_2 = L3_2.Style
          L5_2 = 1
          L3_2(L4_2, L5_2)
          L3_2 = A0_2.currentLapSprite
          L4_2 = L3_2
          L3_2 = L3_2.Colour
          L5_2 = 255
          L6_2 = 255
          L7_2 = 255
          L8_2 = 255
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
          L3_2 = A0_2.currentLapSprite
          L4_2 = L3_2
          L3_2 = L3_2.Text
          L5_2 = "^S^    "
          L3_2(L4_2, L5_2)
          L3_2 = A0_2.currentLapSprite
          L4_2 = L3_2
          L3_2 = L3_2.Align
          L5_2 = 2
          L3_2(L4_2, L5_2)
          L3_2 = TextSprite
          L5_2 = L2_2
          L4_2 = L2_2.PlayerNum
          L4_2 = L4_2(L5_2)
          L5_2 = 435
          L6_2 = 95
          L7_2 = 2
          L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
          A0_2.lapTitle = L3_2
          L3_2 = A0_2.lapTitle
          L4_2 = L3_2
          L3_2 = L3_2.Scale
          L5_2 = 0.8878
          L3_2(L4_2, L5_2)
          L3_2 = A0_2.lapTitle
          L4_2 = L3_2
          L3_2 = L3_2.Style
          L5_2 = 1
          L3_2(L4_2, L5_2)
          L3_2 = A0_2.lapTitle
          L4_2 = L3_2
          L3_2 = L3_2.Colour
          L5_2 = 255
          L6_2 = 255
          L7_2 = 255
          L8_2 = 255
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
          L3_2 = A0_2.lapTitle
          L4_2 = L3_2
          L3_2 = L3_2.Text
          L5_2 = "^S^   "
          L3_2(L4_2, L5_2)
          L3_2 = A0_2.lapTitle
          L4_2 = L3_2
          L3_2 = L3_2.Align
          L5_2 = 2
          L3_2(L4_2, L5_2)
          L3_2 = TextSprite
          L5_2 = L2_2
          L4_2 = L2_2.PlayerNum
          L4_2 = L4_2(L5_2)
          L5_2 = 468
          L6_2 = 77
          L7_2 = 2
          L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
          A0_2.poshud = L3_2
          L3_2 = A0_2.poshud
          L4_2 = L3_2
          L3_2 = L3_2.Scale
          L5_2 = 0.8878
          L3_2(L4_2, L5_2)
          L3_2 = A0_2.poshud
          L4_2 = L3_2
          L3_2 = L3_2.Style
          L5_2 = 1
          L3_2(L4_2, L5_2)
          L3_2 = A0_2.poshud
          L4_2 = L3_2
          L3_2 = L3_2.Colour
          L5_2 = 255
          L6_2 = 255
          L7_2 = 255
          L8_2 = 255
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
          L3_2 = A0_2.poshud
          L4_2 = L3_2
          L3_2 = L3_2.Align
          L5_2 = 2
          L3_2(L4_2, L5_2)
          L3_2 = AllPlayers
          L3_2 = L3_2()
          L4_2 = nil
          L5_2 = 1
          L6_2 = 8
          L7_2 = 1
          L5_2 = L5_2 - L7_2
          for L5_2 = L5_2, L6_2, L7_2 do
            L8_2 = L5_2 - 1
            L8_2 = 17 * L8_2
            L8_2 = 115 + L8_2
            L9_2 = A0_2.rankhud
            L10_2 = TextSprite
            L11_2 = Player
            L11_2 = L11_2()
            L12_2 = L11_2
            L11_2 = L11_2.PlayerNum
            L11_2 = L11_2(L12_2)
            L12_2 = 375
            L13_2 = L8_2
            L14_2 = 0
            L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2)
            L9_2[L5_2] = L10_2
            L9_2 = A0_2.rankhud
            L9_2 = L9_2[L5_2]
            L10_2 = L9_2
            L9_2 = L9_2.Style
            L11_2 = 1
            L9_2(L10_2, L11_2)
            L9_2 = A0_2.rankhud
            L9_2 = L9_2[L5_2]
            L10_2 = L9_2
            L9_2 = L9_2.Scale
            L11_2 = 0.696
            L9_2(L10_2, L11_2)
            L9_2 = A0_2.rankhud
            L9_2 = L9_2[L5_2]
            L10_2 = L9_2
            L9_2 = L9_2.Align
            L11_2 = 2
            L9_2(L10_2, L11_2)
            L9_2 = A0_2.rankhud
            L9_2 = L9_2[L5_2]
            L10_2 = L9_2
            L9_2 = L9_2.Pos
            L11_2 = 470
            L12_2 = L8_2
            L13_2 = 0.1
            L9_2(L10_2, L11_2, L12_2, L13_2)
            L9_2 = A0_2.rankhud
            L9_2 = L9_2[L5_2]
            L10_2 = L9_2
            L9_2 = L9_2.Text
            L11_2 = "^S^"
            L9_2(L10_2, L11_2)
          end
        end
      end
    end
  else
    L3_2 = A0_2.currentLapSprite
    if L3_2 ~= nil then
      L3_2 = A0_2.poshud
      if L3_2 ~= nil then
        L3_2 = A0_2.lapTitle
        if L3_2 ~= nil then
          L3_2 = A0_2.currentLapSprite
          L4_2 = L3_2
          L3_2 = L3_2.Remove
          L3_2(L4_2)
          L3_2 = A0_2.poshud
          L4_2 = L3_2
          L3_2 = L3_2.Remove
          L3_2(L4_2)
          L3_2 = A0_2.lapTitle
          L4_2 = L3_2
          L3_2 = L3_2.Remove
          L3_2(L4_2)
          A0_2.currentLapSprite = nil
          A0_2.poshud = nil
          A0_2.lapTitle = nil
          L3_2 = AllPlayers
          L3_2 = L3_2()
          L4_2 = nil
          L5_2 = 1
          L6_2 = 8
          L7_2 = 1
          L5_2 = L5_2 - L7_2
          for L5_2 = L5_2, L6_2, L7_2 do
            L8_2 = A0_2.rankhud
            L8_2 = L8_2[L5_2]
            L9_2 = L8_2
            L8_2 = L8_2.Remove
            L8_2(L9_2)
          end
        end
      end
    end
  end
end
L0_1.ShowHUD = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
  L1_2 = A0_2.currentLapSprite
  if L1_2 ~= nil then
    L1_2 = A0_2.poshud
    if L1_2 ~= nil then
      L1_2 = A0_2.lapTitle
      if L1_2 ~= nil then
        L1_2 = IsIronManRace
        L1_2 = L1_2()
        L2_2 = false
        if L1_2 == L2_2 then
          L1_2 = A0_2.currentLapSprite
          L2_2 = L1_2
          L1_2 = L1_2.Text
          L3_2 = "^s^"
          L4_2 = A0_2.lapNumber
          L5_2 = "/"
          L6_2 = GameScoreLimit
          L6_2 = L6_2()
          L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2
          L1_2(L2_2, L3_2)
        end
        L1_2 = nil
        L2_2 = A0_2.currentRacePosition
        if L2_2 == 1 then
          L1_2 = "^T^RACEP1"
        else
          L2_2 = A0_2.currentRacePosition
          if L2_2 == 2 then
            L1_2 = "^T^RACEP2"
          else
            L2_2 = A0_2.currentRacePosition
            if L2_2 == 3 then
              L1_2 = "^T^RACEP3"
            else
              L2_2 = A0_2.currentRacePosition
              if L2_2 == 4 then
                L1_2 = "^T^RACEP4"
              else
                L2_2 = A0_2.currentRacePosition
                if L2_2 == 5 then
                  L1_2 = "^T^RACEP5"
                else
                  L2_2 = A0_2.currentRacePosition
                  if L2_2 == 6 then
                    L1_2 = "^T^RACEP6"
                  else
                    L2_2 = A0_2.currentRacePosition
                    if L2_2 == 7 then
                      L1_2 = "^T^RACEP7"
                    else
                      L2_2 = A0_2.currentRacePosition
                      if L2_2 == 8 then
                        L1_2 = "^T^RACEP8"
                      end
                    end
                  end
                end
              end
            end
          end
        end
        L2_2 = A0_2.poshud
        L3_2 = L2_2
        L2_2 = L2_2.Text
        L4_2 = L1_2
        L2_2(L3_2, L4_2)
        L2_2 = IsIronManRace
        L2_2 = L2_2()
        L3_2 = false
        if L2_2 == L3_2 then
          L2_2 = A0_2.lapTitle
          L3_2 = L2_2
          L2_2 = L2_2.Text
          L4_2 = "^t^MRACELA"
          L2_2(L3_2, L4_2)
        end
        L2_2 = AllPlayers
        L2_2 = L2_2()
        L3_2 = 0
        L4_2 = nil
        L5_2 = table
        L5_2 = L5_2.getn
        L6_2 = L2_2
        L5_2 = L5_2(L6_2)
        L6_2 = 1
        L7_2 = 8
        L8_2 = 1
        L6_2 = L6_2 - L8_2
        for L6_2 = L6_2, L7_2, L8_2 do
          L9_2 = A0_2.rankhud
          L9_2 = L9_2[L6_2]
          if L9_2 ~= nil then
            L9_2 = A0_2.rankhud
            L9_2 = L9_2[L6_2]
            L10_2 = L9_2
            L9_2 = L9_2.Text
            L11_2 = "^S^"
            L9_2(L10_2, L11_2)
          end
          L9_2 = ipairs
          L10_2 = L2_2
          L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
          for L11_2, L12_2 in L9_2, L10_2 do
            if L12_2 ~= nil then
              L13_2 = A0_2.allRacePositions
              L15_2 = L12_2
              L14_2 = L12_2.PlayerNum
              L14_2 = L14_2(L15_2)
              L14_2 = L14_2 + 1
              L13_2 = L13_2[L14_2]
              if L13_2 == L6_2 then
                L13_2 = A0_2.rankhud
                L13_2 = L13_2[L6_2]
                if L13_2 ~= nil then
                  L13_2 = A0_2.rankhud
                  L13_2 = L13_2[L6_2]
                  L14_2 = L13_2
                  L13_2 = L13_2.Colour
                  L16_2 = L12_2
                  L15_2 = L12_2.Colour
                  L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L15_2(L16_2)
                  L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
                  L13_2 = A0_2.rankhud
                  L13_2 = L13_2[L6_2]
                  L14_2 = L13_2
                  L13_2 = L13_2.Text
                  L15_2 = "^S^"
                  L17_2 = L12_2
                  L16_2 = L12_2.Name
                  L16_2 = L16_2(L17_2)
                  L17_2 = "  "
                  L18_2 = A0_2.allRacePositions
                  L20_2 = L12_2
                  L19_2 = L12_2.PlayerNum
                  L19_2 = L19_2(L20_2)
                  L19_2 = L19_2 + 1
                  L18_2 = L18_2[L19_2]
                  L15_2 = L15_2 .. L16_2 .. L17_2 .. L18_2
                  L13_2(L14_2, L15_2)
                end
              end
            end
          end
        end
      end
    end
  end
end
L0_1.DrawHUD = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L3_2 = A0_2
  L2_2 = A0_2.ShowHUD
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = main
  L2_2 = L2_2.game
  L2_2.state = "StateGameWon"
  L2_2 = Player
  L2_2 = L2_2()
  L3_2 = Player
  L4_2 = A1_2
  L3_2 = L3_2(L4_2)
  L4_2 = nil
  L5_2 = nil
  L7_2 = L2_2
  L6_2 = L2_2.PlayerNum
  L6_2 = L6_2(L7_2)
  if A1_2 == L6_2 then
    L4_2 = "^T^MRACE04"
    L5_2 = 1
  else
    L6_2 = "^S^"
    L8_2 = L3_2
    L7_2 = L3_2.Name
    L7_2 = L7_2(L8_2)
    L8_2 = " ^T^MRACEWI"
    L4_2 = L6_2 .. L7_2 .. L8_2
    L5_2 = 2
  end
  L6_2 = DisplayFinalWinLoseMessage
  L7_2 = L5_2
  L8_2 = L4_2
  L6_2(L7_2, L8_2)
  L6_2 = main
  L6_2 = L6_2.scores
  L7_2 = L6_2
  L6_2 = L6_2.ToggleUpdate
  L8_2 = false
  L6_2(L7_2, L8_2)
  L6_2 = main
  L6_2 = L6_2.scores
  L7_2 = L6_2
  L6_2 = L6_2.Show
  L8_2 = true
  L6_2(L7_2, L8_2)
  L6_2 = Wait
  L7_2 = 12000
  L6_2(L7_2)
  L6_2 = main
  L6_2 = L6_2.scores
  L7_2 = L6_2
  L6_2 = L6_2.Hide
  L6_2(L7_2)
  L6_2 = main
  L7_2 = L6_2
  L6_2 = L6_2.EndGame
  L6_2(L7_2)
  L6_2 = main
  L6_2 = L6_2.game
  L7_2 = L6_2
  L6_2 = L6_2.CleanUp
  L6_2(L7_2)
end
L0_1.DisplayWinnerMsg = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L2_2 = A0_2.track
  L3_2 = startGrid
  L4_2 = {}
  if A1_2 == nil then
    A1_2 = 1
  end
  L5_2 = A1_2
  L7_2 = A0_2
  L6_2 = A0_2.GetIronManWaterZ
  L8_2 = A1_2
  L6_2 = L6_2(L7_2, L8_2)
  L7_2 = L2_2[L5_2]
  L7_2 = L7_2[1]
  L7_2 = L7_2[1]
  L4_2[1] = L7_2
  L7_2 = L2_2[L5_2]
  L7_2 = L7_2[1]
  L7_2 = L7_2[2]
  L4_2[2] = L7_2
  L7_2 = L2_2[L5_2]
  L7_2 = L7_2[2]
  L4_2[3] = L7_2
  L7_2 = FindGroundZFor3DCoord
  L8_2 = L4_2
  L7_2 = L7_2(L8_2)
  if 100 < L7_2 then
    L4_2[3] = L6_2
  else
    L4_2[3] = L7_2
  end
  L8_2 = IsIronManRace
  L8_2 = L8_2()
  if L8_2 then
    L9_2 = A0_2
    L8_2 = A0_2.GetIronmanModelId
    L10_2 = L5_2
    L8_2 = L8_2(L9_2, L10_2)
    L9_2 = HunterModel
    L9_2 = L9_2()
    if L8_2 == L9_2 then
      L8_2 = L2_2[L5_2]
      L8_2 = L8_2[2]
      L4_2[3] = L8_2
    end
  end
  L8_2 = ClearArea
  L9_2 = L4_2
  L10_2 = 10
  L8_2(L9_2, L10_2)
  L8_2 = Wait
  L9_2 = 250
  L8_2(L9_2)
  L8_2 = 1
  goto lbl_93
  repeat
    L9_2 = 1
    L10_2 = IsIronManRace
    L10_2 = L10_2()
    if L10_2 then
      L9_2 = L5_2 - L8_2
      if L9_2 < 1 then
        L9_2 = 2
      end
    else
      L9_2 = L5_2 - L8_2
      if L9_2 < 1 then
        L10_2 = table
        L10_2 = L10_2.getn
        L11_2 = L2_2
        L10_2 = L10_2(L11_2)
        L9_2 = L9_2 + L10_2
      end
    end
    if L9_2 == nil then
      L9_2 = 1
    end
    L10_2 = L2_2[L9_2]
    L10_2 = L10_2[1]
    L10_2 = L10_2[1]
    L4_2[1] = L10_2
    L10_2 = L2_2[L9_2]
    L10_2 = L10_2[1]
    L10_2 = L10_2[2]
    L4_2[2] = L10_2
    L10_2 = L2_2[L9_2]
    L10_2 = L10_2[2]
    L4_2[3] = L10_2
    L10_2 = ClearArea
    L11_2 = L4_2
    L12_2 = 10
    L10_2(L11_2, L12_2)
    L10_2 = Wait
    L11_2 = 250
    L10_2(L11_2)
    L8_2 = L8_2 + 1
    ::lbl_93::
    L9_2 = CheckObjectSpawnPosition
    L10_2 = L4_2
    L11_2 = 8
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = false
  until L9_2 ~= L10_2
  return L4_2
end
L0_1.GenerateCarRespawnPos = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2
  L1_2 = print
  L2_2 = "getting the big track data"
  L1_2(L2_2)
  L1_2 = nil
  L2_2 = IsIronManRace
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = print
    L3_2 = "I am I.R.O.N - M.A.N"
    L2_2(L3_2)
    L2_2 = GameScoreLimit
    L3_2 = 1
    L2_2(L3_2)
    L2_2 = UseLCFiles
    L2_2 = L2_2()
    if L2_2 then
      L2_2 = dofile
      L3_2 = GetDiskPrepend
      L3_2 = L3_2()
      L4_2 = "LUA/IronManTrackData.lua.lc"
      L3_2 = L3_2 .. L4_2
      L2_2 = L2_2(L3_2)
      L1_2 = L2_2
    else
      L2_2 = dofile
      L3_2 = GetDiskPrepend
      L3_2 = L3_2()
      L4_2 = "LUA/IronManTrackData.lua"
      L3_2 = L3_2 .. L4_2
      L2_2 = L2_2(L3_2)
      L1_2 = L2_2
    end
    L2_2 = {}
    L3_2 = {}
    L4_2 = nil
    L5_2 = nil
    L6_2 = nil
    L7_2 = nil
    L8_2 = nil
    L9_2 = nil
    L10_2 = nil
    L11_2 = nil
    L12_2 = L1_2
    L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2 = L12_2()
    L11_2 = L21_2
    L10_2 = L20_2
    L9_2 = L19_2
    L8_2 = L18_2
    L7_2 = L17_2
    L6_2 = L16_2
    L5_2 = L15_2
    L4_2 = L14_2
    L2_2 = L13_2
    L3_2 = L12_2
    L12_2 = table
    L12_2 = L12_2.clone
    L13_2 = L3_2
    L12_2 = L12_2(L13_2)
    A0_2.track = L12_2
    L12_2 = table
    L12_2 = L12_2.clone
    L13_2 = L2_2
    L12_2 = L12_2(L13_2)
    A0_2.myLegVehicles = L12_2
    A0_2.leg1Veh = L4_2
    A0_2.leg2Veh = L5_2
    A0_2.leg3Veh = L6_2
    A0_2.leg4Veh = L7_2
    A0_2.numWPLeg1 = L8_2
    A0_2.numWPLeg2 = L9_2
    A0_2.numWPLeg3 = L10_2
    A0_2.numWPLeg4 = L11_2
    L1_2 = nil
    L12_2 = collectgarbage
    L12_2()
  else
    L2_2 = print
    L3_2 = "standard checkpoint race"
    L2_2(L3_2)
    L2_2 = IsJetskiRace
    L2_2 = L2_2()
    if L2_2 then
      L2_2 = UseLCFiles
      L2_2 = L2_2()
      if L2_2 then
        L2_2 = dofile
        L3_2 = GetDiskPrepend
        L3_2 = L3_2()
        L4_2 = "LUA/JetSkiRaceData.lua.lc"
        L3_2 = L3_2 .. L4_2
        L2_2 = L2_2(L3_2)
        L1_2 = L2_2
      else
        L2_2 = dofile
        L3_2 = GetDiskPrepend
        L3_2 = L3_2()
        L4_2 = "LUA/JetSkiRaceData.lua"
        L3_2 = L3_2 .. L4_2
        L2_2 = L2_2(L3_2)
        L1_2 = L2_2
      end
    else
      L2_2 = UseLCFiles
      L2_2 = L2_2()
      if L2_2 then
        L2_2 = dofile
        L3_2 = GetDiskPrepend
        L3_2 = L3_2()
        L4_2 = "LUA/MultiRaceTrackData.lua.lc"
        L3_2 = L3_2 .. L4_2
        L2_2 = L2_2(L3_2)
        L1_2 = L2_2
      else
        L2_2 = dofile
        L3_2 = GetDiskPrepend
        L3_2 = L3_2()
        L4_2 = "LUA/MultiRaceTrackData.lua"
        L3_2 = L3_2 .. L4_2
        L2_2 = L2_2(L3_2)
        L1_2 = L2_2
      end
    end
    L2_2 = {}
    L3_2 = L1_2
    L3_2 = L3_2()
    L2_2 = L3_2
    L3_2 = table
    L3_2 = L3_2.clone
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    A0_2.track = L3_2
    L3_2 = print
    L4_2 = "track has "
    L5_2 = table
    L5_2 = L5_2.getn
    L6_2 = A0_2.track
    L5_2 = L5_2(L6_2)
    L6_2 = " waypoints"
    L4_2 = L4_2 .. L5_2 .. L6_2
    L3_2(L4_2)
    L3_2 = print
    L4_2 = "Memory with big track in ..."
    L3_2(L4_2)
    L3_2 = DoMemoryPrint
    L3_2()
    L1_2 = nil
    L3_2 = collectgarbage
    L3_2()
    L3_2 = print
    L4_2 = "Memory with big track out ..."
    L3_2(L4_2)
    L3_2 = DoMemoryPrint
    L3_2()
  end
  L2_2 = Wait
  L3_2 = 5
  L2_2(L3_2)
  L2_2 = IsServer
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = AllPlayers
    L2_2 = L2_2()
    L3_2 = table
    L3_2 = L3_2.getn
    L4_2 = L2_2
    L3_2 = L3_2(L4_2)
    L4_2 = print
    L5_2 = "Num Players == "
    L6_2 = L3_2
    L5_2 = L5_2 .. L6_2
    L4_2(L5_2)
    L4_2 = math
    L4_2 = L4_2.random
    L5_2 = 0
    L6_2 = L3_2
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = print
    L6_2 = "Calc Shift : "
    L7_2 = L4_2
    L6_2 = L6_2 .. L7_2
    L5_2(L6_2)
    L6_2 = A0_2
    L5_2 = A0_2.SendGridSnuffleMessage
    L7_2 = Player
    L7_2 = L7_2()
    L8_2 = L7_2
    L7_2 = L7_2.PlayerNum
    L7_2 = L7_2(L8_2)
    L8_2 = L4_2
    L5_2(L6_2, L7_2, L8_2)
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
  L2_2 = print
  L3_2 = "GOT TO THE END OF INITTRACK"
  L2_2(L3_2)
end
L0_1.InitTrack = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L4_2 = print
  L5_2 = "REGISTER PLAYER KILL: "
  L7_2 = A1_2
  L6_2 = A1_2.Name
  L6_2 = L6_2(L7_2)
  L7_2 = " killed "
  L9_2 = A2_2
  L8_2 = A2_2.Name
  L8_2 = L8_2(L9_2)
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
  L4_2(L5_2)
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
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2
  L1_2 = 4
  return L1_2
end
L0_1.GetNumIronManLegChanges = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = RESPOT_TIME
  L2_2 = A0_2.respotCounter
  L1_2 = L1_2 - L2_2
  L1_2 = L1_2 / 1000
  return L1_2
end
L0_1.GetTimeBeforeRespot = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  if A1_2 == nil then
    L2_2 = print
    L3_2 = "NULL PLAYER in GetTotalCheckpointsCompleted"
    L2_2(L3_2)
    L2_2 = 1
    return L2_2
  end
  L2_2 = A0_2.allCheckPointsCompleted
  L3_2 = A1_2 + 1
  L2_2 = L2_2[L3_2]
  return L2_2
end
L0_1.GetTotalCheckpointsCompleted = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A1_2 == nil then
    L2_2 = print
    L3_2 = "NULL PLAYER in GetCheckpointsCompletedThisLap"
    L2_2(L3_2)
    L2_2 = 1
    return L2_2
  end
  L2_2 = A0_2.allCheckPointsCompleted
  L3_2 = A1_2 + 1
  L2_2 = L2_2[L3_2]
  L4_2 = A0_2
  L3_2 = A0_2.GetCurrentLapNumber
  L5_2 = A1_2
  L3_2 = L3_2(L4_2, L5_2)
  L3_2 = L3_2 - 1
  L5_2 = A0_2
  L4_2 = A0_2.GetNumberOfCheckpointsInLap
  L4_2 = L4_2(L5_2)
  L4_2 = L3_2 * L4_2
  L2_2 = L2_2 - L4_2
  if L2_2 < 0 then
    L2_2 = 0
  end
  return L2_2
end
L0_1.GetCheckpointsCompletedThisLap = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A1_2 == nil then
    return
  end
  L2_2 = A0_2.allCheckPointsCompleted
  L3_2 = A1_2 + 1
  L4_2 = A0_2.allCheckPointsCompleted
  L5_2 = A1_2 + 1
  L4_2 = L4_2[L5_2]
  L4_2 = L4_2 + 1
  L2_2[L3_2] = L4_2
end
L0_1.IncrementCheckpointsCompleted = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  if A1_2 == nil then
    return
  end
  L2_2 = A0_2.allCurrentLap
  L3_2 = A1_2 + 1
  L4_2 = A0_2.allCurrentLap
  L5_2 = A1_2 + 1
  L4_2 = L4_2[L5_2]
  L4_2 = L4_2 + 1
  L2_2[L3_2] = L4_2
end
L0_1.IncrementCurrentLapNumber = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = Player
  L1_2 = L1_2()
  if L1_2 == nil then
    L2_2 = false
    return L2_2
  end
  L2_2 = A0_2.allRacePositions
  L4_2 = L1_2
  L3_2 = L1_2.PlayerNum
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 + 1
  L2_2 = L2_2[L3_2]
  if L2_2 == 1 then
    L2_2 = true
    return L2_2
  else
    L2_2 = false
    return L2_2
  end
end
L0_1.AmILeadingTheRace = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  if A1_2 == nil then
    L2_2 = 1
    return L2_2
  end
  L2_2 = A0_2.allCurrentLap
  L3_2 = A1_2 + 1
  L2_2 = L2_2[L3_2]
  return L2_2
end
L0_1.GetCurrentLapNumber = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  if A1_2 == nil then
    L2_2 = 8
    return L2_2
  end
  L2_2 = A0_2.allRacePositions
  L3_2 = A1_2 + 1
  L2_2 = L2_2[L3_2]
  return L2_2
end
L0_1.GetRacePosition = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = table
  L1_2 = L1_2.getn
  L2_2 = A0_2.track
  return L1_2(L2_2)
end
L0_1.GetNumberOfCheckpointsInLap = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L3_2 = A0_2
  L2_2 = A0_2.GetRacePosition
  L5_2 = A1_2
  L4_2 = A1_2.PlayerNum
  L4_2, L5_2 = L4_2(L5_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2)
  L2_2 = 8 - L2_2
  return L2_2
end
L0_1.Score = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = A1_2 * 64
  L3_2 = 3 + L3_2
  L4_2 = A2_2 * 512
  L3_2 = L3_2 + L4_2
  L4_2 = SendEvent
  L5_2 = L3_2
  L4_2(L5_2)
end
L0_1.SendCheckpointHitMessage = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = MSG_LAP_COMPLETED
  L3_2 = A1_2 * 64
  L2_2 = L2_2 + L3_2
  L3_2 = SendEvent
  L4_2 = L2_2
  L3_2(L4_2)
end
L0_1.SendLapCompleteMessage = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = MSG_RACE_POSITION_CHANGED
  L4_2 = A1_2 * 64
  L3_2 = L3_2 + L4_2
  L4_2 = A2_2 * 512
  L3_2 = L3_2 + L4_2
  L4_2 = SendEvent
  L5_2 = L3_2
  L4_2(L5_2)
end
L0_1.SendRacePositionChangedMessage = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = MSG_GRID_SHUFFLE
  L4_2 = A1_2 * 64
  L3_2 = L3_2 + L4_2
  L4_2 = A2_2 * 512
  L3_2 = L3_2 + L4_2
  L4_2 = SendEvent
  L5_2 = L3_2
  L4_2(L5_2)
end
L0_1.SendGridSnuffleMessage = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = MSG_RACE_OVER
  L3_2 = A1_2 * 64
  L2_2 = L2_2 + L3_2
  L3_2 = SendEvent
  L4_2 = L2_2
  L3_2(L4_2)
end
L0_1.SendRaceOverMessage = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = MSG_RESPAWN_OK
  L3_2 = A1_2 * 64
  L2_2 = L2_2 + L3_2
  L3_2 = SendEvent
  L4_2 = L2_2
  L3_2(L4_2)
end
L0_1.SendOkToRespawnMessage = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = MSG_REQUEST_RESPAWN
  L3_2 = A1_2 * 64
  L2_2 = L2_2 + L3_2
  L3_2 = SendEvent
  L4_2 = L2_2
  L3_2(L4_2)
end
L0_1.SendRequestRespawnMessage = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = MSG_RESPAWN_DONE
  L3_2 = A1_2 * 64
  L2_2 = L2_2 + L3_2
  L3_2 = SendEvent
  L4_2 = L2_2
  L3_2(L4_2)
end
L0_1.SendRespawnDoneMessage = L1_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = print
  L1_2 = "lua Main()"
  L0_2(L1_2)
  L0_2 = MainLoop
  L1_2 = {}
  L0_2 = L0_2(L1_2)
  main = L0_2
  L0_2 = GenerateAmbients
  L1_2 = false
  L0_2(L1_2)
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
  L0_2 = nil
  L1_2 = UseLCFiles
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = IsIronManRace
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = dofile
      L2_2 = GetDiskPrepend
      L2_2 = L2_2()
      L3_2 = "LUA/IronManTrackData.lua.lc"
      L2_2 = L2_2 .. L3_2
      L1_2 = L1_2(L2_2)
      L0_2 = L1_2
    else
      L1_2 = IsJetskiRace
      L1_2 = L1_2()
      if L1_2 then
        L1_2 = dofile
        L2_2 = GetDiskPrepend
        L2_2 = L2_2()
        L3_2 = "LUA/JetSkiRaceData.lua.lc"
        L2_2 = L2_2 .. L3_2
        L1_2 = L1_2(L2_2)
        L0_2 = L1_2
      else
        L1_2 = dofile
        L2_2 = GetDiskPrepend
        L2_2 = L2_2()
        L3_2 = "LUA/MultiRaceTrackData.lua.lc"
        L2_2 = L2_2 .. L3_2
        L1_2 = L1_2(L2_2)
        L0_2 = L1_2
      end
    end
  else
    L1_2 = IsIronManRace
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = dofile
      L2_2 = GetDiskPrepend
      L2_2 = L2_2()
      L3_2 = "LUA/IronManTrackData.lua"
      L2_2 = L2_2 .. L3_2
      L1_2 = L1_2(L2_2)
      L0_2 = L1_2
    else
      L1_2 = IsJetskiRace
      L1_2 = L1_2()
      if L1_2 then
        L1_2 = dofile
        L2_2 = GetDiskPrepend
        L2_2 = L2_2()
        L3_2 = "LUA/JetSkiRaceData.lua"
        L2_2 = L2_2 .. L3_2
        L1_2 = L1_2(L2_2)
        L0_2 = L1_2
      else
        L1_2 = dofile
        L2_2 = GetDiskPrepend
        L2_2 = L2_2()
        L3_2 = "LUA/MultiRaceTrackData.lua"
        L2_2 = L2_2 .. L3_2
        L1_2 = L1_2(L2_2)
        L0_2 = L1_2
      end
    end
  end
  L1_2 = L0_2
  L1_2 = L1_2()
  L2_2 = print
  L3_2 = "lua->CreatePlayer()"
  L2_2(L3_2)
  L2_2 = CreatePlayer
  L3_2 = unpack
  L4_2 = L1_2[1]
  L4_2 = L4_2[1]
  L3_2, L4_2 = L3_2(L4_2)
  L2_2(L3_2, L4_2)
  goto lbl_108
  repeat
    L2_2 = Wait
    L3_2 = 10
    L2_2(L3_2)
    ::lbl_108::
    L2_2 = IsPlayerCreationQueued
    L2_2 = L2_2()
  until not L2_2
  L0_2 = nil
  L1_2 = nil
  L2_2 = collectgarbage
  L2_2()
  L2_2 = PlayerName
  L3_2 = HostName
  L3_2, L4_2 = L3_2()
  L2_2(L3_2, L4_2)
  L2_2 = main
  L3_2 = Turismo
  L3_2 = L3_2()
  L4_2 = L3_2
  L3_2 = L3_2.Start
  L3_2 = L3_2(L4_2)
  L2_2.game = L3_2
  L2_2 = main
  L3_2 = L2_2
  L2_2 = L2_2.Start
  L2_2(L3_2)
end
Main = L0_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = nil
  L3_2 = print
  L4_2 = "Setting iron man model index "
  L5_2 = GameLocation
  L5_2 = L5_2()
  L6_2 = " "
  L7_2 = RaceId
  L7_2 = L7_2()
  L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
  L3_2(L4_2)
  L3_2 = A0_2.numWPLeg1
  L4_2 = A0_2.numWPLeg2
  L3_2 = L3_2 + L4_2
  L4_2 = A0_2.numWPLeg3
  L3_2 = L3_2 + L4_2
  if A1_2 > L3_2 then
    L3_2 = print
    L4_2 = "A"
    L3_2(L4_2)
    L2_2 = A0_2.leg4Veh
  else
    L3_2 = A0_2.numWPLeg1
    L4_2 = A0_2.numWPLeg2
    L3_2 = L3_2 + L4_2
    if A1_2 > L3_2 then
      L3_2 = print
      L4_2 = "B"
      L3_2(L4_2)
      L2_2 = A0_2.leg3Veh
    else
      L3_2 = A0_2.numWPLeg1
      if A1_2 > L3_2 then
        L3_2 = print
        L4_2 = "C"
        L3_2(L4_2)
        L2_2 = A0_2.leg2Veh
      else
        L3_2 = print
        L4_2 = "D"
        L5_2 = A0_2.leg1Veh
        L4_2 = L4_2 .. L5_2
        L3_2(L4_2)
        L2_2 = A0_2.leg1Veh
      end
    end
  end
  return L2_2
end
L0_1.GetIronmanModelId = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.track
  L2_2 = L2_2[A1_2]
  L2_2 = L2_2[1]
  L2_2 = L2_2[3]
  return L2_2
end
L0_1.GetIronManWaterZ = L1_1
L0_1 = Turismo
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.Car
  L2_2 = L2_2(L3_2)
  if L2_2 ~= nil then
    L3_2 = L1_2
    L2_2 = L1_2.Car
    L2_2 = L2_2(L3_2)
    L4_2 = A0_2
    L3_2 = A0_2.KickDriverOutOfCar
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
    L3_2 = VehicleSetCarDoorLocks
    L4_2 = L2_2
    L5_2 = CARLOCK_LOCKED
    L3_2(L4_2, L5_2)
  end
  L2_2 = coreLib
  L3_2 = L2_2
  L2_2 = L2_2.Commentate
  L4_2 = "^T^MPQDCL"
  L2_2(L3_2, L4_2)
end
L0_1.DoIronManLegChange = L1_1
L0_1 = RaceKickOutOfCar
function L1_1(A0_2)
  local L1_2
end
L0_1.Cleanup = L1_1
L0_1 = Turismo
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = print
  L3_2 = "Kick driver out of car"
  L2_2(L3_2)
  L2_2 = RaceKickOutOfCar
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
L0_1 = RaceKickOutOfCar
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
