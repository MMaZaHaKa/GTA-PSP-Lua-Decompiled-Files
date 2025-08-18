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
Hunter = L0_1
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
L0_1 = 2
MSG_AQUIRED_CHOPPER = L0_1
L0_1 = HunterModel
L0_1 = L0_1()
MODELID_HELI_HUNTER = L0_1
L0_1 = Hunter
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
  L1_2 = UpdateGameTime
  L2_2 = true
  L1_2(L2_2)
  L1_2 = "StateRunning"
  return L1_2
end
L0_1.StateInit = L1_1
L0_1 = Hunter
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
  L1_2 = RemoveBlip
  L2_2 = A0_2.TankRadarBlip
  L1_2(L2_2)
  L1_2 = collectgarbage
  L1_2()
end
L0_1.CleanUp = L1_1
L0_1 = Hunter
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = {}
  A0_2.playerSpawnPoints = L1_2
  L1_2 = table
  L1_2 = L1_2.clone
  L2_2 = main
  L2_2 = L2_2.vSpawnPoints
  L1_2 = L1_2(L2_2)
  A0_2.playerSpawnPoints = L1_2
  L1_2 = {}
  A0_2.chopperSpawnPoints = L1_2
  L1_2 = {}
  A0_2.playerInitSpawnPoints = L1_2
  L1_2 = nil
  L2_2 = UseLCFiles
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = dofile
    L3_2 = GetDiskPrepend
    L3_2 = L3_2()
    L4_2 = "LUA/HunterAttackData.lua.lc"
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  else
    L2_2 = dofile
    L3_2 = GetDiskPrepend
    L3_2 = L3_2()
    L4_2 = "LUA/HunterAttackData.lua"
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  end
  L2_2 = {}
  L3_2 = {}
  L4_2 = L1_2
  L4_2, L5_2 = L4_2()
  L3_2 = L5_2
  L2_2 = L4_2
  L4_2 = table
  L4_2 = L4_2.clone
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  A0_2.chopperSpawnPoint = L4_2
  L4_2 = table
  L4_2 = L4_2.clone
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  A0_2.playerInitSpawnPoints = L4_2
  L4_2 = island
  A0_2.island = L4_2
  L4_2 = true
  A0_2.InitialSpawn = L4_2
  L1_2 = nil
  L4_2 = main
  L4_2.vSpawnPoints = nil
  L4_2 = collectgarbage
  L4_2()
  L4_2 = {}
  A0_2.perZoneIndexPlayerArray = L4_2
  L4_2 = {}
  A0_2.perZoneSizePlayerArray = L4_2
  L4_2 = CoreLib
  L5_2 = L4_2
  L4_2 = L4_2.ExtractPerZoneInfo
  L6_2 = A0_2.perZoneIndexPlayerArray
  L7_2 = A0_2.perZoneSizePlayerArray
  L8_2 = A0_2.playerSpawnPoints
  L4_2(L5_2, L6_2, L7_2, L8_2)
  L4_2 = coreLib
  L5_2 = L4_2
  L4_2 = L4_2.ToggleEndOfGame
  L6_2 = false
  L4_2(L5_2, L6_2)
  L4_2 = GameElapsedMs
  L5_2 = 0
  L4_2(L5_2)
  L4_2 = IsServer
  L4_2 = L4_2()
  if L4_2 then
    L4_2 = UsePowerups
    L4_2 = L4_2()
    if L4_2 then
      L4_2 = PowerUpTimer
      L5_2 = L4_2
      L4_2 = L4_2.Start
      L4_2(L5_2)
    end
    L4_2 = ServerLogic
    L4_2 = L4_2()
    A0_2.ServerLogic = L4_2
    L4_2 = A0_2.ServerLogic
    L5_2 = L4_2
    L4_2 = L4_2.Start
    L4_2(L5_2)
  end
  L4_2 = MessagePump
  L4_2 = L4_2()
  A0_2.myMessagePump = L4_2
  L4_2 = A0_2.myMessagePump
  L5_2 = L4_2
  L4_2 = L4_2.Start
  L4_2(L5_2)
  A0_2.peerInChopper = nil
  A0_2.gameWinner = nil
  L4_2 = {}
  A0_2.scores = L4_2
  L4_2 = A0_2.scores
  L4_2[1] = 0
  L4_2 = A0_2.scores
  L4_2[2] = 0
  L4_2 = A0_2.scores
  L4_2[3] = 0
  L4_2 = A0_2.scores
  L4_2[4] = 0
  L4_2 = A0_2.scores
  L4_2[5] = 0
  L4_2 = A0_2.scores
  L4_2[6] = 0
  L4_2 = A0_2.scores
  L4_2[7] = 0
  L4_2 = A0_2.scores
  L4_2[8] = 0
  L4_2 = IsServer
  L4_2 = L4_2()
  if L4_2 then
    A0_2.chopper = nil
    L4_2 = {}
    L4_2[1] = 0
    L4_2[2] = 0
    L4_2[3] = 0
    L5_2 = AddBlipForCoord
    L6_2 = GetEveryonePeerGroupId
    L6_2 = L6_2()
    L7_2 = L4_2
    L8_2 = 3
    L9_2 = pickupicon
    L9_2 = L9_2.heli
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2)
    A0_2.chopperBlip = L5_2
    L5_2 = NetMeter2d
    L6_2 = GetEveryonePeerGroupId
    L6_2 = L6_2()
    L7_2 = 370
    L8_2 = 70
    L9_2 = 48
    L10_2 = 15
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    A0_2.chopperHealthMeter = L5_2
    L5_2 = A0_2.chopperHealthMeter
    L6_2 = L5_2
    L5_2 = L5_2.FillRatio
    L7_2 = 1
    L5_2(L6_2, L7_2)
    L5_2 = A0_2.chopperHealthMeter
    L6_2 = L5_2
    L5_2 = L5_2.Colour
    L7_2 = 48076
    L5_2(L6_2, L7_2)
    L5_2 = A0_2.chopperHealthMeter
    L6_2 = L5_2
    L5_2 = L5_2.UseTitle
    L7_2 = 1
    L5_2(L6_2, L7_2)
    L5_2 = A0_2.chopperHealthMeter
    L6_2 = L5_2
    L5_2 = L5_2.SetTitleKey
    L7_2 = "HA_HNT"
    L5_2(L6_2, L7_2)
  end
  L4_2 = IsServer
  L4_2 = L4_2()
  if L4_2 then
    L4_2 = ServerReadyToGo
    L5_2 = true
    L4_2(L5_2)
    L4_2 = Wait
    L5_2 = 500
    L4_2(L5_2)
  end
  L4_2 = ClearSplashScreen
  L4_2()
  L4_2 = Player
  L4_2 = L4_2()
  L6_2 = A0_2
  L5_2 = A0_2.GetPlayerRespawnPosition
  L5_2 = L5_2(L6_2)
  L7_2 = L4_2
  L6_2 = L4_2.Respawn
  L8_2 = L5_2
  L6_2(L7_2, L8_2)
  L7_2 = A0_2
  L6_2 = A0_2.PrintSpawnText
  L6_2(L7_2)
end
L0_1.InitGame = L1_1
L0_1 = Hunter
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.IsEndOfGame
  L1_2 = L1_2(L2_2)
  if not L1_2 then
    L2_2 = A0_2
    L1_2 = A0_2.CheckForRespawn
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.CheckForChopperDisconnection
    L1_2(L2_2)
    L1_2 = GameTimeLimit
    L1_2 = L1_2()
    if 0 < L1_2 then
      L1_2 = main
      L1_2 = L1_2.scores
      L1_2 = L1_2.scores
      if L1_2 then
        L1_2 = A0_2.DMTime
        if L1_2 ~= nil then
          L1_2 = A0_2.DMTime
          L2_2 = L1_2
          L1_2 = L1_2.Remove
          L1_2(L2_2)
          A0_2.DMTime = nil
        end
      else
        L1_2 = A0_2.DMTime
        if L1_2 == nil then
          L1_2 = Player
          L1_2 = L1_2()
          L2_2 = TextSprite
          L4_2 = L1_2
          L3_2 = L1_2.PlayerNum
          L3_2 = L3_2(L4_2)
          L4_2 = 410
          L5_2 = 85
          L6_2 = 0
          L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
          A0_2.DMTime = L2_2
          L2_2 = A0_2.DMTime
          L3_2 = L2_2
          L2_2 = L2_2.Scale
          L4_2 = 0.8878
          L2_2(L3_2, L4_2)
          L2_2 = A0_2.DMTime
          L3_2 = L2_2
          L2_2 = L2_2.Style
          L4_2 = 1
          L2_2(L3_2, L4_2)
          L2_2 = A0_2.DMTime
          L3_2 = L2_2
          L2_2 = L2_2.Colour
          L4_2 = GameColour
          L5_2 = 10
          L4_2, L5_2, L6_2 = L4_2(L5_2)
          L2_2(L3_2, L4_2, L5_2, L6_2)
        end
      end
      L1_2 = string
      L1_2 = L1_2.format
      L2_2 = "%d:%02d"
      L3_2 = GameTimeMinutes
      L3_2 = L3_2()
      L4_2 = GameTimeSeconds
      L4_2, L5_2, L6_2 = L4_2()
      L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
      L2_2 = A0_2.DMTime
      if L2_2 ~= nil then
        L2_2 = A0_2.DMTime
        L3_2 = L2_2
        L2_2 = L2_2.Text
        L4_2 = "^S^"
        L5_2 = L1_2
        L4_2 = L4_2 .. L5_2
        L2_2(L3_2, L4_2)
      end
    end
    L1_2 = collectgarbage
    L1_2()
    L1_2 = Wait
    L2_2 = 10
    L1_2(L2_2)
  else
    L1_2 = Player
    L1_2 = L1_2()
    L2_2 = A0_2.gameWinner
    if L2_2 == 7 then
      L2_2 = DisplayFinalWinLoseMessage
      L3_2 = 0
      L4_2 = ""
      L2_2(L3_2, L4_2)
    else
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
    end
    L2_2 = A0_2.DMTime
    if L2_2 ~= nil then
      L2_2 = A0_2.DMTime
      L3_2 = L2_2
      L2_2 = L2_2.Remove
      L2_2(L3_2)
      A0_2.DMTime = nil
    end
    L2_2 = UpdateGameTime
    L3_2 = false
    L2_2(L3_2)
    L2_2 = main
    L2_2 = L2_2.game
    L2_2.state = "StateGameWon"
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
  goto lbl_17
  repeat
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.UpdateChopper
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.UpdateRadar
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.CheckForEndOfGame
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 10
    L1_2(L2_2)
    ::lbl_17::
    L1_2 = coreLib
    L2_2 = L1_2
    L1_2 = L1_2.IsEndOfGame
    L1_2 = L1_2(L2_2)
  until L1_2
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
L0_1 = Hunter
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = 0
    L2_2 = AllPlayers
    L2_2 = L2_2()
    L3_2 = GameTimeLimit
    L3_2 = L3_2()
    if 0 < L3_2 then
      L3_2 = 60000
      L4_2 = GameTimeMinutes
      L4_2 = L4_2()
      L5_2 = GameTimeSeconds
      L5_2 = L5_2()
      L6_2 = L4_2 * 60000
      L7_2 = L5_2 * 1000
      L6_2 = L6_2 + L7_2
      if L6_2 <= 0 then
        L7_2 = -9999
        L8_2 = 0
        L9_2 = ipairs
        L10_2 = L2_2
        L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
        for L11_2, L12_2 in L9_2, L10_2 do
          L14_2 = A0_2
          L13_2 = A0_2.Score
          L15_2 = L12_2
          L13_2 = L13_2(L14_2, L15_2)
          if L7_2 < L13_2 then
            L14_2 = A0_2
            L13_2 = A0_2.Score
            L15_2 = L12_2
            L13_2 = L13_2(L14_2, L15_2)
            L7_2 = L13_2
            L14_2 = L12_2
            L13_2 = L12_2.PlayerNum
            L13_2 = L13_2(L14_2)
            L8_2 = L13_2
          end
        end
        L9_2 = 0
        L10_2 = ipairs
        L11_2 = L2_2
        L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
        for L12_2, L13_2 in L10_2, L11_2 do
          L15_2 = A0_2
          L14_2 = A0_2.Score
          L16_2 = L13_2
          L14_2 = L14_2(L15_2, L16_2)
          if L14_2 == L7_2 then
            L9_2 = L9_2 + 1
          end
        end
        if 1 < L9_2 and L7_2 == 0 then
          L8_2 = 7
        end
        L11_2 = A0_2
        L10_2 = A0_2.SendEvent
        L12_2 = MSG_END_GAME
        L13_2 = L8_2
        L14_2 = 0
        L15_2 = 0
        L10_2(L11_2, L12_2, L13_2, L14_2, L15_2)
        return
      end
    end
    L3_2 = GameScoreLimit
    L3_2 = L3_2()
    if 0 < L3_2 then
      L3_2 = ipairs
      L4_2 = L2_2
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L5_2, L6_2 in L3_2, L4_2 do
        L8_2 = A0_2
        L7_2 = A0_2.Score
        L9_2 = L6_2
        L7_2 = L7_2(L8_2, L9_2)
        L8_2 = GameScoreLimit
        L8_2 = L8_2()
        if L7_2 >= L8_2 then
          L8_2 = A0_2
          L7_2 = A0_2.SendEvent
          L9_2 = MSG_END_GAME
          L11_2 = L6_2
          L10_2 = L6_2.PlayerNum
          L10_2 = L10_2(L11_2)
          L11_2 = 0
          L12_2 = 0
          L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
          return
        end
      end
    end
  end
end
L0_1.CheckForEndOfGame = L1_1
L0_1 = Hunter
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.chopper
    if L1_2 ~= nil then
      L1_2 = IsVehicleWrecked
      L2_2 = A0_2.chopper
      L1_2 = L1_2(L2_2)
      if not L1_2 then
        goto lbl_38
      end
    end
    L1_2 = {}
    L3_2 = A0_2
    L2_2 = A0_2.GetChopperRespawnPosition
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
    L2_2 = ClearArea
    L3_2 = L1_2[1]
    L4_2 = 5
    L2_2(L3_2, L4_2)
    L2_2 = Wait
    L3_2 = 25
    L2_2(L3_2)
    L2_2 = CreateVehicle
    L3_2 = MODELID_HELI_HUNTER
    L4_2 = L1_2[1]
    L5_2 = L1_2[2]
    L6_2 = nil
    L7_2 = nil
    L8_2 = true
    L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    A0_2.chopper = L2_2
    L2_2 = SetRadarBlipColour
    L3_2 = A0_2.chopperBlip
    L4_2 = GameColour
    L5_2 = 10
    L4_2, L5_2, L6_2, L7_2, L8_2 = L4_2(L5_2)
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
    ::lbl_38::
    L1_2 = VehicleGetDriverPlayerId
    L2_2 = A0_2.chopper
    L1_2 = L1_2(L2_2)
    if 0 <= L1_2 then
      L1_2 = A0_2.peerInChopper
      if L1_2 == nil then
        L2_2 = A0_2
        L1_2 = A0_2.SendEvent
        L3_2 = MSG_AQUIRED_CHOPPER
        L4_2 = VehicleGetDriverPlayerId
        L5_2 = A0_2.chopper
        L4_2 = L4_2(L5_2)
        L5_2 = 0
        L6_2 = 0
        L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
      end
    end
    L1_2 = A0_2.chopper
    if L1_2 ~= nil then
      L1_2 = VehicleHealth
      L2_2 = A0_2.chopper
      L1_2 = L1_2(L2_2)
      L2_2 = L1_2 - 200
      L1_2 = L2_2 / 800
      if L1_2 < 0 then
        L1_2 = 0
      end
      L2_2 = A0_2.chopperHealthMeter
      L3_2 = L2_2
      L2_2 = L2_2.FillRatio
      L4_2 = L1_2
      L2_2(L3_2, L4_2)
    end
  end
end
L0_1.UpdateChopper = L1_1
L0_1 = Hunter
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = print
    L2_2 = "GetChopperRespawnPosition"
    L1_2(L2_2)
    L1_2 = {}
    L2_2 = 1
    L3_2 = math
    L3_2 = L3_2.random
    L4_2 = 1
    L5_2 = table
    L5_2 = L5_2.getn
    L6_2 = A0_2.chopperSpawnPoint
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L5_2(L6_2)
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L2_2 = L3_2
    L3_2 = A0_2.chopperSpawnPoint
    L1_2 = L3_2[L2_2]
    L3_2 = print
    L4_2 = "index == "
    L5_2 = L2_2
    L6_2 = "pos x "
    L7_2 = L1_2[1]
    L7_2 = L7_2[1]
    L8_2 = "pos y "
    L9_2 = L1_2[1]
    L9_2 = L9_2[2]
    L10_2 = "pos z "
    L11_2 = L1_2[1]
    L11_2 = L11_2[3]
    L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
    L3_2(L4_2)
    return L1_2
  end
end
L0_1.GetChopperRespawnPosition = L1_1
L0_1 = Hunter
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2.peerInChopper
  if L1_2 ~= nil then
    L1_2 = Player
    L2_2 = A0_2.peerInChopper
    L1_2 = L1_2(L2_2)
    L2_2 = IsConnected
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = print
      L3_2 = "Player has left the game and was in the chopper"
      L4_2 = A0_2.peerInChopper
      L3_2 = L3_2 .. L4_2
      L2_2(L3_2)
      A0_2.peerInChopper = nil
      L2_2 = IsServer
      L2_2 = L2_2()
      if L2_2 then
        L2_2 = DeleteVehicle
        L3_2 = A0_2.chopper
        L2_2(L3_2)
        A0_2.chopper = nil
      end
    end
  end
end
L0_1.CheckForChopperDisconnection = L1_1
L0_1 = Hunter
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = IsVehicleWrecked
    L2_2 = A0_2.chopper
    L1_2 = L1_2(L2_2)
    L2_2 = false
    if L1_2 == L2_2 then
      L1_2 = nil
      L2_2 = VehiclePosition
      L3_2 = A0_2.chopper
      L2_2 = L2_2(L3_2)
      L1_2 = L2_2
      L2_2 = L1_2[3]
      L2_2 = L2_2 + 1000
      L1_2[3] = L2_2
      L2_2 = UpdateBlipCoord
      L3_2 = A0_2.chopperBlip
      L4_2 = L1_2
      L2_2(L3_2, L4_2)
    end
  end
end
L0_1.UpdateRadar = L1_1
L0_1 = Hunter
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
    L4_2 = A0_2
    L3_2 = A0_2.PrintSpawnText
    L3_2(L4_2)
  end
end
L0_1.CheckForRespawn = L1_1
L0_1 = Hunter
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = {}
  L3_2 = A0_2.InitialSpawn
  L4_2 = true
  if L3_2 == L4_2 then
    L3_2 = false
    A0_2.InitialSpawn = L3_2
    L3_2 = main
    L4_2 = A0_2.playerInitSpawnPoints
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
    L4_2 = A0_2.playerSpawnPoints
    L3_2.vSpawnPoints = L4_2
    L3_2 = DoSpawn
    L4_2 = nil
    L5_2 = false
    L3_2 = L3_2(L4_2, L5_2)
    L2_2 = L3_2
  end
  return L2_2
end
L0_1.GetPlayerRespawnPosition = L1_1
L0_1 = Hunter
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2.peerInChopper
  if L1_2 == nil then
    L1_2 = coreLib
    L2_2 = L1_2
    L1_2 = L1_2.Commentate
    L3_2 = "^T^HA_STRT"
    L1_2(L2_2, L3_2)
  else
    L1_2 = coreLib
    L2_2 = L1_2
    L1_2 = L1_2.Commentate
    L3_2 = "^T^HA_DSRY"
    L1_2(L2_2, L3_2)
  end
end
L0_1.PrintSpawnText = L1_1
L0_1 = Hunter
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = A2_2
  L4_2 = A2_2.Name
  L4_2 = L4_2(L5_2)
  L6_2 = A1_2
  L5_2 = A1_2.Name
  L5_2 = L5_2(L6_2)
  L6_2 = print
  L7_2 = "XXX RegisterPlayerKill XXX"
  L6_2(L7_2)
  L6_2 = print
  L7_2 = ""
  L8_2 = L4_2
  L9_2 = " Killed "
  L10_2 = L5_2
  L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2
  L6_2(L7_2)
  L6_2 = A0_2.peerInChopper
  if L6_2 ~= nil then
    L7_2 = A1_2
    L6_2 = A1_2.PlayerNum
    L6_2 = L6_2(L7_2)
    L7_2 = A0_2.peerInChopper
    if L6_2 == L7_2 then
      L6_2 = print
      L7_2 = "the chopper is toast"
      L6_2(L7_2)
      L6_2 = print
      L7_2 = "deadPlayer:PlayerNum() == "
      L9_2 = A1_2
      L8_2 = A1_2.PlayerNum
      L8_2 = L8_2(L9_2)
      L9_2 = " killer:PlayerNum() == "
      L11_2 = A2_2
      L10_2 = A2_2.PlayerNum
      L10_2 = L10_2(L11_2)
      L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2
      L6_2(L7_2)
      L6_2 = coreLib
      L7_2 = L6_2
      L6_2 = L6_2.Commentate
      L8_2 = "^T^HA_DST"
      L6_2(L7_2, L8_2)
      L7_2 = A1_2
      L6_2 = A1_2.PlayerNum
      L6_2 = L6_2(L7_2)
      L8_2 = A2_2
      L7_2 = A2_2.PlayerNum
      L7_2 = L7_2(L8_2)
      if L6_2 ~= L7_2 then
      end
      L6_2 = IsServer
      L6_2 = L6_2()
      if L6_2 then
        L6_2 = SetBlipVisibleForPlayerState
        L7_2 = main
        L7_2 = L7_2.game
        L7_2 = L7_2.chopperBlip
        L8_2 = main
        L8_2 = L8_2.game
        L8_2 = L8_2.peerInChopper
        L9_2 = true
        L6_2(L7_2, L8_2, L9_2)
        L6_2 = IsVehicleWrecked
        L7_2 = A0_2.chopper
        L6_2 = L6_2(L7_2)
        L7_2 = false
        if L6_2 == L7_2 then
          L6_2 = print
          L7_2 = "snipered the chopper pilot, blowing the chopper up manually"
          L6_2(L7_2)
          L6_2 = BlowupVehicle
          L7_2 = A0_2.chopper
          L9_2 = A2_2
          L8_2 = A2_2.PlayerNum
          L8_2, L9_2, L10_2, L11_2, L12_2 = L8_2(L9_2)
          L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        end
      end
      L7_2 = A1_2
      L6_2 = A1_2.SetRadarBlipVisibleState
      L8_2 = true
      L6_2(L7_2, L8_2)
      L6_2 = IsServer
      L6_2 = L6_2()
      if L6_2 then
        A0_2.chopper = nil
      end
      A0_2.peerInChopper = nil
      return
    else
      L7_2 = A2_2
      L6_2 = A2_2.PlayerNum
      L6_2 = L6_2(L7_2)
      L7_2 = A0_2.peerInChopper
      if L6_2 == L7_2 then
        L6_2 = print
        L7_2 = "chopper killed someone"
        L6_2(L7_2)
        L6_2 = A0_2.scores
        L8_2 = A2_2
        L7_2 = A2_2.PlayerNum
        L7_2 = L7_2(L8_2)
        L7_2 = L7_2 + 1
        L8_2 = A0_2.scores
        L10_2 = A2_2
        L9_2 = A2_2.PlayerNum
        L9_2 = L9_2(L10_2)
        L9_2 = L9_2 + 1
        L8_2 = L8_2[L9_2]
        L8_2 = L8_2 + 1
        L6_2[L7_2] = L8_2
        L6_2 = coreLib
        L7_2 = L6_2
        L6_2 = L6_2.Commentate
        L8_2 = "^S^"
        L9_2 = L5_2
        L10_2 = "^S^ ^T^HA_HNTK"
        L8_2 = L8_2 .. L9_2 .. L10_2
        L6_2(L7_2, L8_2)
        return
      end
    end
  end
  L6_2 = print
  L7_2 = "kill not involving chopper"
  L6_2(L7_2)
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
L0_1 = Hunter
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A0_2.scores
  L4_2 = A1_2
  L3_2 = A1_2.PlayerNum
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 + 1
  L2_2 = L2_2[L3_2]
  return L2_2
end
L0_1.Score = L1_1
L0_1 = Hunter
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
        L7_2 = string
        L7_2 = L7_2.format
        L8_2 = "0:00"
        L7_2 = L7_2(L8_2)
        L8_2 = main
        L8_2 = L8_2.game
        L8_2 = L8_2.DMTime
        if L8_2 ~= nil then
          L8_2 = main
          L8_2 = L8_2.game
          L8_2 = L8_2.DMTime
          L9_2 = L8_2
          L8_2 = L8_2.Text
          L10_2 = "^S^"
          L11_2 = L7_2
          L10_2 = L10_2 .. L11_2
          L8_2(L9_2, L10_2)
        end
        L8_2 = coreLib
        L9_2 = L8_2
        L8_2 = L8_2.ToggleEndOfGame
        L10_2 = true
        L8_2(L9_2, L10_2)
      else
        L7_2 = MSG_AQUIRED_CHOPPER
        if L3_2 == L7_2 then
          L7_2 = print
          L8_2 = "MSG_AQUIRED_CHOPPER"
          L7_2(L8_2)
          L7_2 = print
          L8_2 = "Peer in chopper "
          L9_2 = L4_2
          L8_2 = L8_2 .. L9_2
          L7_2(L8_2)
          L7_2 = main
          L7_2 = L7_2.game
          L7_2.peerInChopper = L4_2
          L7_2 = Player
          L8_2 = L4_2
          L7_2 = L7_2(L8_2)
          L8_2 = IsServer
          L8_2 = L8_2()
          if L8_2 then
            L8_2 = print
            L9_2 = "Changing blip to match players colour "
            L10_2 = Player
            L11_2 = main
            L11_2 = L11_2.game
            L11_2 = L11_2.peerInChopper
            L10_2 = L10_2(L11_2)
            L11_2 = L10_2
            L10_2 = L10_2.Colour
            L10_2 = L10_2(L11_2)
            L9_2 = L9_2 .. L10_2
            L8_2(L9_2)
            L8_2 = SetRadarBlipColour
            L9_2 = main
            L9_2 = L9_2.game
            L9_2 = L9_2.chopperBlip
            L10_2 = Player
            L11_2 = main
            L11_2 = L11_2.game
            L11_2 = L11_2.peerInChopper
            L10_2 = L10_2(L11_2)
            L11_2 = L10_2
            L10_2 = L10_2.Colour
            L10_2, L11_2, L12_2, L13_2 = L10_2(L11_2)
            L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
            L8_2 = SetBlipVisibleForPlayerState
            L9_2 = main
            L9_2 = L9_2.game
            L9_2 = L9_2.chopperBlip
            L10_2 = main
            L10_2 = L10_2.game
            L10_2 = L10_2.peerInChopper
            L11_2 = false
            L8_2(L9_2, L10_2, L11_2)
          end
          L8_2 = main
          L8_2 = L8_2.game
          L8_2 = L8_2.peerInChopper
          L10_2 = L1_2
          L9_2 = L1_2.PlayerNum
          L9_2 = L9_2(L10_2)
          if L8_2 == L9_2 then
            L8_2 = coreLib
            L9_2 = L8_2
            L8_2 = L8_2.Commentate
            L10_2 = "^T^HA_KILL"
            L8_2(L9_2, L10_2)
            L9_2 = L1_2
            L8_2 = L1_2.SetRadarBlipVisibleState
            L10_2 = false
            L8_2(L9_2, L10_2)
          else
            L8_2 = coreLib
            L9_2 = L8_2
            L8_2 = L8_2.Commentate
            L10_2 = "^S^"
            L12_2 = L7_2
            L11_2 = L7_2.Name
            L11_2 = L11_2(L12_2)
            L12_2 = "^S^ "
            L13_2 = "^T^HA_GOTH"
            L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2
            L8_2(L9_2, L10_2)
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
  L2_2 = Hunter
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
