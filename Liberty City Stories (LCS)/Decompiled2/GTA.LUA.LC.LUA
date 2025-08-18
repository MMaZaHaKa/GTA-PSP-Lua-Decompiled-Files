local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = require
L1_1 = "stdlib"
L0_1(L1_1)
L0_1 = Object
L1_1 = {}
L0_1 = L0_1(L1_1)
Script = L0_1
L0_1 = Script
function L1_1(A0_2, ...)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = simsch
  L2_2 = L2_2.start
  L3_2 = bind
  L4_2 = A0_2.Run
  L5_2 = A0_2
  L6_2 = unpack
  L7_2 = arg
  L6_2, L7_2 = L6_2(L7_2)
  L3_2, L4_2, L5_2, L6_2, L7_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  A0_2.thread = L2_2
  return A0_2
end
L0_1.Start = L1_1
L0_1 = Script
function L1_1(A0_2)
  local L1_2
  L1_2 = A0_2.thread
  return L1_2
end
L0_1.IsRunning = L1_1
L0_1 = Script
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.thread
  if L1_2 then
    L1_2 = simsch
    L1_2 = L1_2.stop
    L2_2 = A0_2.thread
    L1_2(L2_2)
    A0_2.thread = nil
    L2_2 = A0_2
    L1_2 = A0_2.CleanUp
    L1_2(L2_2)
  end
end
L0_1.Stop = L1_1
L0_1 = Script
L1_1 = {}
L2_1 = {}
L3_1 = "state"
L4_1 = "interval"
L2_1[1] = L3_1
L2_1[2] = L4_1
L1_1._init = L2_1
L0_1 = L0_1(L1_1)
StateMachine = L0_1
L0_1 = StateMachine
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  goto lbl_22
  repeat
    L1_2 = Wait
    L2_2 = A0_2.interval
    L1_2(L2_2)
    L1_2 = A0_2.state
    L1_2 = A0_2[L1_2]
    if not L1_2 then
      L2_2 = print
      L3_2 = "missing state handler: "
      L4_2 = A0_2.state
      L3_2 = L3_2 .. L4_2
      L2_2(L3_2)
    else
      L2_2 = L1_2
      L3_2 = A0_2
      L2_2 = L2_2(L3_2)
      if not L2_2 then
        L2_2 = A0_2.state
      end
      A0_2.state = L2_2
    end
    ::lbl_22::
    L1_2 = A0_2.finished
  until L1_2
  L2_2 = A0_2
  L1_2 = A0_2.CleanUp
  L1_2(L2_2)
end
L0_1.Run = L1_1
L0_1 = Object
L1_1 = {}
L0_1 = L0_1(L1_1)
AddText = L0_1
L0_1 = AddText
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L3_2 = A0_2
  L2_2 = A0_2._clone
  L4_2 = A1_2
  return L2_2(L3_2, L4_2)
end
L0_1.With = L1_1
L0_1 = AddText
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = table
  L2_2 = L2_2.merge
  L3_2 = A0_2
  L4_2 = A1_2
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = TextSprite
  L4_2 = L2_2.player
  if not L4_2 then
    L4_2 = Player
    L4_2 = L4_2()
  end
  L5_2 = L2_2.x
  L6_2 = L2_2.y
  L7_2 = L2_2.align
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L4_2 = L2_2.scale
  if L4_2 then
    L5_2 = L3_2
    L4_2 = L3_2.Scale
    L6_2 = L2_2.scale
    L4_2(L5_2, L6_2)
  end
  L4_2 = L2_2.style
  if L4_2 then
    L5_2 = L3_2
    L4_2 = L3_2.Style
    L6_2 = L2_2.style
    L4_2(L5_2, L6_2)
  end
  L4_2 = L2_2.text
  if L4_2 then
    L5_2 = L3_2
    L4_2 = L3_2.Text
    L6_2 = L2_2.text
    L4_2(L5_2, L6_2)
  end
  L4_2 = L2_2.colour
  if L4_2 then
    L5_2 = L3_2
    L4_2 = L3_2.Colour
    L6_2 = L2_2.colour
    L4_2(L5_2, L6_2)
  end
  L4_2 = L2_2.wrapX
  if L4_2 then
    L5_2 = L3_2
    L4_2 = L3_2.WrapX
    L6_2 = L2_2.wrapX
    L4_2(L5_2, L6_2)
  end
  return L3_2
end
L0_1.__call = L1_1
L0_1 = Script
L1_1 = {}
L2_1 = {}
L3_1 = "obj"
L4_1 = "time"
L2_1[1] = L3_1
L2_1[2] = L4_1
L1_1._init = L2_1
L1_1.time = 5000
L0_1 = L0_1(L1_1)
TimedRemove = L0_1
L0_1 = TimedRemove
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = Wait
  L2_2 = A0_2.time
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.CleanUp
  L1_2(L2_2)
end
L0_1.Run = L1_1
L0_1 = TimedRemove
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.obj
  L2_2 = L1_2
  L1_2 = L1_2.Remove
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = A0_2
  L2_2 = Wait
  function L3_2()
    local L0_3, L1_3
    L0_3 = HasModelLoaded
    L1_3 = L1_2
    return L0_3(L1_3)
  end
  L2_2(L3_2)
end
WaitModel = L0_1
function L0_1(A0_2)
  local L1_2, L2_2
  L1_2 = RequestModel
  L2_2 = A0_2
  L1_2(L2_2)
  L1_2 = WaitModel
  L2_2 = A0_2
  L1_2(L2_2)
end
LoadModel = L0_1
function L0_1(...)
  local L1_2, L2_2, L3_2
  goto lbl_5
  repeat
    L1_2 = Wait
    L2_2 = 100
    L1_2(L2_2)
    ::lbl_5::
    L1_2 = LocatePlayerInCar
    L2_2 = unpack
    L3_2 = arg
    L2_2, L3_2 = L2_2(L3_2)
    L1_2 = L1_2(L2_2, L3_2)
  until L1_2
end
WaitLocatePlayerInCar = L0_1
