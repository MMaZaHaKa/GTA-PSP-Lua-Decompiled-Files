local L0_1, L1_1, L2_1
L0_1 = Script
L1_1 = {}
L2_1 = {}
L1_1.strings = L2_1
L1_1.y = 4
L1_1.lineheight = 15
L0_1 = L0_1(L1_1)
Commentary = L0_1
L0_1 = Commentary
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = table
  L2_2 = L2_2.getn
  L3_2 = A0_2.strings
  L2_2 = L2_2(L3_2)
  if 2 < L2_2 then
    L2_2 = A0_2.strings
    L2_2 = L2_2[1]
    L2_2 = L2_2.text
    L3_2 = L2_2
    L2_2 = L2_2.Remove
    L2_2(L3_2)
    L2_2 = table
    L2_2 = L2_2.remove
    L3_2 = A0_2.strings
    L4_2 = 1
    L2_2(L3_2, L4_2)
    L2_2 = 4
    L3_2 = ipairs
    L4_2 = A0_2.strings
    L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
    for L5_2, L6_2 in L3_2, L4_2 do
      L7_2 = L6_2.text
      L8_2 = L7_2
      L7_2 = L7_2.Pos
      L9_2 = 4
      L10_2 = L2_2
      L7_2(L8_2, L9_2, L10_2)
      L7_2 = A0_2.lineheight
      L2_2 = L2_2 + L7_2
    end
    L3_2 = A0_2.y
    L4_2 = A0_2.lineheight
    L3_2 = L3_2 - L4_2
    A0_2.y = L3_2
  end
  L2_2 = table
  L2_2 = L2_2.insert
  L3_2 = A0_2.strings
  L4_2 = {}
  L5_2 = AddText
  L6_2 = {}
  L7_2 = Player
  L7_2 = L7_2()
  L6_2.player = L7_2
  L6_2.text = A1_2
  L6_2.x = 4
  L7_2 = A0_2.y
  L6_2.y = L7_2
  L6_2.style = 1
  L6_2.scale = 0.8878
  L5_2 = L5_2(L6_2)
  L4_2.text = L5_2
  L5_2 = WaitFunc
  L6_2 = 7500
  L5_2 = L5_2(L6_2)
  L4_2.waiter = L5_2
  L2_2(L3_2, L4_2)
  L2_2 = A0_2.strings
  L3_2 = table
  L3_2 = L3_2.getn
  L4_2 = A0_2.strings
  L3_2 = L3_2(L4_2)
  L2_2 = L2_2[L3_2]
  L2_2 = L2_2.text
  L3_2 = L2_2
  L2_2 = L2_2.Flash
  L4_2 = 30
  L2_2(L3_2, L4_2)
  L2_2 = A0_2.y
  L3_2 = A0_2.lineheight
  L2_2 = L2_2 + L3_2
  A0_2.y = L2_2
  L2_2 = ShowingCommentary
  L3_2 = true
  L2_2(L3_2)
end
L0_1.Print = L1_1
L0_1 = Commentary
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  while 1 do
    goto lbl_6
    repeat
      L1_2 = Wait
      L2_2 = 100
      L1_2(L2_2)
      ::lbl_6::
      L1_2 = A0_2.strings
      L1_2 = L1_2[1]
    until L1_2
    L1_2 = Wait
    L2_2 = A0_2.strings
    L2_2 = L2_2[1]
    L2_2 = L2_2.waiter
    L1_2(L2_2)
    L1_2 = 0
    goto lbl_39
    repeat
      L2_2 = Wait
      L2_2 = L2_2()
      L1_2 = L1_2 + L2_2
      L2_2 = A0_2.lineheight
      if L1_2 > L2_2 then
        L1_2 = A0_2.lineheight
      end
      L2_2 = 4 - L1_2
      L3_2 = ipairs
      L4_2 = A0_2.strings
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L5_2, L6_2 in L3_2, L4_2 do
        L7_2 = L6_2.text
        L8_2 = L7_2
        L7_2 = L7_2.Pos
        L9_2 = 4
        L10_2 = L2_2
        L7_2(L8_2, L9_2, L10_2)
        L7_2 = A0_2.lineheight
        L2_2 = L2_2 + L7_2
      end
      A0_2.y = L2_2
      ::lbl_39::
      L2_2 = A0_2.lineheight
    until not (L1_2 < L2_2)
    L2_2 = A0_2.strings
    L2_2 = L2_2[1]
    L2_2 = L2_2.text
    L3_2 = L2_2
    L2_2 = L2_2.Remove
    L2_2(L3_2)
    L2_2 = table
    L2_2 = L2_2.remove
    L3_2 = A0_2.strings
    L4_2 = 1
    L2_2(L3_2, L4_2)
    L2_2 = table
    L2_2 = L2_2.getn
    L3_2 = A0_2.strings
    L2_2 = L2_2(L3_2)
    if L2_2 == 0 then
      L2_2 = ShowingCommentary
      L3_2 = false
      L2_2(L3_2)
    end
  end
end
L0_1.Run = L1_1
L0_1 = Commentary
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = ipairs
  L2_2 = A0_2.strings
  L1_2, L2_2, L3_2, L4_2 = L1_2(L2_2)
  for L3_2, L4_2 in L1_2, L2_2 do
    L5_2 = L4_2.text
    L6_2 = L5_2
    L5_2 = L5_2.Remove
    L5_2(L6_2)
  end
end
L0_1.CleanUp = L1_1
function L0_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L3_2 = Player
  L3_2 = L3_2()
  L4_2 = TextSprite
  L6_2 = L3_2
  L5_2 = L3_2.PlayerNum
  L5_2 = L5_2(L6_2)
  L6_2 = 240
  L7_2 = 80
  L8_2 = 1
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
  L6_2 = L4_2
  L5_2 = L4_2.Scale
  L7_2 = 1.63
  L5_2(L6_2, L7_2)
  L6_2 = L4_2
  L5_2 = L4_2.Style
  L7_2 = 2
  L5_2(L6_2, L7_2)
  L5_2 = nil
  if A0_2 == 0 then
    L7_2 = L4_2
    L6_2 = L4_2.Text
    L8_2 = "^T^MPDRAW"
    L6_2(L7_2, L8_2)
  elseif A0_2 == 1 then
    L7_2 = L4_2
    L6_2 = L4_2.Text
    L8_2 = "^T^WINNER"
    L6_2(L7_2, L8_2)
    L7_2 = L4_2
    L6_2 = L4_2.Colour
    L8_2 = GameColour
    L9_2 = 8
    L8_2, L9_2, L10_2 = L8_2(L9_2)
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = IsTeamGame
    L6_2 = L6_2()
    if L6_2 then
      L6_2 = "^S^~Y~"
      L7_2 = TeamName
      L8_2 = A2_2
      L7_2 = L7_2(L8_2)
      L8_2 = "^S^ ^T^MPTMWIN"
      L6_2 = L6_2 .. L7_2 .. L8_2
      L7_2 = AddText
      L8_2 = {}
      L8_2.x = 240
      L8_2.y = 140
      L8_2.scale = 1.09
      L8_2.align = 1
      L8_2.text = L6_2
      L9_2 = TeamColour
      L10_2 = A2_2
      L9_2 = L9_2(L10_2)
      L8_2.colour = L9_2
      L7_2 = L7_2(L8_2)
      L5_2 = L7_2
    else
      L6_2 = AddText
      L7_2 = {}
      L7_2.x = 240
      L7_2.y = 140
      L7_2.scale = 1.09
      L7_2.align = 1
      L7_2.text = "^S^~Y~^T^MPDADDY"
      L8_2 = GameColour
      L9_2 = 2
      L8_2 = L8_2(L9_2)
      L7_2.colour = L8_2
      L6_2 = L6_2(L7_2)
      L5_2 = L6_2
    end
  else
    L7_2 = L4_2
    L6_2 = L4_2.Text
    L8_2 = "^S^~y~^T^MPYL"
    L6_2(L7_2, L8_2)
    L7_2 = L4_2
    L6_2 = L4_2.Colour
    L8_2 = GameColour
    L9_2 = 9
    L8_2, L9_2, L10_2 = L8_2(L9_2)
    L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = IsTeamGame
    L6_2 = L6_2()
    if L6_2 then
      L6_2 = "^S^~y~"
      L7_2 = TeamName
      L8_2 = A2_2
      L7_2 = L7_2(L8_2)
      L8_2 = "^S^ ^T^MPRUN"
      L6_2 = L6_2 .. L7_2 .. L8_2
      L7_2 = AddText
      L8_2 = {}
      L8_2.x = 240
      L8_2.y = 140
      L8_2.scale = 1.09
      L8_2.align = 1
      L8_2.text = L6_2
      L9_2 = TeamColour
      L10_2 = A2_2
      L9_2 = L9_2(L10_2)
      L8_2.colour = L9_2
      L7_2 = L7_2(L8_2)
      L5_2 = L7_2
    else
      L6_2 = AddText
      L7_2 = {}
      L7_2.x = 240
      L7_2.y = 140
      L7_2.scale = 1.09
      L7_2.align = 1
      L7_2.text = "^S^~y~^T^MPBITCH"
      L8_2 = GameColour
      L9_2 = 2
      L8_2 = L8_2(L9_2)
      L7_2.colour = L8_2
      L6_2 = L6_2(L7_2)
      L5_2 = L6_2
    end
  end
  L6_2 = UseSuperBrakeOnPause
  L7_2 = true
  L6_2(L7_2)
  L6_2 = 0
  while L6_2 < 200 do
    L7_2 = DisablePlayer
    L8_2 = true
    L7_2(L8_2)
    L7_2 = ClearMessages
    L7_2()
    L7_2 = collectgarbage
    L7_2()
    L7_2 = Wait
    L8_2 = 1
    L7_2(L8_2)
    L6_2 = L6_2 + 1
  end
  L8_2 = L4_2
  L7_2 = L4_2.Remove
  L7_2(L8_2)
  if L5_2 then
    L8_2 = L5_2
    L7_2 = L5_2.Remove
    L7_2(L8_2)
  end
end
DisplayFinalWinLoseMessage = L0_1
