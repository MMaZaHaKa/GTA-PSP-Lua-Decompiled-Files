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
L0_1 = StateMachine
L1_1 = {}
L2_1 = "StateInit"
L1_1[1] = L2_1
L0_1 = L0_1(L1_1)
HitParade = L0_1
L0_1 = PowerupTimer
L0_1 = L0_1()
PowerUpTimer = L0_1
L0_1 = 1000
CAR_HEALTH_DEC_PERIOD_MS = L0_1
L0_1 = 50
CAR_HEALTH_DEC_AMOUNT = L0_1
L0_1 = 5
HIT_PARADE_GAME_TIME = L0_1
L0_1 = HitParade
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
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
  L1_2 = GameScoreLimit
  L1_2 = L1_2()
  A0_2.fraglimit = L1_2
  L1_2 = {}
  A0_2.timeminutes = L1_2
  L1_2 = {}
  A0_2.timeseconds = L1_2
  L1_2 = {}
  A0_2.bonustimeminutes = L1_2
  L1_2 = {}
  A0_2.bonustimeseconds = L1_2
  L1_2 = false
  A0_2.playerIsInCar = L1_2
  A0_2.timeToNextDecCarHealth = -1
  L1_2 = true
  A0_2.weAreOnFirstTarget = L1_2
  L1_2 = false
  A0_2.gameFinishing = L1_2
  A0_2.HPTime = nil
  L1_2 = UseSuperBrakeOnPause
  L2_2 = false
  L1_2(L2_2)
  A0_2.headshots = 0
  A0_2.numAllRespawns = 0
  L1_2 = GenerateAmbients
  L2_2 = false
  L1_2(L2_2)
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = {}
  A0_2.targetlist = L2_2
  A0_2.currenttarget = 0
  A0_2.currenttargetindex = 0
  L2_2 = ipairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L4_2, L5_2 in L2_2, L3_2 do
    L6_2 = A0_2.targetlist
    L8_2 = L5_2
    L7_2 = L5_2.PlayerNum
    L7_2 = L7_2(L8_2)
    L6_2[L4_2] = L7_2
  end
  L2_2 = print
  L3_2 = table
  L3_2 = L3_2.getn
  L4_2 = A0_2.targetlist
  L3_2 = L3_2(L4_2)
  L4_2 = " players have joined"
  L2_2(L3_2, L4_2)
  L2_2 = ipairs
  L3_2 = A0_2.targetlist
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L4_2, L5_2 in L2_2, L3_2 do
    L6_2 = L5_2
    L7_2 = math
    L7_2 = L7_2.random
    L8_2 = 1
    L9_2 = table
    L9_2 = L9_2.getn
    L10_2 = A0_2.targetlist
    L9_2, L10_2, L11_2 = L9_2(L10_2)
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2)
    L8_2 = A0_2.targetlist
    L9_2 = A0_2.targetlist
    L9_2 = L9_2[L7_2]
    L8_2[L4_2] = L9_2
    L8_2 = A0_2.targetlist
    L8_2[L7_2] = L6_2
  end
  L2_2 = true
  A0_2.neednewtarget = L2_2
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L4_2, L5_2 in L2_2, L3_2 do
    L6_2 = print
    L7_2 = "Player "
    L9_2 = L5_2
    L8_2 = L5_2.PlayerNum
    L8_2 = L8_2(L9_2)
    L9_2 = " has an initial spawn of "
    L10_2 = InitialSpawnPoint
    L11_2 = L5_2
    L10_2 = L10_2(L11_2)
    L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2
    L6_2(L7_2)
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
  L3_2 = A0_2
  L2_2 = A0_2.DoForcedSpawn
  L2_2(L3_2)
  L2_2 = IsServer
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = UsePowerups
    L2_2 = L2_2()
    if L2_2 then
      L2_2 = PowerUpTimer
      L3_2 = L2_2
      L2_2 = L2_2.Start
      L2_2(L3_2)
      L2_2 = DoesPowerupExist
      L2_2 = L2_2()
      if L2_2 < 2 then
        L2_2 = print
        L3_2 = "Respawning a power up at change sides"
        L2_2(L3_2)
        L2_2 = PowerUpTimer
        L3_2 = L2_2
        L2_2 = L2_2.CreateAPowerUp
        L2_2(L3_2)
      end
      L2_2 = DoesPowerupExist
      L2_2 = L2_2()
      if L2_2 < 2 then
        L2_2 = print
        L3_2 = "Respawning another power up at change sides"
        L2_2(L3_2)
        L2_2 = PowerUpTimer
        L3_2 = L2_2
        L2_2 = L2_2.CreateAPowerUp
        L2_2(L3_2)
      end
    end
  end
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
    goto lbl_163
    repeat
      L2_2 = Wait
      L3_2 = 5
      L2_2(L3_2)
      ::lbl_163::
      L2_2 = SyncCutScene
      L2_2 = L2_2()
      L3_2 = false
    until L2_2 ~= L3_2
    L2_2 = RunScriptedCutscene
    L2_2()
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
    goto lbl_177
    repeat
      L2_2 = Wait
      L3_2 = 0
      L2_2(L3_2)
      ::lbl_177::
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
  L2_2 = StartGame
  L2_2()
  L2_2 = "StateRunning"
  return L2_2
end
L0_1.StateInit = L1_1
L0_1 = HitParade
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.mytimer
  L2_2 = L1_2
  L1_2 = L1_2.Stop
  L1_2(L2_2)
  L1_2 = A0_2.HPTime
  if L1_2 ~= nil then
    L1_2 = A0_2.HPTime
    L1_2 = L1_2.Remove
    L1_2()
    A0_2.HPTime = nil
  end
  L1_2 = A0_2.mypickups
  L2_2 = L1_2
  L1_2 = L1_2.Cleanup
  L1_2(L2_2)
  L1_2 = collectgarbage
  L1_2()
end
L0_1.CleanUp = L1_1
L0_1 = HitParade
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if A1_2 == nil then
    A1_2 = true
  end
  L2_2 = Player
  L2_2 = L2_2()
  L4_2 = L2_2
  L3_2 = L2_2.IsPlaying
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = DoWasted
    L3_2()
    L3_2 = TargetPlayer
    L3_2 = L3_2()
    if L3_2 == 200 then
      L4_2 = A0_2
      L3_2 = A0_2.GetWinner
      L3_2(L4_2)
      return
    end
    L3_2 = DoSpawn
    L3_2()
    L3_2 = A0_2.neednewtarget
    if L3_2 and not A1_2 then
      L4_2 = A0_2
      L3_2 = A0_2.NewTarget
      L3_2(L4_2)
    end
  end
end
L0_1.HandlePlayerDead = L1_1
L0_1 = HitParade
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = AllPlayers
  L2_2 = L2_2()
  L4_2 = A0_2
  L3_2 = A0_2.HandlePlayerDead
  L3_2(L4_2)
  L3_2 = TargetPlayer
  L3_2 = L3_2()
  if L3_2 == 200 then
    L4_2 = A0_2
    L3_2 = A0_2.GetWinner
    L3_2(L4_2)
    return
  end
  L3_2 = PlayerHealth
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = PlayerHealth
    L4_2 = L1_2
    L3_2 = L3_2(L4_2)
    if 0 < L3_2 then
      L3_2 = A0_2.neednewtarget
      if L3_2 then
        L4_2 = A0_2
        L3_2 = A0_2.NewTarget
        L3_2(L4_2)
      end
    end
  end
  L3_2 = GameTimeUp
  L3_2 = L3_2()
  if L3_2 then
    L3_2 = UpdateGameTime
    L4_2 = false
    L3_2(L4_2)
    L4_2 = A0_2
    L3_2 = A0_2.SaveTime
    L5_2 = Player
    L6_2 = A0_2.currenttarget
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L5_2(L6_2)
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L3_2 = true
    A0_2.neednewtarget = L3_2
  else
    L3_2 = main
    L3_2 = L3_2.scores
    L3_2 = L3_2.scores
    if L3_2 then
      L3_2 = A0_2.HPTime
      if L3_2 ~= nil then
        L3_2 = A0_2.HPTime
        L4_2 = L3_2
        L3_2 = L3_2.Remove
        L3_2(L4_2)
        A0_2.HPTime = nil
      end
    else
      L3_2 = A0_2.HPTime
      if L3_2 == nil then
        L3_2 = Player
        L3_2 = L3_2()
        L4_2 = TextSprite
        L6_2 = L3_2
        L5_2 = L3_2.PlayerNum
        L5_2 = L5_2(L6_2)
        L6_2 = 470
        L7_2 = 85
        L8_2 = 2
        L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
        A0_2.HPTime = L4_2
        L4_2 = A0_2.HPTime
        L5_2 = L4_2
        L4_2 = L4_2.Scale
        L6_2 = 0.8878
        L4_2(L5_2, L6_2)
        L4_2 = A0_2.HPTime
        L5_2 = L4_2
        L4_2 = L4_2.Style
        L6_2 = 1
        L4_2(L5_2, L6_2)
        L4_2 = A0_2.HPTime
        L5_2 = L4_2
        L4_2 = L4_2.Colour
        L6_2 = GameColour
        L7_2 = 10
        L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2(L7_2)
        L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
      end
    end
    L3_2 = string
    L3_2 = L3_2.format
    L4_2 = "%d:%02d"
    L5_2 = GameTimeMinutes
    L5_2 = L5_2()
    L6_2 = GameTimeSeconds
    L6_2, L7_2, L8_2, L9_2, L10_2, L11_2 = L6_2()
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
    L4_2 = A0_2.HPTime
    if L4_2 ~= nil then
      L4_2 = A0_2.HPTime
      L5_2 = L4_2
      L4_2 = L4_2.Text
      L6_2 = "^S^"
      L7_2 = L3_2
      L6_2 = L6_2 .. L7_2
      L4_2(L5_2, L6_2)
    end
  end
  L3_2 = Player
  L4_2 = A0_2.currenttarget
  L3_2 = L3_2(L4_2)
  L4_2 = IsConnected
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = print
    L5_2 = "Target disconnected. Setting find new target"
    L4_2(L5_2)
    L4_2 = UpdateGameTime
    L5_2 = false
    L4_2(L5_2)
    L4_2 = true
    A0_2.neednewtarget = L4_2
  end
  L4_2 = IsServer
  L4_2 = L4_2()
  if L4_2 then
    L4_2 = AllPlayers
    L4_2 = L4_2()
    L5_2 = table
    L5_2 = L5_2.getn
    L6_2 = L4_2
    L5_2 = L5_2(L6_2)
    if L5_2 == 1 then
      L6_2 = A0_2
      L5_2 = A0_2.GetWinner
      L5_2(L6_2)
    end
  end
  L5_2 = L1_2
  L4_2 = L1_2.Car
  L4_2 = L4_2(L5_2)
  L6_2 = L1_2
  L5_2 = L1_2.PlayerNum
  L5_2 = L5_2(L6_2)
  L6_2 = A0_2.currenttarget
  if L5_2 == L6_2 and L4_2 then
    L5_2 = GameElapsedMs
    L5_2 = L5_2()
    L6_2 = A0_2.playerIsInCar
    if not L6_2 then
      L6_2 = CAR_HEALTH_DEC_PERIOD_MS
      L6_2 = L5_2 + L6_2
      A0_2.timeToNextDecCarHealth = L6_2
      L6_2 = true
      A0_2.playerIsInCar = L6_2
    end
    L6_2 = A0_2.timeToNextDecCarHealth
    if L5_2 > L6_2 then
      L6_2 = VehicleHealth
      L7_2 = L4_2
      L6_2 = L6_2(L7_2)
      L7_2 = VehicleSetHealth
      L8_2 = L4_2
      L9_2 = CAR_HEALTH_DEC_AMOUNT
      L9_2 = L6_2 - L9_2
      L7_2(L8_2, L9_2)
      L7_2 = CAR_HEALTH_DEC_PERIOD_MS
      L7_2 = L5_2 + L7_2
      A0_2.timeToNextDecCarHealth = L7_2
      L7_2 = print
      L8_2 = "reducing vehicle health to "
      L9_2 = CAR_HEALTH_DEC_AMOUNT
      L9_2 = L6_2 - L9_2
      L10_2 = " from "
      L11_2 = L6_2
      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
      L7_2(L8_2)
    end
  else
    L5_2 = false
    A0_2.playerIsInCar = L5_2
    A0_2.timeToNextDecCarHealth = -1
  end
  L5_2 = A0_2.currenttarget
  L6_2 = TargetPlayer
  L6_2 = L6_2()
  if L5_2 ~= L6_2 then
    L5_2 = TargetPlayer
    L5_2 = L5_2()
    if L5_2 < 100 then
      L5_2 = TargetPlayer
      L5_2 = L5_2()
      A0_2.currenttarget = L5_2
      L5_2 = print
      L6_2 = "DOING EMERGENCY TARGET CHANGE TO "
      L7_2 = A0_2.currenttarget
      L6_2 = L6_2 .. L7_2
      L5_2(L6_2)
      L5_2 = A0_2.numAllRespawns
      L5_2 = L5_2 + 1
      A0_2.numAllRespawns = L5_2
      L5_2 = pairs
      L6_2 = L2_2
      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
      for L7_2, L8_2 in L5_2, L6_2 do
        L10_2 = L8_2
        L9_2 = L8_2.PlayerNum
        L9_2 = L9_2(L10_2)
        L10_2 = A0_2.currenttarget
        if L9_2 == L10_2 then
          L10_2 = L8_2
          L9_2 = L8_2.SetRadarBlipShortRange
          L11_2 = false
          L9_2(L10_2, L11_2)
          L10_2 = L8_2
          L9_2 = L8_2.SetRadarBlipIcon
          L11_2 = pickupicon
          L11_2 = L11_2.targetplayer
          L9_2(L10_2, L11_2)
        else
          L10_2 = L8_2
          L9_2 = L8_2.SetRadarBlipShortRange
          L11_2 = true
          L9_2(L10_2, L11_2)
          L10_2 = L8_2
          L9_2 = L8_2.SetRadarBlipIcon
          L11_2 = pickupicon
          L11_2 = L11_2.player
          L9_2(L10_2, L11_2)
        end
      end
    end
  end
  L5_2 = collectgarbage
  L5_2()
end
L0_1.StateRunning = L1_1
L0_1 = HitParade
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = UpdateGameTime
  L2_2 = false
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.HandlePlayerDead
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = nil
  L3_2 = A0_2.winner
  if L3_2 then
    L3_2 = A0_2.winner
    L4_2 = L3_2
    L3_2 = L3_2.PlayerNum
    L3_2 = L3_2(L4_2)
    L5_2 = L1_2
    L4_2 = L1_2.PlayerNum
    L4_2 = L4_2(L5_2)
    if L3_2 == L4_2 then
      L2_2 = 1
    else
      L2_2 = 2
    end
  else
    L2_2 = 0
  end
  L3_2 = winner
  if L3_2 then
    L3_2 = DisplayFinalWinLoseMessage
    L4_2 = L2_2
    L5_2 = "^S^"
    L6_2 = A0_2.winner
    L7_2 = L6_2
    L6_2 = L6_2.Name
    L6_2 = L6_2(L7_2)
    L7_2 = "^S^ ^T^MPWIN"
    L5_2 = L5_2 .. L6_2 .. L7_2
    L3_2(L4_2, L5_2)
  else
    L3_2 = DisplayFinalWinLoseMessage
    L4_2 = L2_2
    L5_2 = ""
    L3_2(L4_2, L5_2)
  end
  L3_2 = main
  L3_2 = L3_2.scores
  L4_2 = L3_2
  L3_2 = L3_2.ToggleUpdate
  L5_2 = false
  L3_2(L4_2, L5_2)
  L3_2 = main
  L3_2 = L3_2.scores
  L4_2 = L3_2
  L3_2 = L3_2.Show
  L5_2 = true
  L3_2(L4_2, L5_2)
  L3_2 = Wait
  L4_2 = 12000
  L3_2(L4_2)
  L3_2 = main
  L3_2 = L3_2.scores
  L4_2 = L3_2
  L3_2 = L3_2.Hide
  L3_2(L4_2)
  L3_2 = main
  L4_2 = L3_2
  L3_2 = L3_2.EndGame
  L3_2(L4_2)
  L3_2 = "StateRunning"
  return L3_2
end
L0_1.StateGameWon = L1_1
L0_1 = HitParade
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.timeminutes
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L2_2 = 0
  end
  return L2_2
end
L0_1.TimeMinutes = L1_1
L0_1 = HitParade
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.timeseconds
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L2_2 = 0
  end
  return L2_2
end
L0_1.TimeSeconds = L1_1
L0_1 = HitParade
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.bonustimeminutes
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L2_2 = 0
  end
  return L2_2
end
L0_1.BonusTimeMinutes = L1_1
L0_1 = HitParade
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.bonustimeseconds
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L2_2 = 0
  end
  return L2_2
end
L0_1.BonusTimeSeconds = L1_1
L0_1 = HitParade
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.gameFinishing
  if L2_2 then
    return
  end
  L2_2 = 0
  L3_2 = 0
  L4_2 = GameTimeSeconds
  L4_2 = L4_2()
  L2_2 = 60 - L4_2
  L4_2 = HIT_PARADE_GAME_TIME
  L4_2 = L4_2 - 1
  L5_2 = GameTimeMinutes
  L5_2 = L5_2()
  L3_2 = L4_2 - L5_2
  L4_2 = print
  L5_2 = "Minutes lasted: "
  L6_2 = L3_2
  L7_2 = " Seconds lasted: "
  L8_2 = L2_2
  L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2
  L4_2(L5_2)
  if 59 < L2_2 then
    L2_2 = 0
    L3_2 = L3_2 + 1
  end
  L4_2 = A0_2.timeminutes
  L6_2 = A0_2
  L5_2 = A0_2.TimeMinutes
  L7_2 = A1_2
  L5_2 = L5_2(L6_2, L7_2)
  L5_2 = L5_2 + L3_2
  L4_2[A1_2] = L5_2
  L4_2 = A0_2.timeseconds
  L6_2 = A0_2
  L5_2 = A0_2.TimeSeconds
  L7_2 = A1_2
  L5_2 = L5_2(L6_2, L7_2)
  L5_2 = L5_2 + L2_2
  L4_2[A1_2] = L5_2
  goto lbl_51
  repeat
    L4_2 = A0_2.timeminutes
    L6_2 = A0_2
    L5_2 = A0_2.TimeMinutes
    L7_2 = A1_2
    L5_2 = L5_2(L6_2, L7_2)
    L5_2 = L5_2 + 1
    L4_2[A1_2] = L5_2
    L4_2 = A0_2.timeseconds
    L6_2 = A0_2
    L5_2 = A0_2.TimeSeconds
    L7_2 = A1_2
    L5_2 = L5_2(L6_2, L7_2)
    L5_2 = L5_2 - 60
    L4_2[A1_2] = L5_2
    ::lbl_51::
    L5_2 = A0_2
    L4_2 = A0_2.TimeSeconds
    L6_2 = A1_2
    L4_2 = L4_2(L5_2, L6_2)
  until not (59 < L4_2)
end
L0_1.SaveTime = L1_1
L0_1 = HitParade
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = 0
  L3_2 = 0
  L4_2 = GameTimeSeconds
  L4_2 = L4_2()
  L2_2 = L4_2
  L4_2 = GameTimeMinutes
  L4_2 = L4_2()
  L3_2 = L4_2
  L4_2 = HIT_PARADE_GAME_TIME
  L4_2 = L4_2 * 60
  L4_2 = L4_2 / 10
  L5_2 = A0_2.bonustimeseconds
  L7_2 = A0_2
  L6_2 = A0_2.BonusTimeSeconds
  L8_2 = A1_2
  L6_2 = L6_2(L7_2, L8_2)
  L6_2 = L6_2 + L4_2
  L5_2[A1_2] = L6_2
  goto lbl_31
  repeat
    L5_2 = A0_2.bonustimeminutes
    L7_2 = A0_2
    L6_2 = A0_2.BonusTimeMinutes
    L8_2 = A1_2
    L6_2 = L6_2(L7_2, L8_2)
    L6_2 = L6_2 + 1
    L5_2[A1_2] = L6_2
    L5_2 = A0_2.bonustimeseconds
    L7_2 = A0_2
    L6_2 = A0_2.BonusTimeSeconds
    L8_2 = A1_2
    L6_2 = L6_2(L7_2, L8_2)
    L6_2 = L6_2 - 60
    L5_2[A1_2] = L6_2
    ::lbl_31::
    L6_2 = A0_2
    L5_2 = A0_2.BonusTimeSeconds
    L7_2 = A1_2
    L5_2 = L5_2(L6_2, L7_2)
  until not (59 < L5_2)
end
L0_1.GiveTimeBonus = L1_1
L0_1 = HitParade
function L1_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2
  L3_2 = A0_2.bonustimeseconds
  L5_2 = A0_2
  L4_2 = A0_2.BonusTimeSeconds
  L6_2 = A1_2
  L4_2 = L4_2(L5_2, L6_2)
  L4_2 = L4_2 + A2_2
  L3_2[A1_2] = L4_2
  goto lbl_20
  repeat
    L3_2 = A0_2.bonustimeminutes
    L5_2 = A0_2
    L4_2 = A0_2.BonusTimeMinutes
    L6_2 = A1_2
    L4_2 = L4_2(L5_2, L6_2)
    L4_2 = L4_2 + 1
    L3_2[A1_2] = L4_2
    L3_2 = A0_2.bonustimeseconds
    L5_2 = A0_2
    L4_2 = A0_2.BonusTimeSeconds
    L6_2 = A1_2
    L4_2 = L4_2(L5_2, L6_2)
    L4_2 = L4_2 - 60
    L3_2[A1_2] = L4_2
    ::lbl_20::
    L4_2 = A0_2
    L3_2 = A0_2.BonusTimeSeconds
    L5_2 = A1_2
    L3_2 = L3_2(L4_2, L5_2)
  until not (59 < L3_2)
end
L0_1.GiveExtraTimeBonus = L1_1
L0_1 = HitParade
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = 0
  L3_2 = 0
  L4_2 = 0
  L6_2 = A0_2
  L5_2 = A0_2.TimeMinutes
  L7_2 = A1_2
  L5_2 = L5_2(L6_2, L7_2)
  L5_2 = L5_2 * 60
  L7_2 = A0_2
  L6_2 = A0_2.TimeSeconds
  L8_2 = A1_2
  L6_2 = L6_2(L7_2, L8_2)
  L2_2 = L5_2 + L6_2
  L6_2 = A0_2
  L5_2 = A0_2.BonusTimeMinutes
  L7_2 = A1_2
  L5_2 = L5_2(L6_2, L7_2)
  L5_2 = L5_2 * 60
  L7_2 = A0_2
  L6_2 = A0_2.BonusTimeSeconds
  L8_2 = A1_2
  L6_2 = L6_2(L7_2, L8_2)
  L3_2 = L5_2 + L6_2
  L4_2 = L2_2 + L3_2
  return L4_2
end
L0_1.Score = L1_1
L0_1 = HitParade
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = true
  A0_2.gameFinishing = L1_2
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = TargetPlayer
  L3_2 = 200
  L2_2(L3_2)
  L2_2 = A0_2.winner
  if not L2_2 then
    L2_2 = table
    L2_2 = L2_2.sort
    L3_2 = L1_2
    function L4_2(A0_3, A1_3)
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
    L2_2(L3_2, L4_2)
    L2_2 = print
    L3_2 = "Score 1 = "
    L5_2 = A0_2
    L4_2 = A0_2.Score
    L6_2 = L1_2[1]
    L4_2 = L4_2(L5_2, L6_2)
    L5_2 = " Score 2 = "
    L7_2 = A0_2
    L6_2 = A0_2.Score
    L8_2 = L1_2[2]
    L6_2 = L6_2(L7_2, L8_2)
    L3_2 = L3_2 .. L4_2 .. L5_2 .. L6_2
    L2_2(L3_2)
    L3_2 = A0_2
    L2_2 = A0_2.Score
    L4_2 = L1_2[1]
    L2_2 = L2_2(L3_2, L4_2)
    L4_2 = A0_2
    L3_2 = A0_2.Score
    L5_2 = L1_2[2]
    L3_2 = L3_2(L4_2, L5_2)
    if L2_2 == L3_2 then
      A0_2.winner = nil
    else
      L2_2 = L1_2[1]
      A0_2.winner = L2_2
    end
    A0_2.state = "StateGameWon"
  end
end
L0_1.GetWinner = L1_1
L0_1 = HitParade
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = SetGameTime
  L3_2 = HIT_PARADE_GAME_TIME
  L2_2(L3_2)
  L2_2 = UpdateGameTime
  L3_2 = false
  L2_2(L3_2)
  L2_2 = pairs
  L3_2 = L1_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L4_2, L5_2 in L2_2, L3_2 do
    L7_2 = L5_2
    L6_2 = L5_2.SetRadarBlipShortRange
    L8_2 = true
    L6_2(L7_2, L8_2)
    L7_2 = L5_2
    L6_2 = L5_2.SetRadarBlipIcon
    L8_2 = pickupicon
    L8_2 = L8_2.player
    L6_2(L7_2, L8_2)
  end
  L2_2 = IsServer
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = TargetPlayer
    L3_2 = 100
    L2_2(L3_2)
    L2_2 = Wait
    L3_2 = 2000
    L2_2(L3_2)
    L2_2 = false
    while not L2_2 do
      L4_2 = A0_2
      L3_2 = A0_2.HandlePlayerDead
      L5_2 = true
      L3_2(L4_2, L5_2)
      L2_2 = true
      L3_2 = pairs
      L4_2 = L1_2
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L5_2, L6_2 in L3_2, L4_2 do
        L8_2 = L6_2
        L7_2 = L6_2.IsDead
        L7_2 = L7_2(L8_2)
        if L7_2 then
          L2_2 = false
        end
      end
      L3_2 = Wait
      L4_2 = 1
      L3_2(L4_2)
      if L2_2 then
        L3_2 = print
        L4_2 = "All players alive (LIES!!)"
        L3_2(L4_2)
      end
    end
    L3_2 = A0_2.currenttargetindex
    L3_2 = L3_2 + 1
    A0_2.currenttargetindex = L3_2
    L3_2 = print
    L4_2 = "new server currenttargetindex is..."
    L5_2 = A0_2.currenttargetindex
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.currenttargetindex
    L4_2 = table
    L4_2 = L4_2.getn
    L5_2 = A0_2.targetlist
    L4_2 = L4_2(L5_2)
    if L3_2 > L4_2 then
      L4_2 = A0_2
      L3_2 = A0_2.GetWinner
      L3_2(L4_2)
      goto lbl_297
      goto lbl_93
      repeat
        L3_2 = A0_2.currenttargetindex
        L3_2 = L3_2 + 1
        A0_2.currenttargetindex = L3_2
        L3_2 = A0_2.currenttargetindex
        L4_2 = table
        L4_2 = L4_2.getn
        L5_2 = A0_2.targetlist
        L4_2 = L4_2(L5_2)
        if L3_2 > L4_2 then
          L3_2 = TargetPlayer
          L4_2 = 200
          L3_2(L4_2)
          L4_2 = A0_2
          L3_2 = A0_2.GetWinner
          L3_2(L4_2)
          return
        end
        ::lbl_93::
        L3_2 = IsConnected
        L4_2 = Player
        L5_2 = A0_2.targetlist
        L6_2 = A0_2.currenttargetindex
        L5_2 = L5_2[L6_2]
        L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L4_2(L5_2)
        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      until L3_2
    end
    L3_2 = Player
    L4_2 = A0_2.targetlist
    L5_2 = A0_2.currenttargetindex
    L4_2 = L4_2[L5_2]
    L3_2 = L3_2(L4_2)
    L4_2 = print
    L5_2 = "***** Target is "
    L7_2 = L3_2
    L6_2 = L3_2.Name
    L6_2 = L6_2(L7_2)
    L7_2 = L3_2
    L4_2(L5_2, L6_2, L7_2)
    L4_2 = Wait
    L5_2 = 1000
    L4_2(L5_2)
    L4_2 = PrintNow
    L5_2 = GetEveryonePeerGroupId
    L5_2 = L5_2()
    L6_2 = "MPHP05"
    L7_2 = 10000
    L8_2 = 1
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = Wait
    L5_2 = 1000
    L4_2(L5_2)
    L4_2 = PrintNow
    L5_2 = GetEveryonePeerGroupId
    L5_2 = L5_2()
    L6_2 = "MPHP04"
    L7_2 = 10000
    L8_2 = 1
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = Wait
    L5_2 = 1000
    L4_2(L5_2)
    L4_2 = PrintNow
    L5_2 = GetEveryonePeerGroupId
    L5_2 = L5_2()
    L6_2 = "MPHP03"
    L7_2 = 10000
    L8_2 = 1
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = Wait
    L5_2 = 1000
    L4_2(L5_2)
    L4_2 = PrintNow
    L5_2 = GetEveryonePeerGroupId
    L5_2 = L5_2()
    L6_2 = "MPHP02"
    L7_2 = 10000
    L8_2 = 1
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = Wait
    L5_2 = 1000
    L4_2(L5_2)
    L4_2 = PrintNow
    L5_2 = GetEveryonePeerGroupId
    L5_2 = L5_2()
    L6_2 = "MPHP01"
    L7_2 = 10000
    L8_2 = 1
    L4_2(L5_2, L6_2, L7_2, L8_2)
    L4_2 = Wait
    L5_2 = 1000
    L4_2(L5_2)
    L4_2 = ipairs
    L5_2 = L1_2
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L6_2, L7_2 in L4_2, L5_2 do
      L9_2 = L7_2
      L8_2 = L7_2.PlayerNum
      L8_2 = L8_2(L9_2)
      L9_2 = A0_2.targetlist
      L10_2 = A0_2.currenttargetindex
      L9_2 = L9_2[L10_2]
      if L8_2 == L9_2 then
        L8_2 = PrintNow
        L10_2 = L7_2
        L9_2 = L7_2.PlayerNum
        L9_2 = L9_2(L10_2)
        L10_2 = "MPHPGO2"
        L11_2 = 5000
        L12_2 = 1
        L8_2(L9_2, L10_2, L11_2, L12_2)
      else
        L8_2 = PrintNow
        L10_2 = L7_2
        L9_2 = L7_2.PlayerNum
        L9_2 = L9_2(L10_2)
        L10_2 = "MPHPGO"
        L11_2 = 5000
        L12_2 = 1
        L8_2(L9_2, L10_2, L11_2, L12_2)
      end
    end
    L4_2 = TargetPlayer
    L5_2 = A0_2.targetlist
    L6_2 = A0_2.currenttargetindex
    L5_2 = L5_2[L6_2]
    L4_2(L5_2)
    L4_2 = A0_2.targetlist
    L5_2 = A0_2.currenttargetindex
    L4_2 = L4_2[L5_2]
    A0_2.currenttarget = L4_2
    L4_2 = Player
    L4_2 = L4_2()
    L6_2 = L4_2
    L5_2 = L4_2.SetHealth
    L7_2 = 100
    L5_2(L6_2, L7_2)
    L5_2 = A0_2.weAreOnFirstTarget
    if L5_2 then
      L5_2 = false
      A0_2.weAreOnFirstTarget = L5_2
    else
      L6_2 = A0_2
      L5_2 = A0_2.DoForcedSpawn
      L5_2(L6_2)
    end
    L5_2 = IsServer
    L5_2 = L5_2()
    if L5_2 then
      L5_2 = UsePowerups
      L5_2 = L5_2()
      if L5_2 then
        L5_2 = DoesPowerupExist
        L5_2 = L5_2()
        if L5_2 < 2 then
          L5_2 = print
          L6_2 = "Respawning a power up at change sides"
          L5_2(L6_2)
          L5_2 = PowerUpTimer
          L6_2 = L5_2
          L5_2 = L5_2.CreateAPowerUp
          L5_2(L6_2)
        end
        L5_2 = DoesPowerupExist
        L5_2 = L5_2()
        if L5_2 < 2 then
          L5_2 = print
          L6_2 = "Respawning another power up at change sides"
          L5_2(L6_2)
          L5_2 = PowerUpTimer
          L6_2 = L5_2
          L5_2 = L5_2.CreateAPowerUp
          L5_2(L6_2)
        end
      end
    end
    goto lbl_297
    goto lbl_252
    repeat
      L3_2 = A0_2
      L2_2 = A0_2.HandlePlayerDead
      L4_2 = true
      L2_2(L3_2, L4_2)
      L2_2 = Wait
      L3_2 = 0
      L2_2(L3_2)
      ::lbl_252::
      L2_2 = TargetPlayer
      L2_2 = L2_2()
    until not (L2_2 < 100)
  end
  goto lbl_273
  repeat
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
    L2_2 = print
    L3_2 = "holding for new target"
    L2_2(L3_2)
    L3_2 = A0_2
    L2_2 = A0_2.HandlePlayerDead
    L4_2 = true
    L2_2(L3_2, L4_2)
    L2_2 = TargetPlayer
    L2_2 = L2_2()
    if L2_2 == 200 then
      L3_2 = A0_2
      L2_2 = A0_2.GetWinner
      L2_2(L3_2)
      return
    end
    ::lbl_273::
    L2_2 = TargetPlayer
    L2_2 = L2_2()
  until not (100 <= L2_2)
  L2_2 = Player
  L2_2 = L2_2()
  L4_2 = L2_2
  L3_2 = L2_2.SetHealth
  L5_2 = 100
  L3_2(L4_2, L5_2)
  L3_2 = A0_2.weAreOnFirstTarget
  if L3_2 then
    L3_2 = false
    A0_2.weAreOnFirstTarget = L3_2
  else
    L4_2 = A0_2
    L3_2 = A0_2.DoForcedSpawn
    L3_2(L4_2)
  end
  L3_2 = TargetPlayer
  L3_2 = L3_2()
  A0_2.currenttarget = L3_2
  L3_2 = print
  L4_2 = "new self.currenttarget (client) is "
  L5_2 = A0_2.currenttarget
  L3_2(L4_2, L5_2)
  ::lbl_297::
  L2_2 = Player
  L3_2 = A0_2.currenttarget
  L2_2 = L2_2(L3_2)
  L3_2 = TargetPlayer
  L3_2 = L3_2()
  if L3_2 ~= 200 then
    L3_2 = main
    L3_2 = L3_2.commentary
    L4_2 = L3_2
    L3_2 = L3_2.Print
    L5_2 = "^S^~r~"
    L7_2 = L2_2
    L6_2 = L2_2.Name
    L6_2 = L6_2(L7_2)
    L7_2 = "~w~^S^ ^T^MPHPMAR"
    L5_2 = L5_2 .. L6_2 .. L7_2
    L3_2(L4_2, L5_2)
  end
  L3_2 = print
  L4_2 = "I think the current target is "
  L5_2 = A0_2.currenttarget
  L4_2 = L4_2 .. L5_2
  L3_2(L4_2)
  L3_2 = pairs
  L4_2 = L1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L5_2, L6_2 in L3_2, L4_2 do
    L8_2 = L6_2
    L7_2 = L6_2.PlayerNum
    L7_2 = L7_2(L8_2)
    L8_2 = A0_2.currenttarget
    if L7_2 == L8_2 then
      L8_2 = L6_2
      L7_2 = L6_2.SetRadarBlipShortRange
      L9_2 = false
      L7_2(L8_2, L9_2)
      L8_2 = L6_2
      L7_2 = L6_2.SetRadarBlipIcon
      L9_2 = pickupicon
      L9_2 = L9_2.targetplayer
      L7_2(L8_2, L9_2)
    else
      L8_2 = L6_2
      L7_2 = L6_2.SetRadarBlipShortRange
      L9_2 = true
      L7_2(L8_2, L9_2)
      L8_2 = L6_2
      L7_2 = L6_2.SetRadarBlipIcon
      L9_2 = pickupicon
      L9_2 = L9_2.player
      L7_2(L8_2, L9_2)
    end
  end
  L3_2 = collectgarbage
  L3_2()
  L3_2 = UpdateGameTime
  L4_2 = true
  L3_2(L4_2)
  L3_2 = false
  A0_2.playerIsInCar = L3_2
  L3_2 = false
  A0_2.neednewtarget = L3_2
end
L0_1.NewTarget = L1_1
L0_1 = HitParade
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L4_2 = A0_2.state
  if L4_2 ~= "StateGameWon" then
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
      L5_2 = A1_2
      L4_2 = A1_2.PlayerNum
      L4_2 = L4_2(L5_2)
      L5_2 = TargetPlayer
      L5_2 = L5_2()
      if L4_2 == L5_2 then
        L4_2 = UpdateGameTime
        L5_2 = false
        L4_2(L5_2)
        L5_2 = A0_2
        L4_2 = A0_2.SaveTime
        L6_2 = A1_2
        L4_2(L5_2, L6_2)
        L4_2 = true
        A0_2.neednewtarget = L4_2
      end
    else
      if A3_2 then
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
        L4_2 = A0_2.headshots
        L4_2 = L4_2 + 1
        A0_2.headshots = L4_2
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
      if A2_2 then
        L5_2 = A1_2
        L4_2 = A1_2.PlayerNum
        L4_2 = L4_2(L5_2)
        L5_2 = TargetPlayer
        L5_2 = L5_2()
        if L4_2 == L5_2 then
          L4_2 = UpdateGameTime
          L5_2 = false
          L4_2(L5_2)
          L5_2 = A0_2
          L4_2 = A0_2.SaveTime
          L6_2 = A1_2
          L4_2(L5_2, L6_2)
          L5_2 = A0_2
          L4_2 = A0_2.GiveTimeBonus
          L6_2 = A2_2
          L4_2(L5_2, L6_2)
          L4_2 = true
          A0_2.neednewtarget = L4_2
        else
          L5_2 = A2_2
          L4_2 = A2_2.PlayerNum
          L4_2 = L4_2(L5_2)
          L5_2 = PlayerId
          L5_2 = L5_2()
          if L4_2 == L5_2 then
            L4_2 = PrintNow
            L5_2 = Player
            L5_2 = L5_2()
            L6_2 = L5_2
            L5_2 = L5_2.PlayerNum
            L5_2 = L5_2(L6_2)
            L6_2 = "MPHPKI"
            L7_2 = 5000
            L8_2 = 1
            L4_2(L5_2, L6_2, L7_2, L8_2)
          end
        end
      else
        L5_2 = A1_2
        L4_2 = A1_2.PlayerNum
        L4_2 = L4_2(L5_2)
        L5_2 = TargetPlayer
        L5_2 = L5_2()
        if L4_2 == L5_2 then
          L4_2 = UpdateGameTime
          L5_2 = false
          L4_2(L5_2)
          L5_2 = A0_2
          L4_2 = A0_2.SaveTime
          L6_2 = A1_2
          L4_2(L5_2, L6_2)
          L4_2 = true
          A0_2.neednewtarget = L4_2
        end
      end
    end
  end
end
L0_1.RegisterPlayerKill = L1_1
L0_1 = HitParade
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = print
  L2_2 = "Doing forced spawn"
  L1_2(L2_2)
  L1_2 = A0_2.numAllRespawns
  L1_2 = L1_2 + 1
  A0_2.numAllRespawns = L1_2
  L1_2 = DoSpawn
  L2_2 = InitialSpawnPoint
  L3_2 = Player
  L4_2 = math
  L4_2 = L4_2.mod
  L5_2 = PlayerId
  L5_2 = L5_2()
  L6_2 = A0_2.numAllRespawns
  L5_2 = L5_2 + L6_2
  L6_2 = 6
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2, L5_2, L6_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L3_2 = true
  L4_2 = GameLocation
  L4_2, L5_2, L6_2 = L4_2()
  L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
end
L0_1.DoForcedSpawn = L1_1
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
  L2_2 = HitParade
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
