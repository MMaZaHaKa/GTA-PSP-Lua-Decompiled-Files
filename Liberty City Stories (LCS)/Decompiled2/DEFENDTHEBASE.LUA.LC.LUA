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
L1_1 = "Pickups"
L0_1(L1_1)
L0_1 = require
L1_1 = "PowerUps"
L0_1(L1_1)
L0_1 = require
L1_1 = "CutscenePlayer"
L0_1(L1_1)
L0_1 = StateMachine
L1_1 = {}
L2_1 = "StateInit"
L1_1[1] = L2_1
L0_1 = L0_1(L1_1)
DTB = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
MessageDisplay = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
ServerLogic = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
KickOutOfCar = L0_1
L0_1 = PowerupTimer
L0_1 = L0_1()
PowerUpTimer = L0_1
L0_1 = 16777215
DTBEVENTMASK_NONE = L0_1
L0_1 = 14680064
DTBEVENTMASK_TYPE = L0_1
L0_1 = 1966080
DTBEVENTMASK_PARAM1 = L0_1
L0_1 = 131008
DTBEVENTMASK_PARAM2 = L0_1
L0_1 = 127
DTBEVENTMASK_PARAM3 = L0_1
L0_1 = 21
DTBEVENTSHIFT_TYPE = L0_1
L0_1 = 17
DTBEVENTSHIFT_PARAM1 = L0_1
L0_1 = 7
DTBEVENTSHIFT_PARAM2 = L0_1
L0_1 = 0
DTBEVENTSHIFT_PARAM3 = L0_1
L0_1 = 1
MSG_END_GAME = L0_1
L0_1 = 2
MSG_TIMEUPDATE = L0_1
L0_1 = 3
MSG_CAR_LOST = L0_1
L0_1 = 4
MSG_NUM_CARS = L0_1
L0_1 = 5
MSG_SWAP_TEAM = L0_1
L0_1 = 140
LIMO_MODEL_INDEX = L0_1
L0_1 = 132
IDAHO_MODEL_INDEX = L0_1
L0_1 = 133
STINGER_MODEL_INDEX = L0_1
L0_1 = 144
PONY_MODEL_INDEX = L0_1
L0_1 = 187
ESPIRIT_MODEL_INDEX = L0_1
L0_1 = 20000
SHORCUT_VEHICLE_RESPAWN_TIME = L0_1
L0_1 = 0
teamId1 = L0_1
L0_1 = 1
teamId2 = L0_1
L0_1 = 0
team1RadarColour = L0_1
L0_1 = 2
team2RadarColour = L0_1
L0_1 = {}
L1_1 = 0
L2_1 = 2
L0_1[1] = L1_1
L0_1[2] = L2_1
radarColours = L0_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = DbgPrintAllOptions
  L1_2()
  L1_2 = AllPlayers
  L1_2 = L1_2()
  L2_2 = table
  L2_2 = L2_2.getn
  L3_2 = L1_2
  L2_2 = L2_2(L3_2)
  L3_2 = 0
  goto lbl_32
  repeat
    L4_2 = print
    L5_2 = "DTB is sat on its ass waiting for "
    L6_2 = GetExpectedNumberOfPlayers
    L6_2 = L6_2()
    L7_2 = " players, at the minute is has "
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
    ::lbl_32::
    L4_2 = GetExpectedNumberOfPlayers
    L4_2 = L4_2()
  until L2_2 == L4_2 or not (L3_2 < 20)
  L4_2 = GenerateAmbients
  L5_2 = false
  L4_2(L5_2)
  L4_2 = PickupMgr
  L4_2 = L4_2()
  A0_2.mypickups = L4_2
  L4_2 = A0_2.mypickups
  L5_2 = L4_2
  L4_2 = L4_2.CreatePickups
  L4_2(L5_2)
  L5_2 = A0_2
  L4_2 = A0_2.InitGame
  L4_2(L5_2)
  L4_2 = {}
  A0_2.scores = L4_2
  L4_2 = {}
  A0_2.teamscores = L4_2
  L4_2 = A0_2.teamscores
  L4_2[1] = 0
  L4_2 = A0_2.teamscores
  L4_2[2] = 0
  L4_2 = UseSuperBrakeOnPause
  L5_2 = false
  L4_2(L5_2)
  L4_2 = false
  A0_2.gameUnderway = L4_2
  L4_2 = TeamGameEveryoneIn
  L4_2()
  L4_2 = "StateRunning"
  return L4_2
end
L0_1.StateInit = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "DTB Cleanup"
  L1_2(L2_2)
  L1_2 = true
  A0_2.removeSplashTextNow = L1_2
  L1_2 = Wait
  L2_2 = 20
  L1_2(L2_2)
  L1_2 = A0_2.DefenceTimer
  if L1_2 ~= nil then
    L1_2 = A0_2.DefenceTimer
    L2_2 = L1_2
    L1_2 = L1_2.Remove
    L1_2(L2_2)
    A0_2.DefenceTimer = nil
  end
  L1_2 = A0_2.carsLeftText
  if L1_2 ~= nil then
    L1_2 = A0_2.carsLeftText
    L2_2 = L1_2
    L1_2 = L1_2.Remove
    L1_2(L2_2)
    A0_2.carsLeftText = nil
  end
  L1_2 = collectgarbage
  L1_2()
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.ServerLogic
    L2_2 = L1_2
    L1_2 = L1_2.Stop
    L1_2(L2_2)
  end
  L1_2 = RenderHudExtras
  L2_2 = false
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = {}
  A0_2.CarDealerships = L1_2
  L1_2 = {}
  A0_2.DefenceStartPoints = L1_2
  L1_2 = {}
  A0_2.DefenceSpawnPoints = L1_2
  L1_2 = {}
  A0_2.AttackSpawnPoints = L1_2
  L1_2 = GameLocation
  L1_2 = L1_2()
  if L1_2 == 0 then
    L1_2 = {}
    L2_2 = {}
    L3_2 = {}
    L4_2 = 1217.5568
    L5_2 = -133.5395
    L6_2 = 14.4686
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L4_2 = 301.1606
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L3_2 = {}
    L4_2 = {}
    L5_2 = 1237.8014
    L6_2 = -128.9969
    L7_2 = 13.9326
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L5_2 = 71.6178
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L4_2 = {}
    L5_2 = {}
    L6_2 = 1223.91
    L7_2 = -95.0671
    L8_2 = 12.5592
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L6_2 = 169.2657
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L5_2 = {}
    L6_2 = {}
    L7_2 = 1237.8071
    L8_2 = -90.7601
    L9_2 = 12.128
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 4.3658
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    L1_2[3] = L4_2
    L1_2[4] = L5_2
    A0_2.CarDealerships = L1_2
    L1_2 = {}
    L2_2 = {}
    L3_2 = {}
    L4_2 = 1245.5764
    L5_2 = -119.3942
    L6_2 = 13.9326
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L4_2 = 49.8267
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L3_2 = {}
    L4_2 = {}
    L5_2 = 1215.7571
    L6_2 = -118.3896
    L7_2 = 13.9326
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L5_2 = 359.5657
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L4_2 = {}
    L5_2 = {}
    L6_2 = 1216.8038
    L7_2 = -65.0373
    L8_2 = 9.5535
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L6_2 = 177.6218
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L5_2 = {}
    L6_2 = {}
    L7_2 = 1238.3368
    L8_2 = -72.7951
    L9_2 = 10.3317
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 141.8636
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = {}
    L7_2 = {}
    L8_2 = 1243.1484
    L9_2 = -85.036
    L10_2 = 12.6
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = 178.4465
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = {}
    L8_2 = {}
    L9_2 = 1214.1349
    L10_2 = -90.6364
    L11_2 = 13.1644
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = 47.1516
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = 1227.0343
    L11_2 = -112.0405
    L12_2 = 14.9456
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L10_2 = 221.1017
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = {}
    L10_2 = {}
    L11_2 = 1208.2361
    L12_2 = -102.8584
    L13_2 = 14.3751
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L11_2 = 32.3911
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
    A0_2.DefenceStartPoints = L1_2
    L1_2 = {}
    L2_2 = {}
    L3_2 = {}
    L4_2 = 1141.7538
    L5_2 = 39.4818
    L6_2 = -1.5354
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L4_2 = 206.0494
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L3_2 = {}
    L4_2 = {}
    L5_2 = 1142.1028
    L6_2 = -92.71
    L7_2 = 6.4345
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L5_2 = 309.8683
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L4_2 = {}
    L5_2 = {}
    L6_2 = 1104.2711
    L7_2 = -108.6361
    L8_2 = 8.334
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L6_2 = 235.2965
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L5_2 = {}
    L6_2 = {}
    L7_2 = 1340.1337
    L8_2 = -29.3839
    L9_2 = 13.6599
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 80.7714
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = {}
    L7_2 = {}
    L8_2 = 1313.1125
    L9_2 = -77.7719
    L10_2 = 16.2475
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = 178.4465
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = {}
    L8_2 = {}
    L9_2 = 1243.0214
    L10_2 = -28.7687
    L11_2 = 8.9407
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = 47.1516
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = 1174.9203
    L11_2 = -68.5446
    L12_2 = 7.4735
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L10_2 = 221.1017
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = {}
    L10_2 = {}
    L11_2 = 1224.4297
    L12_2 = -159.0303
    L13_2 = 18.2364
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L11_2 = 32.3911
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
    A0_2.DefenceSpawnPoints = L1_2
    L1_2 = {}
    L2_2 = {}
    L3_2 = {}
    L4_2 = 1391.676
    L5_2 = -847.2103
    L6_2 = 10.7845
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L4_2 = 42.1146
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L3_2 = {}
    L4_2 = {}
    L5_2 = 1376.3102
    L6_2 = -805.4339
    L7_2 = 14.0399
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L5_2 = 179.8184
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L4_2 = {}
    L5_2 = {}
    L6_2 = 1375.8094
    L7_2 = -873.0764
    L8_2 = 10.7834
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L5_2[3] = L8_2
    L6_2 = 347.9834
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L5_2 = {}
    L6_2 = {}
    L7_2 = 1405.591
    L8_2 = -882.0255
    L9_2 = 10.7845
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 48.5241
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = {}
    L7_2 = {}
    L8_2 = 1363.277
    L9_2 = -911.0784
    L10_2 = 11.868
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = 208.3221
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = {}
    L8_2 = {}
    L9_2 = 1417.5526
    L10_2 = -825.066
    L11_2 = 11.8318
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = 300.7518
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = 1420.734
    L11_2 = -788.6942
    L12_2 = 11.8318
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L10_2 = 77.0367
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = {}
    L10_2 = {}
    L11_2 = 1375.7164
    L12_2 = -782.0865
    L13_2 = 12.7189
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L11_2 = 84.839
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
    A0_2.AttackSpawnPoints = L1_2
    L1_2 = {}
    L2_2 = {}
    L3_2 = {}
    L4_2 = 1399.002
    L5_2 = -873.7015
    L6_2 = 10.7845
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L3_2[3] = L6_2
    L4_2 = 44.7779
    L2_2[1] = L3_2
    L2_2[2] = L4_2
    L3_2 = {}
    L4_2 = {}
    L5_2 = 1365.1599
    L6_2 = -882.6797
    L7_2 = 10.7834
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L5_2 = 268.7727
    L3_2[1] = L4_2
    L3_2[2] = L5_2
    L1_2[1] = L2_2
    L1_2[2] = L3_2
    A0_2.ShortcutVehiclePoints = L1_2
  else
    L1_2 = GameLocation
    L1_2 = L1_2()
    if L1_2 == 1 then
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = 325.7793
      L5_2 = -518.8485
      L6_2 = 33.8775
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 180.2599
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = 285.2568
      L6_2 = -534.7565
      L7_2 = 35.9085
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 270.0513
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = 327.5192
      L7_2 = -539.9002
      L8_2 = 29.0719
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 135.1706
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = 273.0788
      L8_2 = -543.1061
      L9_2 = 26.169
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 80.8164
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      L1_2[3] = L4_2
      L1_2[4] = L5_2
      A0_2.CarDealerships = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = 277.4468
      L5_2 = -508.5923
      L6_2 = 35.2345
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 176.7698
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = 280.0491
      L6_2 = -586.2841
      L7_2 = 35.2345
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 327.2523
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = 284.0731
      L7_2 = -499.2168
      L8_2 = 35.2345
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 168.0796
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = 283.0218
      L8_2 = -592.6252
      L9_2 = 35.234
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 168.0796
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = 291.3426
      L9_2 = -604.3596
      L10_2 = 36.2789
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 227.8495
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = 274.2108
      L10_2 = -603.1376
      L11_2 = 38.1291
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 238.6174
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = 298.0117
      L11_2 = -487.9803
      L12_2 = 36.2789
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 278.6122
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = 299.5236
      L12_2 = -529.2238
      L13_2 = 36.2789
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 187.481
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
      A0_2.DefenceStartPoints = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = 282.7471
      L5_2 = -604.0484
      L6_2 = 36.2789
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 30.1763
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = 277.7019
      L6_2 = -486.0439
      L7_2 = 36.2789
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 179.487
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = 296.8509
      L7_2 = -513.5869
      L8_2 = 36.2789
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 345.2699
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = 296.8509
      L8_2 = -578.2233
      L9_2 = 36.2789
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 275.487
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = 291.3426
      L9_2 = -604.3596
      L10_2 = 36.2789
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 227.8495
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = 274.2108
      L10_2 = -603.1376
      L11_2 = 38.1291
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 238.6174
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = 298.0117
      L11_2 = -487.9803
      L12_2 = 36.2789
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 278.6122
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = 299.5236
      L12_2 = -529.2238
      L13_2 = 36.2789
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 187.481
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
      A0_2.DefenceSpawnPoints = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = 0.1554
      L5_2 = -1099.8416
      L6_2 = 26.0555
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 58.9067
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -14.6201
      L6_2 = -1092.5254
      L7_2 = 26.0555
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 58.9067
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = -40.271
      L7_2 = -1079.4066
      L8_2 = 26.0555
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L5_2[3] = L8_2
      L6_2 = 62.6046
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L5_2 = {}
      L6_2 = {}
      L7_2 = -58.9729
      L8_2 = -1057.5215
      L9_2 = 25.1252
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 94.4561
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = -84.7132
      L9_2 = -1115.6617
      L10_2 = 25.0627
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 190.758
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = -71.9921
      L10_2 = -1129.8163
      L11_2 = 25.1292
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 316.9256
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = -64.1664
      L11_2 = -1114.823
      L12_2 = 25.1484
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 74.8882
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = -74.1739
      L12_2 = -1154.3387
      L13_2 = 25.1252
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 318.0018
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
      A0_2.AttackSpawnPoints = L1_2
      L1_2 = {}
      L2_2 = {}
      L3_2 = {}
      L4_2 = -55.9539
      L5_2 = -1045.9575
      L6_2 = 25.1281
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L3_2[3] = L6_2
      L4_2 = 68.3198
      L2_2[1] = L3_2
      L2_2[2] = L4_2
      L3_2 = {}
      L4_2 = {}
      L5_2 = -55.5054
      L6_2 = -1043.2014
      L7_2 = 25.1281
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L5_2 = 74.7312
      L3_2[1] = L4_2
      L3_2[2] = L5_2
      L1_2[1] = L2_2
      L1_2[2] = L3_2
      A0_2.ShortcutVehiclePoints = L1_2
    else
      L1_2 = GameLocation
      L1_2 = L1_2()
      L2_2 = 2
      if L1_2 == L2_2 then
        L1_2 = {}
        L2_2 = {}
        L3_2 = {}
        L4_2 = -423.7345
        L5_2 = 292.942
        L6_2 = 61.9167
        L3_2[1] = L4_2
        L3_2[2] = L5_2
        L3_2[3] = L6_2
        L4_2 = 225.8497
        L2_2[1] = L3_2
        L2_2[2] = L4_2
        L3_2 = {}
        L4_2 = {}
        L5_2 = -402.5321
        L6_2 = 291.0504
        L7_2 = 61.9155
        L4_2[1] = L5_2
        L4_2[2] = L6_2
        L4_2[3] = L7_2
        L5_2 = 260.4368
        L3_2[1] = L4_2
        L3_2[2] = L5_2
        L4_2 = {}
        L5_2 = {}
        L6_2 = -365.3934
        L7_2 = 286.3329
        L8_2 = 61.6689
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L5_2[3] = L8_2
        L6_2 = 155.9908
        L4_2[1] = L5_2
        L4_2[2] = L6_2
        L5_2 = {}
        L6_2 = {}
        L7_2 = -336.6916
        L8_2 = 318.5909
        L9_2 = 60.1936
        L6_2[1] = L7_2
        L6_2[2] = L8_2
        L6_2[3] = L9_2
        L7_2 = 285.8416
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L1_2[1] = L2_2
        L1_2[2] = L3_2
        L1_2[3] = L4_2
        L1_2[4] = L5_2
        A0_2.CarDealerships = L1_2
        L1_2 = {}
        L2_2 = {}
        L3_2 = {}
        L4_2 = -413.0652
        L5_2 = 283.408
        L6_2 = 61.8324
        L3_2[1] = L4_2
        L3_2[2] = L5_2
        L3_2[3] = L6_2
        L4_2 = 267.8581
        L2_2[1] = L3_2
        L2_2[2] = L4_2
        L3_2 = {}
        L4_2 = {}
        L5_2 = -381.3149
        L6_2 = 298.5753
        L7_2 = 62.8834
        L4_2[1] = L5_2
        L4_2[2] = L6_2
        L4_2[3] = L7_2
        L5_2 = 202.5833
        L3_2[1] = L4_2
        L3_2[2] = L5_2
        L4_2 = {}
        L5_2 = {}
        L6_2 = -360.3683
        L7_2 = 284.0265
        L8_2 = 61.2464
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L5_2[3] = L8_2
        L6_2 = 114.312
        L4_2[1] = L5_2
        L4_2[2] = L6_2
        L5_2 = {}
        L6_2 = {}
        L7_2 = -347.4209
        L8_2 = 319.1649
        L9_2 = 61.9605
        L6_2[1] = L7_2
        L6_2[2] = L8_2
        L6_2[3] = L9_2
        L7_2 = 176.4641
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L6_2 = {}
        L7_2 = {}
        L8_2 = -425.4589
        L9_2 = 264.1003
        L10_2 = 62.9502
        L7_2[1] = L8_2
        L7_2[2] = L9_2
        L7_2[3] = L10_2
        L8_2 = 279.6114
        L6_2[1] = L7_2
        L6_2[2] = L8_2
        L7_2 = {}
        L8_2 = {}
        L9_2 = -398.7724
        L10_2 = 262.6876
        L11_2 = 62.8707
        L8_2[1] = L9_2
        L8_2[2] = L10_2
        L8_2[3] = L11_2
        L9_2 = 286.5561
        L7_2[1] = L8_2
        L7_2[2] = L9_2
        L8_2 = {}
        L9_2 = {}
        L10_2 = -335.1845
        L11_2 = 297.4939
        L12_2 = 62.9629
        L9_2[1] = L10_2
        L9_2[2] = L11_2
        L9_2[3] = L12_2
        L10_2 = 151.4842
        L8_2[1] = L9_2
        L8_2[2] = L10_2
        L9_2 = {}
        L10_2 = {}
        L11_2 = -333.1377
        L12_2 = 320.2585
        L13_2 = 61.0138
        L10_2[1] = L11_2
        L10_2[2] = L12_2
        L10_2[3] = L13_2
        L11_2 = 93.0748
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
        A0_2.DefenceStartPoints = L1_2
        L1_2 = {}
        L2_2 = {}
        L3_2 = {}
        L4_2 = -290.5696
        L5_2 = 275.6305
        L6_2 = 65.9665
        L3_2[1] = L4_2
        L3_2[2] = L5_2
        L3_2[3] = L6_2
        L4_2 = 93.0181
        L2_2[1] = L3_2
        L2_2[2] = L4_2
        L3_2 = {}
        L4_2 = {}
        L5_2 = -327.5276
        L6_2 = 221.0008
        L7_2 = 57.8212
        L4_2[1] = L5_2
        L4_2[2] = L6_2
        L4_2[3] = L7_2
        L5_2 = 47.8005
        L3_2[1] = L4_2
        L3_2[2] = L5_2
        L4_2 = {}
        L5_2 = {}
        L6_2 = -456.9896
        L7_2 = 252.5688
        L8_2 = 69.0644
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L5_2[3] = L8_2
        L6_2 = 182.6544
        L4_2[1] = L5_2
        L4_2[2] = L6_2
        L5_2 = {}
        L6_2 = {}
        L7_2 = -373.826
        L8_2 = 367.0874
        L9_2 = 87.4753
        L6_2[1] = L7_2
        L6_2[2] = L8_2
        L6_2[3] = L9_2
        L7_2 = 194.7484
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L6_2 = {}
        L7_2 = {}
        L8_2 = -268.4596
        L9_2 = 371.709
        L10_2 = 78.8567
        L7_2[1] = L8_2
        L7_2[2] = L9_2
        L7_2[3] = L10_2
        L8_2 = 45.8441
        L6_2[1] = L7_2
        L6_2[2] = L8_2
        L7_2 = {}
        L8_2 = {}
        L9_2 = -290.0363
        L10_2 = 348.0956
        L11_2 = 78.8597
        L8_2[1] = L9_2
        L8_2[2] = L10_2
        L8_2[3] = L11_2
        L9_2 = 141.8824
        L7_2[1] = L8_2
        L7_2[2] = L9_2
        L8_2 = {}
        L9_2 = {}
        L10_2 = -306.4856
        L11_2 = 310.2876
        L12_2 = 72.4268
        L9_2[1] = L10_2
        L9_2[2] = L11_2
        L9_2[3] = L12_2
        L10_2 = 159.4434
        L8_2[1] = L9_2
        L8_2[2] = L10_2
        L9_2 = {}
        L10_2 = {}
        L11_2 = -362.3963
        L12_2 = 243.408
        L13_2 = 60.6311
        L10_2[1] = L11_2
        L10_2[2] = L12_2
        L10_2[3] = L13_2
        L11_2 = 40.9095
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
        A0_2.DefenceSpawnPoints = L1_2
        L1_2 = {}
        L2_2 = {}
        L3_2 = {}
        L4_2 = -1095.5054
        L5_2 = 64.3309
        L6_2 = 57.5367
        L3_2[1] = L4_2
        L3_2[2] = L5_2
        L3_2[3] = L6_2
        L4_2 = 84.0938
        L2_2[1] = L3_2
        L2_2[2] = L4_2
        L3_2 = {}
        L4_2 = {}
        L5_2 = -1120.9008
        L6_2 = 30.6547
        L7_2 = 57.6976
        L4_2[1] = L5_2
        L4_2[2] = L6_2
        L4_2[3] = L7_2
        L5_2 = 7.049
        L3_2[1] = L4_2
        L3_2[2] = L5_2
        L4_2 = {}
        L5_2 = {}
        L6_2 = -1136.0182
        L7_2 = 28.5069
        L8_2 = 57.772
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L5_2[3] = L8_2
        L6_2 = 340.8487
        L4_2[1] = L5_2
        L4_2[2] = L6_2
        L5_2 = {}
        L6_2 = {}
        L7_2 = -1135.0078
        L8_2 = 53.3453
        L9_2 = 57.7624
        L6_2[1] = L7_2
        L6_2[2] = L8_2
        L6_2[3] = L9_2
        L7_2 = 22.5951
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L6_2 = {}
        L7_2 = {}
        L8_2 = -1149.4758
        L9_2 = 59.6414
        L10_2 = 58.8562
        L7_2[1] = L8_2
        L7_2[2] = L9_2
        L7_2[3] = L10_2
        L8_2 = 79.0715
        L6_2[1] = L7_2
        L6_2[2] = L8_2
        L7_2 = {}
        L8_2 = {}
        L9_2 = -1116.8956
        L10_2 = 77.3148
        L11_2 = 56.2307
        L8_2[1] = L9_2
        L8_2[2] = L10_2
        L8_2[3] = L11_2
        L9_2 = 186.7229
        L7_2[1] = L8_2
        L7_2[2] = L9_2
        L8_2 = {}
        L9_2 = {}
        L10_2 = -1152.7574
        L11_2 = 73.4037
        L12_2 = 58.8566
        L9_2[1] = L10_2
        L9_2[2] = L11_2
        L9_2[3] = L12_2
        L10_2 = 340.4885
        L8_2[1] = L9_2
        L8_2[2] = L10_2
        L9_2 = {}
        L10_2 = {}
        L11_2 = -1154.6077
        L12_2 = 44.9693
        L13_2 = 58.8566
        L10_2[1] = L11_2
        L10_2[2] = L12_2
        L10_2[3] = L13_2
        L11_2 = 181.1303
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
        A0_2.AttackSpawnPoints = L1_2
        L1_2 = {}
        L2_2 = {}
        L3_2 = {}
        L4_2 = -1126.7122
        L5_2 = 38.2038
        L6_2 = 58.7535
        L3_2[1] = L4_2
        L3_2[2] = L5_2
        L3_2[3] = L6_2
        L4_2 = 29.4243
        L2_2[1] = L3_2
        L2_2[2] = L4_2
        L3_2 = {}
        L4_2 = {}
        L5_2 = -1138.4674
        L6_2 = 69.3489
        L7_2 = 58.8249
        L4_2[1] = L5_2
        L4_2[2] = L6_2
        L4_2[3] = L7_2
        L5_2 = 178.7971
        L3_2[1] = L4_2
        L3_2[2] = L5_2
        L1_2[1] = L2_2
        L1_2[2] = L3_2
        A0_2.ShortcutVehiclePoints = L1_2
      end
    end
  end
  L1_2 = IsTeamGame
  L2_2 = true
  L1_2(L2_2)
  L1_2 = GameElapsedMs
  L2_2 = 0
  L1_2(L2_2)
  L1_2 = DisablePlayer
  L2_2 = true
  L1_2(L2_2)
  L1_2 = DefendingTeam
  L2_2 = 1
  L1_2(L2_2)
  L1_2 = "InitialSpawn"
  L2_2 = true
  A0_2[L1_2] = L2_2
  L1_2 = "finalSyncCarsSent"
  L2_2 = false
  A0_2[L1_2] = L2_2
  L1_2 = "gameseconds"
  A0_2[L1_2] = 0
  L1_2 = "mins"
  A0_2[L1_2] = 0
  L1_2 = "seconds"
  A0_2[L1_2] = 0
  L1_2 = "winningTeam"
  A0_2[L1_2] = 1
  L1_2 = "removeSplashTextNow"
  L2_2 = false
  A0_2[L1_2] = L2_2
  L1_2 = "MissionVehicle1"
  L2_2 = nil
  A0_2[L1_2] = L2_2
  L1_2 = "MissionVehicle2"
  L2_2 = nil
  A0_2[L1_2] = L2_2
  L1_2 = "MissionVehicle3"
  L2_2 = nil
  A0_2[L1_2] = L2_2
  L1_2 = "MissionVehicle4"
  L2_2 = nil
  A0_2[L1_2] = L2_2
  L1_2 = "ShortcutVehicle1"
  L2_2 = nil
  A0_2[L1_2] = L2_2
  L1_2 = "ShortcutVehicle2"
  L2_2 = nil
  A0_2[L1_2] = L2_2
  L1_2 = "ShortcutRespawnTimer"
  A0_2[L1_2] = 0
  L1_2 = "ShortcutRespawnLastUpdate"
  L2_2 = GameElapsedMs
  L2_2 = L2_2()
  A0_2[L1_2] = L2_2
  L1_2 = "Car1Destroyed"
  L2_2 = false
  A0_2[L1_2] = L2_2
  L1_2 = "Car2Destroyed"
  L2_2 = false
  A0_2[L1_2] = L2_2
  L1_2 = "Car3Destroyed"
  L2_2 = false
  A0_2[L1_2] = L2_2
  L1_2 = "Car4Destroyed"
  L2_2 = false
  A0_2[L1_2] = L2_2
  L1_2 = "TimeToBeat"
  A0_2[L1_2] = 0
  L1_2 = "FinalRound"
  L2_2 = false
  A0_2[L1_2] = L2_2
  L1_2 = "RoundsPlayed"
  A0_2[L1_2] = 0
  L1_2 = "timeRanOut"
  L2_2 = false
  A0_2[L1_2] = L2_2
  L1_2 = "SplashTextIsOnScreen"
  L2_2 = false
  A0_2[L1_2] = L2_2
  L1_2 = "BaseBlip"
  L2_2 = nil
  A0_2[L1_2] = L2_2
  L1_2 = "VehiclesLeftThisRound"
  L2_2 = 4
  A0_2[L1_2] = L2_2
  L1_2 = "ChangeSides"
  L2_2 = true
  A0_2[L1_2] = L2_2
  L1_2 = "EndOfGame"
  L2_2 = false
  A0_2[L1_2] = L2_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = "DefenceTimer"
  L3_2 = nil
  A0_2[L2_2] = L3_2
  L2_2 = "carsLeftText"
  L3_2 = nil
  A0_2[L2_2] = L3_2
  L4_2 = "ShowHUD"
  L3_2 = A0_2
  L2_2 = A0_2[L4_2]
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = IsServer
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = UsePowerups
    L2_2 = L2_2()
    if L2_2 then
      L2_2 = PowerUpTimer
      L4_2 = "Start"
      L3_2 = L2_2
      L2_2 = L2_2[L4_2]
      L2_2(L3_2)
    end
  end
  L2_2 = Wait
  L3_2 = 1000
  L2_2(L3_2)
  L2_2 = {}
  L5_2 = "TeamId"
  L4_2 = L1_2
  L3_2 = L1_2[L5_2]
  L3_2 = L3_2(L4_2)
  L4_2 = teamId1
  if L3_2 == L4_2 then
    L3_2 = TeamPlayers
    L4_2 = teamId2
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
  else
    L3_2 = TeamPlayers
    L4_2 = teamId1
    L3_2 = L3_2(L4_2)
    L2_2 = L3_2
  end
  L3_2 = pairs
  L4_2 = L2_2
  L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
  for L5_2, L6_2 in L3_2, L4_2 do
    L9_2 = "SetRadarBlipShortRange"
    L8_2 = L6_2
    L7_2 = L6_2[L9_2]
    L9_2 = true
    L7_2(L8_2, L9_2)
  end
  L3_2 = IsServer
  L3_2 = L3_2()
  if L3_2 then
    L3_2 = "ServerLogic"
    L4_2 = ServerLogic
    L4_2 = L4_2()
    A0_2[L3_2] = L4_2
    L3_2 = "ServerLogic"
    L3_2 = A0_2[L3_2]
    L5_2 = "Start"
    L4_2 = L3_2
    L3_2 = L3_2[L5_2]
    L3_2(L4_2)
  end
end
L0_1.InitGame = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.EndOfGame
  L2_2 = false
  if L1_2 == L2_2 then
    L2_2 = A0_2
    L1_2 = A0_2.CheckChangeSides
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.CheckForRespawn
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.UpdateScores
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.UpdateLocalPlayer
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.ProcessNetworkEvents
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.CheckIfEndOfGame
    L1_2(L2_2)
    L1_2 = collectgarbage
    L1_2()
  end
end
L0_1.StateRunning = L1_1
L0_1 = ServerLogic
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2
  while 1 do
    L4_2 = main
    L4_2 = L4_2.game
    L5_2 = L4_2
    L4_2 = L4_2.UpdateMissionVehicles
    L4_2(L5_2)
    L4_2 = main
    L4_2 = L4_2.game
    L5_2 = L4_2
    L4_2 = L4_2.SwapAttackDefend
    L4_2(L5_2)
    L4_2 = main
    L4_2 = L4_2.game
    L5_2 = L4_2
    L4_2 = L4_2.UpdateShortcutVehicles
    L4_2(L5_2)
    L4_2 = main
    L4_2 = L4_2.game
    L5_2 = L4_2
    L4_2 = L4_2.UpdateTimers
    L4_2(L5_2)
    L4_2 = Wait
    L5_2 = 10
    L4_2(L5_2)
  end
end
L0_1.Run = L1_1
L0_1 = ServerLogic
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "Server Logic Cleanup"
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = A0_2.EndOfGame
  L2_2 = true
  if L1_2 == L2_2 then
    return
  end
  L1_2 = GameElapsedMs
  L1_2 = L1_2()
  L2_2 = A0_2.gameseconds
  L2_2 = L1_2 - L2_2
  if 1000 <= L2_2 then
    A0_2.gameseconds = L1_2
    L2_2 = A0_2.seconds
    L2_2 = L2_2 + 1
    A0_2.seconds = L2_2
    L2_2 = A0_2.seconds
    if L2_2 == 60 then
      A0_2.seconds = 0
      L2_2 = A0_2.mins
      L2_2 = L2_2 + 1
      A0_2.mins = L2_2
    end
    L3_2 = A0_2
    L2_2 = A0_2.DoSendEvent
    L4_2 = MSG_TIMEUPDATE
    L5_2 = 0
    L6_2 = A0_2.mins
    L7_2 = A0_2.seconds
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    L3_2 = A0_2
    L2_2 = A0_2.DoSendEvent
    L4_2 = MSG_NUM_CARS
    L5_2 = 0
    L6_2 = A0_2.VehiclesLeftThisRound
    L7_2 = 0
    L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
  end
end
L0_1.UpdateTimers = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L5_2 = print
  L6_2 = "Sending event "
  L7_2 = A1_2
  L8_2 = " "
  L9_2 = A2_2
  L10_2 = " "
  L11_2 = A3_2
  L12_2 = " "
  L13_2 = A4_2
  L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
  L5_2(L6_2)
  L5_2 = MaskEventNumber
  L6_2 = A1_2
  L7_2 = DTBEVENTMASK_NONE
  L8_2 = DTBEVENTSHIFT_TYPE
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = MaskEventNumber
  L7_2 = A2_2
  L8_2 = DTBEVENTMASK_NONE
  L9_2 = DTBEVENTSHIFT_PARAM1
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2 + L6_2
  L6_2 = MaskEventNumber
  L7_2 = A3_2
  L8_2 = DTBEVENTMASK_NONE
  L9_2 = DTBEVENTSHIFT_PARAM2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2 + L6_2
  L6_2 = MaskEventNumber
  L7_2 = A4_2
  L8_2 = DTBEVENTMASK_NONE
  L9_2 = DTBEVENTSHIFT_PARAM3
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2 + L6_2
  L6_2 = SendEvent
  L7_2 = L5_2
  L6_2(L7_2)
end
L0_1.DoSendEvent = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.IsPlaying
  L2_2 = L2_2(L3_2)
  if not L2_2 then
    L2_2 = true
    A0_2.removeSplashTextNow = L2_2
    L2_2 = Wait
    L3_2 = 20
    L2_2(L3_2)
    L2_2 = DoWasted
    L2_2()
    L3_2 = A0_2
    L2_2 = A0_2.GetPlayerRespawnPosition
    L2_2 = L2_2(L3_2)
    L4_2 = L1_2
    L3_2 = L1_2.Respawn
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.ChangeSides
    L4_2 = false
    if L3_2 == L4_2 then
      L4_2 = A0_2
      L3_2 = A0_2.DisplayAttackDefendMessage
      L3_2(L4_2)
    end
  end
end
L0_1.CheckForRespawn = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2
end
L0_1.UpdateLocalPlayer = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.MissionVehicle1
    if L1_2 ~= nil then
      L1_2 = A0_2.Car1Destroyed
      L2_2 = false
      if L1_2 == L2_2 then
        L1_2 = VehicleHealth
        L2_2 = A0_2.MissionVehicle1
        L1_2 = L1_2(L2_2)
        if L1_2 <= 0 then
          L1_2 = VehicleRemove3dMarker
          L2_2 = A0_2.MissionVehicle1
          L1_2(L2_2)
          L1_2 = A0_2.Car1Destroyed
          L2_2 = false
          if L1_2 == L2_2 then
            L1_2 = A0_2.VehiclesLeftThisRound
            L1_2 = L1_2 - 1
            A0_2.VehiclesLeftThisRound = L1_2
            L2_2 = A0_2
            L1_2 = A0_2.DoSendEvent
            L3_2 = MSG_CAR_LOST
            L4_2 = 0
            L5_2 = 0
            L6_2 = 0
            L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
            L1_2 = true
            A0_2.Car1Destroyed = L1_2
          end
        end
      end
    end
    L1_2 = A0_2.MissionVehicle2
    if L1_2 ~= nil then
      L1_2 = A0_2.Car2Destroyed
      L2_2 = false
      if L1_2 == L2_2 then
        L1_2 = VehicleHealth
        L2_2 = A0_2.MissionVehicle2
        L1_2 = L1_2(L2_2)
        if L1_2 <= 0 then
          L1_2 = VehicleRemove3dMarker
          L2_2 = A0_2.MissionVehicle2
          L1_2(L2_2)
          L1_2 = A0_2.Car2Destroyed
          L2_2 = false
          if L1_2 == L2_2 then
            L1_2 = A0_2.VehiclesLeftThisRound
            L1_2 = L1_2 - 1
            A0_2.VehiclesLeftThisRound = L1_2
            L2_2 = A0_2
            L1_2 = A0_2.DoSendEvent
            L3_2 = MSG_CAR_LOST
            L4_2 = 0
            L5_2 = 0
            L6_2 = 0
            L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
            L1_2 = true
            A0_2.Car2Destroyed = L1_2
          end
        end
      end
    end
    L1_2 = A0_2.MissionVehicle3
    if L1_2 ~= nil then
      L1_2 = A0_2.Car3Destroyed
      L2_2 = false
      if L1_2 == L2_2 then
        L1_2 = VehicleHealth
        L2_2 = A0_2.MissionVehicle3
        L1_2 = L1_2(L2_2)
        if L1_2 <= 0 then
          L1_2 = VehicleRemove3dMarker
          L2_2 = A0_2.MissionVehicle3
          L1_2(L2_2)
          L1_2 = A0_2.Car3Destroyed
          L2_2 = false
          if L1_2 == L2_2 then
            L1_2 = A0_2.VehiclesLeftThisRound
            L1_2 = L1_2 - 1
            A0_2.VehiclesLeftThisRound = L1_2
            L2_2 = A0_2
            L1_2 = A0_2.DoSendEvent
            L3_2 = MSG_CAR_LOST
            L4_2 = 0
            L5_2 = 0
            L6_2 = 0
            L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
            L1_2 = true
            A0_2.Car3Destroyed = L1_2
          end
        end
      end
    end
    L1_2 = A0_2.MissionVehicle4
    if L1_2 ~= nil then
      L1_2 = A0_2.Car4Destroyed
      L2_2 = false
      if L1_2 == L2_2 then
        L1_2 = VehicleHealth
        L2_2 = A0_2.MissionVehicle4
        L1_2 = L1_2(L2_2)
        if L1_2 <= 0 then
          L1_2 = VehicleRemove3dMarker
          L2_2 = A0_2.MissionVehicle4
          L1_2(L2_2)
          L1_2 = A0_2.Car4Destroyed
          L2_2 = false
          if L1_2 == L2_2 then
            L1_2 = A0_2.VehiclesLeftThisRound
            L1_2 = L1_2 - 1
            A0_2.VehiclesLeftThisRound = L1_2
            L2_2 = A0_2
            L1_2 = A0_2.DoSendEvent
            L3_2 = MSG_CAR_LOST
            L4_2 = 0
            L5_2 = 0
            L6_2 = 0
            L1_2(L2_2, L3_2, L4_2, L5_2, L6_2)
            L1_2 = true
            A0_2.Car4Destroyed = L1_2
          end
        end
      end
    end
  end
end
L0_1.UpdateMissionVehicles = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.EndOfGame
    L2_2 = true
    if L1_2 == L2_2 then
      return
    end
    L1_2 = nil
    L2_2 = nil
    L3_2 = GameLocation
    L3_2 = L3_2()
    if L3_2 == 0 then
      L1_2 = IDAHO_MODEL_INDEX
      L2_2 = STINGER_MODEL_INDEX
    else
      L3_2 = GameLocation
      L3_2 = L3_2()
      if L3_2 == 1 then
        L1_2 = STINGER_MODEL_INDEX
        L2_2 = ESPIRIT_MODEL_INDEX
      else
        L3_2 = GameLocation
        L3_2 = L3_2()
        if L3_2 == 2 then
          L1_2 = PONY_MODEL_INDEX
          L2_2 = ESPIRIT_MODEL_INDEX
        end
      end
    end
    L3_2 = {}
    L4_2 = A0_2.ShortcutRespawnTimer
    if L4_2 <= 0 then
      L4_2 = A0_2.ShortcutVehicle1
      if L4_2 == nil then
        L4_2 = A0_2.ShortcutVehiclePoints
        L4_2 = L4_2[1]
        L4_2 = L4_2[1]
        L4_2 = L4_2[1]
        L3_2[1] = L4_2
        L4_2 = A0_2.ShortcutVehiclePoints
        L4_2 = L4_2[1]
        L4_2 = L4_2[1]
        L4_2 = L4_2[2]
        L3_2[2] = L4_2
        L4_2 = A0_2.ShortcutVehiclePoints
        L4_2 = L4_2[1]
        L4_2 = L4_2[1]
        L4_2 = L4_2[3]
        L3_2[3] = L4_2
        L4_2 = IsSphereOnScreen
        L5_2 = L3_2
        L6_2 = 5
        L7_2 = 100
        L4_2 = L4_2(L5_2, L6_2, L7_2)
        L5_2 = false
        if L4_2 == L5_2 then
          L4_2 = CreateVehicle
          L5_2 = L1_2
          L6_2 = L3_2
          L7_2 = A0_2.ShortcutVehiclePoints
          L7_2 = L7_2[1]
          L7_2 = L7_2[2]
          L4_2 = L4_2(L5_2, L6_2, L7_2)
          A0_2.ShortcutVehicle1 = L4_2
          L4_2 = SHORCUT_VEHICLE_RESPAWN_TIME
          A0_2.ShortcutRespawnTimer = L4_2
        end
      end
      L4_2 = A0_2.ShortcutVehicle2
      if L4_2 == nil then
        L4_2 = A0_2.ShortcutVehiclePoints
        L4_2 = L4_2[2]
        L4_2 = L4_2[1]
        L4_2 = L4_2[1]
        L3_2[1] = L4_2
        L4_2 = A0_2.ShortcutVehiclePoints
        L4_2 = L4_2[2]
        L4_2 = L4_2[1]
        L4_2 = L4_2[2]
        L3_2[2] = L4_2
        L4_2 = A0_2.ShortcutVehiclePoints
        L4_2 = L4_2[2]
        L4_2 = L4_2[1]
        L4_2 = L4_2[3]
        L3_2[3] = L4_2
        L4_2 = IsSphereOnScreen
        L5_2 = L3_2
        L6_2 = 5
        L7_2 = 100
        L4_2 = L4_2(L5_2, L6_2, L7_2)
        L5_2 = false
        if L4_2 == L5_2 then
          L4_2 = CreateVehicle
          L5_2 = L2_2
          L6_2 = L3_2
          L7_2 = A0_2.ShortcutVehiclePoints
          L7_2 = L7_2[2]
          L7_2 = L7_2[2]
          L4_2 = L4_2(L5_2, L6_2, L7_2)
          A0_2.ShortcutVehicle2 = L4_2
          L4_2 = SHORCUT_VEHICLE_RESPAWN_TIME
          A0_2.ShortcutRespawnTimer = L4_2
        end
      end
    end
    L4_2 = IsVehicleWrecked
    L5_2 = A0_2.ShortcutVehicle1
    L4_2 = L4_2(L5_2)
    if L4_2 then
      A0_2.ShortcutVehicle1 = nil
    end
    L4_2 = IsVehicleWrecked
    L5_2 = A0_2.ShortcutVehicle2
    L4_2 = L4_2(L5_2)
    if L4_2 then
      A0_2.ShortcutVehicle2 = nil
    end
    L4_2 = A0_2.ShortcutVehicle1
    if L4_2 ~= nil then
      L4_2 = A0_2.ShortcutVehicle2
      if L4_2 ~= nil then
        goto lbl_132
      end
    end
    L4_2 = A0_2.ShortcutRespawnTimer
    L5_2 = GameElapsedMs
    L5_2 = L5_2()
    L6_2 = A0_2.ShortcutRespawnLastUpdate
    L5_2 = L5_2 - L6_2
    L4_2 = L4_2 - L5_2
    A0_2.ShortcutRespawnTimer = L4_2
    ::lbl_132::
    L4_2 = GameElapsedMs
    L4_2 = L4_2()
    A0_2.ShortcutRespawnLastUpdate = L4_2
  end
end
L0_1.UpdateShortcutVehicles = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = {}
    L2_2 = A0_2.CarDealerships
    L2_2 = L2_2[2]
    L2_2 = L2_2[1]
    L2_2 = L2_2[1]
    L1_2[1] = L2_2
    L2_2 = A0_2.CarDealerships
    L2_2 = L2_2[2]
    L2_2 = L2_2[1]
    L2_2 = L2_2[2]
    L1_2[2] = L2_2
    L2_2 = A0_2.CarDealerships
    L2_2 = L2_2[2]
    L2_2 = L2_2[1]
    L2_2 = L2_2[3]
    L1_2[3] = L2_2
    L2_2 = A0_2.BaseBlip
    if L2_2 == nil then
      L2_2 = AddBlipForCoord
      L3_2 = L1_2
      L4_2 = radarColours
      L5_2 = DefendingTeam
      L5_2 = L5_2()
      L4_2 = L4_2[L5_2]
      L5_2 = pickupicon
      L5_2 = L5_2.base
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      A0_2.BaseBlip = L2_2
    end
  end
end
L0_1.UpdateRadar = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = 1
    L2_2 = 0
    L3_2 = 0
    L4_2 = DefendingTeam
    L4_2 = L4_2()
    if L4_2 == 1 then
      L2_2 = 3
      L3_2 = 0
    else
      L2_2 = 7
      L3_2 = 0
    end
    L4_2 = {}
    L5_2 = A0_2.CarDealerships
    L5_2 = L5_2[L1_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[1]
    L4_2[1] = L5_2
    L5_2 = A0_2.CarDealerships
    L5_2 = L5_2[L1_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[2]
    L4_2[2] = L5_2
    L5_2 = A0_2.CarDealerships
    L5_2 = L5_2[L1_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[3]
    L4_2[3] = L5_2
    L5_2 = CreateVehicle
    L6_2 = LIMO_MODEL_INDEX
    L7_2 = L4_2
    L8_2 = A0_2.CarDealerships
    L8_2 = L8_2[L1_2]
    L8_2 = L8_2[2]
    L9_2 = L2_2
    L10_2 = L3_2
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    A0_2.MissionVehicle1 = L5_2
    L5_2 = VehicleAdd3dMarker
    L6_2 = A0_2.MissionVehicle1
    L5_2(L6_2)
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 1
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[1]
    L4_2[1] = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 1
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[2]
    L4_2[2] = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 1
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[3]
    L4_2[3] = L5_2
    L5_2 = CreateVehicle
    L6_2 = LIMO_MODEL_INDEX
    L7_2 = L4_2
    L8_2 = A0_2.CarDealerships
    L9_2 = L1_2 + 1
    L8_2 = L8_2[L9_2]
    L8_2 = L8_2[2]
    L9_2 = L2_2
    L10_2 = L3_2
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    A0_2.MissionVehicle2 = L5_2
    L5_2 = VehicleAdd3dMarker
    L6_2 = A0_2.MissionVehicle2
    L5_2(L6_2)
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 2
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[1]
    L4_2[1] = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 2
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[2]
    L4_2[2] = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 2
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[3]
    L4_2[3] = L5_2
    L5_2 = CreateVehicle
    L6_2 = LIMO_MODEL_INDEX
    L7_2 = L4_2
    L8_2 = A0_2.CarDealerships
    L9_2 = L1_2 + 2
    L8_2 = L8_2[L9_2]
    L8_2 = L8_2[2]
    L9_2 = L2_2
    L10_2 = L3_2
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    A0_2.MissionVehicle3 = L5_2
    L5_2 = VehicleAdd3dMarker
    L6_2 = A0_2.MissionVehicle3
    L5_2(L6_2)
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 3
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[1]
    L4_2[1] = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 3
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[2]
    L4_2[2] = L5_2
    L5_2 = A0_2.CarDealerships
    L6_2 = L1_2 + 3
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2[1]
    L5_2 = L5_2[3]
    L4_2[3] = L5_2
    L5_2 = CreateVehicle
    L6_2 = LIMO_MODEL_INDEX
    L7_2 = L4_2
    L8_2 = A0_2.CarDealerships
    L9_2 = L1_2 + 3
    L8_2 = L8_2[L9_2]
    L8_2 = L8_2[2]
    L9_2 = L2_2
    L10_2 = L3_2
    L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    A0_2.MissionVehicle4 = L5_2
    L5_2 = VehicleAdd3dMarker
    L6_2 = A0_2.MissionVehicle4
    L5_2(L6_2)
    L5_2 = false
    A0_2.Car1Destroyed = L5_2
    L5_2 = false
    A0_2.Car2Destroyed = L5_2
    L5_2 = false
    A0_2.Car3Destroyed = L5_2
    L5_2 = false
    A0_2.Car4Destroyed = L5_2
    L5_2 = VehicleSetCarDoorLocks
    L6_2 = A0_2.MissionVehicle1
    L7_2 = CARLOCK_LOCKED
    L5_2(L6_2, L7_2)
    L5_2 = VehicleSetCarDoorLocks
    L6_2 = A0_2.MissionVehicle2
    L7_2 = CARLOCK_LOCKED
    L5_2(L6_2, L7_2)
    L5_2 = VehicleSetCarDoorLocks
    L6_2 = A0_2.MissionVehicle3
    L7_2 = CARLOCK_LOCKED
    L5_2(L6_2, L7_2)
    L5_2 = VehicleSetCarDoorLocks
    L6_2 = A0_2.MissionVehicle4
    L7_2 = CARLOCK_LOCKED
    L5_2(L6_2, L7_2)
  end
end
L0_1.SpawnMissionVehicles = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = nil
  L3_2 = nil
  L4_2 = nil
  L5_2 = nil
  L6_2 = A0_2.RoundsPlayed
  if L6_2 == 1 then
    L7_2 = A0_2
    L6_2 = A0_2.DefenceTimeInMs
    L6_2 = L6_2(L7_2)
    L2_2 = L6_2
    L6_2 = math
    L6_2 = L6_2.floor
    L7_2 = L2_2 / 1000
    L7_2 = L7_2 / 60
    L6_2 = L6_2(L7_2)
    L3_2 = L6_2
    L6_2 = 1000 * 60
    L6_2 = L3_2 * L6_2
    L2_2 = L2_2 - L6_2
    L4_2 = L2_2 / 1000
    if 99 < L3_2 then
      L3_2 = 99
    end
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = "%d:%02d"
    L8_2 = L3_2
    L9_2 = L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2 = L6_2
  else
    L6_2 = A0_2.TimeToBeat
    L8_2 = A0_2
    L7_2 = A0_2.DefenceTimeInMs
    L7_2 = L7_2(L8_2)
    L2_2 = L6_2 - L7_2
    if L2_2 < 0 then
      L2_2 = 0
    end
    L6_2 = math
    L6_2 = L6_2.floor
    L7_2 = L2_2 / 1000
    L7_2 = L7_2 / 60
    L6_2 = L6_2(L7_2)
    L3_2 = L6_2
    L6_2 = 1000 * 60
    L6_2 = L3_2 * L6_2
    L2_2 = L2_2 - L6_2
    L4_2 = L2_2 / 1000
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = "%d:%02d"
    L8_2 = L3_2
    L9_2 = L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L5_2 = L6_2
  end
  L6_2 = A0_2.DefenceTimer
  if L6_2 ~= nil then
    L6_2 = A0_2.DefenceTimer
    L7_2 = L6_2
    L6_2 = L6_2.Text
    L8_2 = "^S^"
    L9_2 = L5_2
    L8_2 = L8_2 .. L9_2
    L6_2(L7_2, L8_2)
  end
  L6_2 = A0_2.carsLeftText
  if L6_2 ~= nil then
    L6_2 = DefendingTeam
    L6_2 = L6_2()
    if L6_2 == 1 then
      L6_2 = A0_2.carsLeftText
      L7_2 = L6_2
      L6_2 = L6_2.Colour
      L8_2 = GameColour
      L9_2 = teamId1
      L8_2, L9_2 = L8_2(L9_2)
      L6_2(L7_2, L8_2, L9_2)
    else
      L6_2 = A0_2.carsLeftText
      L7_2 = L6_2
      L6_2 = L6_2.Colour
      L8_2 = GameColour
      L9_2 = teamId2
      L8_2, L9_2 = L8_2(L9_2)
      L6_2(L7_2, L8_2, L9_2)
    end
    L6_2 = A0_2.carsLeftText
    L7_2 = L6_2
    L6_2 = L6_2.Text
    L8_2 = "^S^"
    L9_2 = A0_2.VehiclesLeftThisRound
    L8_2 = L8_2 .. L9_2
    L6_2(L7_2, L8_2)
  end
end
L0_1.DisplayDefenceTimer = L1_1
L0_1 = DTB
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
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = 0
  L2_2 = GameElapsedMs
  L2_2 = L2_2()
  L3_2 = A0_2.TimeToBeat
  if L2_2 > L3_2 then
    L2_2 = DefendingTeam
    L2_2 = L2_2()
    L1_2 = L2_2
  else
    L2_2 = GameElapsedMs
    L2_2 = L2_2()
    L3_2 = A0_2.TimeToBeat
    if L2_2 == L3_2 then
      L1_2 = 0
    else
      L2_2 = DefendingTeam
      L2_2 = L2_2()
      if L2_2 == 1 then
        L1_2 = 2
      else
        L1_2 = 1
      end
    end
  end
  if L1_2 == 0 then
    L2_2 = print
    L3_2 = "Draw"
    L2_2(L3_2)
  elseif L1_2 == 1 then
    L2_2 = print
    L3_2 = "Blue Team Wins"
    L2_2(L3_2)
  else
    L2_2 = print
    L3_2 = "Red Team Wins"
    L2_2(L3_2)
  end
  return L1_2
end
L0_1.GetTheWiningTeam = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = A0_2.EndOfGame
  L2_2 = true
  if L1_2 == L2_2 then
    L1_2 = print
    L2_2 = "End Of Game Reached"
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.DisplayDefenceTimer
    L1_2(L2_2)
    L1_2 = collectgarbage
    L1_2()
    L1_2 = UpdateGameTime
    L2_2 = false
    L1_2(L2_2)
    L1_2 = DisablePlayer
    L2_2 = true
    L1_2(L2_2)
    L1_2 = main
    L1_2 = L1_2.game
    L1_2.state = "StateGameWon"
    L1_2 = true
    A0_2.removeSplashTextNow = L1_2
    L1_2 = Wait
    L2_2 = 20
    L1_2(L2_2)
    L1_2 = A0_2.winningTeam
    L2_2 = Player
    L2_2 = L2_2()
    L3_2 = nil
    L5_2 = L2_2
    L4_2 = L2_2.TeamId
    L4_2 = L4_2(L5_2)
    L5_2 = L1_2 - 1
    if L4_2 == L5_2 then
      L3_2 = 1
    else
      L3_2 = 2
    end
    L4_2 = true
    A0_2.removeSplashTextNow = L4_2
    L4_2 = Wait
    L5_2 = 20
    L4_2(L5_2)
    L4_2 = DisplayFinalWinLoseMessage
    L5_2 = L3_2
    L6_2 = "^S^"
    L7_2 = L1_2 - 1
    L4_2(L5_2, L6_2, L7_2)
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
    L5_2 = A0_2
    L4_2 = A0_2.CleanUp
    L4_2(L5_2)
  end
end
L0_1.CheckIfEndOfGame = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = A0_2.EndOfGame
    L2_2 = true
    if L1_2 == L2_2 then
      return
    end
    L1_2 = Player
    L1_2 = L1_2()
    L2_2 = false
    L3_2 = A0_2.RoundsPlayed
    if L3_2 == 2 then
      L4_2 = A0_2
      L3_2 = A0_2.DefenceTimeInMs
      L3_2 = L3_2(L4_2)
      L4_2 = A0_2.TimeToBeat
      if L3_2 > L4_2 then
        L2_2 = true
        L3_2 = true
        A0_2.timeRanOut = L3_2
      end
    end
    L3_2 = A0_2.MissionVehicle1
    if L3_2 ~= nil then
      L3_2 = IsVehicleWrecked
      L4_2 = A0_2.MissionVehicle1
      L3_2 = L3_2(L4_2)
      L4_2 = true
      if L3_2 == L4_2 then
        L3_2 = A0_2.MissionVehicle2
        if L3_2 ~= nil then
          L3_2 = IsVehicleWrecked
          L4_2 = A0_2.MissionVehicle2
          L3_2 = L3_2(L4_2)
          L4_2 = true
          if L3_2 == L4_2 then
            L3_2 = A0_2.MissionVehicle3
            if L3_2 ~= nil then
              L3_2 = IsVehicleWrecked
              L4_2 = A0_2.MissionVehicle3
              L3_2 = L3_2(L4_2)
              L4_2 = true
              if L3_2 == L4_2 then
                L3_2 = A0_2.MissionVehicle4
                if L3_2 ~= nil then
                  L3_2 = IsVehicleWrecked
                  L4_2 = A0_2.MissionVehicle4
                  L3_2 = L3_2(L4_2)
                  L4_2 = true
                  if L3_2 == L4_2 then
                    goto lbl_63
                  end
                end
              end
            end
          end
        end
      end
    end
    L3_2 = true
    ::lbl_63::
    if L2_2 == L3_2 then
      L3_2 = A0_2.EndOfGame
      L4_2 = false
      if L3_2 == L4_2 then
        L3_2 = A0_2.finalSyncCarsSent
        L4_2 = true
        if L3_2 == L4_2 then
          L3_2 = print
          L4_2 = "Sync Num Cars At Change Sides"
          L3_2(L4_2)
          A0_2.VehiclesLeftThisRound = 0
          L4_2 = A0_2
          L3_2 = A0_2.DoSendEvent
          L5_2 = MSG_NUM_CARS
          L6_2 = 0
          L7_2 = A0_2.VehiclesLeftThisRound
          L8_2 = 0
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
          L3_2 = true
          A0_2.finalSyncCarsSent = L3_2
          L3_2 = Wait
          L4_2 = 100
          L3_2(L4_2)
        end
      end
      L3_2 = UpdateGameTime
      L4_2 = false
      L3_2(L4_2)
      L3_2 = A0_2.ShortcutVehicle1
      if L3_2 ~= nil then
        L3_2 = VehicleIsDrivenByPlayer
        L4_2 = A0_2.ShortcutVehicle1
        L3_2 = L3_2(L4_2)
        L4_2 = true
        if L3_2 == L4_2 then
          L4_2 = A0_2
          L3_2 = A0_2.KickDriverOutOfCar
          L5_2 = A0_2.ShortcutVehicle1
          L3_2(L4_2, L5_2)
        end
      end
      L3_2 = A0_2.ShortcutVehicle2
      if L3_2 ~= nil then
        L3_2 = VehicleIsDrivenByPlayer
        L4_2 = A0_2.ShortcutVehicle2
        L3_2 = L3_2(L4_2)
        L4_2 = true
        if L3_2 == L4_2 then
          L4_2 = A0_2
          L3_2 = A0_2.KickDriverOutOfCar
          L5_2 = A0_2.ShortcutVehicle2
          L3_2(L4_2, L5_2)
        end
      end
      L3_2 = DeleteVehicle
      L4_2 = A0_2.ShortcutVehicle1
      L3_2(L4_2)
      L3_2 = DeleteVehicle
      L4_2 = A0_2.ShortcutVehicle2
      L3_2(L4_2)
      L3_2 = IsLocalPlayerEnteringAVehicle
      L3_2 = L3_2()
      if L3_2 then
        return
      end
      L4_2 = L1_2
      L3_2 = L1_2.IsPlaying
      L3_2 = L3_2(L4_2)
      L4_2 = false
      if L3_2 == L4_2 then
        return
      end
      L3_2 = IsLocalPlayerInVehicle
      L3_2 = L3_2()
      if L3_2 then
        L3_2 = print
        L4_2 = "Ped is in a vehicle, get the f*ck out !!!"
        L3_2(L4_2)
        L4_2 = A0_2
        L3_2 = A0_2.KickDriverOutOfCar
        L5_2 = GetLocalPlayersVehicle
        L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2()
        L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
      end
      L3_2 = A0_2.FinalRound
      L4_2 = false
      if L3_2 == L4_2 then
        L3_2 = true
        A0_2.FinalRound = L3_2
        L3_2 = A0_2.BaseBlip
        if L3_2 ~= nil then
          L3_2 = RemoveBlip
          L4_2 = A0_2.BaseBlip
          L3_2(L4_2)
          A0_2.BaseBlip = nil
        end
        L3_2 = VehicleRemove3dMarker
        L4_2 = A0_2.MissionVehicle1
        L3_2(L4_2)
        L3_2 = VehicleRemove3dMarker
        L4_2 = A0_2.MissionVehicle2
        L3_2(L4_2)
        L3_2 = VehicleRemove3dMarker
        L4_2 = A0_2.MissionVehicle3
        L3_2(L4_2)
        L3_2 = VehicleRemove3dMarker
        L4_2 = A0_2.MissionVehicle4
        L3_2(L4_2)
        L3_2 = {}
        L4_2 = 0
        L5_2 = 0
        L6_2 = 0
        L3_2[1] = L4_2
        L3_2[2] = L5_2
        L3_2[3] = L6_2
        L4_2 = ClearArea
        L5_2 = L3_2
        L6_2 = 99999
        L4_2(L5_2, L6_2)
        L4_2 = Wait
        L5_2 = 100
        L4_2(L5_2)
        L4_2 = {}
        L5_2 = A0_2.ShortcutVehiclePoints
        L5_2 = L5_2[1]
        L5_2 = L5_2[1]
        L5_2 = L5_2[1]
        L4_2[1] = L5_2
        L5_2 = A0_2.ShortcutVehiclePoints
        L5_2 = L5_2[1]
        L5_2 = L5_2[1]
        L5_2 = L5_2[2]
        L4_2[2] = L5_2
        L5_2 = A0_2.ShortcutVehiclePoints
        L5_2 = L5_2[1]
        L5_2 = L5_2[1]
        L5_2 = L5_2[3]
        L4_2[3] = L5_2
        L5_2 = CreateVehicle
        L6_2 = IDAHO_MODEL_INDEX
        L7_2 = L4_2
        L8_2 = A0_2.ShortcutVehiclePoints
        L8_2 = L8_2[1]
        L8_2 = L8_2[2]
        L5_2 = L5_2(L6_2, L7_2, L8_2)
        A0_2.ShortcutVehicle1 = L5_2
        L5_2 = A0_2.ShortcutVehiclePoints
        L5_2 = L5_2[2]
        L5_2 = L5_2[1]
        L5_2 = L5_2[1]
        L4_2[1] = L5_2
        L5_2 = A0_2.ShortcutVehiclePoints
        L5_2 = L5_2[2]
        L5_2 = L5_2[1]
        L5_2 = L5_2[2]
        L4_2[2] = L5_2
        L5_2 = A0_2.ShortcutVehiclePoints
        L5_2 = L5_2[2]
        L5_2 = L5_2[1]
        L5_2 = L5_2[3]
        L4_2[3] = L5_2
        L5_2 = CreateVehicle
        L6_2 = STINGER_MODEL_INDEX
        L7_2 = L4_2
        L8_2 = A0_2.ShortcutVehiclePoints
        L8_2 = L8_2[2]
        L8_2 = L8_2[2]
        L5_2 = L5_2(L6_2, L7_2, L8_2)
        A0_2.ShortcutVehicle2 = L5_2
        A0_2.ShortcutRespawnTimer = 0
        L5_2 = GameElapsedMs
        L5_2 = L5_2()
        A0_2.ShortcutRespawnLastUpdate = L5_2
        L5_2 = Wait
        L6_2 = 3000
        L5_2(L6_2)
        L5_2 = DeleteVehicle
        L6_2 = A0_2.MissionVehicle1
        L5_2(L6_2)
        L5_2 = DeleteVehicle
        L6_2 = A0_2.MissionVehicle2
        L5_2(L6_2)
        L5_2 = DeleteVehicle
        L6_2 = A0_2.MissionVehicle3
        L5_2(L6_2)
        L5_2 = DeleteVehicle
        L6_2 = A0_2.MissionVehicle4
        L5_2(L6_2)
        A0_2.MissionVehicle1 = nil
        A0_2.MissionVehicle2 = nil
        A0_2.MissionVehicle3 = nil
        A0_2.MissionVehicle4 = nil
        L5_2 = print
        L6_2 = "Sending MSG_SWAP_TEAM"
        L5_2(L6_2)
        L6_2 = A0_2
        L5_2 = A0_2.DoSendEvent
        L7_2 = MSG_SWAP_TEAM
        L8_2 = 0
        L9_2 = A0_2.mins
        L10_2 = A0_2.seconds
        L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
      else
        L3_2 = A0_2.EndOfGame
        L4_2 = false
        if L3_2 == L4_2 then
          L3_2 = A0_2.RoundsPlayed
          if 2 <= L3_2 then
            L3_2 = print
            L4_2 = "Sending END Rounds =="
            L5_2 = A0_2.RoundsPlayed
            L4_2 = L4_2 .. L5_2
            L3_2(L4_2)
            L3_2 = nil
            L5_2 = A0_2
            L4_2 = A0_2.GetTheWiningTeam
            L4_2 = L4_2(L5_2)
            L3_2 = L4_2
            L4_2 = print
            L5_2 = "winningTeam == "
            L6_2 = L3_2
            L5_2 = L5_2 .. L6_2
            L4_2(L5_2)
            L4_2 = A0_2.timeRanOut
            L5_2 = true
            if L4_2 == L5_2 then
              L5_2 = A0_2
              L4_2 = A0_2.DoSendEvent
              L6_2 = MSG_END_GAME
              L7_2 = 0
              L8_2 = L3_2
              L9_2 = 1
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
            else
              L5_2 = A0_2
              L4_2 = A0_2.DoSendEvent
              L6_2 = MSG_END_GAME
              L7_2 = 0
              L8_2 = L3_2
              L9_2 = 0
              L4_2(L5_2, L6_2, L7_2, L8_2, L9_2)
            end
          end
        end
      end
    end
  end
end
L0_1.SwapAttackDefend = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = A0_2.ChangeSides
  L2_2 = true
  if L1_2 == L2_2 then
    L1_2 = IsLocalPlayerEnteringAVehicle
    L1_2 = L1_2()
    if L1_2 then
      return
    end
    L1_2 = IsLocalPlayerInVehicle
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = print
      L2_2 = "Ped is in a vehicle, get the f*ck out !!!"
      L1_2(L2_2)
      L2_2 = A0_2
      L1_2 = A0_2.KickDriverOutOfCar
      L3_2 = GetLocalPlayersVehicle
      L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2 = L3_2()
      L1_2(L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2)
    end
    L1_2 = print
    L2_2 = "Changing Sides"
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.DisplayDefenceTimer
    L1_2(L2_2)
    L1_2 = A0_2.SplashTextIsOnScreen
    L2_2 = true
    if L1_2 == L2_2 then
      L1_2 = true
      A0_2.removeSplashTextNow = L1_2
      L1_2 = Wait
      L2_2 = 20
      L1_2(L2_2)
    end
    L1_2 = collectgarbage
    L1_2()
    L1_2 = RenderHudExtras
    L2_2 = false
    L1_2(L2_2)
    L1_2 = DisablePlayer
    L2_2 = true
    L1_2(L2_2)
    L1_2 = false
    A0_2.ChangeSides = L1_2
    L1_2 = true
    A0_2.InitialSpawn = L1_2
    L2_2 = A0_2
    L1_2 = A0_2.DefenceTimeInMs
    L1_2 = L1_2(L2_2)
    A0_2.TimeToBeat = L1_2
    L1_2 = A0_2.gameUnderway
    L2_2 = true
    if L1_2 == L2_2 then
      L2_2 = A0_2
      L1_2 = A0_2.ShowHUD
      L3_2 = false
      L1_2(L2_2, L3_2)
      L1_2 = main
      L1_2 = L1_2.scores
      L2_2 = L1_2
      L1_2 = L1_2.Hide
      L3_2 = true
      L1_2(L2_2, L3_2)
      L1_2 = RenderPauseScreenStuffNoBox
      L2_2 = true
      L1_2(L2_2)
      L1_2 = SetPauseScreenSelection
      L2_2 = -1
      L1_2(L2_2)
      L1_2 = Player
      L1_2 = L1_2()
      L2_2 = TextSprite
      L3_2 = L1_2
      L4_2 = 235
      L5_2 = 90
      L6_2 = 1
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
      L4_2 = L2_2
      L3_2 = L2_2.Order
      L5_2 = -1
      L3_2(L4_2, L5_2)
      L4_2 = L2_2
      L3_2 = L2_2.Scale
      L5_2 = 0.32
      L3_2(L4_2, L5_2)
      L4_2 = L2_2
      L3_2 = L2_2.Style
      L5_2 = 0
      L3_2(L4_2, L5_2)
      L3_2 = TextSprite
      L4_2 = L1_2
      L5_2 = 235
      L6_2 = 120
      L7_2 = 1
      L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
      L5_2 = L3_2
      L4_2 = L3_2.Order
      L6_2 = -1
      L4_2(L5_2, L6_2)
      L5_2 = L3_2
      L4_2 = L3_2.Scale
      L6_2 = 0.32
      L4_2(L5_2, L6_2)
      L5_2 = L3_2
      L4_2 = L3_2.Style
      L6_2 = 0
      L4_2(L5_2, L6_2)
      L4_2 = TextSprite
      L5_2 = L1_2
      L6_2 = 235
      L7_2 = 150
      L8_2 = 1
      L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
      L6_2 = L4_2
      L5_2 = L4_2.Order
      L7_2 = -1
      L5_2(L6_2, L7_2)
      L6_2 = L4_2
      L5_2 = L4_2.Scale
      L7_2 = 0.31
      L5_2(L6_2, L7_2)
      L6_2 = L4_2
      L5_2 = L4_2.Style
      L7_2 = 0
      L5_2(L6_2, L7_2)
      L5_2 = nil
      L6_2 = nil
      L7_2 = nil
      L8_2 = nil
      L10_2 = A0_2
      L9_2 = A0_2.DefenceTimeInMs
      L9_2 = L9_2(L10_2)
      L5_2 = L9_2
      L9_2 = math
      L9_2 = L9_2.floor
      L10_2 = L5_2 / 1000
      L10_2 = L10_2 / 60
      L9_2 = L9_2(L10_2)
      L6_2 = L9_2
      L9_2 = 1000 * 60
      L9_2 = L6_2 * L9_2
      L5_2 = L5_2 - L9_2
      L7_2 = L5_2 / 1000
      if 99 < L6_2 then
        L6_2 = 99
      end
      L9_2 = string
      L9_2 = L9_2.format
      L10_2 = "%d:%02d"
      L11_2 = L6_2
      L12_2 = L7_2
      L9_2 = L9_2(L10_2, L11_2, L12_2)
      L8_2 = L9_2
      L10_2 = L1_2
      L9_2 = L1_2.TeamId
      L9_2 = L9_2(L10_2)
      L9_2 = L9_2 + 1
      L10_2 = DefendingTeam
      L10_2 = L10_2()
      if L9_2 == L10_2 then
        L10_2 = L2_2
        L9_2 = L2_2.Colour
        L11_2 = GameColour
        L12_2 = teamId2
        L11_2, L12_2 = L11_2(L12_2)
        L9_2(L10_2, L11_2, L12_2)
        L10_2 = L4_2
        L9_2 = L4_2.Colour
        L11_2 = GameColour
        L12_2 = teamId2
        L11_2, L12_2 = L11_2(L12_2)
        L9_2(L10_2, L11_2, L12_2)
        L10_2 = L3_2
        L9_2 = L3_2.Colour
        L11_2 = GameColour
        L12_2 = teamId2
        L11_2, L12_2 = L11_2(L12_2)
        L9_2(L10_2, L11_2, L12_2)
        L10_2 = L2_2
        L9_2 = L2_2.Text
        L11_2 = "^T^DTBSWPA"
        L9_2(L10_2, L11_2)
        L10_2 = L3_2
        L9_2 = L3_2.Text
        L11_2 = "^S^"
        L12_2 = L8_2
        L11_2 = L11_2 .. L12_2
        L9_2(L10_2, L11_2)
        L10_2 = L4_2
        L9_2 = L4_2.Text
        L11_2 = "^T^DTBSWPB"
        L9_2(L10_2, L11_2)
      else
        L10_2 = L2_2
        L9_2 = L2_2.Colour
        L11_2 = GameColour
        L12_2 = teamId1
        L11_2, L12_2 = L11_2(L12_2)
        L9_2(L10_2, L11_2, L12_2)
        L10_2 = L4_2
        L9_2 = L4_2.Colour
        L11_2 = GameColour
        L12_2 = teamId1
        L11_2, L12_2 = L11_2(L12_2)
        L9_2(L10_2, L11_2, L12_2)
        L10_2 = L3_2
        L9_2 = L3_2.Colour
        L11_2 = GameColour
        L12_2 = teamId1
        L11_2, L12_2 = L11_2(L12_2)
        L9_2(L10_2, L11_2, L12_2)
        L10_2 = L2_2
        L9_2 = L2_2.Text
        L11_2 = "^T^DTBSWPC"
        L9_2(L10_2, L11_2)
        L10_2 = L3_2
        L9_2 = L3_2.Text
        L11_2 = "^S^"
        L12_2 = L8_2
        L11_2 = L11_2 .. L12_2
        L9_2(L10_2, L11_2)
        L10_2 = L4_2
        L9_2 = L4_2.Text
        L11_2 = "^T^DTBSWPD"
        L9_2(L10_2, L11_2)
      end
      L9_2 = 0
      while L9_2 < 200 do
        L10_2 = DisablePlayer
        L11_2 = true
        L10_2(L11_2)
        L10_2 = ClearMessages
        L10_2()
        L10_2 = Wait
        L11_2 = 1
        L10_2(L11_2)
        L9_2 = L9_2 + 1
      end
      L11_2 = L2_2
      L10_2 = L2_2.Remove
      L10_2(L11_2)
      L11_2 = L4_2
      L10_2 = L4_2.Remove
      L10_2(L11_2)
      L11_2 = L3_2
      L10_2 = L3_2.Remove
      L10_2(L11_2)
      L10_2 = RenderPauseScreenStuffNoBox
      L11_2 = false
      L10_2(L11_2)
      L11_2 = A0_2
      L10_2 = A0_2.ShowHUD
      L12_2 = true
      L10_2(L11_2, L12_2)
      L10_2 = main
      L10_2 = L10_2.scores
      L11_2 = L10_2
      L10_2 = L10_2.Hide
      L12_2 = false
      L10_2(L11_2, L12_2)
    end
    L1_2 = CameraFadeOut
    L2_2 = 5
    L1_2(L2_2)
    L1_2 = RegenerateAllPickups
    L1_2()
    L1_2 = IsServer
    L1_2 = L1_2()
    if L1_2 then
      L1_2 = UsePowerups
      L1_2 = L1_2()
      if L1_2 then
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
    A0_2.VehiclesLeftThisRound = 4
    L1_2 = DefendingTeam
    L1_2 = L1_2()
    if L1_2 == 1 then
      L1_2 = DefendingTeam
      L2_2 = 2
      L1_2(L2_2)
    else
      L1_2 = DefendingTeam
      L2_2 = 1
      L1_2(L2_2)
    end
    L2_2 = A0_2
    L1_2 = A0_2.UpdateRadar
    L1_2(L2_2)
    L2_2 = A0_2
    L1_2 = A0_2.SpawnMissionVehicles
    L1_2(L2_2)
    L1_2 = Player
    L1_2 = L1_2()
    L3_2 = A0_2
    L2_2 = A0_2.GetPlayerRespawnPosition
    L2_2 = L2_2(L3_2)
    L4_2 = L1_2
    L3_2 = L1_2.Respawn
    L5_2 = L2_2
    L3_2(L4_2, L5_2)
    L3_2 = Wait
    L4_2 = 1000
    L3_2(L4_2)
    L3_2 = A0_2.gameUnderway
    L4_2 = false
    if L3_2 == L4_2 then
      L3_2 = NoFuckingCutscene
      L3_2 = L3_2()
      if not L3_2 then
        L3_2 = main
        L3_2 = L3_2.scores
        L4_2 = L3_2
        L3_2 = L3_2.Hide
        L5_2 = true
        L3_2(L4_2, L5_2)
        L3_2 = Wait
        L4_2 = 5
        L3_2(L4_2)
        goto lbl_308
        repeat
          L3_2 = Wait
          L4_2 = 5
          L3_2(L4_2)
          ::lbl_308::
          L3_2 = SyncCutScene
          L3_2 = L3_2()
          L4_2 = false
        until L3_2 ~= L4_2
        L3_2 = RunScriptedCutscene
        L3_2()
        L3_2 = Wait
        L4_2 = 0
        L3_2(L4_2)
        goto lbl_322
        repeat
          L3_2 = Wait
          L4_2 = 0
          L3_2(L4_2)
          ::lbl_322::
          L3_2 = ProcessScriptedCutscene
          L3_2 = L3_2()
        until not L3_2
        L3_2 = main
        L3_2 = L3_2.scores
        L4_2 = L3_2
        L3_2 = L3_2.Hide
        L5_2 = false
        L3_2(L4_2, L5_2)
      else
        L3_2 = Wait
        L4_2 = 20
        L3_2(L4_2)
        L3_2 = ClearSplashScreen
        L3_2()
      end
      L3_2 = true
      A0_2.gameUnderway = L3_2
      L4_2 = A0_2
      L3_2 = A0_2.ShowHUD
      L5_2 = true
      L3_2(L4_2, L5_2)
    end
    L3_2 = GenerateAmbients
    L4_2 = true
    L3_2(L4_2)
    L3_2 = RenderHudExtras
    L4_2 = true
    L3_2(L4_2)
    L3_2 = GameElapsedMs
    L4_2 = 0
    L3_2(L4_2)
    A0_2.gameseconds = 0
    A0_2.mins = 0
    A0_2.seconds = 0
    L3_2 = UpdateGameTime
    L4_2 = true
    L3_2(L4_2)
    L4_2 = A0_2
    L3_2 = A0_2.DisplayDefenceTimer
    L3_2(L4_2)
    L3_2 = A0_2.RoundsPlayed
    L3_2 = L3_2 + 1
    A0_2.RoundsPlayed = L3_2
    L3_2 = ExtinguishAllFires
    L3_2()
    L3_2 = CameraFadeIn
    L4_2 = 5
    L3_2(L4_2)
    L4_2 = A0_2
    L3_2 = A0_2.DisplayAttackDefendMessage
    L3_2(L4_2)
    L3_2 = DisablePlayer
    L4_2 = false
    L3_2(L4_2)
  end
end
L0_1.CheckChangeSides = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = print
  L3_2 = "Kick driver out of car"
  L2_2(L3_2)
  L2_2 = KickOutOfCar
  L2_2 = L2_2()
  L3_2 = false
  L2_2.isDriverKickedOutOfCar = L3_2
  L2_2.carToKickDriverOutOf = A1_2
  L4_2 = L2_2
  L3_2 = L2_2.Start
  L3_2(L4_2)
  goto lbl_15
  repeat
    L3_2 = Wait
    L4_2 = 0
    L3_2(L4_2)
    ::lbl_15::
    L3_2 = L2_2.isDriverKickedOutOfCar
    L4_2 = false
  until L3_2 ~= L4_2
  A0_2.carToKickDriverOutOf = nil
end
L0_1.KickDriverOutOfCar = L1_1
L0_1 = KickOutOfCar
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = VehicleSetEmergencyStop
  L2_2 = A0_2.carToKickDriverOutOf
  L3_2 = true
  L1_2(L2_2, L3_2)
  L1_2 = Wait
  L2_2 = 500
  L1_2(L2_2)
  L1_2 = VehicleForceOutPeds
  L2_2 = A0_2.carToKickDriverOutOf
  L1_2(L2_2)
  L1_2 = 0
  goto lbl_23
  repeat
    L2_2 = Wait
    L3_2 = 0
    L2_2(L3_2)
    L1_2 = L1_2 + 1
    if 15 < L1_2 then
      L1_2 = 0
      L2_2 = VehicleForceOutPeds
      L3_2 = A0_2.carToKickDriverOutOf
      L2_2(L3_2)
    end
    ::lbl_23::
    L2_2 = VehicleIsDrivenByPlayer
    L3_2 = A0_2.carToKickDriverOutOf
    L2_2 = L2_2(L3_2)
  until not L2_2
  L2_2 = VehicleSetEmergencyStop
  L3_2 = A0_2.carToKickDriverOutOf
  L4_2 = false
  L2_2(L3_2, L4_2)
  L2_2 = true
  A0_2.isDriverKickedOutOfCar = L2_2
end
L0_1.Run = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = IsEventStackEmpty
  L1_2 = L1_2()
  L2_2 = false
  if L1_2 == L2_2 then
    L1_2 = Player
    L1_2 = L1_2()
    L2_2 = GetEvent
    L2_2 = L2_2()
    L3_2 = MaskEventNumber
    L4_2 = L2_2
    L5_2 = DTBEVENTMASK_TYPE
    L6_2 = DTBEVENTSHIFT_TYPE
    L6_2 = -L6_2
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L4_2 = MaskEventNumber
    L5_2 = L2_2
    L6_2 = DTBEVENTMASK_PARAM1
    L7_2 = DTBEVENTSHIFT_PARAM1
    L7_2 = -L7_2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L5_2 = MaskEventNumber
    L6_2 = L2_2
    L7_2 = DTBEVENTMASK_PARAM2
    L8_2 = DTBEVENTSHIFT_PARAM2
    L8_2 = -L8_2
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L6_2 = MaskEventNumber
    L7_2 = L2_2
    L8_2 = DTBEVENTMASK_PARAM3
    L9_2 = DTBEVENTSHIFT_PARAM3
    L9_2 = -L9_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = MSG_SWAP_TEAM
    if L3_2 == L7_2 then
      L7_2 = print
      L8_2 = "MSG_SWAP_TEAM"
      L7_2(L8_2)
      A0_2.mins = L5_2
      A0_2.seconds = L6_2
      L7_2 = true
      A0_2.ChangeSides = L7_2
      L7_2 = A0_2.SplashTextIsOnScreen
      L8_2 = true
      if L7_2 == L8_2 then
        L7_2 = true
        A0_2.removeSplashTextNow = L7_2
        L7_2 = Wait
        L8_2 = 20
        L7_2(L8_2)
      end
    else
      L7_2 = MSG_TIMEUPDATE
      if L3_2 == L7_2 then
        L7_2 = A0_2.ChangeSides
        L8_2 = false
        if L7_2 == L8_2 then
          L7_2 = print
          L8_2 = "MSG_TIMEUPDATE Mins =="
          L9_2 = L5_2
          L10_2 = " Seconds=="
          L11_2 = L6_2
          L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
          L7_2(L8_2)
          A0_2.mins = L5_2
          A0_2.seconds = L6_2
          L8_2 = A0_2
          L7_2 = A0_2.DisplayDefenceTimer
          L7_2(L8_2)
        end
      else
        L7_2 = MSG_END_GAME
        if L3_2 == L7_2 then
          L7_2 = print
          L8_2 = "MSG_END_GAME"
          L7_2(L8_2)
          A0_2.winningTeam = L5_2
          L7_2 = true
          A0_2.EndOfGame = L7_2
          L8_2 = A0_2
          L7_2 = A0_2.DisplayDefenceTimer
          L7_2(L8_2)
          if L6_2 == 0 then
            L7_2 = print
            L8_2 = "Time Did Not Run Out"
            L7_2(L8_2)
            L7_2 = false
            A0_2.timeRanOut = L7_2
          else
            L7_2 = print
            L8_2 = "Time Ran Out"
            L7_2(L8_2)
            L7_2 = true
            A0_2.timeRanOut = L7_2
          end
        else
          L7_2 = MSG_CAR_LOST
          if L3_2 == L7_2 then
            L7_2 = print
            L8_2 = "MSG_CAR_LOST"
            L7_2(L8_2)
            L8_2 = L1_2
            L7_2 = L1_2.TeamId
            L7_2 = L7_2(L8_2)
            L7_2 = L7_2 + 1
            L8_2 = DefendingTeam
            L8_2 = L8_2()
            if L7_2 == L8_2 then
              L8_2 = L1_2
              L7_2 = L1_2.TeamId
              L7_2 = L7_2(L8_2)
              if L7_2 == 0 then
                L8_2 = A0_2
                L7_2 = A0_2.DisplayMessage
                L9_2 = "^t^MTN_1"
                L10_2 = 750
                L11_2 = "^t^DTB03"
                L12_2 = true
                L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
              else
                L8_2 = A0_2
                L7_2 = A0_2.DisplayMessage
                L9_2 = "^t^MTN_2"
                L10_2 = 750
                L11_2 = "^t^DTB03"
                L12_2 = true
                L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
              end
            else
              L8_2 = L1_2
              L7_2 = L1_2.TeamId
              L7_2 = L7_2(L8_2)
              if L7_2 == 0 then
                L8_2 = A0_2
                L7_2 = A0_2.DisplayMessage
                L9_2 = "^t^MTN_1"
                L10_2 = 750
                L11_2 = "^t^DTB04"
                L12_2 = true
                L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
              else
                L8_2 = A0_2
                L7_2 = A0_2.DisplayMessage
                L9_2 = "^t^MTN_2"
                L10_2 = 750
                L11_2 = "^t^DTB04"
                L12_2 = true
                L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
              end
            end
            L8_2 = A0_2
            L7_2 = A0_2.DisplayDefenceTimer
            L7_2(L8_2)
          else
            L7_2 = MSG_NUM_CARS
            if L3_2 == L7_2 then
              L7_2 = IsServer
              L7_2 = L7_2()
              L8_2 = false
              if L7_2 == L8_2 then
                A0_2.VehiclesLeftThisRound = L5_2
              end
            end
          end
        end
      end
    end
  end
end
L0_1.ProcessNetworkEvents = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = A0_2.SplashTextIsOnScreen
  L2_2 = true
  if L1_2 == L2_2 then
    L1_2 = true
    A0_2.removeSplashTextNow = L1_2
    L1_2 = Wait
    L2_2 = 20
    L1_2(L2_2)
  end
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.TeamId
  L2_2 = L2_2(L3_2)
  L2_2 = L2_2 + 1
  L3_2 = DefendingTeam
  L3_2 = L3_2()
  if L2_2 == L3_2 then
    L3_2 = L1_2
    L2_2 = L1_2.TeamId
    L2_2 = L2_2(L3_2)
    if L2_2 == 0 then
      L3_2 = A0_2
      L2_2 = A0_2.DisplayMessage
      L4_2 = "^t^MTN_1"
      L5_2 = 1000
      L6_2 = "^t^DTB01"
      L7_2 = true
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    else
      L3_2 = A0_2
      L2_2 = A0_2.DisplayMessage
      L4_2 = "^t^MTN_2"
      L5_2 = 1000
      L6_2 = "^t^DTB01"
      L7_2 = true
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    end
  else
    L3_2 = L1_2
    L2_2 = L1_2.TeamId
    L2_2 = L2_2(L3_2)
    if L2_2 == 0 then
      L3_2 = A0_2
      L2_2 = A0_2.DisplayMessage
      L4_2 = "^t^MTN_1"
      L5_2 = 1000
      L6_2 = "^t^DTB02"
      L7_2 = true
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    else
      L3_2 = A0_2
      L2_2 = A0_2.DisplayMessage
      L4_2 = "^t^MTN_2"
      L5_2 = 1000
      L6_2 = "^t^DTB02"
      L7_2 = true
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
    end
  end
end
L0_1.DisplayAttackDefendMessage = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L5_2 = A0_2.SplashTextIsOnScreen
  L6_2 = false
  if L5_2 == L6_2 then
    L5_2 = Player
    L5_2 = L5_2()
    L7_2 = L5_2
    L6_2 = L5_2.TeamId
    L6_2 = L6_2(L7_2)
    if L6_2 == 1 then
      L7_2 = A0_2
      L6_2 = A0_2.Commentate
      L8_2 = "^S^~b~"
      L9_2 = A1_2
      L10_2 = "^S^ ~w~"
      L11_2 = A3_2
      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
      L6_2(L7_2, L8_2)
    else
      L7_2 = A0_2
      L6_2 = A0_2.Commentate
      L8_2 = "^S^~r~"
      L9_2 = A1_2
      L10_2 = "^S^ ~w~"
      L11_2 = A3_2
      L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
      L6_2(L7_2, L8_2)
    end
  end
end
L0_1.DisplayMessage = L1_1
L0_1 = MessageDisplay
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "Message Display CLEANUP"
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = MessageDisplay
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L1_2 = main
  L1_2 = L1_2.game
  L2_2 = true
  L1_2.SplashTextIsOnScreen = L2_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = TextSprite
  L3_2 = L1_2
  L4_2 = 235
  L5_2 = 86
  L6_2 = 1
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L4_2 = L2_2
  L3_2 = L2_2.Scale
  L5_2 = 1.2
  L3_2(L4_2, L5_2)
  L4_2 = L2_2
  L3_2 = L2_2.Style
  L5_2 = 2
  L3_2(L4_2, L5_2)
  L4_2 = L2_2
  L3_2 = L2_2.Colour
  L5_2 = main
  L5_2 = L5_2.game
  L5_2 = L5_2.MsgColour
  L5_2 = L5_2[1]
  L6_2 = main
  L6_2 = L6_2.game
  L6_2 = L6_2.MsgColour
  L6_2 = L6_2[2]
  L7_2 = main
  L7_2 = L7_2.game
  L7_2 = L7_2.MsgColour
  L7_2 = L7_2[3]
  L8_2 = main
  L8_2 = L8_2.game
  L8_2 = L8_2.MsgColour
  L8_2 = L8_2[4]
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L4_2 = L2_2
  L3_2 = L2_2.Text
  L5_2 = main
  L5_2 = L5_2.game
  L5_2 = L5_2.Msg
  L3_2(L4_2, L5_2)
  L3_2 = TextSprite
  L4_2 = L1_2
  L5_2 = 235
  L6_2 = 125
  L7_2 = 1
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
  L5_2 = L3_2
  L4_2 = L3_2.Scale
  L6_2 = 0.4
  L7_2 = 1
  L4_2(L5_2, L6_2, L7_2)
  L5_2 = L3_2
  L4_2 = L3_2.Style
  L6_2 = 0
  L4_2(L5_2, L6_2)
  L5_2 = L3_2
  L4_2 = L3_2.Colour
  L6_2 = {}
  L7_2 = 255
  L8_2 = 255
  L9_2 = 255
  L10_2 = 255
  L6_2[1] = L7_2
  L6_2[2] = L8_2
  L6_2[3] = L9_2
  L6_2[4] = L10_2
  L4_2(L5_2, L6_2)
  L5_2 = L3_2
  L4_2 = L3_2.Text
  L6_2 = main
  L6_2 = L6_2.game
  L6_2 = L6_2.Msg2
  L4_2(L5_2, L6_2)
  L4_2 = 0
  while L4_2 < 100 do
    L5_2 = Wait
    L6_2 = 1
    L5_2(L6_2)
    L4_2 = L4_2 + 1
    L5_2 = main
    L5_2 = L5_2.game
    L5_2 = L5_2.removeSplashTextNow
    L6_2 = true
    if L5_2 == L6_2 then
      L5_2 = main
      L5_2 = L5_2.game
      L6_2 = false
      L5_2.removeSplashTextNow = L6_2
      L5_2 = main
      L5_2 = L5_2.game
      L4_2 = L5_2.MsgLength
    end
    L6_2 = L1_2
    L5_2 = L1_2.IsPlaying
    L5_2 = L5_2(L6_2)
    L6_2 = false
    if L5_2 == L6_2 then
      L5_2 = main
      L5_2 = L5_2.game
      L4_2 = L5_2.MsgLength
    end
  end
  L6_2 = L2_2
  L5_2 = L2_2.Remove
  L5_2(L6_2)
  L6_2 = L3_2
  L5_2 = L3_2.Remove
  L5_2(L6_2)
  L5_2 = main
  L5_2 = L5_2.game
  L6_2 = false
  L5_2.SplashTextIsOnScreen = L6_2
end
L0_1.Run = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = {}
  L4_2 = L1_2
  L3_2 = L1_2.TeamId
  L3_2 = L3_2(L4_2)
  L3_2 = L3_2 + 1
  L4_2 = DefendingTeam
  L4_2 = L4_2()
  if L3_2 == L4_2 then
    L3_2 = A0_2.InitialSpawn
    L4_2 = true
    if L3_2 == L4_2 then
      L3_2 = false
      A0_2.InitialSpawn = L3_2
      L3_2 = main
      L4_2 = A0_2.DefenceStartPoints
      L3_2.vSpawnPoints = L4_2
      L3_2 = print
      L4_2 = "Doing initial spawn"
      L3_2(L4_2)
      L3_2 = DoSpawn
      L4_2 = InitialSpawnPoint
      L5_2 = PlayerId
      L5_2 = L5_2()
      L4_2 = L4_2(L5_2)
      L5_2 = false
      L3_2 = L3_2(L4_2, L5_2)
      L2_2 = L3_2
    else
      L3_2 = main
      L4_2 = A0_2.DefenceSpawnPoints
      L3_2.vSpawnPoints = L4_2
      L3_2 = DoSpawn
      L4_2 = nil
      L5_2 = false
      L3_2 = L3_2(L4_2, L5_2)
      L2_2 = L3_2
    end
  else
    L3_2 = main
    L4_2 = A0_2.AttackSpawnPoints
    L3_2.vSpawnPoints = L4_2
    L3_2 = A0_2.InitialSpawn
    if L3_2 then
      L3_2 = print
      L4_2 = "Doing initial spawn"
      L3_2(L4_2)
      L3_2 = DoSpawn
      L4_2 = InitialSpawnPoint
      L5_2 = PlayerId
      L5_2 = L5_2()
      L4_2 = L4_2(L5_2)
      L5_2 = false
      L3_2 = L3_2(L4_2, L5_2)
      L2_2 = L3_2
    else
      L3_2 = DoSpawn
      L4_2 = nil
      L5_2 = false
      L3_2 = L3_2(L4_2, L5_2)
      L2_2 = L3_2
    end
  end
  return L2_2
end
L0_1.GetPlayerRespawnPosition = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = A0_2.teamscores
  L2_2 = DefendingTeam
  L2_2 = L2_2()
  L4_2 = A0_2
  L3_2 = A0_2.DefenceTimeInMs
  L3_2 = L3_2(L4_2)
  L1_2[L2_2] = L3_2
end
L0_1.UpdateScores = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = A0_2.teamscores
  L3_2 = A1_2 + 1
  L2_2 = L2_2[L3_2]
  return L2_2
end
L0_1.TeamScore = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = A0_2.seconds
  L1_2 = L1_2 * 1000
  L2_2 = A0_2.mins
  L2_2 = L2_2 * 60000
  L1_2 = L1_2 + L2_2
  return L1_2
end
L0_1.DefenceTimeInMs = L1_1
L0_1 = DTB
function L1_1(A0_2)
  local L1_2
  L1_2 = A0_2.timeRanOut
  return L1_2
end
L0_1.DidWinBecauseTimeRanOut = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = A0_2.DefenceTimer
  if L2_2 ~= nil then
    L2_2 = A0_2.DefenceTimer
    L3_2 = L2_2
    L2_2 = L2_2.Remove
    L2_2(L3_2)
    A0_2.DefenceTimer = nil
  end
  L2_2 = A0_2.carsLeftText
  if L2_2 ~= nil then
    L2_2 = A0_2.carsLeftText
    L3_2 = L2_2
    L2_2 = L2_2.Remove
    L2_2(L3_2)
    A0_2.carsLeftText = nil
  end
  L2_2 = true
  if A1_2 == L2_2 then
    L2_2 = Player
    L2_2 = L2_2()
    L3_2 = TextSprite
    L4_2 = L2_2
    L5_2 = 470
    L6_2 = 82
    L7_2 = 2
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.DefenceTimer = L3_2
    L3_2 = A0_2.DefenceTimer
    L4_2 = L3_2
    L3_2 = L3_2.Scale
    L5_2 = 0.4048
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.DefenceTimer
    L4_2 = L3_2
    L3_2 = L3_2.Style
    L5_2 = 1
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.DefenceTimer
    L4_2 = L3_2
    L3_2 = L3_2.Colour
    L5_2 = 255
    L6_2 = 255
    L7_2 = 255
    L8_2 = 255
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L3_2 = A0_2.DefenceTimer
    L4_2 = L3_2
    L3_2 = L3_2.Text
    L5_2 = "^S^    "
    L3_2(L4_2, L5_2)
    L3_2 = TextSprite
    L4_2 = L2_2
    L5_2 = 470
    L6_2 = 102
    L7_2 = 2
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.carsLeftText = L3_2
    L3_2 = A0_2.carsLeftText
    L4_2 = L3_2
    L3_2 = L3_2.Scale
    L5_2 = 0.4048
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.carsLeftText
    L4_2 = L3_2
    L3_2 = L3_2.Style
    L5_2 = 1
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.carsLeftText
    L4_2 = L3_2
    L3_2 = L3_2.Text
    L5_2 = "^S^    "
    L3_2(L4_2, L5_2)
  end
end
L0_1.ShowHUD = L1_1
L0_1 = DTB
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L5_2 = A2_2
  L4_2 = A2_2.Name
  L4_2 = L4_2(L5_2)
  L6_2 = A1_2
  L5_2 = A1_2.Name
  L5_2 = L5_2(L6_2)
  if A1_2 == A2_2 then
    L7_2 = A0_2
    L6_2 = A0_2.Commentate
    L8_2 = "^S^"
    L9_2 = L5_2
    L10_2 = "^S^ ^T^MPKSELF"
    L8_2 = L8_2 .. L9_2 .. L10_2
    L6_2(L7_2, L8_2)
  elseif A3_2 then
    L7_2 = A0_2
    L6_2 = A0_2.Commentate
    L8_2 = "^S^"
    L9_2 = L4_2
    L10_2 = "^S^ ^T^MPK^S^ "
    L11_2 = L5_2
    L12_2 = "^S^ ^T^MPKHEAD"
    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2 .. L12_2
    L6_2(L7_2, L8_2)
    L6_2 = A0_2.headshots
    L6_2 = L6_2 + 1
    A0_2.headshots = L6_2
  else
    L7_2 = A0_2
    L6_2 = A0_2.Commentate
    L8_2 = "^S^"
    L9_2 = L4_2
    L10_2 = "^S^ ^T^MPK^S^ "
    L11_2 = L5_2
    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
    L6_2(L7_2, L8_2)
  end
end
L0_1.RegisterPlayerKill = L1_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
  L0_2 = print
  L1_2 = "lua Main()"
  L0_2(L1_2)
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
  L1_2 = print
  L2_2 = "lua CreatePlayer()"
  L1_2(L2_2)
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
  L2_2 = DTB
  L2_2 = L2_2()
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
