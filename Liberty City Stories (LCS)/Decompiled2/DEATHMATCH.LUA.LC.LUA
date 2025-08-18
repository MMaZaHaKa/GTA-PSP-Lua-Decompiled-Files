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
L0_1 = 0
teamId1 = L0_1
L0_1 = 1
teamId2 = L0_1
L0_1 = 99
teamDraw = L0_1
L0_1 = 101
teamError = L0_1
L0_1 = false
hornDebounce = L0_1
L0_1 = 1
testSpawnPoint = L0_1
L0_1 = StateMachine
L1_1 = {}
L2_1 = "StateInit"
L1_1[1] = L2_1
L0_1 = L0_1(L1_1)
DeathMatch = L0_1
L0_1 = DeathMatch
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = DbgPrintAllOptions
  L1_2()
  L1_2 = PickupMgr
  L1_2 = L1_2()
  A0_2.mypickups = L1_2
  L1_2 = A0_2.mypickups
  L2_2 = L1_2
  L1_2 = L1_2.CreatePickups
  L1_2(L2_2)
  L1_2 = GameScoreLimit
  L1_2 = L1_2()
  if 0 < L1_2 then
    L1_2 = GameScoreLimit
    L1_2 = L1_2()
    A0_2.fraglimit = L1_2
  else
    A0_2.fraglimit = nil
  end
  L1_2 = {}
  A0_2.scores = L1_2
  L1_2 = {}
  A0_2.teamscores = L1_2
  A0_2.headshots = 0
  L1_2 = teamError
  A0_2.winningTeam = L1_2
  L1_2 = false
  A0_2.gamePossiblyOver = L1_2
  A0_2.gameOverTestCount = 0
  A0_2.DMTime = nil
  L1_2 = GenerateAmbients
  L2_2 = false
  L1_2(L2_2)
  L1_2 = UseSuperBrakeOnPause
  L2_2 = false
  L1_2(L2_2)
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    goto lbl_43
    repeat
      L1_2 = Wait
      L2_2 = 100
      L1_2(L2_2)
      ::lbl_43::
      L1_2 = IsServer
      L1_2 = L1_2()
      if L1_2 then
        break
      end
      L1_2 = PlayerId
      L1_2 = L1_2()
    until L1_2 ~= 0
  end
  L1_2 = print
  L2_2 = "Doing initial spawn"
  L1_2(L2_2)
  L1_2 = DoSpawn
  L2_2 = InitialSpawnPoint
  L3_2 = PlayerId
  L3_2 = L3_2()
  L2_2, L3_2 = L2_2(L3_2)
  L1_2(L2_2, L3_2)
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
  L1_2 = Wait
  L2_2 = 1000
  L1_2(L2_2)
  L1_2 = NoFuckingCutscene
  L1_2 = L1_2()
  if not L1_2 then
    L1_2 = main
    L1_2 = L1_2.scores
    L2_2 = L1_2
    L1_2 = L1_2.Hide
    L3_2 = true
    L1_2(L2_2, L3_2)
    goto lbl_107
    repeat
      L1_2 = Wait
      L2_2 = 5
      L1_2(L2_2)
      ::lbl_107::
      L1_2 = SyncCutScene
      L1_2 = L1_2()
      L2_2 = false
    until L1_2 ~= L2_2
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
    L1_2 = RunScriptedCutscene
    L1_2()
    L1_2 = Wait
    L2_2 = 0
    L1_2(L2_2)
    goto lbl_126
    repeat
      L1_2 = Wait
      L2_2 = 0
      L1_2(L2_2)
      L1_2 = collectgarbage
      L1_2()
      ::lbl_126::
      L1_2 = ProcessScriptedCutscene
      L1_2 = L1_2()
    until not L1_2
    L1_2 = main
    L1_2 = L1_2.scores
    L2_2 = L1_2
    L1_2 = L1_2.Hide
    L3_2 = false
    L1_2(L2_2, L3_2)
  else
    L1_2 = Wait
    L2_2 = 20
    L1_2(L2_2)
    L1_2 = ClearSplashScreen
    L1_2()
  end
  L1_2 = GenerateAmbients
  L2_2 = true
  L1_2(L2_2)
  L1_2 = UpdateGameTime
  L2_2 = true
  L1_2(L2_2)
  L1_2 = TeamGameEveryoneIn
  L1_2()
  L1_2 = "StateRunning"
  return L1_2
end
L0_1.StateInit = L1_1
L0_1 = DeathMatch
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = collectgarbage
  L1_2()
  L1_2 = A0_2.DMTime
  if L1_2 ~= nil then
    L1_2 = A0_2.DMTime
    L1_2 = L1_2.Remove
    L1_2()
    A0_2.DMTime = nil
  end
  L1_2 = A0_2.mytimer
  L2_2 = L1_2
  L1_2 = L1_2.Stop
  L1_2(L2_2)
  L1_2 = A0_2.mypickups
  L2_2 = L1_2
  L1_2 = L1_2.Cleanup
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = DeathMatch
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = AllPlayers
  L2_2 = L2_2()
  L4_2 = L1_2
  L3_2 = L1_2.IsPlaying
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = A0_2.gamePossiblyOver
    if not L3_2 then
      L3_2 = DoWasted
      L3_2()
    end
  end
  L3_2 = GameTimeUp
  L3_2 = L3_2()
  if L3_2 then
    L3_2 = collectgarbage
    L3_2()
    A0_2.state = "StateGameWon"
  else
    L3_2 = GameTimeLimit
    L3_2 = L3_2()
    if 0 < L3_2 then
      L3_2 = main
      L3_2 = L3_2.scores
      L3_2 = L3_2.scores
      if L3_2 then
        L3_2 = A0_2.DMTime
        if L3_2 ~= nil then
          L3_2 = A0_2.DMTime
          L4_2 = L3_2
          L3_2 = L3_2.Remove
          L3_2(L4_2)
          A0_2.DMTime = nil
        end
      else
        L3_2 = A0_2.DMTime
        if L3_2 == nil then
          L3_2 = Player
          L3_2 = L3_2()
          L4_2 = TextSprite
          L5_2 = L3_2
          L6_2 = 470
          L7_2 = 85
          L8_2 = 2
          L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
          A0_2.DMTime = L4_2
          L4_2 = A0_2.DMTime
          L5_2 = L4_2
          L4_2 = L4_2.Scale
          L6_2 = 0.4048
          L4_2(L5_2, L6_2)
          L4_2 = A0_2.DMTime
          L5_2 = L4_2
          L4_2 = L4_2.Style
          L6_2 = 1
          L4_2(L5_2, L6_2)
          L4_2 = A0_2.DMTime
          L5_2 = L4_2
          L4_2 = L4_2.Colour
          L6_2 = GameColour
          L7_2 = 10
          L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2(L7_2)
          L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
        end
      end
      L3_2 = string
      L3_2 = L3_2.format
      L4_2 = "%d:%02d"
      L5_2 = GameTimeMinutes
      L5_2 = L5_2()
      L6_2 = GameTimeSeconds
      L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L6_2()
      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
      L4_2 = A0_2.DMTime
      if L4_2 ~= nil then
        L4_2 = A0_2.DMTime
        L5_2 = L4_2
        L4_2 = L4_2.Text
        L6_2 = "^S^"
        L7_2 = L3_2
        L6_2 = L6_2 .. L7_2
        L4_2(L5_2, L6_2)
      end
    end
  end
  L3_2 = A0_2.gamePossiblyOver
  if L3_2 then
    L3_2 = A0_2.gameOverTestCount
    L3_2 = L3_2 + 1
    A0_2.gameOverTestCount = L3_2
  end
  L3_2 = A0_2.gamePossiblyOver
  if L3_2 then
    L3_2 = A0_2.gameOverTestCount
    if L3_2 < 20 then
      L3_2 = false
      A0_2.gamePossiblyOver = L3_2
      L3_2 = pairs
      L4_2 = L2_2
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L5_2, L6_2 in L3_2, L4_2 do
        L7_2 = nil
        L8_2 = IsTeamGame
        L8_2 = L8_2()
        if L8_2 then
          L8_2 = A0_2.fraglimit
          L10_2 = A0_2
          L9_2 = A0_2.TeamScore
          L12_2 = L6_2
          L11_2 = L6_2.TeamId
          L11_2, L12_2 = L11_2(L12_2)
          L9_2 = L9_2(L10_2, L11_2, L12_2)
          L7_2 = L8_2 - L9_2
        else
          L8_2 = A0_2.fraglimit
          L10_2 = A0_2
          L9_2 = A0_2.Score
          L11_2 = L6_2
          L9_2 = L9_2(L10_2, L11_2)
          L7_2 = L8_2 - L9_2
        end
        if L7_2 <= 0 then
          A0_2.state = "StateGameWon"
          A0_2.winner = L6_2
          L8_2 = IsTeamGame
          L8_2 = L8_2()
          if L8_2 then
            L9_2 = L6_2
            L8_2 = L6_2.TeamId
            L8_2 = L8_2(L9_2)
            A0_2.winningTeam = L8_2
          end
        end
      end
    end
  end
  L3_2 = IsPlayerPressingHorn
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if L3_2 then
    L3_2 = hornDebounce
    if not L3_2 then
      L3_2 = print
      L4_2 = "Horntest on"
      L3_2(L4_2)
      L3_2 = true
      hornDebounce = L3_2
    end
  end
  L3_2 = IsPlayerPressingHorn
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  if not L3_2 then
    L3_2 = false
    hornDebounce = L3_2
  end
end
L0_1.StateRunning = L1_1
L0_1 = DeathMatch
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
  L4_2 = IsTeamGame
  L4_2 = L4_2()
  if L4_2 then
    L5_2 = A0_2
    L4_2 = A0_2.TeamScore
    L6_2 = teamId1
    L4_2 = L4_2(L5_2, L6_2)
    L6_2 = A0_2
    L5_2 = A0_2.TeamScore
    L7_2 = teamId2
    L5_2 = L5_2(L6_2, L7_2)
    if L4_2 > L5_2 then
      L4_2 = teamId1
      A0_2.winningTeam = L4_2
    else
      L5_2 = A0_2
      L4_2 = A0_2.TeamScore
      L6_2 = teamId2
      L4_2 = L4_2(L5_2, L6_2)
      L6_2 = A0_2
      L5_2 = A0_2.TeamScore
      L7_2 = teamId1
      L5_2 = L5_2(L6_2, L7_2)
      if L4_2 > L5_2 then
        L4_2 = teamId2
        A0_2.winningTeam = L4_2
      else
        L4_2 = teamDraw
        A0_2.winningTeam = L4_2
      end
    end
  else
    L4_2 = table
    L4_2 = L4_2.sort
    L5_2 = L3_2
    function L6_2(A0_3, A1_3)
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
    L4_2(L5_2, L6_2)
    L5_2 = A0_2
    L4_2 = A0_2.Score
    L6_2 = L3_2[1]
    L4_2 = L4_2(L5_2, L6_2)
    L6_2 = A0_2
    L5_2 = A0_2.Score
    L7_2 = L3_2[2]
    L5_2 = L5_2(L6_2, L7_2)
    if L4_2 == L5_2 then
      A0_2.winner = nil
    else
      L4_2 = L3_2[1]
      A0_2.winner = L4_2
    end
  end
  L4_2 = IsTeamGame
  L4_2 = L4_2()
  if L4_2 then
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
  else
    L4_2 = A0_2.winner
    if not L4_2 then
      L5_2 = A0_2
      L4_2 = A0_2.Score
      L6_2 = L2_2
      L4_2 = L4_2(L5_2, L6_2)
      L6_2 = A0_2
      L5_2 = A0_2.Score
      L7_2 = L3_2[1]
      L5_2 = L5_2(L6_2, L7_2)
      if L4_2 < L5_2 then
        L4_2 = DisplayFinalWinLoseMessage
        L5_2 = 2
        L6_2 = " "
        L4_2(L5_2, L6_2)
      else
        L4_2 = DisplayFinalWinLoseMessage
        L5_2 = 0
        L6_2 = " "
        L4_2(L5_2, L6_2)
      end
    else
      L4_2 = A0_2.winner
      L5_2 = L4_2
      L4_2 = L4_2.PlayerNum
      L4_2 = L4_2(L5_2)
      L6_2 = L2_2
      L5_2 = L2_2.PlayerNum
      L5_2 = L5_2(L6_2)
      if L4_2 == L5_2 then
        L4_2 = DisplayFinalWinLoseMessage
        L5_2 = 1
        L6_2 = ""
        L4_2(L5_2, L6_2)
      else
        L4_2 = DisplayFinalWinLoseMessage
        L5_2 = 2
        L6_2 = ""
        L4_2(L5_2, L6_2)
      end
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
L0_1 = DeathMatch
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
L0_1 = DeathMatch
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.scores
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L2_2 = 0
  end
  return L2_2
end
L0_1.Score = L1_1
L0_1 = DeathMatch
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.teamscores
  L2_2 = L2_2[A1_2]
  if not L2_2 then
    L2_2 = 0
  end
  return L2_2
end
L0_1.TeamScore = L1_1
L0_1 = DeathMatch
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = A0_2.state
  if L4_2 ~= "StateGameWon" then
    if A1_2 == A2_2 then
      L4_2 = A0_2.scores
      L6_2 = A0_2
      L5_2 = A0_2.Score
      L7_2 = A1_2
      L5_2 = L5_2(L6_2, L7_2)
      L5_2 = L5_2 - 1
      L4_2[A1_2] = L5_2
      L4_2 = A0_2.teamscores
      L6_2 = A1_2
      L5_2 = A1_2.TeamId
      L5_2 = L5_2(L6_2)
      L7_2 = A0_2
      L6_2 = A0_2.TeamScore
      L9_2 = A1_2
      L8_2 = A1_2.TeamId
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      L6_2 = L6_2 - 1
      L4_2[L5_2] = L6_2
      L5_2 = A0_2
      L4_2 = A0_2.Commentate
      L6_2 = "^S^"
      L8_2 = A1_2
      L7_2 = A1_2.Name
      L7_2 = L7_2(L8_2)
      L8_2 = "^S^ ^T^MPKSELF"
      L6_2 = L6_2 .. L7_2 .. L8_2
      L4_2(L5_2, L6_2)
    else
      L4_2 = IsTeamGame
      L4_2 = L4_2()
      if L4_2 then
        L5_2 = A1_2
        L4_2 = A1_2.TeamId
        L4_2 = L4_2(L5_2)
        L6_2 = A2_2
        L5_2 = A2_2.TeamId
        L5_2 = L5_2(L6_2)
        if L4_2 ~= L5_2 then
          L4_2 = A0_2.scores
          L6_2 = A0_2
          L5_2 = A0_2.Score
          L7_2 = A2_2
          L5_2 = L5_2(L6_2, L7_2)
          L5_2 = L5_2 + 1
          L4_2[A2_2] = L5_2
          L4_2 = A0_2.teamscores
          L6_2 = A2_2
          L5_2 = A2_2.TeamId
          L5_2 = L5_2(L6_2)
          L7_2 = A0_2
          L6_2 = A0_2.TeamScore
          L9_2 = A2_2
          L8_2 = A2_2.TeamId
          L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
          L6_2 = L6_2 + 1
          L4_2[L5_2] = L6_2
        else
          L4_2 = A0_2.scores
          L6_2 = A0_2
          L5_2 = A0_2.Score
          L7_2 = A2_2
          L5_2 = L5_2(L6_2, L7_2)
          L5_2 = L5_2 - 1
          L4_2[A2_2] = L5_2
          L4_2 = A0_2.teamscores
          L6_2 = A2_2
          L5_2 = A2_2.TeamId
          L5_2 = L5_2(L6_2)
          L7_2 = A0_2
          L6_2 = A0_2.TeamScore
          L9_2 = A2_2
          L8_2 = A2_2.TeamId
          L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
          L6_2 = L6_2 - 1
          L4_2[L5_2] = L6_2
        end
      else
        L4_2 = A0_2.scores
        L6_2 = A0_2
        L5_2 = A0_2.Score
        L7_2 = A2_2
        L5_2 = L5_2(L6_2, L7_2)
        L5_2 = L5_2 + 1
        L4_2[A2_2] = L5_2
      end
      if A3_2 then
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
        L4_2 = A0_2.headshots
        L4_2 = L4_2 + 1
        A0_2.headshots = L4_2
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
      L4_2 = A0_2.fraglimit
      if L4_2 and A2_2 then
        L4_2 = 0
        L5_2 = IsTeamGame
        L5_2 = L5_2()
        if L5_2 then
          L5_2 = A0_2.fraglimit
          L7_2 = A0_2
          L6_2 = A0_2.TeamScore
          L9_2 = A2_2
          L8_2 = A2_2.TeamId
          L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
          L4_2 = L5_2 - L6_2
        else
          L5_2 = A0_2.fraglimit
          L7_2 = A0_2
          L6_2 = A0_2.Score
          L8_2 = A2_2
          L6_2 = L6_2(L7_2, L8_2)
          L4_2 = L5_2 - L6_2
        end
        if L4_2 <= 0 then
          L5_2 = A0_2.winner
          if not L5_2 then
            L5_2 = print
            L6_2 = "Setting gamePossiblyOver "
            L5_2(L6_2)
            L5_2 = true
            A0_2.gamePossiblyOver = L5_2
            A0_2.gameOverTestCount = 0
        end
        elseif L4_2 <= 3 and 1 < L4_2 then
          L5_2 = IsTeamGame
          L5_2 = L5_2()
          if L5_2 then
            L6_2 = A0_2
            L5_2 = A0_2.Commentate
            L7_2 = "^S^"
            L9_2 = A2_2
            L8_2 = A2_2.TeamName
            L8_2 = L8_2(L9_2)
            L9_2 = "^S^ ^T^MPTNEED^S^ "
            L10_2 = L4_2
            L11_2 = "^S^ ^T^MPMORE"
            L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
            L5_2(L6_2, L7_2)
          else
            L6_2 = A0_2
            L5_2 = A0_2.Commentate
            L7_2 = "^S^"
            L9_2 = A2_2
            L8_2 = A2_2.Name
            L8_2 = L8_2(L9_2)
            L9_2 = "^S^ ^T^MPNEED^S^ "
            L10_2 = L4_2
            L11_2 = "^S^ ^T^MPMORE"
            L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
            L5_2(L6_2, L7_2)
          end
        elseif L4_2 == 1 then
          L5_2 = IsTeamGame
          L5_2 = L5_2()
          if L5_2 then
            L6_2 = A0_2
            L5_2 = A0_2.Commentate
            L7_2 = "^S^"
            L9_2 = A2_2
            L8_2 = A2_2.TeamName
            L8_2 = L8_2(L9_2)
            L9_2 = "^S^ ^T^MPTNEED^S^ "
            L10_2 = L4_2
            L11_2 = "^S^ ^T^MP1MORE"
            L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
            L5_2(L6_2, L7_2)
          else
            L6_2 = A0_2
            L5_2 = A0_2.Commentate
            L7_2 = "^S^"
            L9_2 = A2_2
            L8_2 = A2_2.Name
            L8_2 = L8_2(L9_2)
            L9_2 = "^S^ ^T^MPNEED^S^ "
            L10_2 = L4_2
            L11_2 = "^S^ ^T^MP1MORE"
            L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
            L5_2(L6_2, L7_2)
          end
        end
      end
    end
  end
end
L0_1.RegisterPlayerKill = L1_1
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
  L2_2 = DeathMatch
  L3_2 = {}
  L2_2 = L2_2(L3_2)
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
