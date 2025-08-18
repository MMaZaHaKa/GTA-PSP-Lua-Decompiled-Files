local L0_1, L1_1, L2_1
L0_1 = string
function L1_1(A0_2)
  local L1_2
  if A0_2 == 1 then
    L1_2 = "st"
    return L1_2
  elseif A0_2 == 2 then
    L1_2 = "nd"
    return L1_2
  elseif A0_2 == 3 then
    L1_2 = "rd"
    return L1_2
  else
    L1_2 = "th"
    return L1_2
  end
end
L0_1.ordinalSuffix = L1_1
L0_1 = {}
list = L0_1
L0_1 = list
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L5_2, L6_2 in L3_2, L4_2 do
    L7_2 = table
    L7_2 = L7_2.insert
    L8_2 = L2_2
    L9_2 = L6_2
    L7_2(L8_2, L9_2)
  end
  L3_2 = ipairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L5_2, L6_2 in L3_2, L4_2 do
    L7_2 = table
    L7_2 = L7_2.insert
    L8_2 = L2_2
    L9_2 = L6_2
    L7_2(L8_2, L9_2)
  end
  return L2_2
end
L0_1.concat = L1_1
L0_1 = list
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = {}
  L3_2 = ipairs
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L5_2, L6_2 in L3_2, L4_2 do
    L7_2 = A1_2
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 then
      L7_2 = table
      L7_2 = L7_2.insert
      L8_2 = L2_2
      L9_2 = L6_2
      L7_2(L8_2, L9_2)
    end
  end
  return L2_2
end
L0_1.filter = L1_1
L0_1 = list
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = table
  L2_2 = L2_2.foreachi
  L3_2 = A0_2
  function L4_2(A0_3, A1_3)
    local L2_3
    L2_3 = A1_2
    if A1_3 == L2_3 then
      return A0_3
    end
  end
  return L2_2(L3_2, L4_2)
end
L0_1.find = L1_1
L0_1 = {}
set = L0_1
L0_1 = set
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = list
  L2_2 = L2_2.find
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  if not L2_2 then
    L2_2 = table
    L2_2 = L2_2.insert
    L3_2 = A0_2
    L4_2 = A1_2
    L2_2(L3_2, L4_2)
  end
end
L0_1.insert = L1_1
L0_1 = table
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = {}
  L3_2 = pairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L5_2, L6_2 in L3_2, L4_2 do
    L7_2 = A0_2[L5_2]
    if L7_2 ~= nil then
      L7_2 = A0_2[L5_2]
      L2_2[L7_2] = L6_2
    else
      L2_2[L5_2] = L6_2
    end
  end
  return L2_2
end
L0_1.permute = L1_1
L0_1 = table
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = setmetatable
  L2_2 = {}
  L3_2 = getmetatable
  L4_2 = A0_2
  L3_2, L4_2, L5_2, L6_2, L7_2, L8_2 = L3_2(L4_2)
  L1_2 = L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2)
  L2_2 = pairs
  L3_2 = A0_2
  L2_2, L3_2, L4_2, L5_2 = L2_2(L3_2)
  for L4_2, L5_2 in L2_2, L3_2 do
    L1_2[L4_2] = L5_2
  end
  return L1_2
end
L0_1.clone = L1_1
L0_1 = table
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = {}
  L3_2 = A0_2
  L4_2 = nil
  L5_2 = nil
  L6_2 = nil
  for L5_2, L6_2 in L3_2, L4_2 do
    L7_2 = type
    L8_2 = L6_2
    L7_2 = L7_2(L8_2)
    if L7_2 ~= "table" then
      L2_2[L5_2] = L6_2
    else
      if not A1_2 then
        L7_2 = {}
        A1_2 = L7_2
      end
      A1_2[A0_2] = L2_2
      L7_2 = A1_2[L6_2]
      if L7_2 then
        L7_2 = A1_2[L6_2]
        L2_2[L5_2] = L7_2
      else
        L7_2 = table
        L7_2 = L7_2.deepcopy
        L8_2 = L6_2
        L9_2 = A1_2
        L7_2 = L7_2(L8_2, L9_2)
        L2_2[L5_2] = L7_2
      end
    end
  end
  return L2_2
end
L0_1.deepcopy = L1_1
L0_1 = table
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L2_2 = table
  L2_2 = L2_2.clone
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = pairs
  L4_2 = A1_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L5_2, L6_2 in L3_2, L4_2 do
    L2_2[L5_2] = L6_2
  end
  return L2_2
end
L0_1.merge = L1_1
L0_1 = table
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = {}
  L2_2 = table
  L2_2 = L2_2.foreach
  L3_2 = A0_2
  function L4_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = table
    L2_3 = L2_3.insert
    L3_3 = L1_2
    L4_3 = A0_3
    L2_3(L3_3, L4_3)
  end
  L2_2(L3_2, L4_2)
  return L1_2
end
L0_1.keys = L1_1
L0_1 = table
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = {}
  L2_2 = table
  L2_2 = L2_2.foreach
  L3_2 = A0_2
  function L4_2(A0_3, A1_3)
    local L2_3, L3_3, L4_3
    L2_3 = table
    L2_3 = L2_3.insert
    L3_3 = L1_2
    L4_3 = A1_3
    L2_3(L3_3, L4_3)
  end
  L2_2(L3_2, L4_2)
  return L1_2
end
L0_1.values = L1_1
L0_1 = table
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = type
  L2_2 = A0_2
  L1_2 = L1_2(L2_2)
  if L1_2 ~= "table" then
    L1_2 = print
    L2_2 = A0_2
    L1_2(L2_2)
  else
    L1_2 = table
    L1_2 = L1_2.keys
    L2_2 = A0_2
    L1_2 = L1_2(L2_2)
    L2_2 = table
    L2_2 = L2_2.getn
    L3_2 = L1_2
    L2_2 = L2_2(L3_2)
    if L2_2 == 0 then
      L2_2 = print
      L3_2 = "<empty table>"
      L2_2(L3_2)
    else
      L2_2 = table
      L2_2 = L2_2.sort
      L3_2 = L1_2
      L2_2(L3_2)
      L2_2 = table
      L2_2 = L2_2.foreachi
      L3_2 = L1_2
      function L4_2(A0_3, A1_3)
        local L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
        L2_3 = A0_2
        L2_3 = L2_3[A1_3]
        L3_3 = type
        L4_3 = A1_3
        L3_3 = L3_3(L4_3)
        if L3_3 == "string" then
          L3_3 = print
          L4_3 = A1_3
          L5_3 = ":\t"
          L6_3 = tostring
          L7_3 = L2_3
          L6_3 = L6_3(L7_3)
          L4_3 = L4_3 .. L5_3 .. L6_3
          L3_3(L4_3)
        else
          L3_3 = print
          L4_3 = "["
          L5_3 = A1_3
          L6_3 = "]\t"
          L7_3 = tostring
          L8_3 = L2_3
          L7_3 = L7_3(L8_3)
          L4_3 = L4_3 .. L5_3 .. L6_3 .. L7_3
          L3_3(L4_3)
        end
      end
      L2_2(L3_2, L4_2)
    end
  end
end
L0_1.dump = L1_1
function L0_1(A0_2, ...)
  local L2_2, L3_2
  L2_2 = arg
  function L3_2(...)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L1_3 = A0_2
    L2_3 = unpack
    L3_3 = list
    L3_3 = L3_3.concat
    L4_3 = L2_2
    L5_3 = arg
    L3_3, L4_3, L5_3 = L3_3(L4_3, L5_3)
    L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3, L4_3, L5_3)
    return L1_3(L2_3, L3_3, L4_3, L5_3)
  end
  return L3_2
end
bind = L0_1
function L0_1(...)
  local L1_2
  return arg
end
pack = L0_1
L0_1 = {}
class = L0_1
L0_1 = class
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  if not A1_2 then
    L2_2 = {}
    A1_2 = L2_2
  end
  L2_2 = setmetatable
  L3_2 = A1_2
  L4_2 = A0_2
  L2_2(L3_2, L4_2)
  A0_2.__index = A0_2
  return A1_2
end
L0_1.new = L1_1
L0_1 = {}
L1_1 = {}
L0_1._init = L1_1
Object = L0_1
L0_1 = setmetatable
L1_1 = Object
L2_1 = Object
L0_1(L1_1, L2_1)
L0_1 = Object
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = table
  L2_2 = L2_2.merge
  L3_2 = A0_2
  L4_2 = table
  L4_2 = L4_2.permute
  L5_2 = A0_2._init
  L6_2 = A1_2 or L6_2
  if not A1_2 then
    L6_2 = {}
  end
  L4_2, L5_2, L6_2 = L4_2(L5_2, L6_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L3_2 = setmetatable
  L4_2 = L2_2
  L5_2 = L2_2
  return L3_2(L4_2, L5_2)
end
L0_1._clone = L1_1
L0_1 = Object
function L1_1(...)
  local L1_2, L2_2, L3_2
  L1_2 = arg[1]
  L1_2 = L1_2._clone
  L2_2 = unpack
  L3_2 = arg
  L2_2, L3_2 = L2_2(L3_2)
  return L1_2(L2_2, L3_2)
end
L0_1.__call = L1_1
