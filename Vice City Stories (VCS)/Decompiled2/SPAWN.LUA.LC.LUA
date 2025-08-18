local L0_1, L1_1
L0_1 = 20
MAX_SPAWN_ATTEMPTS = L0_1
L0_1 = 100
MIN_DISTANCE_FROM_ENEMY = L0_1
L0_1 = 30
MIN_DISTANCE_FROM_TEAMDM_BUDDY = L0_1
L0_1 = 200
MAX_DISTANCE_FROM_TEAMDM_BUDDY = L0_1
L0_1 = 400
MAX_DISTANCE_FROM_ENEMY = L0_1
L0_1 = 100
MIN_DISTANCE_FROM_ENEMY_TDM = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L0_2 = main
  L1_2 = {}
  L2_2 = {}
  L3_2 = {}
  L4_2 = 0
  L5_2 = 4.0E-4
  L6_2 = 0
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L3_2[3] = L6_2
  L4_2 = 0
  L2_2[1] = L3_2
  L2_2[2] = L4_2
  L3_2 = {}
  L4_2 = {}
  L5_2 = 2.0E-4
  L6_2 = 2.0E-4
  L7_2 = 0
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L4_2[3] = L7_2
  L5_2 = 0
  L3_2[1] = L4_2
  L3_2[2] = L5_2
  L4_2 = {}
  L5_2 = {}
  L6_2 = 4.0E-4
  L7_2 = 0
  L8_2 = 0
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L5_2[3] = L8_2
  L6_2 = 0
  L4_2[1] = L5_2
  L4_2[2] = L6_2
  L5_2 = {}
  L6_2 = {}
  L7_2 = 2.0E-4
  L8_2 = -2.0E-4
  L9_2 = 0
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L7_2 = 0
  L5_2[1] = L6_2
  L5_2[2] = L7_2
  L6_2 = {}
  L7_2 = {}
  L8_2 = 0
  L9_2 = -4.0E-4
  L10_2 = 0
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L7_2[3] = L10_2
  L8_2 = 0
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L7_2 = {}
  L8_2 = {}
  L9_2 = -2.0E-4
  L10_2 = -2.0E-4
  L11_2 = 0
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L8_2[3] = L11_2
  L9_2 = 0
  L7_2[1] = L8_2
  L7_2[2] = L9_2
  L8_2 = {}
  L9_2 = {}
  L10_2 = -4.0E-4
  L11_2 = 0
  L12_2 = 0
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L10_2 = 0
  L8_2[1] = L9_2
  L8_2[2] = L10_2
  L9_2 = {}
  L10_2 = {}
  L11_2 = -2.0E-4
  L12_2 = 2.0E-4
  L13_2 = 0
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L11_2 = 0
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L1_2[1] = L2_2
  L1_2[2] = L3_2
  L1_2[3] = L4_2
  L1_2[4] = L5_2
  L1_2[5] = L6_2
  L1_2[6] = L7_2
  L1_2[7] = L8_2
  L1_2[8] = L9_2
  L0_2.vSpawnOffsets = L1_2
end
InitSpawnOffsets = L0_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2, L5_2
  L0_2 = main
  L0_2 = L0_2.vSpawnOffsets
  if not L0_2 then
    L0_2 = InitSpawnOffsets
    L0_2()
  end
  L0_2 = main
  L1_2 = {}
  L0_2.vSpawnPoints = L1_2
  L0_2 = nil
  L1_2 = UseLCFiles
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = dofile
    L2_2 = GetDiskPrepend
    L2_2 = L2_2()
    L3_2 = "LUA/SpawnPointData.lua.lc"
    L2_2 = L2_2 .. L3_2
    L1_2 = L1_2(L2_2)
    L0_2 = L1_2
  else
    L1_2 = dofile
    L2_2 = GetDiskPrepend
    L2_2 = L2_2()
    L3_2 = "LUA/SpawnPointData.lua"
    L2_2 = L2_2 .. L3_2
    L1_2 = L1_2(L2_2)
    L0_2 = L1_2
  end
  L1_2 = {}
  L2_2 = L0_2
  L2_2 = L2_2()
  L1_2 = L2_2
  L2_2 = main
  L3_2 = table
  L3_2 = L3_2.clone
  L4_2 = L1_2
  L3_2 = L3_2(L4_2)
  L2_2.vSpawnPoints = L3_2
  L2_2 = print
  L3_2 = "On this island there are "
  L4_2 = table
  L4_2 = L4_2.getn
  L5_2 = main
  L5_2 = L5_2.vSpawnPoints
  L4_2 = L4_2(L5_2)
  L5_2 = " spawn points"
  L3_2 = L3_2 .. L4_2 .. L5_2
  L2_2(L3_2)
  L2_2 = print
  L3_2 = "freeing the global spawn points"
  L2_2(L3_2)
  L0_2 = nil
  L2_2 = collectgarbage
  L2_2()
end
InitSpawnPoints = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = AllPlayers
  L2_2 = L2_2()
  L3_2 = ipairs
  L4_2 = main
  L4_2 = L4_2.vSpawnPoints
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L5_2, L6_2 in L3_2, L4_2 do
    L7_2 = true
    L8_2 = false
    L9_2 = pairs
    L10_2 = L2_2
    L9_2, L10_2, L11_2, L12_2 = L9_2(L10_2)
    for L11_2, L12_2 in L9_2, L10_2 do
      L14_2 = L12_2
      L13_2 = L12_2.PlayerNum
      L13_2 = L13_2(L14_2)
      L15_2 = L1_2
      L14_2 = L1_2.PlayerNum
      L14_2 = L14_2(L15_2)
      if L13_2 ~= L14_2 then
        L13_2 = Distance2D
        L14_2 = unpack
        L15_2 = L6_2
        L14_2 = L14_2(L15_2)
        L16_2 = L12_2
        L15_2 = L12_2.Position
        L15_2, L16_2 = L15_2(L16_2)
        L13_2 = L13_2(L14_2, L15_2, L16_2)
        L14_2 = MIN_DISTANCE_FROM_ENEMY
        if L13_2 < L14_2 then
          L7_2 = false
        else
          L14_2 = MAX_DISTANCE_FROM_ENEMY
          if L13_2 < L14_2 then
            L8_2 = true
          end
        end
      end
    end
    if not L8_2 then
      L7_2 = false
    end
    if L7_2 then
      L9_2 = table
      L9_2 = L9_2.insert
      L10_2 = A0_2
      L11_2 = L6_2
      L9_2(L10_2, L11_2)
    end
  end
end
PopulateSpawnListStandard = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = AllPlayers
  L2_2 = L2_2()
  L3_2 = ipairs
  L4_2 = main
  L4_2 = L4_2.vSpawnPoints
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L5_2, L6_2 in L3_2, L4_2 do
    L7_2 = true
    L8_2 = pairs
    L9_2 = L2_2
    L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
    for L10_2, L11_2 in L8_2, L9_2 do
      L13_2 = L11_2
      L12_2 = L11_2.PlayerNum
      L12_2 = L12_2(L13_2)
      L14_2 = L1_2
      L13_2 = L1_2.PlayerNum
      L13_2 = L13_2(L14_2)
      if L12_2 ~= L13_2 then
        L13_2 = L1_2
        L12_2 = L1_2.TeamId
        L12_2 = L12_2(L13_2)
        L14_2 = L11_2
        L13_2 = L11_2.TeamId
        L13_2 = L13_2(L14_2)
        if L12_2 == L13_2 then
          L12_2 = Distance2D
          L13_2 = unpack
          L14_2 = L6_2
          L13_2 = L13_2(L14_2)
          L15_2 = L11_2
          L14_2 = L11_2.Position
          L14_2, L15_2 = L14_2(L15_2)
          L12_2 = L12_2(L13_2, L14_2, L15_2)
          L13_2 = MAX_DISTANCE_FROM_TEAMDM_BUDDY
          if L12_2 > L13_2 then
            L7_2 = false
          end
          L13_2 = MIN_DISTANCE_FROM_TEAMDM_BUDDY
          if L12_2 < L13_2 then
            L7_2 = false
          end
      end
      else
        L13_2 = L11_2
        L12_2 = L11_2.PlayerNum
        L12_2 = L12_2(L13_2)
        L14_2 = L1_2
        L13_2 = L1_2.PlayerNum
        L13_2 = L13_2(L14_2)
        if L12_2 ~= L13_2 then
          L12_2 = Distance2D
          L13_2 = unpack
          L14_2 = L6_2
          L13_2 = L13_2(L14_2)
          L15_2 = L11_2
          L14_2 = L11_2.Position
          L14_2, L15_2 = L14_2(L15_2)
          L12_2 = L12_2(L13_2, L14_2, L15_2)
          L13_2 = MIN_DISTANCE_FROM_ENEMY_TDM
          if L12_2 < L13_2 then
            L7_2 = false
          end
        end
      end
    end
    if L7_2 then
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = A0_2
      L10_2 = L6_2
      L8_2(L9_2, L10_2)
    end
  end
end
PopulateSpawnListTeamDM = L0_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = AllPlayers
  L2_2 = L2_2()
  L3_2 = ipairs
  L4_2 = main
  L4_2 = L4_2.vSpawnPoints
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L5_2, L6_2 in L3_2, L4_2 do
    L7_2 = table
    L7_2 = L7_2.insert
    L8_2 = A0_2
    L9_2 = L6_2
    L7_2(L8_2, L9_2)
  end
end
PopulateSpawnListTeamGame = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = print
  L3_2 = "PopulateSpawnListForZone"
  L2_2(L3_2)
  L2_2 = Player
  L2_2 = L2_2()
  L3_2 = AllPlayers
  L3_2 = L3_2()
  L4_2 = ipairs
  L5_2 = main
  L5_2 = L5_2.vSpawnPoints
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L6_2, L7_2 in L4_2, L5_2 do
    L8_2 = L7_2[3]
    if L8_2 == A1_2 then
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = A0_2
      L10_2 = L7_2
      L8_2(L9_2, L10_2)
    end
  end
end
PopulateSpawnListForZone = L0_1
function L0_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L2_2 = {}
  L3_2 = DoSpawn
  L4_2 = nil
  L5_2 = false
  L3_2 = L3_2(L4_2, L5_2)
  L2_2 = L3_2
  L3_2 = 999999
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = 0
  L6_2 = 5
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = ipairs
  L6_2 = main
  L6_2 = L6_2.vSpawnPoints
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L7_2, L8_2 in L5_2, L6_2 do
    if L8_2 ~= nil then
      L9_2 = {}
      L10_2 = unpack
      L11_2 = L8_2
      L10_2 = L10_2(L11_2)
      L9_2 = L10_2
      if L9_2 ~= nil then
        L10_2 = Distance2D
        L11_2 = L9_2
        L12_2 = A0_2
        L10_2 = L10_2(L11_2, L12_2)
        L11_2 = IsAreaClearOfPlayers
        L12_2 = L9_2
        L11_2 = L11_2(L12_2)
        if L11_2 and L3_2 > L10_2 and 5 < L10_2 then
          L2_2 = L8_2
          L3_2 = L10_2
          if A1_2 >= L3_2 then
            if L4_2 <= 0 then
              L11_2 = print
              L12_2 = "SpawnNearHere has found a spawn point "
              L13_2 = L3_2
              L14_2 = " metres from where you wanted it"
              L12_2 = L12_2 .. L13_2 .. L14_2
              L11_2(L12_2)
              L11_2 = L2_2[1]
              return L11_2
            else
              L4_2 = L4_2 - 1
            end
          end
        end
      end
    end
  end
  L5_2 = nil
  L6_2 = Player
  L6_2 = L6_2()
  L7_2 = AddVectors
  L8_2 = unpack
  L9_2 = L2_2
  L8_2 = L8_2(L9_2)
  L9_2 = unpack
  L10_2 = main
  L10_2 = L10_2.vSpawnOffsets
  L12_2 = L6_2
  L11_2 = L6_2.PlayerNum
  L11_2 = L11_2(L12_2)
  L11_2 = L11_2 + 1
  L10_2 = L10_2[L11_2]
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L9_2(L10_2)
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L5_2 = L7_2
  L7_2 = print
  L8_2 = "SpawnNearHere did a best try and got "
  L9_2 = L3_2
  L10_2 = " metres from where you wanted it"
  L8_2 = L8_2 .. L9_2 .. L10_2
  L7_2(L8_2)
  return L5_2
end
SpawnNearHere = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
  L3_2 = {}
  L4_2 = DoSpawn
  L5_2 = nil
  L6_2 = false
  L4_2 = L4_2(L5_2, L6_2)
  L3_2 = L4_2
  L4_2 = math
  L4_2 = L4_2.random
  L5_2 = 0
  L6_2 = 5
  L4_2 = L4_2(L5_2, L6_2)
  L5_2 = ipairs
  L6_2 = main
  L6_2 = L6_2.vSpawnPoints
  L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
  for L7_2, L8_2 in L5_2, L6_2 do
    if L8_2 ~= nil then
      L9_2 = {}
      L10_2 = unpack
      L11_2 = L8_2
      L10_2 = L10_2(L11_2)
      L9_2 = L10_2
      if L9_2 ~= nil then
        L10_2 = Distance2D
        L11_2 = L9_2
        L12_2 = A0_2
        L10_2 = L10_2(L11_2, L12_2)
        L11_2 = IsAreaClearOfPlayers
        L12_2 = L9_2
        L11_2 = L11_2(L12_2)
        if L11_2 and A1_2 < L10_2 then
          L3_2 = L8_2
          if A1_2 < L10_2 and A2_2 > L10_2 then
            if L4_2 <= 0 then
              L11_2 = print
              L12_2 = "SpawnMinMax has found a spawn point "
              L13_2 = L10_2
              L14_2 = " metres from the target"
              L12_2 = L12_2 .. L13_2 .. L14_2
              L11_2(L12_2)
              L11_2 = L3_2[1]
              return L11_2
            else
              L4_2 = L4_2 - 1
            end
          end
        end
      end
    end
  end
  L5_2 = nil
  L6_2 = Player
  L6_2 = L6_2()
  L7_2 = AddVectors
  L8_2 = unpack
  L9_2 = L3_2
  L8_2 = L8_2(L9_2)
  L9_2 = unpack
  L10_2 = main
  L10_2 = L10_2.vSpawnOffsets
  L12_2 = L6_2
  L11_2 = L6_2.PlayerNum
  L11_2 = L11_2(L12_2)
  L11_2 = L11_2 + 1
  L10_2 = L10_2[L11_2]
  L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L9_2(L10_2)
  L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L5_2 = L7_2
  return L5_2
end
SpawnMinMax = L0_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2
  if not A0_2 then
    A0_2 = -1
  end
  if A1_2 == nil then
    A1_2 = true
  end
  L3_2 = Player
  L3_2 = L3_2()
  L4_2 = AllPlayers
  L4_2 = L4_2()
  L5_2 = 0
  L6_2 = 0
  L7_2 = unpack
  L8_2 = main
  L8_2 = L8_2.vSpawnPoints
  L8_2 = L8_2[1]
  L7_2 = L7_2(L8_2)
  L8_2 = 0
  L5_2 = A0_2
  L9_2 = false
  L10_2 = GameType
  L10_2 = L10_2()
  if L10_2 == 0 then
    L10_2 = IsTeamGame
    L10_2 = L10_2()
    if L10_2 then
      L10_2 = print
      L11_2 = "In team mode spawn check"
      L10_2(L11_2)
      L10_2 = TeamPlayers
      L12_2 = L3_2
      L11_2 = L3_2.TeamId
      L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L11_2(L12_2)
      L10_2 = L10_2(L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      L11_2 = table
      L11_2 = L11_2.getn
      L12_2 = L10_2
      L11_2 = L11_2(L12_2)
      if 1 < L11_2 then
        L11_2 = print
        L12_2 = "setting down team spawn to true"
        L11_2(L12_2)
        L9_2 = true
      end
    end
  end
  L10_2 = IsTeamGame
  L10_2 = L10_2()
  L11_2 = print
  L12_2 = "try_this_point_first is "
  L13_2 = A0_2
  L12_2 = L12_2 .. L13_2
  L11_2(L12_2)
  if not (A0_2 < 1) then
    L11_2 = table
    L11_2 = L11_2.getn
    L12_2 = main
    L12_2 = L12_2.vSpawnPoints
    L11_2 = L11_2(L12_2)
    if not (A0_2 > L11_2) then
      goto lbl_318
    end
  end
  L11_2 = print
  L12_2 = "Generating a spawn point list"
  L11_2(L12_2)
  L11_2 = {}
  if A2_2 ~= nil then
    L12_2 = PopulateSpawnListForZone
    L13_2 = L11_2
    L14_2 = A2_2
    L12_2(L13_2, L14_2)
  elseif L9_2 then
    L12_2 = PopulateSpawnListTeamDM
    L13_2 = L11_2
    L12_2(L13_2)
  elseif L10_2 then
    L12_2 = PopulateSpawnListTeamGame
    L13_2 = L11_2
    L12_2(L13_2)
    L12_2 = table
    L12_2 = L12_2.getn
    L13_2 = L11_2
    L12_2 = L12_2(L13_2)
    if L12_2 == 0 then
      L12_2 = print
      L13_2 = "Team DM didnt find a suitable spawn location. Retrying with standard spawn populate."
      L12_2(L13_2)
      L12_2 = PopulateSpawnListStandard
      L13_2 = L11_2
      L12_2(L13_2)
    end
  else
    L12_2 = PopulateSpawnListStandard
    L13_2 = L11_2
    L12_2(L13_2)
  end
  L12_2 = table
  L12_2 = L12_2.getn
  L13_2 = L11_2
  L12_2 = L12_2(L13_2)
  if L12_2 == 0 then
    L12_2 = print
    L13_2 = "SPAWN WARNING!! Havent been able to find a player spawn point that meet conditions! Its ok though."
    L12_2(L13_2)
    L12_2 = ipairs
    L13_2 = main
    L13_2 = L13_2.vSpawnPoints
    L12_2, L13_2, L14_2, L15_2 = L12_2(L13_2)
    for L14_2, L15_2 in L12_2, L13_2 do
      L16_2 = table
      L16_2 = L16_2.insert
      L17_2 = L11_2
      L18_2 = L15_2
      L16_2(L17_2, L18_2)
    end
  end
  L12_2 = math
  L12_2 = L12_2.random
  L13_2 = 1
  L14_2 = table
  L14_2 = L14_2.getn
  L15_2 = L11_2
  L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L14_2(L15_2)
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L5_2 = L12_2
  L12_2 = AddVectors
  L13_2 = unpack
  L14_2 = L11_2[L5_2]
  L13_2 = L13_2(L14_2)
  L14_2 = unpack
  L15_2 = main
  L15_2 = L15_2.vSpawnOffsets
  L17_2 = L3_2
  L16_2 = L3_2.PlayerNum
  L16_2 = L16_2(L17_2)
  L16_2 = L16_2 + 1
  L15_2 = L15_2[L16_2]
  L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L14_2(L15_2)
  L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
  L7_2 = L12_2
  L12_2 = L11_2[L5_2]
  L8_2 = L12_2[2]
  L12_2 = table
  L12_2 = L12_2.remove
  L13_2 = L11_2
  L12_2(L13_2)
  L12_2 = IsAreaClearOfPlayers
  L13_2 = L7_2
  L12_2 = L12_2(L13_2)
  goto lbl_201
  repeat
    L13_2 = print
    L14_2 = "Attempt to spawn failed"
    L13_2(L14_2)
    L13_2 = math
    L13_2 = L13_2.random
    L14_2 = 1
    L15_2 = table
    L15_2 = L15_2.getn
    L16_2 = L11_2
    L15_2, L16_2, L17_2, L18_2, L19_2 = L15_2(L16_2)
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    L5_2 = L13_2
    L13_2 = AddVectors
    L14_2 = unpack
    L15_2 = L11_2[L5_2]
    L14_2 = L14_2(L15_2)
    L15_2 = unpack
    L16_2 = main
    L16_2 = L16_2.vSpawnOffsets
    L18_2 = L3_2
    L17_2 = L3_2.PlayerNum
    L17_2 = L17_2(L18_2)
    L17_2 = L17_2 + 1
    L16_2 = L16_2[L17_2]
    L15_2, L16_2, L17_2, L18_2, L19_2 = L15_2(L16_2)
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    L7_2 = L13_2
    L13_2 = print
    L14_2 = "trying point "
    L15_2 = L5_2
    L16_2 = " out of a list of "
    L17_2 = table
    L17_2 = L17_2.getn
    L18_2 = L11_2
    L17_2 = L17_2(L18_2)
    L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2
    L13_2(L14_2)
    L13_2 = L11_2[L5_2]
    L8_2 = L13_2[2]
    L13_2 = table
    L13_2 = L13_2.remove
    L14_2 = L11_2
    L15_2 = L5_2
    L13_2(L14_2, L15_2)
    L13_2 = IsAreaClearOfPlayers
    L14_2 = L7_2
    L13_2 = L13_2(L14_2)
    L12_2 = L13_2
    ::lbl_201::
    if L12_2 then
      break
    end
    L13_2 = table
    L13_2 = L13_2.getn
    L14_2 = L11_2
    L13_2 = L13_2(L14_2)
  until not (0 < L13_2)
  if not L12_2 then
    L13_2 = print
    L14_2 = "Going into fallback spawn mode, where we try every spawn point specified for this GM and Island"
    L13_2(L14_2)
    L13_2 = ipairs
    L14_2 = main
    L14_2 = L14_2.vSpawnPoints
    L13_2, L14_2, L15_2, L16_2 = L13_2(L14_2)
    for L15_2, L16_2 in L13_2, L14_2 do
      L17_2 = table
      L17_2 = L17_2.insert
      L18_2 = L11_2
      L19_2 = L16_2
      L17_2(L18_2, L19_2)
    end
    goto lbl_274
    repeat
      L13_2 = print
      L14_2 = "DESPERATE Attempt to spawn failed"
      L13_2(L14_2)
      L13_2 = math
      L13_2 = L13_2.random
      L14_2 = 1
      L15_2 = table
      L15_2 = L15_2.getn
      L16_2 = L11_2
      L15_2, L16_2, L17_2, L18_2, L19_2 = L15_2(L16_2)
      L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      L5_2 = L13_2
      L13_2 = AddVectors
      L14_2 = unpack
      L15_2 = L11_2[L5_2]
      L14_2 = L14_2(L15_2)
      L15_2 = unpack
      L16_2 = main
      L16_2 = L16_2.vSpawnOffsets
      L18_2 = L3_2
      L17_2 = L3_2.PlayerNum
      L17_2 = L17_2(L18_2)
      L17_2 = L17_2 + 1
      L16_2 = L16_2[L17_2]
      L15_2, L16_2, L17_2, L18_2, L19_2 = L15_2(L16_2)
      L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      L7_2 = L13_2
      L13_2 = print
      L14_2 = "trying point "
      L15_2 = L5_2
      L16_2 = " out of a list of "
      L17_2 = table
      L17_2 = L17_2.getn
      L18_2 = L11_2
      L17_2 = L17_2(L18_2)
      L14_2 = L14_2 .. L15_2 .. L16_2 .. L17_2
      L13_2(L14_2)
      L13_2 = L11_2[L5_2]
      L8_2 = L13_2[2]
      L13_2 = table
      L13_2 = L13_2.remove
      L14_2 = L11_2
      L15_2 = L5_2
      L13_2(L14_2, L15_2)
      L13_2 = IsAreaClearOfPlayers
      L14_2 = L7_2
      L13_2 = L13_2(L14_2)
      L12_2 = L13_2
      ::lbl_274::
      if L12_2 then
        break
      end
      L13_2 = table
      L13_2 = L13_2.getn
      L14_2 = L11_2
      L13_2 = L13_2(L14_2)
    until not (0 < L13_2)
  end
  if not L12_2 then
    L13_2 = print
    L14_2 = "Going into SUPER FALLBACK spawn mode. Look into putting more spawn points in."
    L13_2(L14_2)
    L13_2 = math
    L13_2 = L13_2.random
    L14_2 = 1
    L15_2 = table
    L15_2 = L15_2.getn
    L16_2 = main
    L16_2 = L16_2.vSpawnPoints
    L15_2, L16_2, L17_2, L18_2, L19_2 = L15_2(L16_2)
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    L5_2 = L13_2
    L13_2 = AddVectors
    L14_2 = unpack
    L15_2 = main
    L15_2 = L15_2.vSpawnPoints
    L15_2 = L15_2[L5_2]
    L14_2 = L14_2(L15_2)
    L15_2 = unpack
    L16_2 = main
    L16_2 = L16_2.vSpawnOffsets
    L18_2 = L3_2
    L17_2 = L3_2.PlayerNum
    L17_2 = L17_2(L18_2)
    L17_2 = L17_2 + 1
    L16_2 = L16_2[L17_2]
    L15_2, L16_2, L17_2, L18_2, L19_2 = L15_2(L16_2)
    L13_2 = L13_2(L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
    L7_2 = L13_2
    L13_2 = main
    L13_2 = L13_2.vSpawnPoints
    L13_2 = L13_2[L5_2]
    L8_2 = L13_2[2]
    goto lbl_357
    ::lbl_318::
    L11_2 = print
    L12_2 = "Trying to do an initial spawn at point "
    L13_2 = L5_2
    L12_2 = L12_2 .. L13_2
    L11_2(L12_2)
    L11_2 = {}
    if A2_2 ~= nil then
      L12_2 = PopulateSpawnListForZone
      L13_2 = L11_2
      L14_2 = A2_2
      L12_2(L13_2, L14_2)
      L12_2 = unpack
      L13_2 = L11_2[L5_2]
      L12_2 = L12_2(L13_2)
      L7_2 = L12_2
      L12_2 = L11_2[L5_2]
      L8_2 = L12_2[2]
    else
      L12_2 = AddVectors
      L13_2 = unpack
      L14_2 = main
      L14_2 = L14_2.vSpawnPoints
      L14_2 = L14_2[L5_2]
      L13_2 = L13_2(L14_2)
      L14_2 = unpack
      L15_2 = main
      L15_2 = L15_2.vSpawnOffsets
      L17_2 = L3_2
      L16_2 = L3_2.PlayerNum
      L16_2 = L16_2(L17_2)
      L16_2 = L16_2 + 1
      L15_2 = L15_2[L16_2]
      L14_2, L15_2, L16_2, L17_2, L18_2, L19_2 = L14_2(L15_2)
      L12_2 = L12_2(L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2)
      L7_2 = L12_2
      L12_2 = main
      L12_2 = L12_2.vSpawnPoints
      L12_2 = L12_2[L5_2]
      L8_2 = L12_2[2]
    end
  end
  ::lbl_357::
  L11_2 = true
  if A1_2 == L11_2 then
    L11_2 = print
    L12_2 = "Respawn called at point "
    L13_2 = L5_2
    L12_2 = L12_2 .. L13_2
    L11_2(L12_2)
    L12_2 = L3_2
    L11_2 = L3_2.Respawn
    L13_2 = L7_2
    L14_2 = L8_2
    L11_2(L12_2, L13_2, L14_2)
  end
  L7_2[4] = L8_2
  L11_2 = collectgarbage
  L11_2()
  return L7_2
end
DoSpawn = L0_1
L0_1 = false
g_isRespawning = L0_1
function L0_1()
  local L0_2, L1_2
  L0_2 = g_isRespawning
  return L0_2
end
IsPlayerRespawning = L0_1
function L0_1()
  local L0_2, L1_2, L2_2
  L0_2 = Wait
  L1_2 = 2000
  L0_2(L1_2)
  L0_2 = true
  g_isRespawning = L0_2
  L0_2 = ClearMessages
  L0_2()
  L0_2 = main
  L0_2 = L0_2.scores
  L1_2 = L0_2
  L0_2 = L0_2.Show
  L2_2 = true
  L0_2(L1_2, L2_2)
  L0_2 = collectgarbage
  L0_2()
  L0_2 = 0
  while L0_2 < 150 do
    L1_2 = DisablePlayer
    L2_2 = true
    L1_2(L2_2)
    L1_2 = ClearMessages
    L1_2()
    L1_2 = Wait
    L2_2 = 1
    L1_2(L2_2)
    L0_2 = L0_2 + 1
    if 50 < L0_2 then
      L1_2 = CrossDown
      L1_2 = L1_2()
      if L1_2 then
        break
      end
    end
  end
  L1_2 = main
  L1_2 = L1_2.scores
  L2_2 = L1_2
  L1_2 = L1_2.Hide
  L1_2(L2_2)
  L1_2 = false
  g_isRespawning = L1_2
end
DoWasted = L0_1
