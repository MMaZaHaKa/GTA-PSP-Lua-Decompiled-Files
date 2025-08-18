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
ServerLogic = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
MessagePump = L0_1
L0_1 = PowerupTimer
L0_1 = L0_1()
PowerUpTimer = L0_1
L0_1 = 16777215
EVENTMASK_NONE = L0_1
L0_1 = 14680064
EVENTMASK_TYPE = L0_1
L0_1 = 1966080
EVENTMASK_PARAM1 = L0_1
L0_1 = 131008
EVENTMASK_PARAM2 = L0_1
L0_1 = 127
EVENTMASK_PARAM3 = L0_1
L0_1 = 21
EVENTSHIFT_TYPE = L0_1
L0_1 = 17
EVENTSHIFT_PARAM1 = L0_1
L0_1 = 7
EVENTSHIFT_PARAM2 = L0_1
L0_1 = 0
EVENTSHIFT_PARAM3 = L0_1
L0_1 = 1
MSG_END_GAME = L0_1
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
  L1_2 = "StateRunning"
  return L1_2
end
L0_1.StateInit = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "Game Cleanup"
  L1_2(L2_2)
  L1_2 = A0_2.myMessagePump
  L2_2 = L1_2
  L1_2 = L1_2.Stop
  L1_2(L2_2)
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.ServerLogic
    L2_2 = L1_2
    L1_2 = L1_2.Stop
    L1_2(L2_2)
  end
  L1_2 = collectgarbage
  L1_2()
end
L0_1.CleanUp = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.ToggleEndOfGame
  L3_2 = false
  L1_2(L2_2, L3_2)
  A0_2.gameWinner = nil
  L1_2 = GameElapsedMs
  L2_2 = 0
  L1_2(L2_2)
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = UsePowerups
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = PowerUpTimer
      L2_2 = L1_2
      L1_2 = L1_2.Start
      L1_2(L2_2)
    end
    L1_2 = ServerLogic
    L1_2 = L1_2()
    A0_2.ServerLogic = L1_2
    L1_2 = A0_2.ServerLogic
    L2_2 = L1_2
    L1_2 = L1_2.Start
    L1_2(L2_2)
  end
  L1_2 = MessagePump
  L1_2 = L1_2()
  A0_2.myMessagePump = L1_2
  L1_2 = A0_2.myMessagePump
  L2_2 = L1_2
  L1_2 = L1_2.Start
  L1_2(L2_2)
  L1_2 = ClearSplashScreen
  L1_2()
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = A0_2
  L2_2 = A0_2.GetPlayerRespawnPosition
  L2_2 = L2_2(L3_2)
  L4_2 = L1_2
  L3_2 = L1_2.Respawn
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
end
L0_1.InitGame = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.IsEndOfGame
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.CheckForRespawn
    L1_2(L2_2)
    L1_2 = collectgarbage
    L1_2()
    L1_2 = Wait
    L2_2 = 10
    L1_2(L2_2)
  else
    L1_2 = Player
    L1_2 = L1_2()
    L3_2 = L1_2
    L2_2 = L1_2.PlayerNum
    L2_2 = L2_2(L3_2)
    L3_2 = A0_2.gameWinner
    if L2_2 == L3_2 then
      L2_2 = DisplayFinalWinLoseMessage
      L3_2 = 1
      L4_2 = ""
      L2_2(L3_2, L4_2)
    else
      L2_2 = DisplayFinalWinLoseMessage
      L3_2 = 2
      L4_2 = ""
      L2_2(L3_2, L4_2)
    end
    L2_2 = main
    L2_2 = L2_2.scores
    L3_2 = L2_2
    L2_2 = L2_2.ToggleUpdate
    L4_2 = false
    L2_2(L3_2, L4_2)
    L2_2 = main
    L2_2 = L2_2.scores
    L3_2 = L2_2
    L2_2 = L2_2.Show
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = Wait
    L3_2 = 12000
    L2_2(L3_2)
    L2_2 = main
    L2_2 = L2_2.scores
    L3_2 = L2_2
    L2_2 = L2_2.Hide
    L2_2(L3_2)
    L2_2 = main
    L3_2 = L2_2
    L2_2 = L2_2.EndGame
    L2_2(L3_2)
    L3_2 = A0_2
    L2_2 = A0_2.CleanUp
    L2_2(L3_2)
  end
end
L0_1.StateRunning = L1_1
L0_1 = ServerLogic
function L1_1(A0_2)
  local L1_2, L2_2
  while 1 do
    L1_2 = Wait
    L2_2 = 10
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
  end
end
L0_1.CheckForRespawn = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
  end
end
L0_1.UpdateRadar = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = {}
  L3_2 = DoSpawn
  L4_2 = nil
  L5_2 = false
  L3_2 = L3_2(L4_2, L5_2)
  L2_2 = L3_2
  return L2_2
end
L0_1.GetPlayerRespawnPosition = L1_1
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
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = 10
  return L2_2
end
L0_1.Score = L1_1
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
  L7_2 = EVENTMASK_NONE
  L8_2 = EVENTSHIFT_TYPE
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = MaskEventNumber
  L7_2 = A2_2
  L8_2 = EVENTMASK_NONE
  L9_2 = EVENTSHIFT_PARAM1
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2 + L6_2
  L6_2 = MaskEventNumber
  L7_2 = A3_2
  L8_2 = EVENTMASK_NONE
  L9_2 = EVENTSHIFT_PARAM2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2 + L6_2
  L6_2 = MaskEventNumber
  L7_2 = A4_2
  L8_2 = EVENTMASK_NONE
  L9_2 = EVENTSHIFT_PARAM3
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2 + L6_2
  L6_2 = SendEvent
  L7_2 = L5_2
  L6_2(L7_2)
end
L0_1.SendEvent = L1_1
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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
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
      L5_2 = EVENTMASK_TYPE
      L6_2 = EVENTSHIFT_TYPE
      L6_2 = -L6_2
      L3_2 = L3_2(L4_2, L5_2, L6_2)
      L4_2 = MaskEventNumber
      L5_2 = L2_2
      L6_2 = EVENTMASK_PARAM1
      L7_2 = EVENTSHIFT_PARAM1
      L7_2 = -L7_2
      L4_2 = L4_2(L5_2, L6_2, L7_2)
      L5_2 = MaskEventNumber
      L6_2 = L2_2
      L7_2 = EVENTMASK_PARAM2
      L8_2 = EVENTSHIFT_PARAM2
      L8_2 = -L8_2
      L5_2 = L5_2(L6_2, L7_2, L8_2)
      L6_2 = MaskEventNumber
      L7_2 = L2_2
      L8_2 = EVENTMASK_PARAM3
      L9_2 = EVENTSHIFT_PARAM3
      L9_2 = -L9_2
      L6_2 = L6_2(L7_2, L8_2, L9_2)
      L7_2 = MSG_END_GAME
      if L3_2 == L7_2 then
        L7_2 = print
        L8_2 = "MSG_END_GAME"
        L7_2(L8_2)
        L7_2 = coreLib
        L8_2 = L7_2
        L7_2 = L7_2.ToggleEndOfGame
        L9_2 = true
        L7_2(L8_2, L9_2)
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
