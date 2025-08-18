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
FlagBall = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
ServerLogic = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
MessagePump = L0_1
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
EVENT_GAME_OVER = L0_1
L0_1 = 2
EVENT_BOMB_DELIVERED = L0_1
L0_1 = 3
EVENT_BOMB_REMOVED = L0_1
L0_1 = 4
EVENT_PLAYER_HAS_FLAGBALL = L0_1
L0_1 = 6
EVENT_GIVE_PLAYER_FLAG = L0_1
L0_1 = 7
EVENT_TAKE_PLAYER_FLAG = L0_1
L0_1 = 6
BOMB_DROP_RAD = L0_1
L0_1 = 59000
DEFAULT_COUNTTIME_MS = L0_1
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
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
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
  L2_2 = 0
  L3_2 = 0
  L4_2 = 0
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  A0_2.scores = L1_2
  L1_2 = {}
  A0_2.teamscores = L1_2
  L1_2 = A0_2.teamscores
  L1_2[1] = 0
  L1_2 = A0_2.teamscores
  L1_2[2] = 0
  L1_2 = "StateRunning"
  return L1_2
end
L0_1.StateInit = L1_1
L0_1 = FlagBall
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
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2
  A0_2.ownBlip = nil
  L1_2 = true
  A0_2.initialSpawn = L1_2
  A0_2.winningTeam = nil
  L1_2 = false
  A0_2.playerHasFlagBall = L1_2
  A0_2.flagBallCarrier = -1
  L1_2 = {}
  A0_2.bombStartPosition = L1_2
  L1_2 = {}
  A0_2.teamAInitial = L1_2
  L1_2 = {}
  A0_2.teamBInitial = L1_2
  L1_2 = {}
  A0_2.teamABombEndPos = L1_2
  L1_2 = {}
  A0_2.teamBBombEndPos = L1_2
  A0_2.teamASiteNum = nil
  A0_2.teamBSiteNum = nil
  L1_2 = {}
  A0_2.teamARespawn = L1_2
  L1_2 = {}
  A0_2.teamBRespawn = L1_2
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L4_2 = {}
  L5_2 = {}
  L6_2 = nil
  L7_2 = nil
  L8_2 = {}
  L9_2 = nil
  L10_2 = nil
  L11_2 = nil
  L12_2 = nil
  L13_2 = {}
  L14_2 = {}
  L15_2 = nil
  L16_2 = UseLCFiles
  L16_2 = L16_2()
  if L16_2 then
    L16_2 = dofile
    L17_2 = GetDiskPrepend
    L17_2 = L17_2()
    L18_2 = "LUA/FlagBallData.lua.lc"
    L17_2 = L17_2 .. L18_2
    L16_2 = L16_2(L17_2)
    L15_2 = L16_2
  else
    L16_2 = dofile
    L17_2 = GetDiskPrepend
    L17_2 = L17_2()
    L18_2 = "LUA/FlagBallData.lua"
    L17_2 = L17_2 .. L18_2
    L16_2 = L16_2(L17_2)
    L15_2 = L16_2
  end
  L16_2 = L15_2
  L16_2, L17_2, L18_2, L19_2, L20_2, L21_2, L22_2, L23_2, L24_2, L25_2, L26_2, L27_2, L28_2 = L16_2()
  L14_2 = L28_2
  L13_2 = L27_2
  L12_2 = L26_2
  L11_2 = L25_2
  L10_2 = L24_2
  L9_2 = L23_2
  L7_2 = L22_2
  L6_2 = L21_2
  L5_2 = L20_2
  L4_2 = L19_2
  L3_2 = L18_2
  L2_2 = L17_2
  L1_2 = L16_2
  L16_2 = table
  L16_2 = L16_2.clone
  L17_2 = L1_2
  L16_2 = L16_2(L17_2)
  A0_2.bombStartPosition = L16_2
  L16_2 = table
  L16_2 = L16_2.clone
  L17_2 = L2_2
  L16_2 = L16_2(L17_2)
  A0_2.teamAInitial = L16_2
  L16_2 = table
  L16_2 = L16_2.clone
  L17_2 = L3_2
  L16_2 = L16_2(L17_2)
  A0_2.teamBInitial = L16_2
  L16_2 = table
  L16_2 = L16_2.clone
  L17_2 = L4_2
  L16_2 = L16_2(L17_2)
  A0_2.teamABombEndPos = L16_2
  L16_2 = table
  L16_2 = L16_2.clone
  L17_2 = L5_2
  L16_2 = L16_2(L17_2)
  A0_2.teamBBombEndPos = L16_2
  A0_2.teamASiteNum = L6_2
  A0_2.teamBSiteNum = L7_2
  L16_2 = table
  L16_2 = L16_2.clone
  L17_2 = L8_2
  L16_2 = L16_2(L17_2)
  A0_2.playerSpawns = L16_2
  L16_2 = table
  L16_2 = L16_2.clone
  L17_2 = L13_2
  L16_2 = L16_2(L17_2)
  A0_2.teamARespawn = L16_2
  L16_2 = table
  L16_2 = L16_2.clone
  L17_2 = L14_2
  L16_2 = L16_2(L17_2)
  A0_2.teamBRespawn = L16_2
  L16_2 = SetEmpireSiteSize
  L17_2 = L6_2
  L18_2 = L9_2
  L16_2(L17_2, L18_2)
  L16_2 = SetEmpireSiteType
  L17_2 = L6_2
  L18_2 = L11_2
  L16_2(L17_2, L18_2)
  L16_2 = SetEmpireSiteSize
  L17_2 = L7_2
  L18_2 = L10_2
  L16_2(L17_2, L18_2)
  L16_2 = SetEmpireSiteType
  L17_2 = L7_2
  L18_2 = L12_2
  L16_2(L17_2, L18_2)
  L15_2 = nil
  L16_2 = collectgarbage
  L16_2()
  L16_2 = coreLib
  L17_2 = L16_2
  L16_2 = L16_2.ToggleEndOfGame
  L18_2 = false
  L16_2(L17_2, L18_2)
  A0_2.gameWinner = nil
  L16_2 = GameElapsedMs
  L17_2 = 0
  L16_2(L17_2)
  L16_2 = IsServer
  L16_2 = L16_2()
  if L16_2 then
    L17_2 = A0_2
    L16_2 = A0_2.ResetFlagBall
    L16_2(L17_2)
    L16_2 = ServerLogic
    L16_2 = L16_2()
    A0_2.ServerLogic = L16_2
    L16_2 = A0_2.ServerLogic
    L17_2 = L16_2
    L16_2 = L16_2.Start
    L16_2(L17_2)
  end
  L16_2 = {}
  A0_2.baseHalos = L16_2
  L16_2 = A0_2.baseHalos
  L17_2 = SetHalo
  L18_2 = A0_2.teamABombEndPos
  L18_2 = L18_2[1]
  L19_2 = 0
  L20_2 = 1
  L21_2 = BOMB_DROP_RAD
  L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
  L16_2[1] = L17_2
  L16_2 = A0_2.baseHalos
  L17_2 = SetHalo
  L18_2 = A0_2.teamBBombEndPos
  L18_2 = L18_2[1]
  L19_2 = 0
  L20_2 = 0
  L21_2 = BOMB_DROP_RAD
  L17_2 = L17_2(L18_2, L19_2, L20_2, L21_2)
  L16_2[2] = L17_2
  L16_2 = AddBlipForCoord
  L17_2 = GetEveryonePeerGroupId
  L17_2 = L17_2()
  L18_2 = A0_2.teamABombEndPos
  L18_2 = L18_2[1]
  L19_2 = team2RadarColour
  L20_2 = pickupicon
  L20_2 = L20_2.base
  L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
  A0_2.team1BaseBlip = L16_2
  L16_2 = AddBlipForCoord
  L17_2 = GetEveryonePeerGroupId
  L17_2 = L17_2()
  L18_2 = A0_2.teamBBombEndPos
  L18_2 = L18_2[1]
  L19_2 = team1RadarColour
  L20_2 = pickupicon
  L20_2 = L20_2.base
  L16_2 = L16_2(L17_2, L18_2, L19_2, L20_2)
  A0_2.team2BaseBlip = L16_2
  L16_2 = MessagePump
  L16_2 = L16_2()
  A0_2.myMessagePump = L16_2
  L16_2 = A0_2.myMessagePump
  L17_2 = L16_2
  L16_2 = L16_2.Start
  L16_2(L17_2)
  L16_2 = false
  A0_2.flagIsAtTeam1Base = L16_2
  L16_2 = false
  A0_2.flagIsAtTeam2Base = L16_2
  L16_2 = UpdateGameTime
  L17_2 = true
  L16_2(L17_2)
  L16_2 = TeamColour
  L17_2 = teamId1
  L16_2 = L16_2(L17_2)
  A0_2.team1Colour = L16_2
  L16_2 = TeamColour
  L17_2 = teamId2
  L16_2 = L16_2(L17_2)
  A0_2.team2Colour = L16_2
  A0_2.teamACountTimer = nil
  A0_2.teamBCountTimer = nil
  L16_2 = SetTeamTimer
  L17_2 = teamId1
  L18_2 = DEFAULT_COUNTTIME_MS
  L16_2(L17_2, L18_2)
  L16_2 = SetTeamTimer
  L17_2 = teamId2
  L18_2 = DEFAULT_COUNTTIME_MS
  L16_2(L17_2, L18_2)
  L16_2 = IsServer
  L16_2 = L16_2()
  if L16_2 then
    L16_2 = ServerReadyToGo
    L17_2 = true
    L16_2(L17_2)
    L16_2 = Wait
    L17_2 = 500
    L16_2(L17_2)
  end
  L16_2 = SetTeamTimerCounting
  L17_2 = teamId1
  L18_2 = true
  L16_2(L17_2, L18_2)
  L16_2 = SetTeamTimerCounting
  L17_2 = teamId2
  L18_2 = true
  L16_2(L17_2, L18_2)
  L16_2 = SetTeamTimerCounting
  L17_2 = teamId1
  L18_2 = false
  L16_2(L17_2, L18_2)
  L16_2 = SetTeamTimerCounting
  L17_2 = teamId2
  L18_2 = false
  L16_2(L17_2, L18_2)
  L17_2 = A0_2
  L16_2 = A0_2.ShowHUD
  L18_2 = true
  L16_2(L17_2, L18_2)
  L16_2 = true
  A0_2.gameDataInitialised = L16_2
  L16_2 = ClearSplashScreen
  L16_2()
  L16_2 = Player
  L16_2 = L16_2()
  L18_2 = A0_2
  L17_2 = A0_2.GetPlayerRespawnPosition
  L17_2 = L17_2(L18_2)
  L19_2 = L16_2
  L18_2 = L16_2.Respawn
  L20_2 = L17_2
  L18_2(L19_2, L20_2)
  L18_2 = coreLib
  L19_2 = L18_2
  L18_2 = L18_2.Commentate
  L20_2 = "^T^MPFBGB"
  L18_2(L19_2, L20_2)
end
L0_1.InitGame = L1_1
L0_1 = FlagBall
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
    L2_2 = A0_2
    L1_2 = A0_2.UpdateScores
    L1_2(L2_2)
    L1_2 = collectgarbage
    L1_2()
    L2_2 = A0_2
    L1_2 = A0_2.CheckFlagBallPos
    L1_2(L2_2)
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
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = A0_2.flagIsAtTeam2Base
  if L2_2 then
    L2_2 = print
    L3_2 = "BOMB IS AT TEAM 2 BASE"
    L2_2(L3_2)
  end
  L2_2 = A0_2.flagIsAtTeam1Base
  if L2_2 then
    L2_2 = print
    L3_2 = "BOMB IS AT TEAM 1 BASE"
    L2_2(L3_2)
  end
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L4_2, L5_2 in L2_2, L3_2 do
    L7_2 = L5_2
    L6_2 = L5_2.TeamId
    L6_2 = L6_2(L7_2)
    L7_2 = teamId2
    if L6_2 == L7_2 then
      L6_2 = A0_2.flagIsAtTeam2Base
      if L6_2 then
        L6_2 = IsPosInArea
        L8_2 = L5_2
        L7_2 = L5_2.Position
        L7_2 = L7_2(L8_2)
        L8_2 = A0_2.teamABombEndPos
        L8_2 = L8_2[1]
        L9_2 = BOMB_DROP_RAD
        L6_2 = L6_2(L7_2, L8_2, L9_2)
        if L6_2 then
          L6_2 = IsPlayerDead
          L7_2 = L5_2
          L6_2 = L6_2(L7_2)
          if not L6_2 then
            L7_2 = A0_2
            L6_2 = A0_2.DoSendEvent
            L8_2 = EVENT_GIVE_PLAYER_FLAG
            L10_2 = L5_2
            L9_2 = L5_2.PlayerNum
            L9_2 = L9_2(L10_2)
            L10_2 = 0
            L11_2 = 0
            L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
            L7_2 = A0_2
            L6_2 = A0_2.DoSendEvent
            L8_2 = EVENT_BOMB_REMOVED
            L9_2 = teamId1
            L10_2 = 0
            L11_2 = 0
            L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
            L6_2 = false
            A0_2.flagIsAtTeam2Base = L6_2
          end
        end
      end
    end
    L7_2 = L5_2
    L6_2 = L5_2.TeamId
    L6_2 = L6_2(L7_2)
    L7_2 = teamId1
    if L6_2 == L7_2 then
      L6_2 = A0_2.flagIsAtTeam1Base
      if L6_2 then
        L6_2 = IsPosInArea
        L8_2 = L5_2
        L7_2 = L5_2.Position
        L7_2 = L7_2(L8_2)
        L8_2 = A0_2.teamBBombEndPos
        L8_2 = L8_2[1]
        L9_2 = BOMB_DROP_RAD
        L6_2 = L6_2(L7_2, L8_2, L9_2)
        if L6_2 then
          L6_2 = IsPlayerDead
          L7_2 = L5_2
          L6_2 = L6_2(L7_2)
          if not L6_2 then
            L7_2 = A0_2
            L6_2 = A0_2.DoSendEvent
            L8_2 = EVENT_GIVE_PLAYER_FLAG
            L10_2 = L5_2
            L9_2 = L5_2.PlayerNum
            L9_2 = L9_2(L10_2)
            L10_2 = 0
            L11_2 = 0
            L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
            L7_2 = A0_2
            L6_2 = A0_2.DoSendEvent
            L8_2 = EVENT_BOMB_REMOVED
            L9_2 = teamId2
            L10_2 = 0
            L11_2 = 0
            L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
            L6_2 = false
            A0_2.flagIsAtTeam1Base = L6_2
          end
        end
      end
    end
  end
  L2_2 = A0_2.flagIsAtTeam1Base
  L3_2 = false
  if L2_2 == L3_2 then
    L2_2 = A0_2.flagIsAtTeam2Base
    L3_2 = false
    if L2_2 == L3_2 then
      L2_2 = true
      L3_2 = pairs
      L4_2 = L1_2
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L5_2, L6_2 in L3_2, L4_2 do
        L8_2 = L6_2
        L7_2 = L6_2.HasFlagBall
        L7_2 = L7_2(L8_2)
        L8_2 = true
        if L7_2 == L8_2 then
          L2_2 = false
        end
      end
      L3_2 = true
      if L2_2 == L3_2 then
        L3_2 = {}
        L4_2 = GetFlagballPosition
        L4_2 = L4_2()
        L3_2 = L4_2
        L4_2 = false
        L5_2 = FindGroundZFor3DCoord
        L6_2 = L3_2
        L7_2 = false
        L5_2 = L5_2(L6_2, L7_2)
        L6_2 = print
        L7_2 = "z == "
        L8_2 = L5_2
        L7_2 = L7_2 .. L8_2
        L6_2(L7_2)
        if 100 < L5_2 then
          L4_2 = true
        end
        L6_2 = PointInActivityZone
        L7_2 = L3_2
        L6_2 = L6_2(L7_2)
        L7_2 = false
        if L6_2 == L7_2 then
          L4_2 = true
        end
        L6_2 = true
        if L4_2 == L6_2 then
          L6_2 = print
          L7_2 = "bun successfully fried (flagball is out of bounds)"
          L6_2(L7_2)
          L7_2 = A0_2
          L6_2 = A0_2.ResetFlagBall
          L6_2(L7_2)
        end
      end
    end
  end
end
L0_1.CheckForFlagPickup = L1_1
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = GetTeamTimer
  L2_2 = teamId1
  L1_2 = L1_2(L2_2)
  if L1_2 <= 0 then
    L2_2 = A0_2
    L1_2 = A0_2.DoSendEvent
    L3_2 = EVENT_GAME_OVER
    L4_2 = teamId2
    L5_2 = 0
    L6_2 = 0
    L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
  else
    L1_2 = GetTeamTimer
    L2_2 = teamId2
    L1_2 = L1_2(L2_2)
    if L1_2 <= 0 then
      L2_2 = A0_2
      L1_2 = A0_2.DoSendEvent
      L3_2 = EVENT_GAME_OVER
      L4_2 = teamId1
      L5_2 = 0
      L6_2 = 0
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
    end
  end
end
L0_1.CheckForEndOfGame = L1_1
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2, L2_2
  L2_2 = A0_2
  L1_2 = A0_2.CheckForFlagPickup
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.CheckForEndOfGame
  L1_2(L2_2)
end
L0_1.DoServerLogic = L1_1
L0_1 = ServerLogic
function L1_1(A0_2)
  local L1_2, L2_2
  while 1 do
    L1_2 = Wait
    L2_2 = 10
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.DoServerLogic
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.CheckForCarrierDisconnection
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
L0_1 = FlagBall
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
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
  end
end
L0_1.UpdateRadar = L1_1
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = {}
  L3_2 = A0_2.initialSpawn
  L4_2 = true
  if L3_2 == L4_2 then
    L3_2 = false
    A0_2.initialSpawn = L3_2
    L3_2 = PlayerId
    L3_2 = L3_2()
    L3_2 = L3_2 + 1
    L5_2 = L1_2
    L4_2 = L1_2.TeamId
    L4_2 = L4_2(L5_2)
    L5_2 = teamId1
    if L4_2 == L5_2 then
      L4_2 = A0_2.teamAInitial
      L4_2 = L4_2[L3_2]
      L2_2 = L4_2[1]
    else
      L4_2 = A0_2.teamBInitial
      L4_2 = L4_2[L3_2]
      L2_2 = L4_2[1]
    end
  else
    L4_2 = L1_2
    L3_2 = L1_2.TeamId
    L3_2 = L3_2(L4_2)
    L4_2 = teamId1
    if L3_2 == L4_2 then
      L3_2 = main
      L4_2 = A0_2.teamARespawn
      L3_2.vSpawnPoints = L4_2
    else
      L3_2 = main
      L4_2 = A0_2.teamBRespawn
      L3_2.vSpawnPoints = L4_2
    end
    L3_2 = DoSpawn
    L4_2 = nil
    L5_2 = false
    L3_2 = L3_2(L4_2, L5_2)
    L2_2 = L3_2
  end
  return L2_2
end
L0_1.GetPlayerRespawnPosition = L1_1
L0_1 = FlagBall
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
L0_1 = FlagBall
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = 10
  return L2_2
end
L0_1.Score = L1_1
L0_1 = FlagBall
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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
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
      L7_2 = print
      L8_2 = "+++Recieved event: "
      L9_2 = L3_2
      L10_2 = " "
      L11_2 = L4_2
      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
      L7_2(L8_2)
      L7_2 = IsServer
      L7_2 = L7_2()
      if L7_2 then
        L7_2 = main
        L7_2 = L7_2.game
        L8_2 = L7_2
        L7_2 = L7_2.ServerMsgProcess
        L9_2 = L3_2
        L10_2 = L4_2
        L11_2 = L5_2
        L12_2 = L6_2
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      end
      L7_2 = main
      L7_2 = L7_2.game
      L8_2 = L7_2
      L7_2 = L7_2.ClientMsgProcess
      L9_2 = L3_2
      L10_2 = L4_2
      L11_2 = L5_2
      L12_2 = L6_2
      L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
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
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.DisplayCountDownTimers
    L1_2(L2_2)
  end
end
L0_1.Run = L1_1
L0_1 = FlagBall
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2
  L5_2 = EVENT_BOMB_DELIVERED
  if A1_2 == L5_2 then
    L5_2 = teamId1
    if A2_2 == L5_2 then
      L5_2 = SetTeamTimerCounting
      L6_2 = teamId2
      L7_2 = true
      L5_2(L6_2, L7_2)
      L5_2 = CreateLuaObject
      L6_2 = pickup
      L6_2 = L6_2.flagball
      L7_2 = A0_2.teamABombEndPos
      L7_2 = L7_2[1]
      L5_2(L6_2, L7_2)
    else
      L5_2 = teamId2
      if A2_2 == L5_2 then
        L5_2 = SetTeamTimerCounting
        L6_2 = teamId1
        L7_2 = true
        L5_2(L6_2, L7_2)
        L5_2 = CreateLuaObject
        L6_2 = pickup
        L6_2 = L6_2.flagball
        L7_2 = A0_2.teamBBombEndPos
        L7_2 = L7_2[1]
        L5_2(L6_2, L7_2)
      end
    end
  else
    L5_2 = EVENT_BOMB_REMOVED
    if A1_2 == L5_2 then
      L5_2 = teamId1
      if A2_2 == L5_2 then
        L5_2 = SetTeamTimerCounting
        L6_2 = teamId2
        L7_2 = false
        L5_2(L6_2, L7_2)
      else
        L5_2 = teamId2
        if A2_2 == L5_2 then
          L5_2 = SetTeamTimerCounting
          L6_2 = teamId1
          L7_2 = false
          L5_2(L6_2, L7_2)
        end
      end
      L5_2 = DestroyLuaObject
      L5_2()
    else
      L5_2 = EVENT_PLAYER_HAS_FLAGBALL
      if A1_2 == L5_2 then
        if A3_2 == 1 then
          A0_2.flagBallCarrier = A2_2
        else
          A0_2.flagBallCarrier = -1
        end
      end
    end
  end
end
L0_1.ServerMsgProcess = L1_1
L0_1 = FlagBall
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L5_2 = Player
  L5_2 = L5_2()
  L6_2 = AllPlayers
  L6_2 = L6_2()
  L7_2 = print
  L8_2 = "Doing client message process"
  L7_2(L8_2)
  L7_2 = EVENT_BOMB_DELIVERED
  if A1_2 == L7_2 then
    L7_2 = teamId1
    if A2_2 == L7_2 then
      L7_2 = true
      A0_2.flagIsAtTeam2Base = L7_2
    else
      L7_2 = teamId2
      if A2_2 == L7_2 then
        L7_2 = true
        A0_2.flagIsAtTeam1Base = L7_2
      end
    end
    L7_2 = coreLib
    L8_2 = L7_2
    L7_2 = L7_2.Commentate
    L9_2 = "^S^"
    L10_2 = TeamName
    L11_2 = A2_2
    L10_2 = L10_2(L11_2)
    L11_2 = " ^T^MPFBPPB"
    L9_2 = L9_2 .. L10_2 .. L11_2
    L7_2(L8_2, L9_2)
  else
    L7_2 = EVENT_BOMB_REMOVED
    if A1_2 == L7_2 then
      L7_2 = teamId1
      if A2_2 == L7_2 then
        L7_2 = false
        A0_2.flagIsAtTeam2Base = L7_2
        L7_2 = print
        L8_2 = "Setting bomb at team 2 base to false"
        L7_2(L8_2)
      else
        L7_2 = teamId2
        if A2_2 == L7_2 then
          L7_2 = false
          A0_2.flagIsAtTeam1Base = L7_2
          L7_2 = print
          L8_2 = "Setting bomb at team 1 base to false"
          L7_2(L8_2)
        end
      end
    else
      L7_2 = EVENT_GIVE_PLAYER_FLAG
      if A1_2 == L7_2 then
        L8_2 = L5_2
        L7_2 = L5_2.PlayerNum
        L7_2 = L7_2(L8_2)
        if A2_2 == L7_2 then
          L8_2 = L5_2
          L7_2 = L5_2.GiveFlagBall
          L7_2(L8_2)
          L7_2 = coreLib
          L8_2 = L7_2
          L7_2 = L7_2.Commentate
          L9_2 = "^T^MPFBDB"
          L7_2(L8_2, L9_2)
        end
      else
        L7_2 = EVENT_GAME_OVER
        if A1_2 == L7_2 then
          A0_2.winningTeam = A2_2
          L7_2 = main
          L7_2 = L7_2.game
          L7_2.state = "StateGameWon"
        else
          L7_2 = EVENT_PLAYER_HAS_FLAGBALL
          if A1_2 == L7_2 then
            if A3_2 == 1 then
              L7_2 = pairs
              L8_2 = L6_2
              L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
              for L9_2, L10_2 in L7_2, L8_2 do
                L12_2 = L10_2
                L11_2 = L10_2.PlayerNum
                L11_2 = L11_2(L12_2)
                if L11_2 == A2_2 then
                  L12_2 = L10_2
                  L11_2 = L10_2.SetRadarBlipShortRange
                  L13_2 = false
                  L11_2(L12_2, L13_2)
                  L12_2 = L10_2
                  L11_2 = L10_2.SetRadarBlipIcon
                  L13_2 = pickupicon
                  L13_2 = L13_2.targetplayer
                  L11_2(L12_2, L13_2)
                else
                  L12_2 = L10_2
                  L11_2 = L10_2.SetRadarBlipShortRange
                  L13_2 = false
                  L11_2(L12_2, L13_2)
                  L12_2 = L10_2
                  L11_2 = L10_2.SetRadarBlipIcon
                  L13_2 = pickupicon
                  L13_2 = L13_2.player
                  L11_2(L12_2, L13_2)
                end
              end
              L7_2 = print
              L8_2 = "EVENT_PLAYER_HAS_FLAGBALL GOT IT"
              L7_2(L8_2)
              L7_2 = print
              L8_2 = "Player with BALL == "
              L9_2 = A2_2
              L8_2 = L8_2 .. L9_2
              L7_2(L8_2)
              L7_2 = A0_2.ownBlip
              if L7_2 then
                L7_2 = print
                L8_2 = "Removing Blip"
                L7_2(L8_2)
                L7_2 = RemoveBlip
                L8_2 = A0_2.ownBlip
                L7_2(L8_2)
                A0_2.ownBlip = nil
              end
              L8_2 = L5_2
              L7_2 = L5_2.PlayerNum
              L7_2 = L7_2(L8_2)
              if L7_2 == A2_2 then
                L8_2 = L5_2
                L7_2 = L5_2.SetCenterBlipVisible
                L9_2 = false
                L7_2(L8_2, L9_2)
                L7_2 = print
                L8_2 = "Adding a player bomb radar blip"
                L7_2(L8_2)
                L7_2 = AddBlipForCoord
                L8_2 = GetEveryonePeerGroupId
                L8_2 = L8_2()
                L10_2 = L5_2
                L9_2 = L5_2.Position
                L9_2 = L9_2(L10_2)
                L11_2 = L5_2
                L10_2 = L5_2.TeamColour
                L10_2 = L10_2(L11_2)
                L11_2 = pickupicon
                L11_2 = L11_2.targetplayer
                L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
                A0_2.ownBlip = L7_2
                L7_2 = SetRadarToTeamColour
                L8_2 = A0_2.ownBlip
                L10_2 = L5_2
                L9_2 = L5_2.TeamId
                L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2(L10_2)
                L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
              end
              L7_2 = coreLib
              L8_2 = L7_2
              L7_2 = L7_2.Commentate
              L9_2 = "^S^"
              L10_2 = PlayerName
              L11_2 = Player
              L12_2 = A2_2
              L11_2, L12_2, L13_2 = L11_2(L12_2)
              L10_2 = L10_2(L11_2, L12_2, L13_2)
              L11_2 = " ^T^MPFBPBR"
              L9_2 = L9_2 .. L10_2 .. L11_2
              L7_2(L8_2, L9_2)
            elseif A3_2 == 0 then
              L7_2 = pairs
              L8_2 = L6_2
              L7_2, L8_2, L9_2, L10_2 = L7_2(L8_2)
              for L9_2, L10_2 in L7_2, L8_2 do
                L12_2 = L10_2
                L11_2 = L10_2.SetRadarBlipShortRange
                L13_2 = false
                L11_2(L12_2, L13_2)
                L12_2 = L10_2
                L11_2 = L10_2.SetRadarBlipIcon
                L13_2 = pickupicon
                L13_2 = L13_2.player
                L11_2(L12_2, L13_2)
              end
              L7_2 = print
              L8_2 = "EVENT_PLAYER_HAS_FLAGBALL DROPPED IT"
              L7_2(L8_2)
              L8_2 = L5_2
              L7_2 = L5_2.PlayerNum
              L7_2 = L7_2(L8_2)
              if L7_2 == A2_2 then
                L8_2 = L5_2
                L7_2 = L5_2.SetCenterBlipVisible
                L9_2 = true
                L7_2(L8_2, L9_2)
                L7_2 = A0_2.ownBlip
                if L7_2 then
                  L7_2 = RemoveBlip
                  L8_2 = A0_2.ownBlip
                  L7_2(L8_2)
                  A0_2.ownBlip = nil
                end
              end
            end
          end
        end
      end
    end
  end
end
L0_1.ClientMsgProcess = L1_1
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = UpdateGameTime
  L2_2 = false
  L1_2(L2_2)
  L1_2 = nil
  L2_2 = Player
  L2_2 = L2_2()
  L3_2 = AllPlayers
  L3_2 = L3_2()
  L4_2 = IsServer
  L4_2 = L4_2()
  if L4_2 then
    L4_2 = A0_2.winningTeam
    if L4_2 == 1 then
      L4_2 = {}
      L5_2 = A0_2.teamBBombEndPos
      L4_2 = L5_2[1]
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = L4_2[1]
      L5_2 = L5_2 + 5
      L4_2[1] = L5_2
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = A0_2.teamBBombEndPos
      L4_2 = L5_2[1]
      L5_2 = L4_2[2]
      L5_2 = L5_2 + 5
      L4_2[2] = L5_2
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = A0_2.teamBBombEndPos
      L4_2 = L5_2[1]
      L5_2 = L4_2[3]
      L5_2 = L5_2 + 5
      L4_2[3] = L5_2
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = L4_2[1]
      L5_2 = L5_2 - 5
      L4_2[1] = L5_2
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = A0_2.teamBBombEndPos
      L4_2 = L5_2[1]
      L5_2 = L4_2[2]
      L5_2 = L5_2 - 5
      L4_2[2] = L5_2
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = A0_2.teamBBombEndPos
      L4_2 = L5_2[1]
      L5_2 = L4_2[3]
      L5_2 = L5_2 - 5
      L4_2[3] = L5_2
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
    else
      L4_2 = {}
      L5_2 = A0_2.teamABombEndPos
      L4_2 = L5_2[1]
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = L4_2[1]
      L5_2 = L5_2 + 5
      L4_2[1] = L5_2
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = A0_2.teamABombEndPos
      L4_2 = L5_2[1]
      L5_2 = L4_2[2]
      L5_2 = L5_2 + 5
      L4_2[2] = L5_2
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = A0_2.teamABombEndPos
      L4_2 = L5_2[1]
      L5_2 = L4_2[3]
      L5_2 = L5_2 + 5
      L4_2[3] = L5_2
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = L4_2[1]
      L5_2 = L5_2 - 5
      L4_2[1] = L5_2
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = A0_2.teamABombEndPos
      L4_2 = L5_2[1]
      L5_2 = L4_2[2]
      L5_2 = L5_2 - 5
      L4_2[2] = L5_2
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
      L5_2 = A0_2.teamABombEndPos
      L4_2 = L5_2[1]
      L5_2 = L4_2[3]
      L5_2 = L5_2 - 5
      L4_2[3] = L5_2
      L5_2 = AddExplosion
      L6_2 = L4_2
      L5_2(L6_2)
    end
  end
  L4_2 = A0_2.winningTeam
  L5_2 = teamDraw
  if L4_2 == L5_2 then
    L4_2 = DisplayFinalWinLoseMessage
    L5_2 = 0
    L6_2 = ""
    L4_2(L5_2, L6_2)
  else
    L4_2 = A0_2.winningTeam
    L6_2 = L2_2
    L5_2 = L2_2.TeamId
    L5_2 = L5_2(L6_2)
    if L4_2 == L5_2 then
      L4_2 = DisplayFinalWinLoseMessage
      L5_2 = 1
      L6_2 = ""
      L7_2 = A0_2.winningTeam
      L4_2(L5_2, L6_2, L7_2)
    else
      L4_2 = DisplayFinalWinLoseMessage
      L5_2 = 2
      L6_2 = ""
      L7_2 = A0_2.winningTeam
      L4_2(L5_2, L6_2, L7_2)
    end
  end
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
  L4_2 = "StateRunning"
  return L4_2
end
L0_1.StateGameWon = L1_1
L0_1 = FlagBall
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.teamscores
  L3_2 = A1_2 + 1
  L2_2 = L2_2[L3_2]
  if not L2_2 then
    L2_2 = 0
  end
  return L2_2
end
L0_1.TeamScore = L1_1
L0_1 = FlagBall
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = A0_2.teamACountTimer
  if L2_2 ~= nil then
    L2_2 = A0_2.teamACountTimer
    L3_2 = L2_2
    L2_2 = L2_2.Remove
    L2_2(L3_2)
    A0_2.teamACountTimer = nil
  end
  L2_2 = A0_2.teamBCountTimer
  if L2_2 ~= nil then
    L2_2 = A0_2.teamBCountTimer
    L3_2 = L2_2
    L2_2 = L2_2.Remove
    L2_2(L3_2)
    A0_2.teamBCountTimer = nil
  end
  L2_2 = true
  if A1_2 == L2_2 then
    L2_2 = Player
    L2_2 = L2_2()
    L3_2 = coreLib
    L4_2 = L3_2
    L3_2 = L3_2.FormatMsValueToHHMMSS
    L5_2 = GetTeamTimer
    L6_2 = teamId1
    L5_2, L6_2, L7_2, L8_2, L9_2 = L5_2(L6_2)
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = TextSprite
    L6_2 = L2_2
    L5_2 = L2_2.PlayerNum
    L5_2 = L5_2(L6_2)
    L6_2 = 400
    L7_2 = 75
    L8_2 = 2
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    A0_2.teamACountTimer = L4_2
    L4_2 = A0_2.teamACountTimer
    L5_2 = L4_2
    L4_2 = L4_2.Scale
    L6_2 = 0.8878
    L4_2(L5_2, L6_2)
    L4_2 = A0_2.teamACountTimer
    L5_2 = L4_2
    L4_2 = L4_2.Style
    L6_2 = 1
    L4_2(L5_2, L6_2)
    L4_2 = A0_2.teamACountTimer
    L5_2 = L4_2
    L4_2 = L4_2.Colour
    L6_2 = 255
    L7_2 = 255
    L8_2 = 255
    L9_2 = 255
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = A0_2.teamACountTimer
    L5_2 = L4_2
    L4_2 = L4_2.Text
    L6_2 = "^S^"
    L7_2 = L3_2
    L6_2 = L6_2 .. L7_2
    L4_2(L5_2, L6_2)
    L4_2 = coreLib
    L5_2 = L4_2
    L4_2 = L4_2.FormatMsValueToHHMMSS
    L6_2 = GetTeamTimer
    L7_2 = teamId2
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L3_2 = L4_2
    L4_2 = TextSprite
    L6_2 = L2_2
    L5_2 = L2_2.PlayerNum
    L5_2 = L5_2(L6_2)
    L6_2 = 400
    L7_2 = 95
    L8_2 = 2
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    A0_2.teamBCountTimer = L4_2
    L4_2 = A0_2.teamBCountTimer
    L5_2 = L4_2
    L4_2 = L4_2.Scale
    L6_2 = 0.8878
    L4_2(L5_2, L6_2)
    L4_2 = A0_2.teamBCountTimer
    L5_2 = L4_2
    L4_2 = L4_2.Style
    L6_2 = 1
    L4_2(L5_2, L6_2)
    L4_2 = A0_2.teamBCountTimer
    L5_2 = L4_2
    L4_2 = L4_2.Colour
    L6_2 = 255
    L7_2 = 255
    L8_2 = 255
    L9_2 = 255
    L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
    L4_2 = A0_2.teamBCountTimer
    L5_2 = L4_2
    L4_2 = L4_2.Text
    L6_2 = "^S^"
    L7_2 = L3_2
    L6_2 = L6_2 .. L7_2
    L4_2(L5_2, L6_2)
  end
end
L0_1.ShowHUD = L1_1
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = A0_2.gameDataInitialised
  if L1_2 ~= nil then
    L1_2 = nil
    L2_2 = GetTeamTimer
    L3_2 = teamId1
    L2_2 = L2_2(L3_2)
    if 0 < L2_2 then
      L2_2 = GetTeamTimer
      L3_2 = teamId1
      L2_2 = L2_2(L3_2)
      L1_2 = L2_2
    else
      L1_2 = 0
    end
    L2_2 = coreLib
    L3_2 = L2_2
    L2_2 = L2_2.FormatMsValueToHHMMSS
    L4_2 = L1_2
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = A0_2.teamACountTimer
    if L3_2 ~= nil then
      L3_2 = A0_2.teamACountTimer
      L4_2 = L3_2
      L3_2 = L3_2.Text
      L5_2 = "^S"
      L6_2 = L2_2
      L5_2 = L5_2 .. L6_2
      L3_2(L4_2, L5_2)
      L3_2 = A0_2.teamACountTimer
      L4_2 = L3_2
      L3_2 = L3_2.Colour
      L5_2 = A0_2.team1Colour
      L3_2(L4_2, L5_2)
    end
    L3_2 = GetTeamTimer
    L4_2 = teamId2
    L3_2 = L3_2(L4_2)
    if 0 < L3_2 then
      L3_2 = GetTeamTimer
      L4_2 = teamId2
      L3_2 = L3_2(L4_2)
      L1_2 = L3_2
    else
      L1_2 = 0
    end
    L3_2 = coreLib
    L4_2 = L3_2
    L3_2 = L3_2.FormatMsValueToHHMMSS
    L5_2 = L1_2
    L3_2 = L3_2(L4_2, L5_2)
    L2_2 = L3_2
    L3_2 = A0_2.teamBCountTimer
    if L3_2 ~= nil then
      L3_2 = A0_2.teamBCountTimer
      L4_2 = L3_2
      L3_2 = L3_2.Text
      L5_2 = "^S"
      L6_2 = L2_2
      L5_2 = L5_2 .. L6_2
      L3_2(L4_2, L5_2)
      L3_2 = A0_2.teamBCountTimer
      L4_2 = L3_2
      L3_2 = L3_2.Colour
      L5_2 = A0_2.team2Colour
      L3_2(L4_2, L5_2)
    end
  end
end
L0_1.DisplayCountDownTimers = L1_1
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = GetTeamTimer
  L2_2 = teamId1
  L1_2 = L1_2(L2_2)
  if L1_2 < 0 then
    L1_2 = 0
  end
  L2_2 = A0_2.teamscores
  L2_2[1] = L1_2
  L2_2 = GetTeamTimer
  L3_2 = teamId2
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  if L1_2 < 0 then
    L1_2 = 0
  end
  L2_2 = A0_2.teamscores
  L3_2 = GetTeamTimer
  L4_2 = teamId2
  L3_2 = L3_2(L4_2)
  L2_2[2] = L3_2
end
L0_1.UpdateScores = L1_1
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = CreatePickup
  L2_2 = pickup
  L2_2 = L2_2.flagball
  L3_2 = A0_2.bombStartPosition
  L3_2 = L3_2[1]
  L4_2 = 1
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = DestroyLuaObject
  L1_2()
  A0_2.flagBallCarrier = -1
end
L0_1.ResetFlagBall = L1_1
L0_1 = FlagBall
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
L0_1.DoSendEvent = L1_1
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.HasFlagBall
  L2_2 = L2_2(L3_2)
  if L2_2 then
    L3_2 = L1_2
    L2_2 = L1_2.TeamId
    L2_2 = L2_2(L3_2)
    L3_2 = teamId1
    if L2_2 == L3_2 then
      L2_2 = IsPosInArea
      L4_2 = L1_2
      L3_2 = L1_2.Position
      L3_2 = L3_2(L4_2)
      L4_2 = A0_2.teamABombEndPos
      L4_2 = L4_2[1]
      L5_2 = BOMB_DROP_RAD
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      if L2_2 then
        L2_2 = IsLocalPlayerInVehicle
        L2_2 = L2_2()
        if not L2_2 then
          L3_2 = L1_2
          L2_2 = L1_2.DropFlagBall
          L2_2(L3_2)
          L3_2 = A0_2
          L2_2 = A0_2.DoSendEvent
          L4_2 = EVENT_BOMB_DELIVERED
          L5_2 = teamId1
          L6_2 = 0
          L7_2 = 0
          L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
        end
      end
    else
      L3_2 = L1_2
      L2_2 = L1_2.TeamId
      L2_2 = L2_2(L3_2)
      L3_2 = teamId2
      if L2_2 == L3_2 then
        L2_2 = IsPosInArea
        L4_2 = L1_2
        L3_2 = L1_2.Position
        L3_2 = L3_2(L4_2)
        L4_2 = A0_2.teamBBombEndPos
        L4_2 = L4_2[1]
        L5_2 = BOMB_DROP_RAD
        L2_2 = L2_2(L3_2, L4_2, L5_2)
        if L2_2 then
          L2_2 = IsLocalPlayerInVehicle
          L2_2 = L2_2()
          if not L2_2 then
            L3_2 = L1_2
            L2_2 = L1_2.DropFlagBall
            L2_2(L3_2)
            L3_2 = A0_2
            L2_2 = A0_2.DoSendEvent
            L4_2 = EVENT_BOMB_DELIVERED
            L5_2 = teamId2
            L6_2 = 0
            L7_2 = 0
            L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
          end
        end
      end
    end
  end
  L2_2 = A0_2.playerHasFlagBall
  if L2_2 then
    L3_2 = L1_2
    L2_2 = L1_2.HasFlagBall
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = false
      A0_2.playerHasFlagBall = L2_2
      L3_2 = A0_2
      L2_2 = A0_2.DoSendEvent
      L4_2 = EVENT_PLAYER_HAS_FLAGBALL
      L6_2 = L1_2
      L5_2 = L1_2.PlayerNum
      L5_2 = L5_2(L6_2)
      L6_2 = 0
      L7_2 = 0
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    end
  else
    L3_2 = L1_2
    L2_2 = L1_2.HasFlagBall
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = true
      A0_2.playerHasFlagBall = L2_2
      L3_2 = A0_2
      L2_2 = A0_2.DoSendEvent
      L4_2 = EVENT_PLAYER_HAS_FLAGBALL
      L6_2 = L1_2
      L5_2 = L1_2.PlayerNum
      L5_2 = L5_2(L6_2)
      L6_2 = 1
      L7_2 = 0
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    end
  end
  L2_2 = A0_2.ownBlip
  if L2_2 then
    L2_2 = UpdateBlipCoord
    L3_2 = A0_2.ownBlip
    L4_2 = Player
    L4_2 = L4_2()
    L5_2 = L4_2
    L4_2 = L4_2.Position
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
end
L0_1.CheckFlagBallPos = L1_1
L0_1 = FlagBall
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
  L2_2 = FlagBall
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
L0_1 = FlagBall
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.flagBallCarrier
    if L1_2 ~= -1 then
      L1_2 = IsConnected
      L2_2 = Player
      L3_2 = A0_2.flagBallCarrier
      L2_2, L3_2 = L2_2(L3_2)
      L1_2 = L1_2(L2_2, L3_2)
      if not L1_2 then
        L2_2 = A0_2
        L1_2 = A0_2.ResetFlagBall
        L1_2(L2_2)
      end
    end
  end
end
L0_1.CheckForCarrierDisconnection = L1_1
