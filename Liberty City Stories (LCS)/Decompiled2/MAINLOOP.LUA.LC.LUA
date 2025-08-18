local L0_1, L1_1, L2_1
L0_1 = require
L1_1 = "scoresheet"
L0_1(L1_1)
L0_1 = require
L1_1 = "commentary"
L0_1(L1_1)
L0_1 = StateMachine
L1_1 = {}
L2_1 = "StateInit"
L1_1[1] = L2_1
L0_1 = L0_1(L1_1)
MainLoop = L0_1
L0_1 = MainLoop
L1_1 = {}
L0_1 = L0_1(L1_1)
main = L0_1
L0_1 = MainLoop
function L1_1(A0_2)
  local L1_2
  L1_2 = "StateRunning"
  return L1_2
end
L0_1.StateInit = L1_1
L0_1 = MainLoop
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = Wait
    L2_2 = 3000
    L1_2(L2_2)
  end
end
L0_1.StateRunning = L1_1
L0_1 = MainLoop
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = A0_2.commentary
  L3_2 = L2_2
  L2_2 = L2_2.Print
  L4_2 = A1_2
  L2_2(L3_2, L4_2)
end
L0_1.Commentate = L1_1
L0_1 = MainLoop
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.scores
  L2_2 = L1_2
  L1_2 = L1_2.Stop
  L1_2(L2_2)
  L1_2 = A0_2.commentary
  L2_2 = L1_2
  L1_2 = L1_2.CleanUp
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = MainLoop
function L1_1(A0_2)
  local L1_2, L2_2
  L2_2 = A0_2
  L1_2 = A0_2.CleanUp
  L1_2(L2_2)
  L1_2 = EndGame
  L1_2()
end
L0_1.EndGame = L1_1
function L0_1(...)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = main
  L1_2 = L1_2.game
  L2_2 = L1_2
  L1_2 = L1_2.RegisterPlayerKill
  L3_2 = unpack
  L4_2 = arg
  L3_2, L4_2 = L3_2(L4_2)
  L1_2(L2_2, L3_2, L4_2)
  L1_2 = main
  L1_2 = L1_2.scores
  L1_2 = L1_2.scores
  if L1_2 then
    L1_2 = main
    L1_2 = L1_2.scores
    L1_2 = L1_2.scores
    L1_2 = L1_2.screen
    if L1_2 == 0 then
      L1_2 = main
      L1_2 = L1_2.scores
      L1_2 = L1_2.scores
      L2_2 = L1_2
      L1_2 = L1_2.DrawScores
      L1_2(L2_2)
    end
  end
end
RegisterPlayerKill = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2
  L0_2 = AllPlayers
  L0_2 = L0_2()
  L1_2 = 1
  goto lbl_16
  repeat
    L2_2 = PlayerHealth
    L3_2 = L0_2[L1_2]
    L2_2 = L2_2(L3_2)
    if L2_2 <= 1 then
      L1_2 = 1
    else
      L1_2 = L1_2 + 1
    end
    L2_2 = Wait
    L3_2 = 1
    L2_2(L3_2)
    ::lbl_16::
    L2_2 = table
    L2_2 = L2_2.getn
    L3_2 = L0_2
    L2_2 = L2_2(L3_2)
  until not (L1_2 <= L2_2)
end
WaitUntilAllPlayersAlive = L0_1
