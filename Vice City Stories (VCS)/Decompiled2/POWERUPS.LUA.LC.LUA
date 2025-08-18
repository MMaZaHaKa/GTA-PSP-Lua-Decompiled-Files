local L0_1, L1_1, L2_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
PowerupTimer = L0_1
L0_1 = -1
lastCreatedIndex = L0_1
L0_1 = 1
L1_1 = PowerupTimer
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = {}
    A0_2.pickupdata = L1_2
    L2_2 = A0_2
    L1_2 = A0_2.InitPowerups
    L1_2(L2_2)
    while 1 do
      L1_2 = DoesPowerupExist
      L1_2 = L1_2()
      if 2 <= L1_2 then
        L1_2 = Wait
        L2_2 = 500
        L1_2(L2_2)
      else
        L1_2 = Wait
        L2_2 = L0_1
        L1_2(L2_2)
        L2_2 = A0_2
        L1_2 = A0_2.CreateAPowerUp
        L1_2(L2_2)
      end
      L1_2 = Wait
      L2_2 = 10
      L1_2(L2_2)
    end
  end
end
L1_1.Run = L2_1
L1_1 = PowerupTimer
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = nil
  L2_2 = UseLCFiles
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = dofile
    L3_2 = GetDiskPrepend
    L3_2 = L3_2()
    L4_2 = "LUA/PowerupData.lua.lc"
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  else
    L2_2 = dofile
    L3_2 = GetDiskPrepend
    L3_2 = L3_2()
    L4_2 = "LUA/PowerupData.lua"
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  end
  L2_2 = {}
  L3_2 = L1_2
  L3_2 = L3_2()
  L2_2 = L3_2
  L3_2 = table
  L3_2 = L3_2.clone
  L4_2 = L2_2
  L3_2 = L3_2(L4_2)
  A0_2.pickupdata = L3_2
  L3_2 = print
  L4_2 = "On this island there are "
  L5_2 = table
  L5_2 = L5_2.getn
  L6_2 = A0_2.pickupdata
  L5_2 = L5_2(L6_2)
  L6_2 = "powerups"
  L4_2 = L4_2 .. L5_2 .. L6_2
  L3_2(L4_2)
  L1_2 = nil
  L3_2 = collectgarbage
  L3_2()
end
L1_1.InitPowerups = L2_1
L1_1 = PowerupTimer
function L2_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = DoesPowerupExist
  L1_2 = L1_2()
  if 2 <= L1_2 then
    return
  end
  L1_2 = nil
  L2_2 = A0_2.pickupdata
  if L2_2 ~= nil then
    L2_2 = table
    L2_2 = L2_2.getn
    L3_2 = A0_2.pickupdata
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  end
  if L1_2 and 1 <= L1_2 then
    L2_2 = print
    L3_2 = "PowerupTimer:CreateAPowerUp()"
    L2_2(L3_2)
    L2_2 = math
    L2_2 = L2_2.random
    L3_2 = 1
    L4_2 = L1_2
    L2_2 = L2_2(L3_2, L4_2)
    L3_2 = lastCreatedIndex
    if L2_2 == L3_2 then
      L2_2 = L2_2 + 1
      if L2_2 and L1_2 < L2_2 then
        L2_2 = 1
      end
    end
    L3_2 = lastCreatedIndex
    if L3_2 ~= L2_2 then
      L3_2 = print
      L4_2 = "Creating powerup, index == "
      L5_2 = L2_2
      L4_2 = L4_2 .. L5_2
      L3_2(L4_2)
      L3_2 = GameType
      L3_2 = L3_2()
      if L3_2 == 5 then
        L3_2 = A0_2.pickupdata
        L3_2 = L3_2[L2_2]
        L3_2 = L3_2[1]
        L4_2 = pickup
        L4_2 = L4_2.invisible
        if L3_2 == L4_2 then
          L3_2 = A0_2.pickupdata
          L3_2 = L3_2[L2_2]
          L4_2 = pickup
          L4_2 = L4_2.regenhealth
          L3_2[1] = L4_2
        end
      end
      L3_2 = CreatePickup
      L4_2 = A0_2.pickupdata
      L4_2 = L4_2[L2_2]
      L4_2 = L4_2[1]
      L5_2 = A0_2.pickupdata
      L5_2 = L5_2[L2_2]
      L5_2 = L5_2[2]
      L6_2 = A0_2.pickupdata
      L6_2 = L6_2[L2_2]
      L6_2 = L6_2[3]
      L3_2(L4_2, L5_2, L6_2)
    end
    lastCreatedIndex = L2_2
    L3_2 = math
    L3_2 = L3_2.random
    L4_2 = 30000
    L5_2 = 60000
    L3_2 = L3_2(L4_2, L5_2)
    L3_2 = 120000 + L3_2
    L0_1 = L3_2
    L3_2 = print
    L4_2 = "Powerup will respawn in "
    L5_2 = L0_1
    L6_2 = " Ms"
    L4_2 = L4_2 .. L5_2 .. L6_2
    L3_2(L4_2)
  end
end
L1_1.CreateAPowerUp = L2_1
