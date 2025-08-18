local L0_1, L1_1
L0_1 = Object
L1_1 = {}
L0_1 = L0_1(L1_1)
CoreLib = L0_1
L0_1 = CoreLib
function L1_1(A0_2)
  local L1_2
  L1_2 = false
  A0_2.endOfGame = L1_2
end
L0_1.Init = L1_1
L0_1 = CoreLib
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
L0_1 = CoreLib
function L1_1(A0_2)
  local L1_2
  L1_2 = A0_2.endOfGame
  return L1_2
end
L0_1.IsEndOfGame = L1_1
L0_1 = CoreLib
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  if A1_2 then
    L2_2 = print
    L3_2 = "End Of Game Toggled To True"
    L2_2(L3_2)
  end
  A0_2.endOfGame = A1_2
end
L0_1.ToggleEndOfGame = L1_1
L0_1 = CoreLib
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = table
  L2_2 = L2_2.getn
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = 0
  goto lbl_30
  repeat
    L4_2 = print
    L5_2 = "Lua Game is sat on its ass waiting for "
    L6_2 = GetExpectedNumberOfPlayers
    L6_2 = L6_2()
    L7_2 = " players, at the moment is has "
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
    ::lbl_30::
    L4_2 = GetExpectedNumberOfPlayers
    L4_2 = L4_2()
  until L2_2 == L4_2 or not (L3_2 < 20)
  L3_2 = 0
  L4_2 = IsServer
  L4_2 = L4_2()
  L5_2 = false
  if L4_2 == L5_2 then
    goto lbl_50
    repeat
      L4_2 = print
      L5_2 = "Waiting for server go msg"
      L4_2(L5_2)
      L4_2 = Wait
      L5_2 = 500
      L4_2(L5_2)
      L3_2 = L3_2 + 1
      ::lbl_50::
      L4_2 = ServerReadyToGo
      L4_2 = L4_2()
      L5_2 = false
    until L4_2 ~= L5_2 or not (L3_2 < 10)
  end
  L4_2 = PrintAllPeerGroups
  L4_2()
end
L0_1.WaitForAllPlayersToJoin = L1_1
L0_1 = CoreLib
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = table
  L2_2 = L2_2.getn
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  return L2_2
end
L0_1.GetNumberOfPlayers = L1_1
L0_1 = CoreLib
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = 0
  L2_2 = 1
  L3_2 = Player
  L3_2 = L3_2()
  L4_2 = {}
  L6_2 = L3_2
  L5_2 = L3_2.TeamId
  L5_2 = L5_2(L6_2)
  if L5_2 == L1_2 then
    L5_2 = TeamPlayers
    L6_2 = L2_2
    L5_2 = L5_2(L6_2)
    L4_2 = L5_2
  else
    L5_2 = TeamPlayers
    L6_2 = L1_2
    L5_2 = L5_2(L6_2)
    L4_2 = L5_2
  end
  L5_2 = pairs
  L6_2 = L4_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L7_2, L8_2 in L5_2, L6_2 do
    L10_2 = L8_2
    L9_2 = L8_2.SetRadarBlipShortRange
    L11_2 = true
    L9_2(L10_2, L11_2)
  end
end
L0_1.SetEnemyTeamToShortRangeRadar = L1_1
L0_1 = CoreLib
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = nil
  L3_2 = nil
  L4_2 = nil
  L5_2 = nil
  L6_2 = math
  L6_2 = L6_2.floor
  L7_2 = A1_2 / 1000
  L7_2 = L7_2 / 60
  L7_2 = L7_2 / 60
  L6_2 = L6_2(L7_2)
  L2_2 = L6_2
  L6_2 = 1000 * 60
  L6_2 = L6_2 * 60
  L6_2 = L2_2 * L6_2
  A1_2 = A1_2 - L6_2
  L6_2 = math
  L6_2 = L6_2.floor
  L7_2 = A1_2 / 1000
  L7_2 = L7_2 / 60
  L6_2 = L6_2(L7_2)
  L3_2 = L6_2
  L6_2 = 1000 * 60
  L6_2 = L3_2 * L6_2
  A1_2 = A1_2 - L6_2
  L4_2 = A1_2 / 1000
  if 1 <= L2_2 then
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = "%d:%02d:%02d"
    L8_2 = L2_2
    L9_2 = L3_2
    L10_2 = L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    L5_2 = L6_2
  else
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = "%d:%02d"
    L8_2 = L3_2
    L9_2 = L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2 = L6_2
  end
  return L5_2
end
L0_1.FormatMsValueToHHMMSS = L1_1
L0_1 = CoreLib
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L4_2 = print
  L5_2 = "CoreLib:ExtractPerZoneInfo()"
  L4_2(L5_2)
  A1_2[1] = nil
  A2_2[1] = 0
  A1_2[2] = nil
  A2_2[2] = 0
  A1_2[3] = nil
  A2_2[3] = 0
  A1_2[4] = nil
  A2_2[4] = 0
  A1_2[5] = nil
  A2_2[5] = 0
  A1_2[6] = nil
  A2_2[6] = 0
  A1_2[7] = nil
  A2_2[7] = 0
  A1_2[8] = nil
  A2_2[8] = 0
  A1_2[9] = nil
  A2_2[9] = 0
  A1_2[10] = nil
  A2_2[10] = 0
  A1_2[11] = nil
  A2_2[11] = 0
  A1_2[12] = nil
  A2_2[12] = 0
  L4_2 = print
  L5_2 = "Setting up per zone tables"
  L4_2(L5_2)
  L4_2 = -1
  L5_2 = ipairs
  L6_2 = A3_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L7_2, L8_2 in L5_2, L6_2 do
    L9_2 = L8_2[3]
    if L9_2 ~= L4_2 then
      L4_2 = L8_2[3]
      L9_2 = L4_2 + 1
      A1_2[L9_2] = L7_2
      L9_2 = print
      L10_2 = "Zone "
      L11_2 = L4_2
      L12_2 = " starts at index "
      L13_2 = L4_2 + 1
      L13_2 = A1_2[L13_2]
      L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2
      L9_2(L10_2)
    end
    L9_2 = L8_2[3]
    L9_2 = L9_2 + 1
    L10_2 = L8_2[3]
    L10_2 = L10_2 + 1
    L10_2 = A2_2[L10_2]
    L10_2 = L10_2 + 1
    A2_2[L9_2] = L10_2
  end
  L5_2 = ipairs
  L6_2 = A1_2
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L7_2, L8_2 in L5_2, L6_2 do
    L9_2 = print
    L10_2 = "Zone "
    L11_2 = A3_2[L8_2]
    L11_2 = L11_2[3]
    L12_2 = " has "
    L13_2 = A2_2[L7_2]
    L14_2 = " entries"
    L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2
    L9_2(L10_2)
  end
end
L0_1.ExtractPerZoneInfo = L1_1
L0_1 = CoreLib
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2
  L5_2 = print
  L6_2 = "BuildSingleZoneTable()"
  L5_2(L6_2)
  L5_2 = 0
  while A3_2 > L5_2 do
    L6_2 = L5_2 + 1
    L7_2 = A2_2 + L5_2
    L7_2 = A1_2[L7_2]
    A4_2[L6_2] = L7_2
    L5_2 = L5_2 + 1
  end
  L6_2 = table
  L6_2 = L6_2.getn
  L7_2 = A4_2
  L6_2 = L6_2(L7_2)
  L7_2 = print
  L8_2 = "single zone table count "
  L9_2 = L6_2
  L8_2 = L8_2 .. L9_2
  L7_2(L8_2)
end
L0_1.BuildSingleZoneTable = L1_1
L0_1 = CoreLib
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L5_2 = {}
  L6_2 = {}
  L7_2 = {}
  L8_2 = print
  L9_2 = "building table for zone "
  L10_2 = A1_2
  L9_2 = L9_2 .. L10_2
  L8_2(L9_2)
  L8_2 = print
  L9_2 = "Start Index "
  L10_2 = A1_2 + 1
  L10_2 = A3_2[L10_2]
  L11_2 = " Zone Size "
  L12_2 = A1_2 + 1
  L12_2 = A4_2[L12_2]
  L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2
  L8_2(L9_2)
  L9_2 = A0_2
  L8_2 = A0_2.BuildSingleZoneTable
  L10_2 = A2_2
  L11_2 = A1_2 + 1
  L11_2 = A3_2[L11_2]
  L12_2 = A1_2 + 1
  L12_2 = A4_2[L12_2]
  L13_2 = L5_2
  L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
  L8_2 = main
  L7_2 = L8_2.vSpawnPoints
  L8_2 = main
  L8_2.vSpawnPoints = L5_2
  L8_2 = DoSpawn
  L9_2 = nil
  L10_2 = false
  L8_2 = L8_2(L9_2, L10_2)
  L6_2 = L8_2
  L8_2 = main
  L8_2.vSpawnPoints = L7_2
  L5_2 = nil
  L8_2 = collectgarbage
  L8_2()
  return L6_2
end
L0_1.GetSpawnPositionInZone = L1_1
