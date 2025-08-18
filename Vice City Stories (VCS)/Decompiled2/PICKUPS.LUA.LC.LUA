local L0_1, L1_1
L0_1 = require
L1_1 = "PickupBlips"
L0_1(L1_1)
L0_1 = Object
L1_1 = {}
L0_1 = L0_1(L1_1)
PickupMgr = L0_1
L0_1 = 30
MAX_PICKUPS = L0_1
L0_1 = PickupMgr
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = A0_2.pickupBlipScript
  L2_2 = L1_2
  L1_2 = L1_2.Stop
  L1_2(L2_2)
  L1_2 = ipairs
  L2_2 = A0_2.pickups
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L3_2, L4_2 in L1_2, L2_2 do
    L6_2 = L4_2
    L5_2 = L4_2.Remove
    L5_2(L6_2)
  end
end
L0_1.CleanUp = L1_1
L0_1 = PickupMgr
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = {}
  A0_2.pickups = L1_2
  L1_2 = print
  L2_2 = "Creating Pickups from lua"
  L1_2(L2_2)
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = {}
    L2_2 = nil
    L3_2 = UseLCFiles
    L3_2 = L3_2()
    if L3_2 then
      L3_2 = dofile
      L4_2 = GetDiskPrepend
      L4_2 = L4_2()
      L5_2 = "LUA/PickupsData.lua.lc"
      L4_2 = L4_2 .. L5_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
    else
      L3_2 = dofile
      L4_2 = GetDiskPrepend
      L4_2 = L4_2()
      L5_2 = "LUA/PickupsData.lua"
      L4_2 = L4_2 .. L5_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
    end
    L3_2 = {}
    L4_2 = L2_2
    L4_2 = L4_2()
    L3_2 = L4_2
    L4_2 = table
    L4_2 = L4_2.clone
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L1_2 = L4_2
    L4_2 = print
    L5_2 = "On this island there are "
    L6_2 = table
    L6_2 = L6_2.getn
    L7_2 = L1_2
    L6_2 = L6_2(L7_2)
    L7_2 = " pickups"
    L5_2 = L5_2 .. L6_2 .. L7_2
    L4_2(L5_2)
    L2_2 = nil
    L4_2 = collectgarbage
    L4_2()
    L4_2 = GameType
    L4_2 = L4_2()
    if L4_2 == 1 then
      L4_2 = UseRacePowerups
      L4_2 = L4_2()
      if L4_2 then
        L5_2 = A0_2
        L4_2 = A0_2.AddRacePickups
        L4_2(L5_2)
      end
    else
      L4_2 = 0
      L5_2 = ipairs
      L6_2 = L1_2
      L5_2, L6_2, L7_2, L8_2 = L5_2(L6_2)
      for L7_2, L8_2 in L5_2, L6_2 do
        L4_2 = L4_2 + 1
        L9_2 = GameType
        L9_2 = L9_2()
        if L9_2 == 3 then
          L9_2 = L8_2[1]
          L10_2 = pickup
          L10_2 = L10_2.det_grenade
          if L9_2 == L10_2 then
            L9_2 = pickup
            L9_2 = L9_2.grenade
            L8_2[1] = L9_2
          end
        end
        L9_2 = table
        L9_2 = L9_2.insert
        L10_2 = A0_2.pickups
        L11_2 = CreatePickup
        L12_2 = unpack
        L13_2 = L8_2
        L12_2, L13_2 = L12_2(L13_2)
        L11_2, L12_2, L13_2 = L11_2(L12_2, L13_2)
        L9_2(L10_2, L11_2, L12_2, L13_2)
      end
    end
    L4_2 = GameType
    L4_2 = L4_2()
    if L4_2 == 2 then
      L5_2 = A0_2
      L4_2 = A0_2.AddDTBPickups
      L4_2(L5_2)
    else
      L4_2 = GameType
      L4_2 = L4_2()
      if L4_2 == 3 then
        L5_2 = A0_2
        L4_2 = A0_2.AddCTFPickups
        L4_2(L5_2)
      end
    end
  end
  L1_2 = PickupBlipScript
  L2_2 = {}
  L1_2 = L1_2(L2_2)
  L2_2 = L1_2
  L1_2 = L1_2.Start
  L3_2 = 90
  L1_2 = L1_2(L2_2, L3_2)
  A0_2.pickupBlipScript = L1_2
end
L0_1.CreatePickups = L1_1
L0_1 = PickupMgr
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = IsIronManRace
    L1_2 = L1_2()
    if L1_2 then
      return
    end
    L1_2 = print
    L2_2 = "Creating RACE pickups"
    L1_2(L2_2)
    L1_2 = {}
    L2_2 = nil
    L3_2 = UseLCFiles
    L3_2 = L3_2()
    if L3_2 then
      L3_2 = dofile
      L4_2 = GetDiskPrepend
      L4_2 = L4_2()
      L5_2 = "LUA/MultiRacePickupData.lua.lc"
      L4_2 = L4_2 .. L5_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
    else
      L3_2 = dofile
      L4_2 = GetDiskPrepend
      L4_2 = L4_2()
      L5_2 = "LUA/MultiRacePickupData.lua"
      L4_2 = L4_2 .. L5_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
    end
    L3_2 = {}
    L4_2 = L2_2
    L4_2 = L4_2()
    L3_2 = L4_2
    L4_2 = table
    L4_2 = L4_2.clone
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L1_2 = L4_2
    L4_2 = print
    L5_2 = "On this island there are "
    L6_2 = table
    L6_2 = L6_2.getn
    L7_2 = L1_2
    L6_2 = L6_2(L7_2)
    L7_2 = " race pickups"
    L5_2 = L5_2 .. L6_2 .. L7_2
    L4_2(L5_2)
    L4_2 = print
    L5_2 = "Memory with all race pickups in ..."
    L4_2(L5_2)
    L4_2 = DoMemoryPrint
    L4_2()
    L2_2 = nil
    L4_2 = collectgarbage
    L4_2()
    L4_2 = print
    L5_2 = "Memory with other island race pickups out ..."
    L4_2(L5_2)
    L4_2 = DoMemoryPrint
    L4_2()
    L4_2 = ipairs
    L5_2 = L1_2
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L6_2, L7_2 in L4_2, L5_2 do
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = A0_2.pickups
      L10_2 = CreatePickup
      L11_2 = unpack
      L12_2 = L7_2
      L11_2, L12_2 = L11_2(L12_2)
      L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
      L8_2(L9_2, L10_2, L11_2, L12_2)
    end
  end
end
L0_1.AddRacePickups = L1_1
L0_1 = PickupMgr
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = {}
    L2_2 = nil
    L3_2 = UseLCFiles
    L3_2 = L3_2()
    if L3_2 then
      L3_2 = dofile
      L4_2 = GetDiskPrepend
      L4_2 = L4_2()
      L5_2 = "LUA/DTBPickupData.lua.lc"
      L4_2 = L4_2 .. L5_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
    else
      L3_2 = dofile
      L4_2 = GetDiskPrepend
      L4_2 = L4_2()
      L5_2 = "LUA/DTBPickupData.lua"
      L4_2 = L4_2 .. L5_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
    end
    L3_2 = {}
    L4_2 = L2_2
    L4_2 = L4_2()
    L3_2 = L4_2
    L4_2 = table
    L4_2 = L4_2.clone
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L1_2 = L4_2
    L4_2 = ipairs
    L5_2 = L1_2
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L6_2, L7_2 in L4_2, L5_2 do
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = A0_2.pickups
      L10_2 = CreatePickup
      L11_2 = unpack
      L12_2 = L7_2
      L11_2, L12_2 = L11_2(L12_2)
      L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
      L8_2(L9_2, L10_2, L11_2, L12_2)
    end
  end
end
L0_1.AddDTBPickups = L1_1
L0_1 = PickupMgr
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = {}
    L2_2 = nil
    L3_2 = UseLCFiles
    L3_2 = L3_2()
    if L3_2 then
      L3_2 = dofile
      L4_2 = GetDiskPrepend
      L4_2 = L4_2()
      L5_2 = "LUA/CTFPickupData.lua.lc"
      L4_2 = L4_2 .. L5_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
    else
      L3_2 = dofile
      L4_2 = GetDiskPrepend
      L4_2 = L4_2()
      L5_2 = "LUA/CTFPickupData.lua"
      L4_2 = L4_2 .. L5_2
      L3_2 = L3_2(L4_2)
      L2_2 = L3_2
    end
    L3_2 = {}
    L4_2 = L2_2
    L4_2 = L4_2()
    L3_2 = L4_2
    L4_2 = table
    L4_2 = L4_2.clone
    L5_2 = L3_2
    L4_2 = L4_2(L5_2)
    L1_2 = L4_2
    L4_2 = ipairs
    L5_2 = L1_2
    L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
    for L6_2, L7_2 in L4_2, L5_2 do
      L8_2 = table
      L8_2 = L8_2.insert
      L9_2 = A0_2.pickups
      L10_2 = CreatePickup
      L11_2 = unpack
      L12_2 = L7_2
      L11_2, L12_2 = L11_2(L12_2)
      L10_2, L11_2, L12_2 = L10_2(L11_2, L12_2)
      L8_2(L9_2, L10_2, L11_2, L12_2)
    end
  end
end
L0_1.AddCTFPickups = L1_1
