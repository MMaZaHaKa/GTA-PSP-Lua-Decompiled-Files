local L0_1, L1_1
function L0_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = main
  L1_2 = L1_2.commentary
  L2_2 = L1_2
  L1_2 = L1_2.Print
  L3_2 = "CUTSCENE START"
  L1_2(L2_2, L3_2)
  L1_2 = Wait
  L2_2 = 100
  L1_2(L2_2)
  L1_2 = LOAD_CUTSCENE
  L2_2 = A0_2
  L1_2(L2_2)
  goto lbl_16
  repeat
    L1_2 = Wait
    L2_2 = 500
    L1_2(L2_2)
    ::lbl_16::
    L1_2 = IS_CUTSCENE_LOADED
    L1_2 = L1_2()
  until L1_2
  L1_2 = CameraFadeIn
  L2_2 = 1
  L1_2(L2_2)
  L1_2 = Wait
  L2_2 = 100
  L1_2(L2_2)
  goto lbl_30
  repeat
    L1_2 = Wait
    L2_2 = 100
    L1_2(L2_2)
    ::lbl_30::
    L1_2 = IsCameraFading
    L1_2 = L1_2()
  until not L1_2
  L1_2 = START_CUTSCENE
  L1_2()
  goto lbl_40
  repeat
    L1_2 = Wait
    L2_2 = 500
    L1_2(L2_2)
    ::lbl_40::
    L1_2 = HAS_CUTSCENE_FINISHED
    L1_2 = L1_2()
  until L1_2
  L1_2 = Wait
  L2_2 = 100
  L1_2(L2_2)
  goto lbl_51
  repeat
    L1_2 = Wait
    L2_2 = 100
    L1_2(L2_2)
    ::lbl_51::
    L1_2 = IsCameraFading
    L1_2 = L1_2()
  until not L1_2
  L1_2 = CLEAR_CUTSCENE
  L1_2()
  L1_2 = main
  L1_2 = L1_2.commentary
  L2_2 = L1_2
  L1_2 = L1_2.Print
  L3_2 = "CUTSCENE END!"
  L1_2(L2_2, L3_2)
end
PlayCutscene = L0_1
