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
VIP = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
ServerLogic = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
MessagePump = L0_1
L0_1 = 0
teamId1 = L0_1
L0_1 = 1
teamId2 = L0_1
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
L0_1 = 2
MSG_BRIEFCASE_COLLECTED = L0_1
L0_1 = 3
MSG_YOU_ARE_THE_VIP = L0_1
L0_1 = 4
MSG_GETAWAY = L0_1
L0_1 = 5
MSG_CREATE_BRIEFCASE = L0_1
L0_1 = 0
STATE_GETTING_THE_CASES = L0_1
L0_1 = 1
STATE_GETAWAY = L0_1
L0_1 = VIP
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
L0_1 = VIP
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
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = {}
  A0_2.briefCasesSpawnPoints = L1_2
  L1_2 = {}
  A0_2.playerSpawnPointsInitial = L1_2
  L1_2 = {}
  A0_2.getawayExitPoints = L1_2
  L1_2 = {}
  A0_2.playerRespawnPoints = L1_2
  L1_2 = nil
  L2_2 = UseLCFiles
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = dofile
    L3_2 = GetDiskPrepend
    L3_2 = L3_2()
    L4_2 = "LUA/VipData.lua.lc"
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  else
    L2_2 = dofile
    L3_2 = GetDiskPrepend
    L3_2 = L3_2()
    L4_2 = "LUA/VipData.lua"
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  end
  L2_2 = {}
  L3_2 = {}
  L4_2 = {}
  L5_2 = {}
  L6_2 = L1_2
  L6_2, L7_2, L8_2, L9_2 = L6_2()
  L5_2 = L9_2
  L4_2 = L8_2
  L3_2 = L7_2
  L2_2 = L6_2
  L6_2 = table
  L6_2 = L6_2.clone
  L7_2 = L2_2
  L6_2 = L6_2(L7_2)
  A0_2.briefCasesSpawnPoints = L6_2
  L6_2 = table
  L6_2 = L6_2.clone
  L7_2 = L3_2
  L6_2 = L6_2(L7_2)
  A0_2.playerSpawnPointsInitial = L6_2
  L6_2 = table
  L6_2 = L6_2.clone
  L7_2 = L4_2
  L6_2 = L6_2(L7_2)
  A0_2.getawayExitPoints = L6_2
  L6_2 = table
  L6_2 = L6_2.clone
  L7_2 = L5_2
  L6_2 = L6_2(L7_2)
  A0_2.playerRespawnPoints = L6_2
  L1_2 = nil
  L6_2 = collectgarbage
  L6_2()
  L6_2 = coreLib
  L7_2 = L6_2
  L6_2 = L6_2.ToggleEndOfGame
  L8_2 = false
  L6_2(L7_2, L8_2)
  A0_2.gameWinner = nil
  L6_2 = GameElapsedMs
  L7_2 = 0
  L6_2(L7_2)
  A0_2.briefcasesCollected = 0
  L6_2 = MessagePump
  L6_2 = L6_2()
  A0_2.myMessagePump = L6_2
  L6_2 = A0_2.myMessagePump
  L7_2 = L6_2
  L6_2 = L6_2.Start
  L6_2(L7_2)
  A0_2.lastBriefCase = 1
  A0_2.vipTeam = nil
  A0_2.vipPeerId = nil
  A0_2.initialSpawnBlock = nil
  L6_2 = IsServer
  L6_2 = L6_2()
  if L6_2 then
    L6_2 = STATE_GETTING_THE_CASES
    A0_2.gameState = L6_2
    L6_2 = false
    L7_2 = VipTeam
    L7_2 = L7_2()
    A0_2.vipTeam = L7_2
    L7_2 = 0
    while not L6_2 and L7_2 < 200 do
      L8_2 = math
      L8_2 = L8_2.random
      L9_2 = 0
      L10_2 = coreLib
      L11_2 = L10_2
      L10_2 = L10_2.GetNumberOfPlayers
      L10_2 = L10_2(L11_2)
      L10_2 = L10_2 - 1
      L8_2 = L8_2(L9_2, L10_2)
      A0_2.vipPeerId = L8_2
      L8_2 = Player
      L9_2 = A0_2.vipPeerId
      L8_2 = L8_2(L9_2)
      A0_2.vipPlayer = L8_2
      L8_2 = A0_2.vipPlayer
      L9_2 = L8_2
      L8_2 = L8_2.TeamId
      L8_2 = L8_2(L9_2)
      L9_2 = A0_2.vipTeam
      if L8_2 == L9_2 then
        L6_2 = true
      end
      L7_2 = L7_2 + 1
    end
    L8_2 = 1
    L9_2 = table
    L9_2 = L9_2.getn
    L10_2 = A0_2.playerSpawnPointsInitial
    L9_2 = L9_2(L10_2)
    L9_2 = L9_2 / 6
    L9_2 = L9_2 - 1
    L10_2 = math
    L10_2 = L10_2.random
    L11_2 = 0
    L12_2 = L9_2
    L10_2 = L10_2(L11_2, L12_2)
    L8_2 = L10_2
    L11_2 = A0_2
    L10_2 = A0_2.SendEvent
    L12_2 = MSG_YOU_ARE_THE_VIP
    L13_2 = A0_2.vipPeerId
    L14_2 = A0_2.vipPlayer
    L15_2 = L14_2
    L14_2 = L14_2.TeamId
    L14_2 = L14_2(L15_2)
    L15_2 = L8_2
    L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
    L11_2 = A0_2
    L10_2 = A0_2.SpawnBriefCase
    L10_2(L11_2)
    L10_2 = {}
    L11_2 = A0_2.vipPlayer
    L12_2 = L11_2
    L11_2 = L11_2.Position
    L11_2 = L11_2(L12_2)
    L10_2 = L11_2
    if L10_2 ~= nil then
      L11_2 = AddBlipForCoord
      L12_2 = GetEveryonePeerGroupId
      L12_2 = L12_2()
      L13_2 = A0_2.vipPlayer
      L14_2 = L13_2
      L13_2 = L13_2.Position
      L13_2 = L13_2(L14_2)
      L14_2 = 3
      L15_2 = pickupicon
      L15_2 = L15_2.targetplayer
      L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
      A0_2.vipBlip = L11_2
      L11_2 = SetRadarBlipColour
      L12_2 = A0_2.vipBlip
      L13_2 = A0_2.vipPlayer
      L14_2 = L13_2
      L13_2 = L13_2.TeamColour
      L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
      L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
    end
    L11_2 = A0_2.briefcase
    L10_2 = L11_2[1]
    if L10_2 ~= nil then
      L11_2 = AddBlipForCoord
      L12_2 = A0_2.vipPlayer
      L13_2 = L12_2
      L12_2 = L12_2.TeamPeerGroup
      L12_2 = L12_2(L13_2)
      L13_2 = A0_2.briefcase
      L13_2 = L13_2[1]
      L14_2 = 3
      L15_2 = pickupicon
      L15_2 = L15_2.briefcase
      L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2)
      A0_2.briefcaseBlip = L11_2
    end
    A0_2.getawayBlip = nil
    A0_2.escapeWaypoint = nil
    A0_2.escapeBlip = nil
    L11_2 = NetMeter2d
    L12_2 = GetEveryonePeerGroupId
    L12_2 = L12_2()
    L13_2 = 370
    L14_2 = 70
    L15_2 = 48
    L16_2 = 15
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
    A0_2.vipHealthMeter = L11_2
    L11_2 = A0_2.vipHealthMeter
    L12_2 = L11_2
    L11_2 = L11_2.FillRatio
    L13_2 = 1
    L11_2(L12_2, L13_2)
    L11_2 = A0_2.vipHealthMeter
    L12_2 = L11_2
    L11_2 = L11_2.Colour
    L13_2 = A0_2.vipPlayer
    L14_2 = L13_2
    L13_2 = L13_2.TeamColour
    L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
    L11_2(L12_2, L13_2, L14_2, L15_2, L16_2)
    L11_2 = A0_2.vipHealthMeter
    L12_2 = L11_2
    L11_2 = L11_2.UseTitle
    L13_2 = 1
    L11_2(L12_2, L13_2)
    L11_2 = A0_2.vipHealthMeter
    L12_2 = L11_2
    L11_2 = L11_2.SetTitleKey
    L13_2 = "MPVIP7"
    L11_2(L12_2, L13_2)
    L11_2 = ServerLogic
    L11_2 = L11_2()
    A0_2.ServerLogic = L11_2
    L11_2 = A0_2.ServerLogic
    L12_2 = L11_2
    L11_2 = L11_2.Start
    L11_2(L12_2)
  end
  L6_2 = IsServer
  L6_2 = L6_2()
  if L6_2 then
    L6_2 = ServerReadyToGo
    L7_2 = true
    L6_2(L7_2)
    L6_2 = Wait
    L7_2 = 500
    L6_2(L7_2)
  end
  L6_2 = ClearSplashScreen
  L6_2()
  L6_2 = Player
  L6_2 = L6_2()
  L7_2 = {}
  L9_2 = A0_2
  L8_2 = A0_2.GetPlayerRespawnPositionInitial
  L8_2 = L8_2(L9_2)
  L7_2 = L8_2
  L9_2 = L6_2
  L8_2 = L6_2.Respawn
  L10_2 = L7_2
  L8_2(L9_2, L10_2)
end
L0_1.InitGame = L1_1
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2
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
    A0_2.state = "StateGameWon"
  end
end
L0_1.StateRunning = L1_1
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.TeamId
  L2_2 = L2_2(L3_2)
  L3_2 = A0_2.gameWinner
  if L2_2 == L3_2 then
    L2_2 = DisplayFinalWinLoseMessage
    L3_2 = 1
    L4_2 = ""
    L5_2 = A0_2.gameWinner
    L2_2(L3_2, L4_2, L5_2)
  else
    L2_2 = DisplayFinalWinLoseMessage
    L3_2 = 2
    L4_2 = ""
    L5_2 = A0_2.gameWinner
    L2_2(L3_2, L4_2, L5_2)
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
  L3_2 = 3000
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
  L2_2 = "StateRunning"
  return L2_2
end
L0_1.StateGameWon = L1_1
L0_1 = ServerLogic
function L1_1(A0_2)
  local L1_2, L2_2
  while 1 do
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.UpdateGameState
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.UpdateRadar
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.CheckForVipDisconnection
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.UpdateHud
    L1_2(L2_2)
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
L0_1 = VIP
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
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = PlayerHealth
    L2_2 = A0_2.vipPlayer
    L1_2 = L1_2(L2_2)
    L1_2 = L1_2 / 100
    L2_2 = A0_2.vipHealthMeter
    L3_2 = L2_2
    L2_2 = L2_2.FillRatio
    L4_2 = L1_2
    L2_2(L3_2, L4_2)
  end
end
L0_1.UpdateHud = L1_1
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = IsConnected
    L2_2 = A0_2.vipPlayer
    L1_2 = L1_2(L2_2)
    if not L1_2 then
      L1_2 = print
      L2_2 = "Vip has left the game"
      L1_2(L2_2)
      L1_2 = 0
      L2_2 = A0_2.vipTeam
      if L2_2 == 0 then
        L1_2 = 1
      end
      L3_2 = A0_2
      L2_2 = A0_2.SendEvent
      L4_2 = MSG_END_GAME
      L5_2 = L1_2
      L6_2 = 0
      L7_2 = 0
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    end
  end
end
L0_1.CheckForVipDisconnection = L1_1
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = {}
    L2_2 = A0_2.vipPlayer
    L3_2 = L2_2
    L2_2 = L2_2.Position
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
    if L1_2 ~= nil then
      L2_2 = UpdateBlipCoord
      L3_2 = A0_2.vipBlip
      L4_2 = A0_2.vipPlayer
      L5_2 = L4_2
      L4_2 = L4_2.Position
      L4_2, L5_2 = L4_2(L5_2)
      L2_2(L3_2, L4_2, L5_2)
    end
    L2_2 = A0_2.briefcasesCollected
    L3_2 = GameScoreLimit
    L3_2 = L3_2()
    if L2_2 < L3_2 then
      L2_2 = A0_2.briefcase
      L2_2 = L2_2[1]
      if L2_2 ~= nil then
        L2_2 = UpdateBlipCoord
        L3_2 = A0_2.briefcaseBlip
        L4_2 = A0_2.briefcase
        L4_2 = L4_2[1]
        L2_2(L3_2, L4_2)
      end
    else
      L2_2 = A0_2.briefcaseBlip
      if L2_2 ~= nil then
        L2_2 = RemoveBlip
        L3_2 = A0_2.briefcaseBlip
        L2_2(L3_2)
        A0_2.briefcaseBlip = nil
      end
    end
  end
end
L0_1.UpdateRadar = L1_1
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.gameState
    L2_2 = STATE_GETTING_THE_CASES
    if L1_2 == L2_2 then
      L1_2 = main
      L1_2 = L1_2.game
      L2_2 = L1_2
      L1_2 = L1_2.UpdateBriefCase
      L1_2(L2_2)
    else
      L1_2 = A0_2.gameState
      L2_2 = STATE_GETAWAY
      if L1_2 == L2_2 then
        L1_2 = main
        L1_2 = L1_2.game
        L2_2 = L1_2
        L1_2 = L1_2.UpdateGetaway
        L1_2(L2_2)
      end
    end
  end
end
L0_1.UpdateGameState = L1_1
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.vipPlayer
    L2_2 = L1_2
    L1_2 = L1_2.Position
    L1_2 = L1_2(L2_2)
    L2_2 = A0_2.briefcase
    L2_2 = L2_2[1]
    if L1_2 ~= nil and L2_2 ~= nil then
      L3_2 = Distance
      L4_2 = L1_2
      L5_2 = L2_2
      L3_2 = L3_2(L4_2, L5_2)
      if L3_2 <= 3 then
        L3_2 = A0_2.briefcasesCollected
        L3_2 = L3_2 + 1
        A0_2.briefcasesCollected = L3_2
        L3_2 = A0_2.briefcasesCollected
        L4_2 = GameScoreLimit
        L4_2 = L4_2()
        if L3_2 < L4_2 then
          L4_2 = A0_2
          L3_2 = A0_2.SendEvent
          L5_2 = MSG_BRIEFCASE_COLLECTED
          L6_2 = A0_2.briefcasesCollected
          L6_2 = L6_2 - 1
          L7_2 = 0
          L8_2 = 0
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
          L4_2 = A0_2
          L3_2 = A0_2.SpawnBriefCase
          L3_2(L4_2)
        end
        L3_2 = print
        L4_2 = "PICKED UP A BRIEFCASE "
        L5_2 = A0_2.briefcasesCollected
        L6_2 = " of "
        L7_2 = GameScoreLimit
        L7_2 = L7_2()
        L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2
        L3_2(L4_2)
      end
      L3_2 = A0_2.briefcasesCollected
      L4_2 = GameScoreLimit
      L4_2 = L4_2()
      if L3_2 >= L4_2 then
        L3_2 = STATE_GETAWAY
        A0_2.gameState = L3_2
        L3_2 = 10
        L4_2 = {}
        L6_2 = A0_2
        L5_2 = A0_2.GetExitPoint
        L5_2 = L5_2(L6_2)
        L4_2 = L5_2
        if L4_2 ~= nil then
          L5_2 = ClearPointerArrow
          L5_2()
          L5_2 = SetWaypoint
          L6_2 = A0_2.vipPlayer
          L7_2 = L6_2
          L6_2 = L6_2.PlayerNum
          L6_2 = L6_2(L7_2)
          L7_2 = L4_2
          L8_2 = L4_2
          L9_2 = 10
          L10_2 = 237
          L11_2 = 130
          L12_2 = 180
          L13_2 = 255
          L14_2 = 7 / 8
          L14_2 = L3_2 * L14_2
          L15_2 = 0
          L16_2 = false
          L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
          A0_2.escapeWaypoint = L5_2
          L5_2 = AddBlipForCoord
          L6_2 = A0_2.vipPlayer
          L7_2 = L6_2
          L6_2 = L6_2.TeamPeerGroup
          L6_2 = L6_2(L7_2)
          L7_2 = L4_2
          L8_2 = 5
          L9_2 = pickupicon
          L9_2 = L9_2.base
          L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
          A0_2.escapeBlip = L5_2
        end
        L6_2 = A0_2
        L5_2 = A0_2.SendEvent
        L7_2 = MSG_GETAWAY
        L8_2 = A0_2.vipTeam
        L9_2 = 0
        L10_2 = 0
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
      end
    end
  end
end
L0_1.UpdateBriefCase = L1_1
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = A0_2.escapeWaypoint
  if L1_2 ~= nil then
    L1_2 = A0_2.escapeWaypoint
    L2_2 = L1_2
    L1_2 = L1_2.HasBeenHit
    L1_2 = L1_2(L2_2)
    if L1_2 then
      L1_2 = A0_2.escapeWaypoint
      L2_2 = L1_2
      L1_2 = L1_2.Remove
      L1_2(L2_2)
      L2_2 = A0_2
      L1_2 = A0_2.SendEvent
      L3_2 = MSG_END_GAME
      L4_2 = A0_2.vipTeam
      L5_2 = 0
      L6_2 = 0
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
    end
  end
end
L0_1.UpdateGetaway = L1_1
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = print
    L2_2 = "SpawnBriefCase()"
    L1_2(L2_2)
    L1_2 = math
    L1_2 = L1_2.random
    L2_2 = 1
    L3_2 = table
    L3_2 = L3_2.getn
    L4_2 = A0_2.briefCasesSpawnPoints
    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L3_2(L4_2)
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    L2_2 = table
    L2_2 = L2_2.getn
    L3_2 = A0_2.briefCasesSpawnPoints
    L2_2 = L2_2(L3_2)
    if L1_2 >= L2_2 then
      L1_2 = 1
    end
    L2_2 = A0_2.lastBriefCase
    if L1_2 == L2_2 then
      if L1_2 == 1 then
        L1_2 = 2
      else
        L1_2 = 1
      end
    end
    L2_2 = print
    L3_2 = "num briefcases = "
    L4_2 = table
    L4_2 = L4_2.getn
    L5_2 = A0_2.briefCasesSpawnPoints
    L4_2 = L4_2(L5_2)
    L3_2 = L3_2 .. L4_2
    L2_2(L3_2)
    L2_2 = print
    L3_2 = "index == "
    L4_2 = L1_2
    L3_2 = L3_2 .. L4_2
    L2_2(L3_2)
    L2_2 = A0_2.briefCasesSpawnPoints
    L2_2 = L2_2[L1_2]
    A0_2.briefcase = L2_2
    L2_2 = print
    L3_2 = "Briefcase Pos = X"
    L4_2 = A0_2.briefcase
    L4_2 = L4_2[1]
    L4_2 = L4_2[1]
    L5_2 = " Y "
    L6_2 = A0_2.briefcase
    L6_2 = L6_2[1]
    L6_2 = L6_2[2]
    L7_2 = " Z "
    L8_2 = A0_2.briefcase
    L8_2 = L8_2[1]
    L8_2 = L8_2[3]
    L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2
    L2_2(L3_2)
    L3_2 = A0_2
    L2_2 = A0_2.SendEvent
    L4_2 = MSG_CREATE_BRIEFCASE
    L5_2 = 0
    L6_2 = L1_2
    L7_2 = 0
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    A0_2.lastBriefCase = L1_2
  end
end
L0_1.SpawnBriefCase = L1_1
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = print
    L2_2 = "GetExitPoint()"
    L1_2(L2_2)
    L1_2 = math
    L1_2 = L1_2.random
    L2_2 = 1
    L3_2 = table
    L3_2 = L3_2.getn
    L4_2 = A0_2.getawayExitPoints
    L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2 = L3_2(L4_2)
    L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    L2_2 = table
    L2_2 = L2_2.getn
    L3_2 = A0_2.getawayExitPoints
    L2_2 = L2_2(L3_2)
    if L1_2 >= L2_2 then
      L1_2 = 1
    end
    L2_2 = print
    L3_2 = "index == "
    L4_2 = L1_2
    L3_2 = L3_2 .. L4_2
    L2_2(L3_2)
    L2_2 = {}
    L3_2 = A0_2.getawayExitPoints
    L3_2 = L3_2[L1_2]
    L3_2 = L3_2[1]
    L3_2 = L3_2[1]
    L2_2[1] = L3_2
    L3_2 = A0_2.getawayExitPoints
    L3_2 = L3_2[L1_2]
    L3_2 = L3_2[1]
    L3_2 = L3_2[2]
    L2_2[2] = L3_2
    L3_2 = A0_2.getawayExitPoints
    L3_2 = L3_2[L1_2]
    L3_2 = L3_2[1]
    L3_2 = L3_2[3]
    L2_2[3] = L3_2
    L3_2 = print
    L4_2 = "Exit Pos = X"
    L5_2 = L2_2[1]
    L6_2 = " Y "
    L7_2 = L2_2[2]
    L8_2 = " Z "
    L9_2 = L2_2[3]
    L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2
    L3_2(L4_2)
    return L2_2
  end
end
L0_1.GetExitPoint = L1_1
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = {}
  L3_2 = Player
  L4_2 = A0_2.vipPeerId
  L3_2 = L3_2(L4_2)
  L4_2 = main
  L5_2 = A0_2.playerRespawnPoints
  L4_2.vSpawnPoints = L5_2
  L4_2 = A0_2.vipTeam
  L6_2 = L1_2
  L5_2 = L1_2.TeamId
  L5_2 = L5_2(L6_2)
  if L4_2 ~= L5_2 then
    L4_2 = SpawnMinMax
    L6_2 = L3_2
    L5_2 = L3_2.Position
    L5_2 = L5_2(L6_2)
    L6_2 = 100
    L7_2 = 400
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L2_2 = L4_2
  else
    L4_2 = SpawnNearHere
    L6_2 = L3_2
    L5_2 = L3_2.Position
    L5_2 = L5_2(L6_2)
    L6_2 = 100
    L4_2 = L4_2(L5_2, L6_2)
    L2_2 = L4_2
  end
  return L2_2
end
L0_1.GetPlayerRespawnPosition = L1_1
L0_1 = VIP
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  goto lbl_8
  repeat
    repeat
      repeat
        L1_2 = print
        L2_2 = "Waiting for vip id to come through"
        L1_2(L2_2)
        L1_2 = Wait
        L2_2 = 100
        L1_2(L2_2)
        ::lbl_8::
        L1_2 = A0_2.vipTeam
      until L1_2 ~= nil
      L1_2 = A0_2.initialSpawnBlock
    until L1_2 ~= nil
    L1_2 = A0_2.vipPeerId
  until L1_2 ~= nil
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = {}
  L3_2 = main
  L4_2 = A0_2.playerSpawnPointsInitial
  L3_2.vSpawnPoints = L4_2
  L3_2 = A0_2.vipTeam
  L5_2 = L1_2
  L4_2 = L1_2.TeamId
  L4_2 = L4_2(L5_2)
  if L3_2 ~= L4_2 then
    L3_2 = main
    L4_2 = A0_2.playerRespawnPoints
    L3_2.vSpawnPoints = L4_2
    L3_2 = DoSpawn
    L4_2 = InitialSpawnPoint
    L5_2 = PlayerId
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L5_2()
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L5_2 = false
    L3_2 = L3_2(L4_2, L5_2)
    L2_2 = L3_2
    return L2_2
  else
    L3_2 = A0_2.initialSpawnBlock
    L3_2 = L3_2 * 6
    L4_2 = PlayerId
    L4_2 = L4_2()
    L4_2 = L4_2 + 1
    if 6 < L4_2 then
      L4_2 = L4_2 - 6
    end
    L3_2 = L3_2 + L4_2
    L5_2 = print
    L6_2 = "index == "
    L7_2 = L3_2
    L6_2 = L6_2 .. L7_2
    L5_2(L6_2)
    L5_2 = A0_2.playerSpawnPointsInitial
    L2_2 = L5_2[L3_2]
    L5_2 = print
    L6_2 = "pos x "
    L7_2 = L2_2[1]
    L7_2 = L7_2[1]
    L8_2 = "pos y "
    L9_2 = L2_2[1]
    L9_2 = L9_2[2]
    L10_2 = "pos z "
    L11_2 = L2_2[1]
    L11_2 = L11_2[3]
    L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
    L5_2(L6_2)
    L5_2 = L2_2[1]
    return L5_2
  end
end
L0_1.GetPlayerRespawnPositionInitial = L1_1
L0_1 = VIP
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
L0_1 = VIP
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = A2_2
  L4_2 = A2_2.Name
  L4_2 = L4_2(L5_2)
  L6_2 = A1_2
  L5_2 = A1_2.Name
  L5_2 = L5_2(L6_2)
  L6_2 = IsServer
  L6_2 = L6_2()
  if L6_2 then
    L7_2 = A1_2
    L6_2 = A1_2.PlayerNum
    L6_2 = L6_2(L7_2)
    L7_2 = A0_2.vipPlayer
    L8_2 = L7_2
    L7_2 = L7_2.PlayerNum
    L7_2 = L7_2(L8_2)
    if L6_2 == L7_2 then
      L6_2 = 0
      L7_2 = A0_2.vipPlayer
      L8_2 = L7_2
      L7_2 = L7_2.TeamId
      L7_2 = L7_2(L8_2)
      if L7_2 == 0 then
        L6_2 = 1
      end
      L8_2 = A0_2
      L7_2 = A0_2.SendEvent
      L9_2 = MSG_END_GAME
      L10_2 = L6_2
      L11_2 = 0
      L12_2 = 0
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
    end
  end
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
L0_1 = VIP
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.briefcasesCollected
  return L2_2
end
L0_1.Score = L1_1
L0_1 = VIP
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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
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
        L7_2 = main
        L7_2 = L7_2.game
        L7_2.gameWinner = L4_2
        L7_2 = coreLib
        L8_2 = L7_2
        L7_2 = L7_2.ToggleEndOfGame
        L9_2 = true
        L7_2(L8_2, L9_2)
      else
        L7_2 = MSG_BRIEFCASE_COLLECTED
        if L3_2 == L7_2 then
          L7_2 = print
          L8_2 = "MSG_BRIEFCASE_COLLECTED"
          L7_2(L8_2)
          L7_2 = main
          L7_2 = L7_2.game
          L8_2 = L7_2
          L7_2 = L7_2.DisplayMessage
          L9_2 = "^t^MPVIP4"
          L7_2(L8_2, L9_2)
        else
          L7_2 = MSG_YOU_ARE_THE_VIP
          if L3_2 == L7_2 then
            L7_2 = L4_2
            L8_2 = L5_2
            L9_2 = L6_2
            L10_2 = main
            L10_2 = L10_2.game
            L10_2.initialSpawnBlock = L9_2
            L10_2 = print
            L11_2 = "MSG_YOU_ARE_THE_VIP, vipPeerId = "
            L12_2 = L7_2
            L13_2 = " vipTeam = "
            L14_2 = L8_2
            L11_2 = L11_2 .. L12_2 .. L13_2 .. L14_2
            L10_2(L11_2)
            L10_2 = SetVip
            L11_2 = L7_2
            L10_2(L11_2)
            L10_2 = IsServer
            L10_2 = L10_2()
            L11_2 = false
            if L10_2 == L11_2 then
              L10_2 = main
              L10_2 = L10_2.game
              L10_2.vipTeam = L8_2
              L10_2 = main
              L10_2 = L10_2.game
              L10_2.vipPeerId = L7_2
            end
            L10_2 = PlayerId
            L10_2 = L10_2()
            if L10_2 == L7_2 then
              L10_2 = main
              L10_2 = L10_2.game
              L11_2 = L10_2
              L10_2 = L10_2.DisplayMessage
              L12_2 = "^t^MPVIP1"
              L10_2(L11_2, L12_2)
              L11_2 = L1_2
              L10_2 = L1_2.SetCenterBlipVisible
              L12_2 = false
              L10_2(L11_2, L12_2)
            else
              L11_2 = L1_2
              L10_2 = L1_2.TeamId
              L10_2 = L10_2(L11_2)
              if L10_2 == L8_2 then
                L10_2 = main
                L10_2 = L10_2.game
                L11_2 = L10_2
                L10_2 = L10_2.DisplayMessage
                L12_2 = "^t^MPVIP2"
                L10_2(L11_2, L12_2)
              else
                L10_2 = main
                L10_2 = L10_2.game
                L11_2 = L10_2
                L10_2 = L10_2.DisplayMessage
                L12_2 = "^t^MPVIP3"
                L10_2(L11_2, L12_2)
              end
            end
          else
            L7_2 = MSG_GETAWAY
            if L3_2 == L7_2 then
              L7_2 = print
              L8_2 = "MSG_GETAWAY"
              L7_2(L8_2)
              L7_2 = L4_2
              L8_2 = DestroyLuaObject
              L8_2()
              L9_2 = L1_2
              L8_2 = L1_2.TeamId
              L8_2 = L8_2(L9_2)
              if L8_2 == L7_2 then
                L8_2 = main
                L8_2 = L8_2.game
                L9_2 = L8_2
                L8_2 = L8_2.DisplayMessage
                L10_2 = "^t^MPVIP5"
                L8_2(L9_2, L10_2)
              else
                L8_2 = main
                L8_2 = L8_2.game
                L9_2 = L8_2
                L8_2 = L8_2.DisplayMessage
                L10_2 = "^t^MPVIP6"
                L8_2(L9_2, L10_2)
              end
            else
              L7_2 = MSG_CREATE_BRIEFCASE
              if L7_2 then
                L7_2 = print
                L8_2 = "MSG_CREATE_BRIEFCASE"
                L7_2(L8_2)
                L7_2 = L5_2
                L8_2 = print
                L9_2 = "briefcase index == "
                L10_2 = L7_2
                L9_2 = L9_2 .. L10_2
                L8_2(L9_2)
                L8_2 = {}
                L9_2 = main
                L9_2 = L9_2.game
                L9_2 = L9_2.briefCasesSpawnPoints
                L8_2 = L9_2[L7_2]
                L9_2 = print
                L10_2 = "Briefcase Pos = X"
                L11_2 = L8_2[1]
                L11_2 = L11_2[1]
                L12_2 = " Y "
                L13_2 = L8_2[1]
                L13_2 = L13_2[2]
                L14_2 = " Z "
                L15_2 = L8_2[1]
                L15_2 = L15_2[3]
                L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
                L9_2(L10_2)
                L9_2 = DestroyLuaObject
                L9_2()
                L9_2 = CreateLuaObject
                L10_2 = pickup
                L10_2 = L10_2.briefcase
                L11_2 = L8_2[1]
                L9_2(L10_2, L11_2)
                L10_2 = L1_2
                L9_2 = L1_2.TeamId
                L9_2 = L9_2(L10_2)
                L10_2 = main
                L10_2 = L10_2.game
                L10_2 = L10_2.vipTeam
                if L9_2 == L10_2 then
                  L9_2 = SetPointerArrow
                  L10_2 = L8_2[1]
                  L9_2(L10_2)
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
L0_1 = VIP
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
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = nil
  L1_2 = GameLocation
  L1_2 = L1_2()
  if L1_2 == 0 then
    L1_2 = {}
    L2_2 = {}
    L3_2 = 502.7
    L4_2 = -161.8
    L5_2 = 11.7
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L2_2[3] = L5_2
    L3_2 = 95
    L4_2 = 0
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    L0_2 = L1_2
  else
    L1_2 = GameLocation
    L1_2 = L1_2()
    if L1_2 == 1 then
      L1_2 = {}
      L2_2 = {}
      L3_2 = 225.8
      L4_2 = -1140.6
      L5_2 = 10.7
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L2_2[3] = L5_2
      L3_2 = 82.7
      L4_2 = 1
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L0_2 = L1_2
    else
      L1_2 = GameLocation
      L1_2 = L1_2()
      if L1_2 == 2 then
        L1_2 = {}
        L2_2 = {}
        L3_2 = 183.4
        L4_2 = -1535.5
        L5_2 = 10.8
        L2_2[1] = L3_2
        L2_2[2] = L4_2
        L2_2[3] = L5_2
        L3_2 = 355.5
        L4_2 = 2
        L1_2[1] = L2_2
        L1_2[2] = L3_2
        L1_2[3] = L4_2
        L0_2 = L1_2
      else
        L1_2 = GameLocation
        L1_2 = L1_2()
        if L1_2 == 3 then
          L1_2 = {}
          L2_2 = {}
          L3_2 = 76.1
          L4_2 = 1081.4
          L5_2 = 16.3
          L2_2[1] = L3_2
          L2_2[2] = L4_2
          L2_2[3] = L5_2
          L3_2 = 180
          L4_2 = 3
          L1_2[1] = L2_2
          L1_2[2] = L3_2
          L1_2[3] = L4_2
          L0_2 = L1_2
        else
          L1_2 = GameLocation
          L1_2 = L1_2()
          if L1_2 == 4 then
            L1_2 = {}
            L2_2 = {}
            L3_2 = 102.2
            L4_2 = 249.7
            L5_2 = 21.7
            L2_2[1] = L3_2
            L2_2[2] = L4_2
            L2_2[3] = L5_2
            L3_2 = 240
            L4_2 = 4
            L1_2[1] = L2_2
            L1_2[2] = L3_2
            L1_2[3] = L4_2
            L0_2 = L1_2
          else
            L1_2 = GameLocation
            L1_2 = L1_2()
            if L1_2 == 5 then
              L1_2 = {}
              L2_2 = {}
              L3_2 = -377.9
              L4_2 = -539.5
              L5_2 = 17.2
              L2_2[1] = L3_2
              L2_2[2] = L4_2
              L2_2[3] = L5_2
              L3_2 = 296
              L4_2 = 5
              L1_2[1] = L2_2
              L1_2[2] = L3_2
              L1_2[3] = L4_2
              L0_2 = L1_2
            else
              L1_2 = GameLocation
              L1_2 = L1_2()
              if L1_2 == 6 then
                L1_2 = {}
                L2_2 = {}
                L3_2 = -507
                L4_2 = 1141.3
                L5_2 = 11
                L2_2[1] = L3_2
                L2_2[2] = L4_2
                L2_2[3] = L5_2
                L3_2 = 181
                L4_2 = 6
                L1_2[1] = L2_2
                L1_2[2] = L3_2
                L1_2[3] = L4_2
                L0_2 = L1_2
              else
                L1_2 = GameLocation
                L1_2 = L1_2()
                if L1_2 == 7 then
                  L1_2 = {}
                  L2_2 = {}
                  L3_2 = -973.4
                  L4_2 = -72.5
                  L5_2 = 10.7
                  L2_2[1] = L3_2
                  L2_2[2] = L4_2
                  L2_2[3] = L5_2
                  L3_2 = 150
                  L4_2 = 7
                  L1_2[1] = L2_2
                  L1_2[2] = L3_2
                  L1_2[3] = L4_2
                  L0_2 = L1_2
                else
                  L1_2 = GameLocation
                  L1_2 = L1_2()
                  if L1_2 == 8 then
                    L1_2 = {}
                    L2_2 = {}
                    L3_2 = -1182.8
                    L4_2 = -584.3
                    L5_2 = 11.5
                    L2_2[1] = L3_2
                    L2_2[2] = L4_2
                    L2_2[3] = L5_2
                    L3_2 = 210
                    L4_2 = 8
                    L1_2[1] = L2_2
                    L1_2[2] = L3_2
                    L1_2[3] = L4_2
                    L0_2 = L1_2
                  else
                    L1_2 = GameLocation
                    L1_2 = L1_2()
                    if L1_2 == 9 then
                      L1_2 = {}
                      L2_2 = {}
                      L3_2 = -700.4
                      L4_2 = -1286.9
                      L5_2 = 11
                      L2_2[1] = L3_2
                      L2_2[2] = L4_2
                      L2_2[3] = L5_2
                      L3_2 = 40
                      L4_2 = 9
                      L1_2[1] = L2_2
                      L1_2[2] = L3_2
                      L1_2[3] = L4_2
                      L0_2 = L1_2
                    else
                      L1_2 = GameLocation
                      L1_2 = L1_2()
                      if L1_2 == 10 then
                        L1_2 = {}
                        L2_2 = {}
                        L3_2 = -1142.7156
                        L4_2 = -1087.3027
                        L5_2 = 14.868
                        L2_2[1] = L3_2
                        L2_2[2] = L4_2
                        L2_2[3] = L5_2
                        L3_2 = 289.5881
                        L4_2 = 10
                        L1_2[1] = L2_2
                        L1_2[2] = L3_2
                        L1_2[3] = L4_2
                        L0_2 = L1_2
                      else
                        L1_2 = GameLocation
                        L1_2 = L1_2()
                        if L1_2 == 11 then
                          L1_2 = {}
                          L2_2 = {}
                          L3_2 = -1740.2
                          L4_2 = -97.6
                          L5_2 = 14.8
                          L2_2[1] = L3_2
                          L2_2[2] = L4_2
                          L2_2[3] = L5_2
                          L3_2 = 266.2
                          L4_2 = 11
                          L1_2[1] = L2_2
                          L1_2[2] = L3_2
                          L1_2[3] = L4_2
                          L0_2 = L1_2
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
  end
  L1_2 = print
  L2_2 = "lua Main()"
  L1_2(L2_2)
  L1_2 = MainLoop
  L2_2 = {}
  L1_2 = L1_2(L2_2)
  main = L1_2
  L1_2 = main
  L2_2 = Commentary
  L3_2 = {}
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2
  L2_2 = L2_2.Start
  L2_2 = L2_2(L3_2)
  L1_2.commentary = L2_2
  L1_2 = main
  L2_2 = ScoreSheetScript
  L3_2 = {}
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2
  L2_2 = L2_2.Start
  L2_2 = L2_2(L3_2)
  L1_2.scores = L2_2
  L1_2 = InitSpawnOffsets
  L1_2()
  L1_2 = print
  L2_2 = "lua CreatePlayer()"
  L1_2(L2_2)
  L1_2 = CreatePlayer
  L2_2 = unpack
  L3_2 = L0_2[1]
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  L1_2(L2_2, L3_2, L4_2, L5_2)
  goto lbl_216
  repeat
    L1_2 = Wait
    L2_2 = 10
    L1_2(L2_2)
    ::lbl_216::
    L1_2 = IsPlayerCreationQueued
    L1_2 = L1_2()
  until not L1_2
  L0_2 = nil
  L1_2 = collectgarbage
  L1_2()
  L1_2 = PlayerName
  L2_2 = HostName
  L2_2, L3_2, L4_2, L5_2 = L2_2()
  L1_2(L2_2, L3_2, L4_2, L5_2)
  L1_2 = main
  L2_2 = VIP
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
