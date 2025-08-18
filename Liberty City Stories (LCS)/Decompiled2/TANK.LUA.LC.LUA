local L0_1, L1_1, L2_1, L3_1
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
L1_1 = "PowerUps"
L0_1(L1_1)
L0_1 = require
L1_1 = "Pickups"
L0_1(L1_1)
L0_1 = require
L1_1 = "PickupBlips"
L0_1(L1_1)
L0_1 = require
L1_1 = "CutscenePlayer"
L0_1(L1_1)
L0_1 = PowerupTimer
L0_1 = L0_1()
PowerUpTimer = L0_1
L0_1 = StateMachine
L1_1 = {}
L2_1 = "StateInit"
L1_1[1] = L2_1
L0_1 = L0_1(L1_1)
Tank = L0_1
L0_1 = -1
playerintank = L0_1
L0_1 = Script
L1_1 = {}
L2_1 = {}
L3_1 = "thisplayer"
L2_1[1] = L3_1
L1_1._init = L2_1
L0_1 = L0_1(L1_1)
MultiTankClient = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
TankMessagePump = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
MessageDisplay = L0_1
L0_1 = Script
L1_1 = {}
L0_1 = L0_1(L1_1)
KickOutOfCar = L0_1
L0_1 = 20000
WRECKED_TANK_CLEANUP_TIME = L0_1
L0_1 = 1000
DEATH_WAIT_RESPAWN_TIME = L0_1
L0_1 = 16777215
TANKEVENTMASK_NONE = L0_1
L0_1 = 14680064
TANKEVENTMASK_TYPE = L0_1
L0_1 = 1966080
TANKEVENTMASK_PARAM1 = L0_1
L0_1 = 131008
TANKEVENTMASK_PARAM2 = L0_1
L0_1 = 127
TANKEVENTMASK_PARAM3 = L0_1
L0_1 = 21
TANKEVENTSHIFT_TYPE = L0_1
L0_1 = 17
TANKEVENTSHIFT_PARAM1 = L0_1
L0_1 = 7
TANKEVENTSHIFT_PARAM2 = L0_1
L0_1 = 0
TANKEVENTSHIFT_PARAM3 = L0_1
L0_1 = 1
TANKEVENT_GAMEOVER = L0_1
L0_1 = 2
TANKEVENT_TIMEUPDATE = L0_1
L0_1 = 3
TANKEVENT_TANK_DAMAGE = L0_1
L0_1 = 4
TANKEVENT_AQUIRE_TANK = L0_1
L0_1 = 5
TANKEVENT_PLAYERINTANK = L0_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2
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
    L5_2 = "Tank is sat on its ass waiting for "
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
  L4_2 = {}
  A0_2.TankSpawnPoints = L4_2
  L4_2 = {}
  A0_2.PlayerSpawnPoints = L4_2
  L4_2 = GameLocation
  L4_2 = L4_2()
  if L4_2 == 0 then
    L4_2 = {}
    L5_2 = {}
    L6_2 = {}
    L7_2 = 797.8071
    L8_2 = 207.5598
    L9_2 = 2.6607
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 358.5674
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = {}
    L7_2 = {}
    L8_2 = 929.1254
    L9_2 = -54.7401
    L10_2 = 6.8729
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = 355.8375
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = {}
    L8_2 = {}
    L9_2 = 1222.6725
    L10_2 = -85.2097
    L11_2 = 11.5875
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = 121.4133
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = 858.0843
    L11_2 = -204.6711
    L12_2 = 2.4764
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L10_2 = 87.2288
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = {}
    L10_2 = {}
    L11_2 = 1340.4441
    L12_2 = -252.3403
    L13_2 = 48.6063
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L11_2 = 265.8214
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L10_2 = {}
    L11_2 = {}
    L12_2 = 1159.9774
    L13_2 = -392.3391
    L14_2 = 25.804
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    L11_2[3] = L14_2
    L12_2 = 270.8189
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L11_2 = {}
    L12_2 = {}
    L13_2 = 863.2579
    L14_2 = -619.9805
    L15_2 = 13.7827
    L12_2[1] = L13_2
    L12_2[2] = L14_2
    L12_2[3] = L15_2
    L13_2 = 266.1452
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    L12_2 = {}
    L13_2 = {}
    L14_2 = 1012.097
    L15_2 = -855.1946
    L16_2 = 13.9287
    L13_2[1] = L14_2
    L13_2[2] = L15_2
    L13_2[3] = L16_2
    L14_2 = 356.2619
    L12_2[1] = L13_2
    L12_2[2] = L14_2
    L13_2 = {}
    L14_2 = {}
    L15_2 = 1229.6819
    L16_2 = -797.6679
    L17_2 = 13.693
    L14_2[1] = L15_2
    L14_2[2] = L16_2
    L14_2[3] = L17_2
    L15_2 = 215.9505
    L13_2[1] = L14_2
    L13_2[2] = L15_2
    L14_2 = {}
    L15_2 = {}
    L16_2 = 1550.7103
    L17_2 = -702.2163
    L18_2 = 10.7862
    L15_2[1] = L16_2
    L15_2[2] = L17_2
    L15_2[3] = L18_2
    L16_2 = 92.8023
    L14_2[1] = L15_2
    L14_2[2] = L16_2
    L15_2 = {}
    L16_2 = {}
    L17_2 = 880.7193
    L18_2 = -988.7128
    L19_2 = 4.0137
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L16_2[3] = L19_2
    L17_2 = 180.1849
    L15_2[1] = L16_2
    L15_2[2] = L17_2
    L16_2 = {}
    L17_2 = {}
    L18_2 = 1240.3583
    L19_2 = -1036.9274
    L20_2 = 13.826
    L17_2[1] = L18_2
    L17_2[2] = L19_2
    L17_2[3] = L20_2
    L18_2 = 271.3563
    L16_2[1] = L17_2
    L16_2[2] = L18_2
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L4_2[4] = L8_2
    L4_2[5] = L9_2
    L4_2[6] = L10_2
    L4_2[7] = L11_2
    L4_2[8] = L12_2
    L4_2[9] = L13_2
    L4_2[10] = L14_2
    L4_2[11] = L15_2
    L4_2[12] = L16_2
    A0_2.TankSpawnPoints = L4_2
    L4_2 = {}
    L5_2 = {}
    L6_2 = {}
    L7_2 = 1293.4583
    L8_2 = -934.6291
    L9_2 = 13.9326
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L6_2[3] = L9_2
    L7_2 = 9.3867
    L5_2[1] = L6_2
    L5_2[2] = L7_2
    L6_2 = {}
    L7_2 = {}
    L8_2 = 1037.981
    L9_2 = -933.4276
    L10_2 = 13.9326
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L7_2[3] = L10_2
    L8_2 = 307.8666
    L6_2[1] = L7_2
    L6_2[2] = L8_2
    L7_2 = {}
    L8_2 = {}
    L9_2 = 826.0873
    L10_2 = -848.7362
    L11_2 = 14.0352
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L8_2[3] = L11_2
    L9_2 = 340.377
    L7_2[1] = L8_2
    L7_2[2] = L9_2
    L8_2 = {}
    L9_2 = {}
    L10_2 = 1038.0424
    L11_2 = -671.6776
    L12_2 = 13.9326
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L9_2[3] = L12_2
    L10_2 = 195.6944
    L8_2[1] = L9_2
    L8_2[2] = L10_2
    L9_2 = {}
    L10_2 = {}
    L11_2 = 1203.441
    L12_2 = -512.1193
    L13_2 = 23.9328
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L10_2[3] = L13_2
    L11_2 = 57.2714
    L9_2[1] = L10_2
    L9_2[2] = L11_2
    L10_2 = {}
    L11_2 = {}
    L12_2 = 843.8878
    L13_2 = -507.8421
    L14_2 = 13.9326
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    L11_2[3] = L14_2
    L12_2 = 21.4699
    L10_2[1] = L11_2
    L10_2[2] = L12_2
    L11_2 = {}
    L12_2 = {}
    L13_2 = 1133.5897
    L14_2 = -194.7319
    L15_2 = 13.9326
    L12_2[1] = L13_2
    L12_2[2] = L14_2
    L12_2[3] = L15_2
    L13_2 = 149.1851
    L11_2[1] = L12_2
    L11_2[2] = L13_2
    L12_2 = {}
    L13_2 = {}
    L14_2 = 1356.6787
    L15_2 = -290.317
    L16_2 = 48.9329
    L13_2[1] = L14_2
    L13_2[2] = L15_2
    L13_2[3] = L16_2
    L14_2 = 336.6544
    L12_2[1] = L13_2
    L12_2[2] = L14_2
    L4_2[1] = L5_2
    L4_2[2] = L6_2
    L4_2[3] = L7_2
    L4_2[4] = L8_2
    L4_2[5] = L9_2
    L4_2[6] = L10_2
    L4_2[7] = L11_2
    L4_2[8] = L12_2
    A0_2.PlayerSpawnPoints = L4_2
  else
    L4_2 = GameLocation
    L4_2 = L4_2()
    if L4_2 == 1 then
      L4_2 = {}
      L5_2 = {}
      L6_2 = {}
      L7_2 = 155.8805
      L8_2 = 186.9074
      L9_2 = 10.6642
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 102.7052
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = 268.2766
      L9_2 = 53.4401
      L10_2 = 12.7449
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 40.6748
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = 176.0187
      L10_2 = -155.48
      L11_2 = 15.4296
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 77.6582
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = 51.3637
      L11_2 = -355.7569
      L12_2 = 15.1348
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 349.4941
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = 349.3484
      L12_2 = -447.7346
      L13_2 = 21.1986
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 88.0826
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L10_2 = {}
      L11_2 = {}
      L12_2 = 237.74
      L13_2 = -1156.3549
      L14_2 = 26.0804
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L11_2[3] = L14_2
      L12_2 = 90
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L11_2 = {}
      L12_2 = {}
      L13_2 = 463.3164
      L14_2 = -786.4393
      L15_2 = 15.1136
      L12_2[1] = L13_2
      L12_2[2] = L14_2
      L12_2[3] = L15_2
      L13_2 = 0.0033
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L12_2 = {}
      L13_2 = {}
      L14_2 = 44.9321
      L15_2 = -998.8205
      L16_2 = 25.5804
      L13_2[1] = L14_2
      L13_2[2] = L15_2
      L13_2[3] = L16_2
      L14_2 = 180
      L12_2[1] = L13_2
      L12_2[2] = L14_2
      L13_2 = {}
      L14_2 = {}
      L15_2 = 455.0771
      L16_2 = -1489.4423
      L17_2 = 17.6312
      L14_2[1] = L15_2
      L14_2[2] = L16_2
      L14_2[3] = L17_2
      L15_2 = 289.1265
      L13_2[1] = L14_2
      L13_2[2] = L15_2
      L14_2 = {}
      L15_2 = {}
      L16_2 = 268.7971
      L17_2 = -1679.5638
      L18_2 = 25.003
      L15_2[1] = L16_2
      L15_2[2] = L17_2
      L15_2[3] = L18_2
      L16_2 = 305.9543
      L14_2[1] = L15_2
      L14_2[2] = L16_2
      L15_2 = {}
      L16_2 = {}
      L17_2 = -124.1932
      L18_2 = -1149.4763
      L19_2 = 15.9319
      L16_2[1] = L17_2
      L16_2[2] = L18_2
      L16_2[3] = L19_2
      L17_2 = 355.1831
      L15_2[1] = L16_2
      L15_2[2] = L17_2
      L16_2 = {}
      L17_2 = {}
      L18_2 = -90.8065
      L19_2 = -439.4426
      L20_2 = 16.2269
      L17_2[1] = L18_2
      L17_2[2] = L19_2
      L17_2[3] = L20_2
      L18_2 = 96.0153
      L16_2[1] = L17_2
      L16_2[2] = L18_2
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L4_2[4] = L8_2
      L4_2[5] = L9_2
      L4_2[6] = L10_2
      L4_2[7] = L11_2
      L4_2[8] = L12_2
      L4_2[9] = L13_2
      L4_2[10] = L14_2
      L4_2[11] = L15_2
      L4_2[12] = L16_2
      A0_2.TankSpawnPoints = L4_2
      L4_2 = {}
      L5_2 = {}
      L6_2 = {}
      L7_2 = 164.25
      L8_2 = -622.24
      L9_2 = -100
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L6_2[3] = L9_2
      L7_2 = 0
      L5_2[1] = L6_2
      L5_2[2] = L7_2
      L6_2 = {}
      L7_2 = {}
      L8_2 = 47.52
      L9_2 = -635.31
      L10_2 = -100
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L7_2[3] = L10_2
      L8_2 = 0
      L6_2[1] = L7_2
      L6_2[2] = L8_2
      L7_2 = {}
      L8_2 = {}
      L9_2 = 39.34
      L10_2 = -724.23
      L11_2 = -100
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L8_2[3] = L11_2
      L9_2 = 0
      L7_2[1] = L8_2
      L7_2[2] = L9_2
      L8_2 = {}
      L9_2 = {}
      L10_2 = -116.2
      L11_2 = -1176.88
      L12_2 = -100
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L9_2[3] = L12_2
      L10_2 = 0
      L8_2[1] = L9_2
      L8_2[2] = L10_2
      L9_2 = {}
      L10_2 = {}
      L11_2 = -91.98
      L12_2 = -1383.62
      L13_2 = -100
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L10_2[3] = L13_2
      L11_2 = 0
      L9_2[1] = L10_2
      L9_2[2] = L11_2
      L10_2 = {}
      L11_2 = {}
      L12_2 = -29.16
      L13_2 = -1152.6
      L14_2 = -100
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L11_2[3] = L14_2
      L12_2 = 0
      L10_2[1] = L11_2
      L10_2[2] = L12_2
      L11_2 = {}
      L12_2 = {}
      L13_2 = 96.98
      L14_2 = -1097.28
      L15_2 = -100
      L12_2[1] = L13_2
      L12_2[2] = L14_2
      L12_2[3] = L15_2
      L13_2 = 0
      L11_2[1] = L12_2
      L11_2[2] = L13_2
      L4_2[1] = L5_2
      L4_2[2] = L6_2
      L4_2[3] = L7_2
      L4_2[4] = L8_2
      L4_2[5] = L9_2
      L4_2[6] = L10_2
      L4_2[7] = L11_2
      A0_2.PlayerSpawnPoints = L4_2
    else
      L4_2 = GameLocation
      L4_2 = L4_2()
      if L4_2 == 2 then
        L4_2 = {}
        L5_2 = {}
        L6_2 = {}
        L7_2 = -585.1682
        L8_2 = 337.9316
        L9_2 = 71.6561
        L6_2[1] = L7_2
        L6_2[2] = L8_2
        L6_2[3] = L9_2
        L7_2 = 0.233
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L6_2 = {}
        L7_2 = {}
        L8_2 = -334.1411
        L9_2 = 128.9998
        L10_2 = 7.3551
        L7_2[1] = L8_2
        L7_2[2] = L9_2
        L7_2[3] = L10_2
        L8_2 = 99.0586
        L6_2[1] = L7_2
        L6_2[2] = L8_2
        L7_2 = {}
        L8_2 = {}
        L9_2 = -528.0366
        L10_2 = -21.3841
        L11_2 = 2.8213
        L8_2[1] = L9_2
        L8_2[2] = L10_2
        L8_2[3] = L11_2
        L9_2 = 359.2286
        L7_2[1] = L8_2
        L7_2[2] = L9_2
        L8_2 = {}
        L9_2 = {}
        L10_2 = -1184.0801
        L11_2 = 304.2325
        L12_2 = 2.3991
        L9_2[1] = L10_2
        L9_2[2] = L11_2
        L9_2[3] = L12_2
        L10_2 = 181.0941
        L8_2[1] = L9_2
        L8_2[2] = L10_2
        L9_2 = {}
        L10_2 = {}
        L11_2 = -1124.5128
        L12_2 = 135.8386
        L13_2 = 57.7689
        L10_2[1] = L11_2
        L10_2[2] = L12_2
        L10_2[3] = L13_2
        L11_2 = 359.982
        L9_2[1] = L10_2
        L9_2[2] = L11_2
        L10_2 = {}
        L11_2 = {}
        L12_2 = -1206.1182
        L13_2 = 114.5237
        L14_2 = 67.5982
        L11_2[1] = L12_2
        L11_2[2] = L13_2
        L11_2[3] = L14_2
        L12_2 = 88.7102
        L10_2[1] = L11_2
        L10_2[2] = L12_2
        L11_2 = {}
        L12_2 = {}
        L13_2 = -1268.1327
        L14_2 = -152.1534
        L15_2 = 57.7441
        L12_2[1] = L13_2
        L12_2[2] = L14_2
        L12_2[3] = L15_2
        L13_2 = 1.9605
        L11_2[1] = L12_2
        L11_2[2] = L13_2
        L12_2 = {}
        L13_2 = {}
        L14_2 = -1062.7156
        L15_2 = -153.1494
        L16_2 = 32.7021
        L13_2[1] = L14_2
        L13_2[2] = L15_2
        L13_2[3] = L16_2
        L14_2 = 203.8334
        L12_2[1] = L13_2
        L12_2[2] = L14_2
        L13_2 = {}
        L14_2 = {}
        L15_2 = -741.3131
        L16_2 = 195.6344
        L17_2 = 27.6714
        L14_2[1] = L15_2
        L14_2[2] = L16_2
        L14_2[3] = L17_2
        L15_2 = 160.1146
        L13_2[1] = L14_2
        L13_2[2] = L15_2
        L14_2 = {}
        L15_2 = {}
        L16_2 = -877.9
        L17_2 = -201.54
        L18_2 = 32.8155
        L15_2[1] = L16_2
        L15_2[2] = L17_2
        L15_2[3] = L18_2
        L16_2 = 90
        L14_2[1] = L15_2
        L14_2[2] = L16_2
        L15_2 = {}
        L16_2 = {}
        L17_2 = -366.6813
        L18_2 = 260.2819
        L19_2 = 60.1424
        L16_2[1] = L17_2
        L16_2[2] = L18_2
        L16_2[3] = L19_2
        L17_2 = 192.7559
        L15_2[1] = L16_2
        L15_2[2] = L17_2
        L16_2 = {}
        L17_2 = {}
        L18_2 = -784.5757
        L19_2 = 312.2558
        L20_2 = 49.4734
        L17_2[1] = L18_2
        L17_2[2] = L19_2
        L17_2[3] = L20_2
        L18_2 = 343.633
        L16_2[1] = L17_2
        L16_2[2] = L18_2
        L4_2[1] = L5_2
        L4_2[2] = L6_2
        L4_2[3] = L7_2
        L4_2[4] = L8_2
        L4_2[5] = L9_2
        L4_2[6] = L10_2
        L4_2[7] = L11_2
        L4_2[8] = L12_2
        L4_2[9] = L13_2
        L4_2[10] = L14_2
        L4_2[11] = L15_2
        L4_2[12] = L16_2
        A0_2.TankSpawnPoints = L4_2
        L4_2 = {}
        L5_2 = {}
        L6_2 = {}
        L7_2 = -725.23
        L8_2 = 39.73
        L9_2 = -100
        L6_2[1] = L7_2
        L6_2[2] = L8_2
        L6_2[3] = L9_2
        L7_2 = 0
        L5_2[1] = L6_2
        L5_2[2] = L7_2
        L6_2 = {}
        L7_2 = {}
        L8_2 = -748.79
        L9_2 = -583.35
        L10_2 = -100
        L7_2[1] = L8_2
        L7_2[2] = L9_2
        L7_2[3] = L10_2
        L8_2 = 0
        L6_2[1] = L7_2
        L6_2[2] = L8_2
        L7_2 = {}
        L8_2 = {}
        L9_2 = -715.24
        L10_2 = -721.57
        L11_2 = 8.85
        L8_2[1] = L9_2
        L8_2[2] = L10_2
        L8_2[3] = L11_2
        L9_2 = 0
        L7_2[1] = L8_2
        L7_2[2] = L9_2
        L8_2 = {}
        L9_2 = {}
        L10_2 = -648.56
        L11_2 = -152.97
        L12_2 = 3.71
        L9_2[1] = L10_2
        L9_2[2] = L11_2
        L9_2[3] = L12_2
        L10_2 = 0
        L8_2[1] = L9_2
        L8_2[2] = L10_2
        L9_2 = {}
        L10_2 = {}
        L11_2 = -861.49
        L12_2 = 172.22
        L13_2 = -100
        L10_2[1] = L11_2
        L10_2[2] = L12_2
        L10_2[3] = L13_2
        L11_2 = 0
        L9_2[1] = L10_2
        L9_2[2] = L11_2
        L10_2 = {}
        L11_2 = {}
        L12_2 = -1211.44
        L13_2 = 412.65
        L14_2 = -100
        L11_2[1] = L12_2
        L11_2[2] = L13_2
        L11_2[3] = L14_2
        L12_2 = 0
        L10_2[1] = L11_2
        L10_2[2] = L12_2
        L4_2[1] = L5_2
        L4_2[2] = L6_2
        L4_2[3] = L7_2
        L4_2[4] = L8_2
        L4_2[5] = L9_2
        L4_2[6] = L10_2
        A0_2.PlayerSpawnPoints = L4_2
      end
    end
  end
  L4_2 = UseSuperBrakeOnPause
  L5_2 = false
  L4_2(L5_2)
  L4_2 = "removeSplashTextNow"
  L5_2 = false
  A0_2[L4_2] = L5_2
  L4_2 = "allPlayerDamage"
  L5_2 = {}
  A0_2[L4_2] = L5_2
  L6_2 = "ClearDamageArray"
  L5_2 = A0_2
  L4_2 = A0_2[L6_2]
  L4_2(L5_2)
  L4_2 = "scores"
  L5_2 = {}
  A0_2[L4_2] = L5_2
  L4_2 = "mypickups"
  L5_2 = PickupMgr
  L5_2 = L5_2()
  A0_2[L4_2] = L5_2
  L4_2 = "mypickups"
  L4_2 = A0_2[L4_2]
  L6_2 = "CreatePickups"
  L5_2 = L4_2
  L4_2 = L4_2[L6_2]
  L4_2(L5_2)
  L4_2 = "InATank"
  L5_2 = false
  A0_2[L4_2] = L5_2
  L4_2 = "winningPlayer"
  A0_2[L4_2] = 0
  L4_2 = IsServer
  L4_2 = L4_2()
  if L4_2 then
    L4_2 = UsePowerups
    L4_2 = L4_2()
    if L4_2 then
      L4_2 = PowerUpTimer
      L6_2 = "Start"
      L5_2 = L4_2
      L4_2 = L4_2[L6_2]
      L4_2(L5_2)
      L4_2 = DoesPowerupExist
      L4_2 = L4_2()
      if L4_2 < 2 then
        L4_2 = print
        L5_2 = "Respawning a power up at change sides"
        L4_2(L5_2)
        L4_2 = PowerUpTimer
        L6_2 = "CreateAPowerUp"
        L5_2 = L4_2
        L4_2 = L4_2[L6_2]
        L4_2(L5_2)
      end
      L4_2 = DoesPowerupExist
      L4_2 = L4_2()
      if L4_2 < 2 then
        L4_2 = print
        L5_2 = "Respawning another power up at change sides"
        L4_2(L5_2)
        L4_2 = PowerUpTimer
        L6_2 = "CreateAPowerUp"
        L5_2 = L4_2
        L4_2 = L4_2[L6_2]
        L4_2(L5_2)
      end
    end
  end
  L4_2 = Wait
  L5_2 = 1000
  L4_2(L5_2)
  L4_2 = "players"
  L5_2 = {}
  A0_2[L4_2] = L5_2
  L4_2 = "totalmins"
  L5_2 = {}
  A0_2[L4_2] = L5_2
  L4_2 = "totalseconds"
  L5_2 = {}
  A0_2[L4_2] = L5_2
  L4_2 = "allplayers"
  L5_2 = AllPlayers
  L5_2 = L5_2()
  A0_2[L4_2] = L5_2
  L4_2 = ipairs
  L5_2 = "allplayers"
  L5_2 = A0_2[L5_2]
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L6_2, L7_2 in L4_2, L5_2 do
    L8_2 = print
    L9_2 = "Insert "
    L10_2 = L6_2
    L9_2 = L9_2 .. L10_2
    L8_2(L9_2)
    L8_2 = table
    L9_2 = "insert"
    L8_2 = L8_2[L9_2]
    L9_2 = "players"
    L9_2 = A0_2[L9_2]
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
  L4_2 = 0
  goto lbl_640
  repeat
    L5_2 = "totalmins"
    L5_2 = A0_2[L5_2]
    L5_2[L4_2] = 0
    L5_2 = "totalseconds"
    L5_2 = A0_2[L5_2]
    L5_2[L4_2] = 0
    L4_2 = L4_2 + 1
    ::lbl_640::
    L5_2 = 8
  until not (L4_2 <= L5_2)
  L5_2 = "localplayer"
  L6_2 = Player
  L7_2 = PlayerId
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L7_2()
  L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  A0_2[L5_2] = L6_2
  L5_2 = Player
  L5_2 = L5_2()
  L6_2 = "tankDamage"
  A0_2[L6_2] = 0
  L6_2 = "SplashTextIsOnScreen"
  L7_2 = false
  A0_2[L6_2] = L7_2
  L6_2 = "tankDam"
  L7_2 = nil
  A0_2[L6_2] = L7_2
  L6_2 = "tankDmgTxt"
  L7_2 = nil
  A0_2[L6_2] = L7_2
  L6_2 = "tanktime"
  L7_2 = nil
  A0_2[L6_2] = L7_2
  L8_2 = "ShowHUD"
  L7_2 = A0_2
  L6_2 = A0_2[L8_2]
  L8_2 = false
  L6_2(L7_2, L8_2)
  L6_2 = "EndOfGame"
  L7_2 = false
  A0_2[L6_2] = L7_2
  L6_2 = "myMessagePump"
  L7_2 = TankMessagePump
  L7_2 = L7_2()
  A0_2[L6_2] = L7_2
  L6_2 = "myMessagePump"
  L6_2 = A0_2[L6_2]
  L8_2 = "Start"
  L7_2 = L6_2
  L6_2 = L6_2[L8_2]
  L6_2(L7_2)
  L6_2 = Wait
  L7_2 = 100
  L6_2(L7_2)
  L6_2 = "currentTank"
  L7_2 = nil
  A0_2[L6_2] = L7_2
  L6_2 = IsServer
  L6_2 = L6_2()
  if L6_2 then
    L8_2 = "GetTankRespawnPosition"
    L7_2 = A0_2
    L6_2 = A0_2[L8_2]
    L6_2 = L6_2(L7_2)
    L7_2 = "currentTank"
    L8_2 = CreateVehicle
    L9_2 = TankModel
    L9_2 = L9_2()
    L10_2 = L6_2
    L11_2 = 4
    L11_2 = L6_2[L11_2]
    L8_2 = L8_2(L9_2, L10_2, L11_2)
    A0_2[L7_2] = L8_2
    L7_2 = VehicleAdd3dMarker
    L8_2 = "currentTank"
    L8_2 = A0_2[L8_2]
    L7_2(L8_2)
    L7_2 = VehicleSetCarDoorLocks
    L8_2 = "currentTank"
    L8_2 = A0_2[L8_2]
    L9_2 = CARLOCK_UNLOCKED
    L7_2(L8_2, L9_2)
  end
  L6_2 = "StartGameRunForTank"
  L7_2 = true
  A0_2[L6_2] = L7_2
  L6_2 = "TankRadarBlip"
  L7_2 = nil
  A0_2[L6_2] = L7_2
  L6_2 = "localplayer"
  L6_2 = A0_2[L6_2]
  L8_2 = "PlayerNum"
  L7_2 = L6_2
  L6_2 = L6_2[L8_2]
  L6_2 = L6_2(L7_2)
  L7_2 = playerintank
  if L6_2 ~= L7_2 then
    L6_2 = main
    L7_2 = "vSpawnPoints"
    L8_2 = A0_2.PlayerSpawnPoints
    L6_2[L7_2] = L8_2
    L6_2 = DoSpawn
    L7_2 = InitialSpawnPoint
    L8_2 = PlayerId
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L8_2()
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L8_2 = false
    L6_2 = L6_2(L7_2, L8_2)
    L7_2 = print
    L8_2 = "^S^ "
    L9_2 = PlayerId
    L9_2 = L9_2()
    L10_2 = "^S^ "
    L11_2 = InitialSpawnPoint
    L12_2 = PlayerId
    L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L12_2()
    L11_2 = L11_2(L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
    L7_2(L8_2)
    L7_2 = "localplayer"
    L7_2 = A0_2[L7_2]
    L9_2 = "Respawn"
    L8_2 = L7_2
    L7_2 = L7_2[L9_2]
    L9_2 = L6_2
    L10_2 = 4
    L10_2 = L6_2[L10_2]
    L7_2(L8_2, L9_2, L10_2)
  end
  L6_2 = "client"
  L7_2 = {}
  A0_2[L6_2] = L7_2
  L6_2 = IsServer
  L6_2 = L6_2()
  if L6_2 then
    L6_2 = pairs
    L7_2 = "players"
    L7_2 = A0_2[L7_2]
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
    for L8_2, L9_2 in L6_2, L7_2 do
      L10_2 = "client"
      L10_2 = A0_2[L10_2]
      L11_2 = MultiTankClient
      L12_2 = {}
      L13_2 = L9_2
      L12_2[1] = L13_2
      L11_2 = L11_2(L12_2)
      L13_2 = "Start"
      L12_2 = L11_2
      L11_2 = L11_2[L13_2]
      L11_2 = L11_2(L12_2)
      L10_2[L9_2] = L11_2
    end
  end
  L6_2 = Wait
  L7_2 = 100
  L6_2(L7_2)
  L6_2 = NoFuckingCutscene
  L6_2 = L6_2()
  if not L6_2 then
    L6_2 = main
    L7_2 = "scores"
    L6_2 = L6_2[L7_2]
    L8_2 = "Hide"
    L7_2 = L6_2
    L6_2 = L6_2[L8_2]
    L8_2 = true
    L6_2(L7_2, L8_2)
    L6_2 = Wait
    L7_2 = 5
    L6_2(L7_2)
    goto lbl_802
    repeat
      L6_2 = Wait
      L7_2 = 5
      L6_2(L7_2)
      ::lbl_802::
      L6_2 = SyncCutScene
      L6_2 = L6_2()
      L7_2 = false
    until L6_2 ~= L7_2
    L6_2 = RunScriptedCutscene
    L6_2()
    L6_2 = Wait
    L7_2 = 0
    L6_2(L7_2)
    goto lbl_816
    repeat
      L6_2 = Wait
      L7_2 = 0
      L6_2(L7_2)
      ::lbl_816::
      L6_2 = ProcessScriptedCutscene
      L6_2 = L6_2()
    until not L6_2
    L6_2 = main
    L7_2 = "scores"
    L6_2 = L6_2[L7_2]
    L8_2 = "Hide"
    L7_2 = L6_2
    L6_2 = L6_2[L8_2]
    L8_2 = false
    L6_2(L7_2, L8_2)
  else
    L6_2 = Wait
    L7_2 = 20
    L6_2(L7_2)
    L6_2 = ClearSplashScreen
    L6_2()
  end
  L6_2 = GenerateAmbients
  L7_2 = true
  L6_2(L7_2)
  L8_2 = "ShowHUD"
  L7_2 = A0_2
  L6_2 = A0_2[L8_2]
  L8_2 = true
  L6_2(L7_2, L8_2)
  L6_2 = SetGameTime
  L7_2 = GameTimeLimit
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2 = L7_2()
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2, L19_2, L20_2)
  L6_2 = GameElapsedMs
  L7_2 = 0
  L6_2(L7_2)
  L6_2 = UpdateGameTime
  L7_2 = true
  L6_2(L7_2)
  L8_2 = "Commentate"
  L7_2 = A0_2
  L6_2 = A0_2[L8_2]
  L8_2 = "^T^MPTNK"
  L6_2(L7_2, L8_2)
  L6_2 = "StateRunning"
  return L6_2
end
L0_1.StateInit = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "Tank Cleanup"
  L1_2(L2_2)
  L1_2 = true
  A0_2.removeSplashTextNow = L1_2
  L1_2 = Wait
  L2_2 = 20
  L1_2(L2_2)
  L1_2 = A0_2.tankDam
  if L1_2 ~= nil then
    L1_2 = A0_2.tankDam
    L1_2 = L1_2.Remove
    L1_2()
    A0_2.tankDam = nil
  end
  L1_2 = A0_2.tankDmgTxt
  if L1_2 ~= nil then
    L1_2 = A0_2.tankDmgTxt
    L1_2 = L1_2.Remove
    L1_2()
    A0_2.tankDmgTxt = nil
  end
  L1_2 = A0_2.tanktime
  if L1_2 ~= nil then
    L1_2 = A0_2.tanktime
    L1_2 = L1_2.Remove
    L1_2()
    A0_2.tanktime = nil
  end
  L1_2 = collectgarbage
  L1_2()
  L1_2 = A0_2.mypickups
  L2_2 = L1_2
  L1_2 = L1_2.Cleanup
  L1_2(L2_2)
  L1_2 = A0_2.myMessagePump
  L2_2 = L1_2
  L1_2 = L1_2.Stop
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2
  L2_2 = A0_2
  L1_2 = A0_2.UpdateDamageDoneToTank
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.CheckPutInTank
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.CheckForRespawn_NoTank
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.UpdateRadar
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.CheckForGameOver
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.CheckForTankDisconnection
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.CheckForEndGame
  L1_2(L2_2)
  L1_2 = Wait
  L2_2 = 10
  L1_2(L2_2)
  L1_2 = collectgarbage
  L1_2()
end
L0_1.StateRunning = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = IsServer
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = A0_2.StartGameRunForTank
    L3_2 = true
    if L2_2 == L3_2 then
      L2_2 = IsVehicleWrecked
      L3_2 = A0_2.currentTank
      L2_2 = L2_2(L3_2)
      if L2_2 then
        L3_2 = A0_2
        L2_2 = A0_2.GetTankRespawnPosition
        L2_2 = L2_2(L3_2)
        L3_2 = CreateVehicle
        L4_2 = TankModel
        L4_2 = L4_2()
        L5_2 = L2_2
        L6_2 = L2_2[4]
        L3_2 = L3_2(L4_2, L5_2, L6_2)
        A0_2.currentTank = L3_2
        L3_2 = VehicleAdd3dMarker
        L4_2 = A0_2.currentTank
        L3_2(L4_2)
        L3_2 = VehicleSetCarDoorLocks
        L4_2 = A0_2.currentTank
        L5_2 = CARLOCK_UNLOCKED
        L3_2(L4_2, L5_2)
      end
    end
  end
  L2_2 = A0_2.StartGameRunForTank
  L3_2 = true
  if L2_2 == L3_2 then
    L3_2 = L1_2
    L2_2 = L1_2.InATank
    L2_2 = L2_2(L3_2)
    if L2_2 then
      L2_2 = GetLocalPlayersVehicle
      L2_2 = L2_2()
      A0_2.currentTank = L2_2
      L3_2 = A0_2
      L2_2 = A0_2.DoSendEvent
      L4_2 = TANKEVENT_AQUIRE_TANK
      L5_2 = PlayerId
      L5_2 = L5_2()
      L6_2 = 0
      L7_2 = 0
      L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
      L2_2 = Wait
      L3_2 = 200
      L2_2(L3_2)
    end
  end
  L2_2 = PlayerId
  L2_2 = L2_2()
  L3_2 = playerintank
  if L2_2 == L3_2 then
    L2_2 = IsLocalPlayerDrowning
    L2_2 = L2_2()
    L3_2 = false
    if L2_2 == L3_2 then
      L3_2 = L1_2
      L2_2 = L1_2.InATank
      L2_2 = L2_2(L3_2)
      if not L2_2 then
        L3_2 = A0_2
        L2_2 = A0_2.TransferPlayerToTank
        L2_2(L3_2)
      end
    end
  end
end
L0_1.CheckPutInTank = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = PlayerId
  L1_2 = L1_2()
  L2_2 = playerintank
  if L1_2 ~= L2_2 then
    L1_2 = A0_2.StartGameRunForTank
    L2_2 = true
    if L1_2 ~= L2_2 then
      goto lbl_72
    end
    L1_2 = IsServer
    L1_2 = L1_2()
    if not L1_2 then
      goto lbl_72
    end
  end
  L1_2 = nil
  L2_2 = VehiclePosition
  L3_2 = A0_2.currentTank
  L2_2 = L2_2(L3_2)
  L1_2 = L2_2
  if L1_2 ~= nil then
    L2_2 = L1_2[3]
    L2_2 = L2_2 + 1000
    L1_2[3] = L2_2
    L2_2 = A0_2.TankRadarBlip
    if L2_2 ~= nil then
      L2_2 = UpdateBlipCoord
      L3_2 = A0_2.TankRadarBlip
      L4_2 = L1_2
      L2_2(L3_2, L4_2)
    else
      L2_2 = AddBlipForCoord
      L3_2 = L1_2
      L4_2 = 3
      L5_2 = pickupicon
      L5_2 = L5_2.tank
      L2_2 = L2_2(L3_2, L4_2, L5_2)
      A0_2.TankRadarBlip = L2_2
    end
    L2_2 = PlayerId
    L2_2 = L2_2()
    L3_2 = playerintank
    if L2_2 == L3_2 then
      L2_2 = Player
      L2_2 = L2_2()
      L3_2 = SetBlipVisibleForPlayerState
      L4_2 = A0_2.TankRadarBlip
      L6_2 = L2_2
      L5_2 = L2_2.PlayerNum
      L5_2 = L5_2(L6_2)
      L6_2 = false
      L3_2(L4_2, L5_2, L6_2)
    end
    L2_2 = A0_2.StartGameRunForTank
    L3_2 = false
    if L2_2 == L3_2 then
      L2_2 = A0_2.TankRadarBlip
      if L2_2 ~= nil then
        L2_2 = SetRadarBlipColour
        L3_2 = A0_2.TankRadarBlip
        L4_2 = VehicleGetDriverPlayerColour
        L5_2 = A0_2.currentTank
        L4_2, L5_2, L6_2 = L4_2(L5_2)
        L2_2(L3_2, L4_2, L5_2, L6_2)
        L2_2 = L1_2[2]
        L2_2 = L2_2 + 1
        L1_2[2] = L2_2
        L2_2 = UpdateBlipCoord
        L3_2 = A0_2.TankRadarBlip
        L4_2 = L1_2
        L2_2(L3_2, L4_2)
      end
    end
  end
  ::lbl_72::
end
L0_1.UpdateRadar = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.PlayerNum
  L2_2 = L2_2(L3_2)
  L3_2 = playerintank
  if L2_2 == L3_2 then
    L2_2 = LimitTankSpeed
    L3_2 = A0_2.currentTank
    L2_2(L3_2)
    L2_2 = VehicleHealth
    L3_2 = A0_2.currentTank
    L2_2 = L2_2(L3_2)
    L2_2 = 1000 - L2_2
    A0_2.tankDamage = L2_2
    L2_2 = A0_2.tankDamage
    L2_2 = L2_2 / 7.5
    if L2_2 < 0 then
      L2_2 = 0
    elseif 100 < L2_2 then
      L2_2 = 100
    end
    L3_2 = string
    L3_2 = L3_2.format
    L4_2 = "%.3d"
    L5_2 = L2_2
    L3_2 = L3_2(L4_2, L5_2)
    L4_2 = A0_2.tankDmgTxt
    if L4_2 ~= nil then
      L4_2 = A0_2.tankDmgTxt
      L5_2 = L4_2
      L4_2 = L4_2.Text
      L6_2 = "^S^ "
      L7_2 = L3_2
      L8_2 = "%"
      L6_2 = L6_2 .. L7_2 .. L8_2
      L4_2(L5_2, L6_2)
    end
    L4_2 = VehicleGetLastDamageAmount
    L5_2 = A0_2.currentTank
    L4_2 = L4_2(L5_2)
    L5_2 = VehicleGetLastDamagePlayerID
    L6_2 = A0_2.currentTank
    L5_2 = L5_2(L6_2)
    if 0 < L4_2 and L5_2 ~= -1 then
      L6_2 = VehicleClearLastDamagePlayerID
      L7_2 = A0_2.currentTank
      L6_2(L7_2)
      L7_2 = A0_2
      L6_2 = A0_2.DoSendEvent
      L8_2 = TANKEVENT_TANK_DAMAGE
      L9_2 = L5_2
      L10_2 = L4_2
      L11_2 = 0
      L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
    end
  end
end
L0_1.UpdateDamageDoneToTank = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = table
    L1_2 = L1_2.getn
    L2_2 = A0_2.players
    L1_2 = L1_2(L2_2)
    L2_2 = 0
    L3_2 = nil
    if L1_2 == 1 then
      L4_2 = print
      L5_2 = "All Clients Gone, Quiting"
      L4_2(L5_2)
      L4_2 = UpdateGameTime
      L5_2 = false
      L4_2(L5_2)
      A0_2.winningPlayer = 0
      L4_2 = true
      A0_2.EndOfGame = L4_2
    end
    L4_2 = 0
    L5_2 = L1_2
    L6_2 = 1
    L4_2 = L4_2 - L6_2
    for L4_2 = L4_2, L5_2, L6_2 do
      L8_2 = A0_2
      L7_2 = A0_2.GetTimeMinutes
      L9_2 = L4_2
      L7_2 = L7_2(L8_2, L9_2)
      L3_2 = L7_2 * 60000
      L8_2 = A0_2
      L7_2 = A0_2.GetTimeSeconds
      L9_2 = L4_2
      L7_2 = L7_2(L8_2, L9_2)
      L7_2 = L7_2 * 1000
      L3_2 = L3_2 + L7_2
      L7_2 = GameScoreLimit
      L7_2 = L7_2()
      L7_2 = L7_2 * 60000
      if L3_2 >= L7_2 then
        L7_2 = Tank
        L8_2 = L7_2
        L7_2 = L7_2.DoSendEvent
        L9_2 = TANKEVENT_GAMEOVER
        L10_2 = L4_2
        L11_2 = 0
        L12_2 = 0
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      end
    end
  end
end
L0_1.CheckForGameOver = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L1_2 = IsServer
  L1_2 = L1_2()
  if L1_2 then
    L1_2 = playerintank
    if L1_2 ~= -1 then
      L1_2 = Player
      L2_2 = playerintank
      L1_2 = L1_2(L2_2)
      L2_2 = IsConnected
      L3_2 = L1_2
      L2_2 = L2_2(L3_2)
      if not L2_2 then
        L2_2 = print
        L3_2 = "Player has left the game and was in a tank "
        L4_2 = playerintank
        L3_2 = L3_2 .. L4_2
        L2_2(L3_2)
        L3_2 = A0_2
        L2_2 = A0_2.ChoosePlayerInTank
        L2_2(L3_2)
        L2_2 = Tank
        L3_2 = L2_2
        L2_2 = L2_2.DoSendEvent
        L4_2 = TANKEVENT_PLAYERINTANK
        L5_2 = playerintank
        L6_2 = 0
        L7_2 = 0
        L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
      end
    end
  end
end
L0_1.CheckForTankDisconnection = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = table
  L1_2 = L1_2.getn
  L2_2 = A0_2.players
  L1_2 = L1_2(L2_2)
  L2_2 = false
  L3_2 = nil
  while not L2_2 do
    L4_2 = math
    L4_2 = L4_2.random
    L5_2 = 0
    L6_2 = L1_2 - 1
    L4_2 = L4_2(L5_2, L6_2)
    L3_2 = L4_2
    L4_2 = playerintank
    if L3_2 ~= L4_2 then
      L4_2 = IsConnected
      L5_2 = Player
      L6_2 = L3_2
      L5_2, L6_2 = L5_2(L6_2)
      L4_2 = L4_2(L5_2, L6_2)
      L2_2 = L4_2
    end
  end
  playerintank = L3_2
  L4_2 = print
  L5_2 = "Player In Tank Is "
  L6_2 = playerintank
  L5_2 = L5_2 .. L6_2
  L4_2(L5_2)
  L4_2 = TargetPlayer
  L5_2 = playerintank
  L4_2(L5_2)
end
L0_1.ChoosePlayerInTank = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L1_2 = Wait
  L2_2 = 2000
  L1_2(L2_2)
  L1_2 = IsLocalPlayerEnteringAVehicle
  L1_2 = L1_2()
  if L1_2 then
    return
  end
  L1_2 = print
  L2_2 = "Respawning player in transferplayertotank"
  L1_2(L2_2)
  L1_2 = CameraFadeOut
  L2_2 = 3
  L1_2(L2_2)
  L2_2 = A0_2
  L1_2 = A0_2.GetTankRespawnPosition
  L1_2 = L1_2(L2_2)
  L2_2 = print
  L3_2 = "Transfering player to a tank"
  L2_2(L3_2)
  L2_2 = L1_2
  L1_2[3] = -100
  L3_2 = print
  L4_2 = [[

x == ]]
  L5_2 = L2_2[1]
  L4_2 = L4_2 .. L5_2
  L3_2(L4_2)
  L3_2 = print
  L4_2 = [[

y == ]]
  L5_2 = L2_2[2]
  L4_2 = L4_2 .. L5_2
  L3_2(L4_2)
  L3_2 = print
  L4_2 = [[

z == ]]
  L5_2 = L2_2[3]
  L4_2 = L4_2 .. L5_2
  L3_2(L4_2)
  L3_2 = print
  L4_2 = [[

heading == ]]
  L5_2 = L2_2[4]
  L4_2 = L4_2 .. L5_2
  L3_2(L4_2)
  L3_2 = ClearLocalPlayerLockOn
  L3_2()
  L3_2 = IsLocalPlayerInVehicle
  L3_2 = L3_2()
  if L3_2 then
    L3_2 = print
    L4_2 = "Ped is in a vehicle, get the f*ck out !!!"
    L3_2(L4_2)
    L4_2 = A0_2
    L3_2 = A0_2.KickDriverOutOfCar
    L5_2 = GetLocalPlayersVehicle
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L5_2()
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  end
  L3_2 = PlayerHealth
  L4_2 = Player
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L4_2()
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  if not (L3_2 <= 1) then
    L3_2 = IsLocalPlayerInVehicle
    L3_2 = L3_2()
    if not L3_2 then
      goto lbl_73
    end
  end
  L3_2 = print
  L4_2 = "respawn player for tank"
  L3_2(L4_2)
  L3_2 = A0_2.localplayer
  L4_2 = L3_2
  L3_2 = L3_2.Respawn
  L5_2 = L2_2
  L6_2 = L2_2[4]
  L3_2(L4_2, L5_2, L6_2)
  ::lbl_73::
  L3_2 = Player
  L3_2 = L3_2()
  L5_2 = L3_2
  L4_2 = L3_2.IsPlaying
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L4_2 = print
    L5_2 = "**************** NOT PLAYING RESPAWN"
    L4_2(L5_2)
    L4_2 = A0_2.localplayer
    L5_2 = L4_2
    L4_2 = L4_2.Respawn
    L6_2 = L2_2
    L7_2 = L2_2[4]
    L4_2(L5_2, L6_2, L7_2)
  end
  L4_2 = CreateVehicle
  L5_2 = TankModel
  L5_2 = L5_2()
  L6_2 = L2_2
  L7_2 = L2_2[4]
  L4_2 = L4_2(L5_2, L6_2, L7_2)
  A0_2.currentTank = L4_2
  L4_2 = VehicleAdd3dMarker
  L5_2 = A0_2.currentTank
  L4_2(L5_2)
  L4_2 = SetPosition
  L5_2 = Player
  L6_2 = PlayerId
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2 = L6_2()
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2)
  L6_2 = L1_2
  L4_2(L5_2, L6_2)
  L4_2 = WarpPlayerIntoCar
  L5_2 = PlayerId
  L5_2 = L5_2()
  L6_2 = A0_2.currentTank
  L4_2(L5_2, L6_2)
  L4_2 = true
  A0_2.InATank = L4_2
  L4_2 = Player
  L4_2 = L4_2()
  L5_2 = ShowRadar
  L6_2 = true
  L5_2(L6_2)
  L5_2 = CameraFadeIn
  L6_2 = 5
  L5_2(L6_2)
  L6_2 = A0_2
  L5_2 = A0_2.DisplayTankMessage
  L7_2 = "^T^MPTNKGA"
  L8_2 = 1500
  L9_2 = "^T^MPTNKGB"
  L10_2 = {}
  L11_2 = 255
  L12_2 = 255
  L13_2 = 255
  L14_2 = 255
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L11_2 = {}
  L12_2 = 255
  L13_2 = 255
  L14_2 = 255
  L15_2 = 255
  L11_2[1] = L12_2
  L11_2[2] = L13_2
  L11_2[3] = L14_2
  L11_2[4] = L15_2
  L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2)
end
L0_1.TransferPlayerToTank = L1_1
L0_1 = Tank
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
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2
  L1_2 = Player
  L1_2 = L1_2()
  L3_2 = L1_2
  L2_2 = L1_2.PlayerNum
  L2_2 = L2_2(L3_2)
  L3_2 = playerintank
  if L2_2 ~= L3_2 then
    L3_2 = L1_2
    L2_2 = L1_2.IsPlaying
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = DoWasted
      L2_2()
      L3_2 = A0_2
      L2_2 = A0_2.GetOnFootRespawnPosition
      L2_2 = L2_2(L3_2)
      L3_2 = A0_2.localplayer
      L4_2 = L3_2
      L3_2 = L3_2.Respawn
      L5_2 = L2_2
      L6_2 = L2_2[4]
      L3_2(L4_2, L5_2, L6_2)
    end
  end
end
L0_1.CheckForRespawn_NoTank = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
  L1_2 = A0_2.EndOfGame
  L2_2 = true
  if L1_2 == L2_2 then
    L1_2 = main
    L1_2 = L1_2.game
    L1_2.state = "StateGameWon"
    L1_2 = Wait
    L2_2 = 100
    L1_2(L2_2)
    L1_2 = -1
    L2_2 = 0
    L3_2 = IsServer
    L3_2 = L3_2()
    if L3_2 then
      L3_2 = pairs
      L4_2 = A0_2.players
      L3_2, L4_2, L5_2, L6_2 = L3_2(L4_2)
      for L5_2, L6_2 in L3_2, L4_2 do
        L7_2 = A0_2.client
        L7_2 = L7_2[L6_2]
        L8_2 = L7_2
        L7_2 = L7_2.Stop
        L7_2(L8_2)
      end
    end
    L3_2 = UpdateGameTime
    L4_2 = false
    L3_2(L4_2)
    L3_2 = Player
    L4_2 = A0_2.winningPlayer
    L3_2 = L3_2(L4_2)
    L4_2 = Player
    L4_2 = L4_2()
    L5_2 = nil
    L7_2 = L4_2
    L6_2 = L4_2.PlayerNum
    L6_2 = L6_2(L7_2)
    L7_2 = A0_2.winningPlayer
    if L6_2 == L7_2 then
      L5_2 = 1
    else
      L5_2 = 2
    end
    if L5_2 == 1 then
      L6_2 = DisplayFinalWinLoseMessage
      L7_2 = L5_2
      L8_2 = "^S^"
      L6_2(L7_2, L8_2)
    else
      L6_2 = DisplayFinalWinLoseMessage
      L7_2 = L5_2
      L8_2 = "^S^"
      L6_2(L7_2, L8_2)
    end
    L6_2 = main
    L6_2 = L6_2.scores
    L7_2 = L6_2
    L6_2 = L6_2.ToggleUpdate
    L8_2 = false
    L6_2(L7_2, L8_2)
    L6_2 = main
    L6_2 = L6_2.scores
    L7_2 = L6_2
    L6_2 = L6_2.Show
    L8_2 = true
    L6_2(L7_2, L8_2)
    L6_2 = Wait
    L7_2 = 12000
    L6_2(L7_2)
    L6_2 = main
    L6_2 = L6_2.scores
    L7_2 = L6_2
    L6_2 = L6_2.Hide
    L6_2(L7_2)
    L6_2 = main
    L7_2 = L6_2
    L6_2 = L6_2.EndGame
    L6_2(L7_2)
  end
end
L0_1.CheckForEndGame = L1_1
L0_1 = Tank
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
L0_1 = Tank
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = 0
  L3_2 = A0_2.totalmins
  L5_2 = A1_2
  L4_2 = A1_2.PlayerNum
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2[L4_2]
  L2_2 = L3_2 * 60
  L3_2 = A0_2.totalseconds
  L5_2 = A1_2
  L4_2 = A1_2.PlayerNum
  L4_2 = L4_2(L5_2)
  L3_2 = L3_2[L4_2]
  L2_2 = L2_2 + L3_2
  return L2_2
end
L0_1.Score = L1_1
L0_1 = Tank
function L1_1(A0_2, A1_2, A2_2, A3_2)
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L4_2 = print
  L5_2 = "***RegisterPlayerKill***"
  L4_2(L5_2)
  L4_2 = Player
  L4_2 = L4_2()
  L6_2 = L4_2
  L5_2 = L4_2.PlayerNum
  L5_2 = L5_2(L6_2)
  L7_2 = A1_2
  L6_2 = A1_2.PlayerNum
  L6_2 = L6_2(L7_2)
  if L5_2 == L6_2 then
    L6_2 = L4_2
    L5_2 = L4_2.PlayerNum
    L5_2 = L5_2(L6_2)
    L6_2 = playerintank
    if L5_2 == L6_2 then
      L5_2 = A0_2.currentTank
      if L5_2 ~= nil then
        L5_2 = VehicleRemove3dMarker
        L6_2 = A0_2.currentTank
        L5_2(L6_2)
      end
    end
  end
  L6_2 = A0_2
  L5_2 = A0_2.UpdateDamageDoneToTank
  L5_2(L6_2)
  L5_2 = IsServer
  L5_2 = L5_2()
  if L5_2 then
    L6_2 = A1_2
    L5_2 = A1_2.PlayerNum
    L5_2 = L5_2(L6_2)
    L6_2 = playerintank
    if L5_2 == L6_2 then
      L6_2 = A1_2
      L5_2 = A1_2.InATank
      L5_2 = L5_2(L6_2)
      if L5_2 then
        L6_2 = A0_2
        L5_2 = A0_2.PlayerWhoDamagedTankMost
        L5_2 = L5_2(L6_2)
        L6_2 = playerintank
        if L5_2 ~= L6_2 then
          playerintank = L5_2
        else
          L7_2 = A0_2
          L6_2 = A0_2.ChoosePlayerInTank
          L6_2(L7_2)
        end
        L6_2 = TargetPlayer
        L7_2 = playerintank
        L6_2(L7_2)
        L6_2 = print
        L7_2 = "The Tank is dead, Long live the Tank : "
        L8_2 = playerintank
        L7_2 = L7_2 .. L8_2
        L6_2(L7_2)
        L7_2 = A0_2
        L6_2 = A0_2.DoSendEvent
        L8_2 = TANKEVENT_PLAYERINTANK
        L9_2 = playerintank
        L10_2 = 0
        L11_2 = 0
        L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      end
    end
  end
  L6_2 = A2_2
  L5_2 = A2_2.Name
  L5_2 = L5_2(L6_2)
  L7_2 = A1_2
  L6_2 = A1_2.Name
  L6_2 = L6_2(L7_2)
  if A1_2 == A2_2 then
    L8_2 = A0_2
    L7_2 = A0_2.Commentate
    L9_2 = "^S^"
    L10_2 = L6_2
    L11_2 = "^S^ ^T^MPKSELF"
    L9_2 = L9_2 .. L10_2 .. L11_2
    L7_2(L8_2, L9_2)
  elseif A3_2 then
    L8_2 = A0_2
    L7_2 = A0_2.Commentate
    L9_2 = "^S^"
    L10_2 = L5_2
    L11_2 = "^S^ ^T^MPK^S^ "
    L12_2 = L6_2
    L13_2 = "^S^ ^T^MPKHEAD"
    L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
    L7_2(L8_2, L9_2)
  else
    L8_2 = A0_2
    L7_2 = A0_2.Commentate
    L9_2 = "^S^"
    L10_2 = L5_2
    L11_2 = "^S^ ^T^MPK^S^ "
    L12_2 = L6_2
    L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2
    L7_2(L8_2, L9_2)
  end
end
L0_1.RegisterPlayerKill = L1_1
L0_1 = MultiTankClient
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = main
  L1_2 = L1_2.game
  L1_2 = L1_2.EndOfGame
  L2_2 = false
  if L1_2 == L2_2 then
    L1_2 = A0_2.thisplayer
    L2_2 = L1_2
    L1_2 = L1_2.PlayerNum
    L1_2 = L1_2(L2_2)
    L2_2 = GameElapsedMs
    L2_2 = L2_2()
    A0_2.gameseconds = L2_2
    A0_2.mins = 0
    A0_2.seconds = 0
    while 0 < 1 do
      L2_2 = playerintank
      if L2_2 == L1_2 then
        L2_2 = Wait
        L3_2 = 100
        L2_2(L3_2)
        L2_2 = GameElapsedMs
        L2_2 = L2_2()
        L3_2 = A0_2.gameseconds
        L3_2 = L2_2 - L3_2
        if 1000 <= L3_2 then
          A0_2.gameseconds = L2_2
          L3_2 = A0_2.seconds
          L3_2 = L3_2 + 1
          A0_2.seconds = L3_2
          L3_2 = A0_2.seconds
          if L3_2 == 60 then
            A0_2.seconds = 0
            L3_2 = A0_2.mins
            L3_2 = L3_2 + 1
            A0_2.mins = L3_2
          end
          L3_2 = Tank
          L4_2 = L3_2
          L3_2 = L3_2.DoSendEvent
          L5_2 = TANKEVENT_TIMEUPDATE
          L6_2 = L1_2
          L7_2 = A0_2.mins
          L8_2 = A0_2.seconds
          L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
        end
      else
        L2_2 = Wait
        L3_2 = 500
        L2_2(L3_2)
      end
    end
  end
end
L0_1.Run = L1_1
L0_1 = Tank
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.totalmins
  L2_2 = L2_2[A1_2]
  return L2_2
end
L0_1.GetTimeMinutes = L1_1
L0_1 = Tank
function L1_1(A0_2, A1_2)
  local L2_2
  L2_2 = A0_2.totalseconds
  L2_2 = L2_2[A1_2]
  return L2_2
end
L0_1.GetTimeSeconds = L1_1
L0_1 = MultiTankClient
function L1_1(A0_2)
  local L1_2
end
L0_1.CleanUp = L1_1
L0_1 = Tank
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
  L7_2 = TANKEVENTMASK_NONE
  L8_2 = TANKEVENTSHIFT_TYPE
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  L6_2 = MaskEventNumber
  L7_2 = A2_2
  L8_2 = TANKEVENTMASK_NONE
  L9_2 = TANKEVENTSHIFT_PARAM1
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2 + L6_2
  L6_2 = MaskEventNumber
  L7_2 = A3_2
  L8_2 = TANKEVENTMASK_NONE
  L9_2 = TANKEVENTSHIFT_PARAM2
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2 + L6_2
  L6_2 = MaskEventNumber
  L7_2 = A4_2
  L8_2 = TANKEVENTMASK_NONE
  L9_2 = TANKEVENTSHIFT_PARAM3
  L6_2 = L6_2(L7_2, L8_2, L9_2)
  L5_2 = L5_2 + L6_2
  L6_2 = SendEvent
  L7_2 = L5_2
  L6_2(L7_2)
end
L0_1.DoSendEvent = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2
  L1_2 = A0_2.allPlayerDamage
  L1_2[1] = 0
  L1_2 = A0_2.allPlayerDamage
  L1_2[2] = 0
  L1_2 = A0_2.allPlayerDamage
  L1_2[3] = 0
  L1_2 = A0_2.allPlayerDamage
  L1_2[4] = 0
  L1_2 = A0_2.allPlayerDamage
  L1_2[5] = 0
  L1_2 = A0_2.allPlayerDamage
  L1_2[6] = 0
  L1_2 = A0_2.allPlayerDamage
  L1_2[7] = 0
  L1_2 = A0_2.allPlayerDamage
  L1_2[8] = 0
end
L0_1.ClearDamageArray = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = print
  L2_2 = "PlayerWhoDamagedTankMost"
  L1_2(L2_2)
  L1_2 = table
  L1_2 = L1_2.getn
  L2_2 = A0_2.players
  L1_2 = L1_2(L2_2)
  L2_2 = 1
  L3_2 = 0
  L4_2 = 0
  L5_2 = 1
  L6_2 = L1_2
  L7_2 = 1
  L5_2 = L5_2 - L7_2
  for L5_2 = L5_2, L6_2, L7_2 do
    L8_2 = A0_2.allPlayerDamage
    L8_2 = L8_2[L5_2]
    if L3_2 < L8_2 then
      L8_2 = A0_2.allPlayerDamage
      L3_2 = L8_2[L5_2]
      L4_2 = L5_2 - 1
    end
  end
  return L4_2
end
L0_1.PlayerWhoDamagedTankMost = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2, L17_2, L18_2
  goto lbl_338
  repeat
    L1_2 = GetEvent
    L1_2 = L1_2()
    L2_2 = A0_2.EndOfGame
    L3_2 = true
    if L2_2 == L3_2 then
      return
    end
    L2_2 = MaskEventNumber
    L3_2 = L1_2
    L4_2 = TANKEVENTMASK_TYPE
    L5_2 = TANKEVENTSHIFT_TYPE
    L5_2 = -L5_2
    L2_2 = L2_2(L3_2, L4_2, L5_2)
    L3_2 = MaskEventNumber
    L4_2 = L1_2
    L5_2 = TANKEVENTMASK_PARAM1
    L6_2 = TANKEVENTSHIFT_PARAM1
    L6_2 = -L6_2
    L3_2 = L3_2(L4_2, L5_2, L6_2)
    L4_2 = MaskEventNumber
    L5_2 = L1_2
    L6_2 = TANKEVENTMASK_PARAM2
    L7_2 = TANKEVENTSHIFT_PARAM2
    L7_2 = -L7_2
    L4_2 = L4_2(L5_2, L6_2, L7_2)
    L5_2 = MaskEventNumber
    L6_2 = L1_2
    L7_2 = TANKEVENTMASK_PARAM3
    L8_2 = TANKEVENTSHIFT_PARAM3
    L8_2 = -L8_2
    L5_2 = L5_2(L6_2, L7_2, L8_2)
    L6_2 = Player
    L6_2 = L6_2()
    L7_2 = TANKEVENT_TIMEUPDATE
    if L2_2 == L7_2 then
      L7_2 = A0_2.totalmins
      L7_2[L3_2] = L4_2
      L7_2 = A0_2.totalseconds
      L7_2[L3_2] = L5_2
      L7_2 = PlayerId
      L7_2 = L7_2()
      if L3_2 == L7_2 then
        L8_2 = L6_2
        L7_2 = L6_2.InATank
        L7_2 = L7_2(L8_2)
        if L7_2 then
          L7_2 = nil
          L8_2 = nil
          L9_2 = GameScoreLimit
          L9_2 = L9_2()
          L9_2 = L9_2 * 60000
          L10_2 = L4_2 * 60000
          L9_2 = L9_2 - L10_2
          L10_2 = L5_2 * 1000
          L9_2 = L9_2 - L10_2
          L10_2 = math
          L10_2 = L10_2.floor
          L11_2 = L9_2 / 1000
          L11_2 = L11_2 / 60
          L10_2 = L10_2(L11_2)
          L7_2 = L10_2
          L10_2 = math
          L10_2 = L10_2.floor
          L11_2 = 1000 * 60
          L11_2 = L7_2 * L11_2
          L11_2 = L9_2 - L11_2
          L10_2 = L10_2(L11_2)
          L9_2 = L10_2
          L10_2 = math
          L10_2 = L10_2.floor
          L11_2 = L9_2 / 1000
          L10_2 = L10_2(L11_2)
          L8_2 = L10_2
          L10_2 = string
          L10_2 = L10_2.format
          L11_2 = "%d:%02d"
          L12_2 = L7_2
          L13_2 = L8_2
          L10_2 = L10_2(L11_2, L12_2, L13_2)
          L11_2 = A0_2.tanktime
          if L11_2 ~= nil then
            L11_2 = A0_2.tanktime
            L12_2 = L11_2
            L11_2 = L11_2.Text
            L13_2 = "^S^"
            L14_2 = L10_2
            L13_2 = L13_2 .. L14_2
            L11_2(L12_2, L13_2)
          end
        end
      end
    else
      L7_2 = TANKEVENT_GAMEOVER
      if L2_2 == L7_2 then
        L7_2 = print
        L8_2 = "XXX TANKEVENT_GAMEOVER XXX"
        L7_2(L8_2)
        L7_2 = UpdateGameTime
        L8_2 = false
        L7_2(L8_2)
        A0_2.winningPlayer = L3_2
        L7_2 = true
        A0_2.EndOfGame = L7_2
      else
        L7_2 = TANKEVENT_TANK_DAMAGE
        if L2_2 == L7_2 then
          L7_2 = print
          L8_2 = "XXX TANKEVENT_TANK_DAMAGE XXX"
          L7_2(L8_2)
          L7_2 = print
          L8_2 = "Player "
          L9_2 = L3_2
          L10_2 = " Damaged It By = "
          L11_2 = L4_2
          L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
          L7_2(L8_2)
          L7_2 = Player
          L7_2 = L7_2()
          L9_2 = L7_2
          L8_2 = L7_2.PlayerNum
          L8_2 = L8_2(L9_2)
          if L3_2 == L8_2 then
            L8_2 = A0_2.tankDamage
            L8_2 = L8_2 + L4_2
            A0_2.tankDamage = L8_2
            L8_2 = print
            L9_2 = "Player "
            L10_2 = L3_2
            L11_2 = " Total Damage = "
            L12_2 = A0_2.tankDamage
            L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2
            L8_2(L9_2)
            L8_2 = A0_2.tankDamage
            L9_2 = A0_2.tankDamage
            L8_2 = L9_2 / 7.5
            if L8_2 < 0 then
              L8_2 = 0
            elseif 100 < L8_2 then
              L8_2 = 100
            end
            L9_2 = string
            L9_2 = L9_2.format
            L10_2 = "%.3d"
            L11_2 = L8_2
            L9_2 = L9_2(L10_2, L11_2)
            L10_2 = A0_2.tankDmgTxt
            if L10_2 ~= nil then
              L10_2 = A0_2.tankDmgTxt
              L11_2 = L10_2
              L10_2 = L10_2.Text
              L12_2 = "^S^ "
              L13_2 = L9_2
              L14_2 = "%"
              L12_2 = L12_2 .. L13_2 .. L14_2
              L10_2(L11_2, L12_2)
            end
          end
          L8_2 = IsServer
          L8_2 = L8_2()
          if L8_2 then
            L8_2 = A0_2.allPlayerDamage
            L9_2 = L3_2 + 1
            L10_2 = A0_2.allPlayerDamage
            L11_2 = L3_2 + 1
            L10_2 = L10_2[L11_2]
            L10_2 = L10_2 + L4_2
            L8_2[L9_2] = L10_2
          end
        else
          L7_2 = TANKEVENT_PLAYERINTANK
          if L2_2 == L7_2 then
            playerintank = L3_2
            L7_2 = print
            L8_2 = "MSG = TANKEVENT_PLAYERINTANK : Player In Tank = "
            L9_2 = playerintank
            L8_2 = L8_2 .. L9_2
            L7_2(L8_2)
            L7_2 = collectgarbage
            L7_2()
            L7_2 = playerintank
            L8_2 = PlayerId
            L8_2 = L8_2()
            if L7_2 ~= L8_2 then
              A0_2.currentTank = nil
            end
            L7_2 = false
            A0_2.StartGameRunForTank = L7_2
            L7_2 = A0_2.TankRadarBlip
            if L7_2 ~= nil then
              L7_2 = RemoveBlip
              L8_2 = A0_2.TankRadarBlip
              L7_2(L8_2)
              A0_2.TankRadarBlip = nil
            end
            L8_2 = A0_2
            L7_2 = A0_2.ClearDamageArray
            L7_2(L8_2)
            A0_2.tankDamage = 0
            L7_2 = string
            L7_2 = L7_2.format
            L8_2 = "%.3d"
            L9_2 = A0_2.tankDamage
            L7_2 = L7_2(L8_2, L9_2)
            L8_2 = A0_2.tankDmgTxt
            if L8_2 ~= nil then
              L8_2 = A0_2.tankDmgTxt
              L9_2 = L8_2
              L8_2 = L8_2.Text
              L10_2 = "^S^ "
              L11_2 = L7_2
              L12_2 = "%"
              L10_2 = L10_2 .. L11_2 .. L12_2
              L8_2(L9_2, L10_2)
            end
            L9_2 = L6_2
            L8_2 = L6_2.IsPlaying
            L8_2 = L8_2(L9_2)
            if L8_2 then
              L8_2 = PlayerId
              L8_2 = L8_2()
              L9_2 = playerintank
              if L8_2 ~= L9_2 then
                L9_2 = A0_2
                L8_2 = A0_2.DisplayTankMessage
                L10_2 = "^S^ "
                L11_2 = Player
                L12_2 = playerintank
                L11_2 = L11_2(L12_2)
                L12_2 = L11_2
                L11_2 = L11_2.Name
                L11_2 = L11_2(L12_2)
                L12_2 = "^S^ "
                L10_2 = L10_2 .. L11_2 .. L12_2
                L11_2 = 1500
                L12_2 = "^T^MPTANK"
                L13_2 = Player
                L14_2 = playerintank
                L13_2 = L13_2(L14_2)
                L14_2 = L13_2
                L13_2 = L13_2.Colour
                L13_2 = L13_2(L14_2)
                L14_2 = {}
                L15_2 = 255
                L16_2 = 255
                L17_2 = 255
                L18_2 = 255
                L14_2[1] = L15_2
                L14_2[2] = L16_2
                L14_2[3] = L17_2
                L14_2[4] = L18_2
                L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
              end
            end
            L8_2 = Player
            L9_2 = playerintank
            L8_2 = L8_2(L9_2)
            L10_2 = L8_2
            L9_2 = L8_2.Colour
            L9_2 = L9_2(L10_2)
            L10_2 = A0_2.tankDmgTxt
            if L10_2 ~= nil then
              L10_2 = A0_2.tankDmgTxt
              L11_2 = L10_2
              L10_2 = L10_2.Colour
              L12_2 = L9_2
              L10_2(L11_2, L12_2)
            end
            L10_2 = A0_2.tankDam
            if L10_2 ~= nil then
              L10_2 = A0_2.tankDam
              L11_2 = L10_2
              L10_2 = L10_2.Colour
              L12_2 = L9_2
              L10_2(L11_2, L12_2)
            end
          else
            L7_2 = TANKEVENT_AQUIRE_TANK
            if L2_2 == L7_2 then
              playerintank = L3_2
              L7_2 = print
              L8_2 = "MSG = TANKEVENT_AQUIRE_TANK : Player In Tank = "
              L9_2 = playerintank
              L8_2 = L8_2 .. L9_2
              L7_2(L8_2)
              L7_2 = false
              A0_2.StartGameRunForTank = L7_2
              L7_2 = A0_2.TankRadarBlip
              if L7_2 ~= nil then
                L7_2 = RemoveBlip
                L8_2 = A0_2.TankRadarBlip
                L7_2(L8_2)
                A0_2.TankRadarBlip = nil
              end
              L8_2 = A0_2
              L7_2 = A0_2.ClearDamageArray
              L7_2(L8_2)
              L8_2 = L6_2
              L7_2 = L6_2.IsPlaying
              L7_2 = L7_2(L8_2)
              if L7_2 then
                L7_2 = PlayerId
                L7_2 = L7_2()
                L8_2 = playerintank
                if L7_2 ~= L8_2 then
                  L8_2 = A0_2
                  L7_2 = A0_2.DisplayTankMessage
                  L9_2 = "^S^ "
                  L10_2 = Player
                  L11_2 = playerintank
                  L10_2 = L10_2(L11_2)
                  L11_2 = L10_2
                  L10_2 = L10_2.Name
                  L10_2 = L10_2(L11_2)
                  L11_2 = "^S^ "
                  L9_2 = L9_2 .. L10_2 .. L11_2
                  L10_2 = 1500
                  L11_2 = "^T^MPTANK"
                  L12_2 = Player
                  L13_2 = playerintank
                  L12_2 = L12_2(L13_2)
                  L13_2 = L12_2
                  L12_2 = L12_2.Colour
                  L12_2 = L12_2(L13_2)
                  L13_2 = {}
                  L14_2 = 255
                  L15_2 = 255
                  L16_2 = 255
                  L17_2 = 255
                  L13_2[1] = L14_2
                  L13_2[2] = L15_2
                  L13_2[3] = L16_2
                  L13_2[4] = L17_2
                  L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
                end
              end
              L7_2 = Player
              L8_2 = playerintank
              L7_2 = L7_2(L8_2)
              L9_2 = L7_2
              L8_2 = L7_2.Colour
              L8_2 = L8_2(L9_2)
              L9_2 = A0_2.tankDmgTxt
              if L9_2 ~= nil then
                L9_2 = A0_2.tankDmgTxt
                L10_2 = L9_2
                L9_2 = L9_2.Colour
                L11_2 = L8_2
                L9_2(L10_2, L11_2)
              end
              L9_2 = A0_2.tankDam
              if L9_2 ~= nil then
                L9_2 = A0_2.tankDam
                L10_2 = L9_2
                L9_2 = L9_2.Colour
                L11_2 = L8_2
                L9_2(L10_2, L11_2)
              end
            end
          end
        end
      end
    end
    ::lbl_338::
    L1_2 = IsEventStackEmpty
    L1_2 = L1_2()
  until L1_2
end
L0_1.ReceiveEvents = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = {}
  L2_2 = main
  L3_2 = A0_2.PlayerSpawnPoints
  L2_2.vSpawnPoints = L3_2
  L2_2 = DoSpawn
  L3_2 = -1
  L4_2 = false
  L2_2 = L2_2(L3_2, L4_2)
  L1_2 = L2_2
  return L1_2
end
L0_1.GetOnFootRespawnPosition = L1_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2
  L1_2 = print
  L2_2 = "GetTankRespawnPosition()"
  L1_2(L2_2)
  L1_2 = {}
  L2_2 = main
  L3_2 = A0_2.TankSpawnPoints
  L2_2.vSpawnPoints = L3_2
  L2_2 = DoSpawn
  L3_2 = -1
  L4_2 = false
  L2_2 = L2_2(L3_2, L4_2)
  L1_2 = L2_2
  return L1_2
end
L0_1.GetTankRespawnPosition = L1_1
L0_1 = Tank
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = A0_2.tankDam
  if L2_2 ~= nil then
    L2_2 = A0_2.tankDam
    L3_2 = L2_2
    L2_2 = L2_2.Remove
    L2_2(L3_2)
    A0_2.tankDam = nil
  end
  L2_2 = A0_2.tankDmgTxt
  if L2_2 ~= nil then
    L2_2 = A0_2.tankDmgTxt
    L3_2 = L2_2
    L2_2 = L2_2.Remove
    L2_2(L3_2)
    A0_2.tankDmgTxt = nil
  end
  L2_2 = A0_2.tanktime
  if L2_2 ~= nil then
    L2_2 = A0_2.tanktime
    L3_2 = L2_2
    L2_2 = L2_2.Remove
    L2_2(L3_2)
    A0_2.tanktime = nil
  end
  L2_2 = true
  if A1_2 == L2_2 then
    L2_2 = Player
    L2_2 = L2_2()
    L3_2 = TextSprite
    L4_2 = L2_2
    L5_2 = 420
    L6_2 = 105
    L7_2 = 2
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.tankDam = L3_2
    L3_2 = A0_2.tankDam
    L4_2 = L3_2
    L3_2 = L3_2.Scale
    L5_2 = 0.4048
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.tankDam
    L4_2 = L3_2
    L3_2 = L3_2.Style
    L5_2 = 1
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.tankDam
    L4_2 = L3_2
    L3_2 = L3_2.Colour
    L5_2 = 255
    L6_2 = 255
    L7_2 = 255
    L8_2 = 255
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L3_2 = A0_2.tankDam
    L4_2 = L3_2
    L3_2 = L3_2.Text
    L5_2 = "^T^DAM"
    L3_2(L4_2, L5_2)
    L3_2 = TextSprite
    L4_2 = L2_2
    L5_2 = 470
    L6_2 = 105
    L7_2 = 2
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.tankDmgTxt = L3_2
    L3_2 = A0_2.tankDmgTxt
    L4_2 = L3_2
    L3_2 = L3_2.Scale
    L5_2 = 0.4048
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.tankDmgTxt
    L4_2 = L3_2
    L3_2 = L3_2.Style
    L5_2 = 1
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.tankDmgTxt
    L4_2 = L3_2
    L3_2 = L3_2.Colour
    L5_2 = 255
    L6_2 = 255
    L7_2 = 255
    L8_2 = 255
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
    L3_2 = A0_2.tankDmgTxt
    L4_2 = L3_2
    L3_2 = L3_2.Text
    L5_2 = "^S^000%"
    L3_2(L4_2, L5_2)
    L3_2 = TextSprite
    L4_2 = L2_2
    L5_2 = 470
    L6_2 = 85
    L7_2 = 2
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.tanktime = L3_2
    L3_2 = A0_2.tanktime
    L4_2 = L3_2
    L3_2 = L3_2.Scale
    L5_2 = 0.4048
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.tanktime
    L4_2 = L3_2
    L3_2 = L3_2.Style
    L5_2 = 1
    L3_2(L4_2, L5_2)
    L3_2 = A0_2.tanktime
    L4_2 = L3_2
    L3_2 = L3_2.Colour
    L5_2 = Player
    L5_2 = L5_2()
    L6_2 = L5_2
    L5_2 = L5_2.Colour
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2 = L5_2(L6_2)
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
    L3_2 = nil
    L4_2 = nil
    L5_2 = GameScoreLimit
    L5_2 = L5_2()
    L5_2 = L5_2 * 60000
    L7_2 = A0_2
    L6_2 = A0_2.GetTimeMinutes
    L9_2 = L2_2
    L8_2 = L2_2.PlayerNum
    L8_2, L9_2, L10_2 = L8_2(L9_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = L6_2 * 60000
    L5_2 = L5_2 - L6_2
    L7_2 = A0_2
    L6_2 = A0_2.GetTimeSeconds
    L9_2 = L2_2
    L8_2 = L2_2.PlayerNum
    L8_2, L9_2, L10_2 = L8_2(L9_2)
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2)
    L6_2 = L6_2 * 1000
    L5_2 = L5_2 - L6_2
    L6_2 = math
    L6_2 = L6_2.floor
    L7_2 = L5_2 / 1000
    L7_2 = L7_2 / 60
    L6_2 = L6_2(L7_2)
    L3_2 = L6_2
    L6_2 = math
    L6_2 = L6_2.floor
    L7_2 = 1000 * 60
    L7_2 = L3_2 * L7_2
    L7_2 = L5_2 - L7_2
    L6_2 = L6_2(L7_2)
    L5_2 = L6_2
    L6_2 = math
    L6_2 = L6_2.floor
    L7_2 = L5_2 / 1000
    L6_2 = L6_2(L7_2)
    L4_2 = L6_2
    L6_2 = string
    L6_2 = L6_2.format
    L7_2 = "%d:%02d"
    L8_2 = L3_2
    L9_2 = L4_2
    L6_2 = L6_2(L7_2, L8_2, L9_2)
    L7_2 = A0_2.tanktime
    L8_2 = L7_2
    L7_2 = L7_2.Text
    L9_2 = "^S^"
    L10_2 = L6_2
    L9_2 = L9_2 .. L10_2
    L7_2(L8_2, L9_2)
  end
  L2_2 = A0_2.StartGameRunForTank
  L3_2 = false
  if L2_2 == L3_2 then
    L2_2 = Player
    L3_2 = playerintank
    L2_2 = L2_2(L3_2)
    L4_2 = L2_2
    L3_2 = L2_2.Colour
    L3_2 = L3_2(L4_2)
    L4_2 = A0_2.tankDmgTxt
    if L4_2 ~= nil then
      L4_2 = A0_2.tankDmgTxt
      L5_2 = L4_2
      L4_2 = L4_2.Colour
      L6_2 = L3_2
      L4_2(L5_2, L6_2)
    end
    L4_2 = A0_2.tankDam
    if L4_2 ~= nil then
      L4_2 = A0_2.tankDam
      L5_2 = L4_2
      L4_2 = L4_2.Colour
      L6_2 = L3_2
      L4_2(L5_2, L6_2)
    end
  end
end
L0_1.ShowHUD = L1_1
L0_1 = Tank
function L1_1(A0_2, A1_2, A2_2, A3_2, A4_2, A5_2)
  local L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L7_2 = A0_2
  L6_2 = A0_2.Commentate
  L8_2 = "^S^"
  L9_2 = A1_2
  L10_2 = "^S^ "
  L11_2 = A3_2
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
  L6_2(L7_2, L8_2)
end
L0_1.DisplayTankMessage = L1_1
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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L1_2 = main
  L1_2 = L1_2.game
  L2_2 = true
  L1_2.SplashTextIsOnScreen = L2_2
  L1_2 = main
  L1_2 = L1_2.game
  L2_2 = L1_2
  L1_2 = L1_2.ShowHUD
  L3_2 = false
  L1_2(L2_2, L3_2)
  L1_2 = Player
  L1_2 = L1_2()
  L2_2 = TextSprite
  L3_2 = L1_2
  L4_2 = 240
  L5_2 = 83
  L6_2 = 1
  L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
  L4_2 = L2_2
  L3_2 = L2_2.Scale
  L5_2 = 0.47
  L3_2(L4_2, L5_2)
  L4_2 = L2_2
  L3_2 = L2_2.Style
  L5_2 = 0
  L3_2(L4_2, L5_2)
  L4_2 = L2_2
  L3_2 = L2_2.Colour
  L5_2 = main
  L5_2 = L5_2.game
  L5_2 = L5_2.MsgColour1
  L3_2(L4_2, L5_2)
  L4_2 = L2_2
  L3_2 = L2_2.Text
  L5_2 = main
  L5_2 = L5_2.game
  L5_2 = L5_2.Msg
  L3_2(L4_2, L5_2)
  L3_2 = nil
  L4_2 = main
  L4_2 = L4_2.game
  L4_2 = L4_2.MsgLineTwo
  if L4_2 ~= nil then
    L4_2 = TextSprite
    L5_2 = L1_2
    L6_2 = 240
    L7_2 = 100
    L8_2 = 1
    L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2)
    L3_2 = L4_2
    L5_2 = L3_2
    L4_2 = L3_2.Scale
    L6_2 = 0.47
    L4_2(L5_2, L6_2)
    L5_2 = L3_2
    L4_2 = L3_2.Style
    L6_2 = 0
    L4_2(L5_2, L6_2)
    L5_2 = L3_2
    L4_2 = L3_2.Colour
    L6_2 = main
    L6_2 = L6_2.game
    L6_2 = L6_2.MsgColour2
    L4_2(L5_2, L6_2)
    L5_2 = L3_2
    L4_2 = L3_2.Text
    L6_2 = main
    L6_2 = L6_2.game
    L6_2 = L6_2.MsgLineTwo
    L4_2(L5_2, L6_2)
  end
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
  if L3_2 then
    L6_2 = L3_2
    L5_2 = L3_2.Remove
    L5_2(L6_2)
    L5_2 = main
    L5_2 = L5_2.game
    L5_2.MsgLineTwo = nil
  end
  L5_2 = main
  L5_2 = L5_2.game
  L6_2 = L5_2
  L5_2 = L5_2.ShowHUD
  L7_2 = true
  L5_2(L6_2, L7_2)
  L5_2 = main
  L5_2 = L5_2.game
  L6_2 = false
  L5_2.SplashTextIsOnScreen = L6_2
end
L0_1.Run = L1_1
L0_1 = TankMessagePump
function L1_1(A0_2)
  local L1_2, L2_2
  L1_2 = print
  L2_2 = "MESAGE PUMP CLEANUP"
  L1_2(L2_2)
end
L0_1.CleanUp = L1_1
L0_1 = TankMessagePump
function L1_1(A0_2)
  local L1_2, L2_2
  while 1 do
    L1_2 = main
    L1_2 = L1_2.game
    L2_2 = L1_2
    L1_2 = L1_2.ReceiveEvents
    L1_2(L2_2)
    L1_2 = Wait
    L2_2 = 50
    L1_2(L2_2)
  end
end
L0_1.Run = L1_1
function L0_1()
  local L0_2, L1_2, L2_2, L3_2, L4_2
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
  L2_2 = Tank
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
