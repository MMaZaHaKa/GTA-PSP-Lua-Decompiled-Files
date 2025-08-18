require("PickupBlips")
local Object = {}
local PickupMgr = Object

function PickupMgr:CleanUp()
  self.pickupBlipScript:Stop()
  for k, v in ipairs(self.pickups) do
    v:Remove()
  end
end

function PickupMgr:CreatePickups()
  local pickupsTable, pickupArray

  self.pickups = {}
  if IsServer() then
    pickupsTable = {}
    if GameLocation() == 0 then
      pickupArray = {}
      pickupArray[1] = { pickup.shotgun, { 1265.85, -1107.46, 11.86 }, 20 }
      pickupArray[2] = { pickup.sniper, { 1182.1538, -1117.1766, 11.8192 }, 20 }
      pickupArray[3] = { pickup.tec9, { 1147.1584, -925.2814, 15.0079 }, 50 }
      pickupArray[4] = { pickup.molotov, { 1387.9872, -1001.4305, 11.883 }, 10 }
      pickupArray[5] = { pickup.rocket_launcher, { 1575.3541, -928.5635, 10.3405 }, 5 }
      pickupArray[6] = { pickup.ak47, { 1317.7924, -844.6498, 14.9858 }, 50 }
      pickupArray[7] = { pickup.grenade, { 1132.9966, -976.2681, 14.8263 }, 10 }
      pickupArray[8] = { pickup.armour, { 1319.3462, -1007.6297, 14.8094 } }
      pickupArray[9] = { pickup.health, { 1153.5819, -1077.5167, 13.5928 } }
      pickupArray[10] = { pickup.health, { 1553.7484, -890.5146, 11.7833 } }
      pickupArray[11] = { pickup.armour, { 1329.7201, -1155.3195, 11.8202 } }
      pickupArray[12] = { pickup.shotgun, { 1103.062, -1136.5417, 11.8192 }, 20 }
      pickupArray[13] = { pickup.sniper, { 1101.92, -1045.36, 14.83 }, 20 }
      pickupArray[14] = { pickup.ak47, { 1017.22, -1015.92, 14.9313 }, 50 }
      pickupArray[15] = { pickup.rocket_launcher, { 908.94, -1056.6, 9.8 }, 5 }
      pickupArray[16] = { pickup.sniper, { 926.489, -1045.8192, 14.4932 }, 20 }
      pickupArray[17] = { pickup.tec9, { 934.6821, -848.4339, 14.8313 }, 50 }
      pickupArray[18] = { pickup.rocket_launcher, { 1083.26, -854.59, 15.1771 }, 5 }
      pickupArray[19] = { pickup.health, { 878.6973, -1010.762, 4.8675 } }
      pickupArray[20] = { pickup.health, { 774.2908, -854.0803, 14.7246 } }
      pickupArray[21] = { pickup.health, { 1031.0684, -933.0208, 14.9334 } }
      pickupArray[22] = { pickup.armour, { 795.2945, -1004.9326, 4.8487 } }
      pickupArray[23] = { pickup.armour, { 1048.9757, -1154.1892, 13.1295 } }
      pickupArray[24] = { pickup.armour, { 852.28, -795.73, 27.5 } }
      pickupArray[25] = { pickup.sniper, { 1273.5935, -743.9666, 14.9277 }, 50 }
      pickupArray[26] = { pickup.chainsaw, { 1272.7783, -617.6541, 12.1677 }, 60 }
      pickupArray[27] = { pickup.shotgun, { 1140.08, -668.72, 14.9 }, 20 }
      pickupArray[28] = { pickup.rocket_launcher, { 1205.1144, -803.7195, 21.909 }, 5 }
      pickupArray[29] = { pickup.ak47, { 1486.2443, -774.576, 11.7823 }, 50 }
      pickupArray[30] = { pickup.det_grenade, { 1442.9634, -673.6034, 11.7862 }, 10 }
      pickupArray[31] = { pickup.health, { 1325.2334, -682.5991, 13.3427 } }
      pickupArray[32] = { pickup.health, { 1145.59, -591.48, 14.9 } }
      pickupArray[33] = { pickup.armour, { 1179.9272, -751.6107, 14.9483 } }
      pickupArray[34] = { pickup.armour, { 1483.7257, -623.2601, 15.8246 } }
      pickupArray[35] = { pickup.armour, { 1400.5881, -837.1541, 11.7845 } }
      pickupArray[36] = { pickup.sniper, { 849.6788, -806.3579, 27.5369 }, 20 }
      pickupArray[37] = { pickup.shotgun, { 868.7071, -663.7165, 14.9361 }, 20 }
      pickupArray[38] = { pickup.molotov, { 903.24, -598.9313, 17.3037 }, 10 }
      pickupArray[39] = { pickup.ak47, { 1061.3633, -568.351, 16.6948 }, 50 }
      pickupArray[40] = { pickup.tec9, { 1085.6558, -693.68, 14.9333 }, 50 }
      pickupArray[41] = { pickup.rocket_launcher, { 978.5672, -681.0534, 14.9329 }, 5 }
      pickupArray[42] = { pickup.shotgun, { 1008.3642, -749.9523, 14.9316 }, 20 }
      pickupArray[43] = { pickup.health, { 927.1153, -681.6978, 14.9329 } }
      pickupArray[44] = { pickup.health, { 1068.5796, -694.7872, 14.9333 } }
      pickupArray[45] = { pickup.health, { 883.1231, -547.7568, 14.9327 } }
      pickupArray[46] = { pickup.armour, { 922.2511, -793.7344, 15.1297 } }
      pickupArray[47] = { pickup.armour, { 978.47, -423.68, 14.96 } }
      pickupArray[48] = { pickup.armour, { 789.83, -575.4, 19.8 } }
      pickupArray[49] = { pickup.shotgun, { 1345.5742, -389.0824, 46.8913 }, 20 }
      pickupArray[50] = { pickup.shotgun, { 1408.151, -352.3069, 49.4392 }, 20 }
      pickupArray[51] = { pickup.tec9, { 1265.9596, -297.0884, 39.8659 }, 50 }
      pickupArray[52] = { pickup.ak47, { 1210.6884, -330.2845, 25.9959 }, 50 }
      pickupArray[53] = { pickup.chainsaw, { 1167.8335, -461.7343, 22.7914 }, 60 }
      pickupArray[54] = { pickup.sniper, { 1306.8975, -536.9243, 47.548 }, 20 }
      pickupArray[55] = { pickup.det_grenade, { 1160.8082, -236.2865, 17.1449 }, 10 }
      pickupArray[56] = { pickup.ak47, { 1317.1562, -471.8507, 59.4692 }, 50 }
      pickupArray[57] = { pickup.health, { 1355.7018, -318.2846, 49.9307 } }
      pickupArray[58] = { pickup.health, { 1180.3762, -463.2792, 24.2913 } }
      pickupArray[59] = { pickup.health, { 1274.5616, -196.3914, 33.3328 } }
      pickupArray[60] = { pickup.armour, { 1246.5503, -388.611, 29.079 } }
      pickupArray[61] = { pickup.armour, { 1410.1499, -314.3487, 49.3908 } }
      pickupArray[62] = { pickup.armour, { 1301.93, -315.13, 41.5 } }
      pickupArray[63] = { pickup.chainsaw, { 1023.72, -471.08, 14.91 }, 60 }
      pickupArray[64] = { pickup.shotgun, { 1090.9064, -406.1047, 14.9602 }, 20 }
      pickupArray[65] = { pickup.grenade, { 825.7883, -384.59, 14.04 }, 10 }
      pickupArray[66] = { pickup.rocket_launcher, { 863.4547, -301.2214, 8.2144 }, 5 }
      pickupArray[67] = { pickup.ak47, { 937.884, -200.6623, 5.5756 }, 50 }
      pickupArray[68] = { pickup.tec9, { 952.5809, -331.0723, 9.9325 }, 50 }
      pickupArray[69] = { pickup.sniper, { 929.7228, -399.8782, 29.0918 }, 20 }
      pickupArray[70] = { pickup.det_grenade, { 1017.0515, -207.6367, 12.9065 }, 10 }
      pickupArray[71] = { pickup.health, { 825.6195, -348.5254, 10.4039 } }
      pickupArray[72] = { pickup.health, { 1086.7998, -228.3988, 9.3846 } }
      pickupArray[73] = { pickup.armour, { 1072.2, -411.73, 15.2532 } }
      pickupArray[74] = { pickup.armour, { 848.4544, -241.4469, 5.2577 } }
      pickupArray[75] = { pickup.armour, { 989.61, -350.96, 11.57 } }
      pickupArray[76] = { pickup.ak47, { 1419.5056, -193.6966, 50.2434 }, 50 }
      pickupArray[77] = { pickup.shotgun, { 1165.9436, -148.1886, 14.9334 }, 20 }
      pickupArray[78] = { pickup.molotov, { 1235.8333, -116.2467, 14.9326 }, 10 }
      pickupArray[79] = { pickup.tec9, { 1326.1029, -54.0221, 14.8431 }, 50 }
      pickupArray[80] = { pickup.rocket_launcher, { 1320.1128, -352.0229, 15.2435 }, 5 }
      pickupArray[81] = { pickup.det_grenade, { 1173.4381, 0.8479, 0.0252 }, 10 }
      pickupArray[82] = { pickup.sniper, { 1279.8035, -179.4836, 31.7287 }, 20 }
      pickupArray[83] = { pickup.grenade, { 1153.25, -317.58, 21.47 }, 10 }
      pickupArray[84] = { pickup.health, { 1282.435, -80.1266, 14.419 } }
      pickupArray[85] = { pickup.health, { 1139.4219, 108.4135, 1.2472 } }
      pickupArray[86] = { pickup.armour, { 1459.4512, -178.3427, 55.7397 } }
      pickupArray[87] = { pickup.armour, { 1251.3943, 18.1692, 9.2759 } }
      pickupArray[88] = { pickup.health, { 1215.89, -248.16, 24.9 } }
      pickupArray[89] = { pickup.armour, { 1079, 40.5, 8.9 } }
      pickupArray[90] = { pickup.sniper, { 1012.1614, -34.1731, 20.6331 }, 20 }
      pickupArray[91] = { pickup.rocket_launcher, { 1124.9573, 46.5368, 4.6281 }, 5 }
      pickupArray[92] = { pickup.ak47, { 854.2657, -204.7187, 3.9226 }, 50 }
      pickupArray[93] = { pickup.shotgun, { 974.2974, -126.2021, 4.9593 }, 20 }
      pickupArray[94] = { pickup.det_grenade, { 1083.3535, -70.6726, 9.3526 }, 10 }
      pickupArray[95] = { pickup.rocket_launcher, { 784.4633, 208.3205, 3.7091 }, 5 }
      pickupArray[96] = { pickup.ak47, { 1147.21, -74.33, 7.47 }, 50 }
      pickupArray[97] = { pickup.health, { 946.9291, -30.3201, 7.433 } }
      pickupArray[98] = { pickup.health, { 803.0809, -174.5709, -3.919 } }
      pickupArray[99] = { pickup.health, { 917.6138, 194.484, 4.4738 } }
      pickupArray[100] = { pickup.armour, { 709.4316, 175.718, 4.6584 } }
      pickupArray[101] = { pickup.armour, { 889.9774, 13.2502, 24.0152 } }
      pickupArray[102] = { pickup.shotgun, { 1468.4039, -77.7275, 18.0674 }, 12 }
      pickupArray[103] = { pickup.rocket_launcher, { 1483.7692, -423.6853, 10.8379 }, 10 }
      pickupArray[104] = { pickup.armour, { 1497.51, -1118.4, 18.9 } }
      pickupArray[105] = { pickup.chainsaw, { 1585.03, -1137.4, 18.9 }, 60 }
      pickupArray[106] = { pickup.det_grenade, { 1361.06, -1114.43, 18.9 }, 10 }
      pickupsTable = pickupArray
    else
      if GameLocation() == 1 then
        pickupArray = {}
        pickupArray[1] = { pickup.rocket_launcher, { -19.08, -252.31, 23.4 }, 5 }
        pickupArray[2] = { pickup.ak47, { -166.6796, -86.527, 16.1281 }, 50 }
        pickupArray[3] = { pickup.sniper, { -93.42, 90.66, 15.28 }, 20 }
        pickupArray[4] = { pickup.molotov, { 157.1552, -89.6627, 20.1317 }, 10 }
        pickupArray[5] = { pickup.tec9, { 86.6841, -271.094, 16.1282 }, 50 }
        pickupArray[6] = { pickup.shotgun, { 85.8526, 62.05, 16.1281 }, 20 }
        pickupArray[7] = { pickup.grenade, { 152.6397, 244.6639, 11.6714 }, 10 }
        pickupArray[8] = { pickup.health, { 131.2948, -246.9034, 16.1303 } }
        pickupArray[9] = { pickup.armour, { 32.6114, -214.3139, 29.7703 } }
        pickupArray[10] = { pickup.armour, { -302.8382, -106.0074, 1.3235 } }
        pickupArray[11] = { pickup.health, { 6.01, -278.63, 16.17 } }
        pickupArray[12] = { pickup.ak47, { 387.8773, -49.6129, 19.1455 }, 50 }
        pickupArray[13] = { pickup.shotgun, { 288.575, 14.5047, 9.2954 }, 20 }
        pickupArray[14] = { pickup.det_grenade, { 274.4805, -151.3062, 21.4009 }, 10 }
        pickupArray[15] = { pickup.tec9, { 392.6464, -232.234, 21.2863 }, 50 }
        pickupArray[16] = { pickup.rocket_launcher, { 539.2078, -227.7842, 22.8391 }, 5 }
        pickupArray[17] = { pickup.chainsaw, { 225.6796, -243.1202, 16.1354 }, 12 }
        pickupArray[18] = { pickup.sniper, { 461.3714, -60.456, 20.4013 }, 20 }
        pickupArray[19] = { pickup.health, { 348.1933, -252.6339, 16.5619 } }
        pickupArray[20] = { pickup.health, { 182.74, -16.43, 16.22 } }
        pickupArray[21] = { pickup.armour, { 265.8773, -40.4615, 16.178 } }
        pickupArray[22] = { pickup.armour, { 269.21, -87.96, 22.57 } }
        pickupArray[23] = { pickup.shotgun, { 53.9878, -633.2505, 28.8959 }, 5 }
        pickupArray[24] = { pickup.tec9, { 183.3566, -533.9287, 26.1547 }, 100 }
        pickupArray[25] = { pickup.shotgun, { -45.4264, -336.1899, 16.1283 }, 20 }
        pickupArray[26] = { pickup.sniper, { -161.3304, -499.3698, 15.2069 }, 20 }
        pickupArray[27] = { pickup.shotgun, { -73.5023, -691.5687, 15.9785 }, 20 }
        pickupArray[28] = { pickup.ak47, { 127.4823, -314.6342, 16.1303 }, 50 }
        pickupArray[29] = { pickup.rocket_launcher, { 129.1635, -470.2218, 15.9964 }, 5 }
        pickupArray[30] = { pickup.armour, { -44.06, -493.72, 16.9 } }
        pickupArray[31] = { pickup.health, { 140.1274, -646.1885, 26.1259 } }
        pickupArray[32] = { pickup.health, { -221.2036, -315.1253, 1.416 } }
        pickupArray[33] = { pickup.armour, { 66.9742, -341.7166, 16.1315 } }
        pickupArray[34] = { pickup.chainsaw, { 427.481, -347.8263, 23.8034 }, 12 }
        pickupArray[35] = { pickup.det_grenade, { 332.9192, -361.0118, 23.1756 }, 10 }
        pickupArray[36] = { pickup.shotgun, { 235.0777, -420.0157, 26.1547 }, 20 }
        pickupArray[37] = { pickup.shotgun, { 470.0943, -676.3466, 17.0943 }, 20 }
        pickupArray[38] = { pickup.sniper, { 439.4245, -656.3184, 38.2752 }, 20 }
        pickupArray[39] = { pickup.tec9, { 279.9217, -656.2534, 26.1426 }, 50 }
        pickupArray[40] = { pickup.molotov, { 353.2662, -585.6368, 20.517 }, 10 }
        pickupArray[41] = { pickup.ak47, { 416.8767, -514.0427, 26.1281 }, 50 }
        pickupArray[42] = { pickup.health, { 523.7003, -671.5518, 16.6312 } }
        pickupArray[43] = { pickup.armour, { 581.2285, -441.465, 19.0677 } }
        pickupArray[44] = { pickup.health, { 371.2046, -435.1332, 21.0766 } }
        pickupArray[45] = { pickup.armour, { 379.851, -517.2027, 26.1213 } }
        pickupArray[46] = { pickup.armour, { 234.35, -470.09, 26.17 } }
        pickupArray[47] = { pickup.ak47, { 43.2178, -879.9251, 34.1308 }, 50 }
        pickupArray[48] = { pickup.grenade, { 168.6215, -998.2197, 28.1833 }, 10 }
        pickupArray[49] = { pickup.sniper, { -67.6814, -1119.906, 26.1352 }, 20 }
        pickupArray[50] = { pickup.shotgun, { 166.5697, -1133.4026, 26.1281 }, 20 }
        pickupArray[51] = { pickup.tec9, { -50.2946, -763.0078, 26.1305 }, 50 }
        pickupArray[52] = { pickup.rocket_launcher, { -63.0124, -937.1064, 15.843 }, 5 }
        pickupArray[53] = { pickup.tec9, { 21.2991, -1125.3928, 26.0883 }, 50 }
        pickupArray[54] = { pickup.shotgun, { 94.781, -961.6431, 29.1521 }, 20 }
        pickupArray[55] = { pickup.health, { 38.6209, -724.2225, 22.7164 } }
        pickupArray[56] = { pickup.health, { -10.873, -1091.0701, 27.051 } }
        pickupArray[57] = { pickup.armour, { 83.3542, -991.6765, 26.6281 } }
        pickupArray[58] = { pickup.armour, { 166.9951, -1040.8634, 26.1339 } }
        pickupArray[59] = { pickup.armour, { 68.8317, -773.5626, 22.8922 } }
        pickupArray[60] = { pickup.rocket_launcher, { 396.0922, -881.8372, 32.1495 }, 10 }
        pickupArray[61] = { pickup.tec9, { 389.0978, -1028.2582, 26.0787 }, 50 }
        pickupArray[62] = { pickup.ak47, { 296.8719, -1080.4738, 28.2782 }, 50 }
        pickupArray[63] = { pickup.tec9, { 334.8151, -813.1529, 28.3818 }, 50 }
        pickupArray[64] = { pickup.rocket_launcher, { 244.2408, -931.1363, 30.0133 }, 5 }
        pickupArray[65] = { pickup.ak47, { 449.64, -1021.7003, 16.1156 }, 50 }
        pickupArray[66] = { pickup.molotov, { 469.3693, -846.8632, 18.1219 }, 10 }
        pickupArray[67] = { pickup.shotgun, { 440.1427, -1170.203, 16.4572 }, 20 }
        pickupArray[68] = { pickup.det_grenade, { 437.7, -1083.9, 16.1183 }, 10 }
        pickupArray[69] = { pickup.armour, { 333.1736, -952.1639, 33.1412 } }
        pickupArray[70] = { pickup.health, { 240.8735, -1063.1118, 29.6225 } }
        pickupArray[71] = { pickup.health, { 338.674, -734.5394, 25.6823 } }
        pickupArray[72] = { pickup.armour, { 340.351, -1121.101, 25.9564 } }
        pickupArray[73] = { pickup.armour, { 233.7513, -809.9095, 28.3393 } }
        pickupArray[74] = { pickup.chainsaw, { 112.1903, -1258.2954, 26.1281 }, 12 }
        pickupArray[75] = { pickup.det_grenade, { 147.3746, -1583.8622, 30.9033 }, 10 }
        pickupArray[76] = { pickup.ak47, { -146.7106, -1548.1036, 25.9768 }, 50 }
        pickupArray[77] = { pickup.tec9, { -171.2565, -1296.1251, 25.6634 }, 50 }
        pickupArray[78] = { pickup.shotgun, { 19.4487, -1305.6299, 25.437 }, 20 }
        pickupArray[79] = { pickup.rocket_launcher, { 110.7564, -1457.8505, 32.1357 }, 5 }
        pickupArray[80] = { pickup.molotov, { -112.7039, -1398.3604, 26.1041 }, 10 }
        pickupArray[81] = { pickup.tec9, { 22.2295, -1515.5632, 26.069 }, 50 }
        pickupArray[82] = { pickup.health, { 3.7249, -1320.5448, 28.9841 } }
        pickupArray[83] = { pickup.health, { 111.5237, -1232.6802, 26.1281 } }
        pickupArray[84] = { pickup.health, { -240.4522, -1400.8868, 10.9768 } }
        pickupArray[85] = { pickup.armour, { 74.5476, -1595.2391, 28.341 } }
        pickupArray[86] = { pickup.armour, { 19.4366, -1240.2572, 27.7909 } }
        pickupArray[87] = { pickup.armour, { -184.7864, -1230.4316, 17.9272 } }
        pickupArray[88] = { pickup.rocket_launcher, { 312.0387, -1534.5155, 39.7277 }, 5 }
        pickupArray[89] = { pickup.sniper, { 436.7471, -1389.0802, 29.9038 }, 20 }
        pickupArray[90] = { pickup.ak47, { 395.1092, -1530.8867, 17.2016 }, 50 }
        pickupArray[91] = { pickup.tec9, { 200.4206, -1285.0986, 26.1281 }, 50 }
        pickupArray[92] = { pickup.shotgun, { 319.4207, -1356.6794, 26.8735 }, 20 }
        pickupArray[93] = { pickup.det_grenade, { 240.5015, -1413.0853, 26.1282 }, 10 }
        pickupArray[94] = { pickup.rocket_launcher, { -76.7, -1158.29, 26.16 }, 5 }
        pickupArray[95] = { pickup.health, { 218.4009, -1507.7183, 27.3755 } }
        pickupArray[96] = { pickup.armour, { 244.7295, -1207.948, 20.4144 } }
        pickupArray[97] = { pickup.armour, { 359.8225, -1317.5646, 26.2112 } }
        pickupArray[98] = { pickup.health, { 401.3023, -1605.9877, 25.974 } }
        pickupArray[99] = { pickup.health, { 507.8522, -1365.5096, 25.9269 } }
        pickupArray[100] = { pickup.armour, { 419.1234, -1464.9121, 26.1729 } }
        pickupsTable = pickupArray
      else
        pickupArray = {}
        pickupArray[1] = { pickup.det_grenade, { -1178.9146, 335.7963, 31.7777 }, 10 }
        pickupArray[2] = { pickup.tec9, { -1249.5565, 160.6126, 68.6709 }, 50 }
        pickupArray[3] = { pickup.ak47, { -1068.1783, 156.8197, 59.0778 }, 50 }
        pickupArray[4] = { pickup.ak47, { -1108.8717, 533.3457, 68.5363 }, 50 }
        pickupArray[5] = { pickup.shotgun, { -1184.1217, 498.5787, 68.5415 }, 20 }
        pickupArray[6] = { pickup.rocket_launcher, { -1035.6367, 455.5263, 23.5578 }, 5 }
        pickupArray[7] = { pickup.tec9, { -950.2345, 310.7479, 33.7339 }, 50 }
        pickupArray[8] = { pickup.shotgun, { -1172.0604, 277.0716, 3.5321 }, 20 }
        pickupArray[9] = { pickup.ak47, { -1035.1123, 227.9059, 3.675 }, 50 }
        pickupArray[10] = { pickup.molotov, { -1279.41, 267.2, 67.69 }, 10 }
        pickupArray[11] = { pickup.shotgun, { -624.6401, 622.5327, 78.2558 }, 20 }
        pickupArray[12] = { pickup.rocket_launcher, { -329.4771, 507.2226, 88.5111 }, 5 }
        pickupArray[13] = { pickup.sniper, { -989.9016, 246.1893, 38.0991 }, 20 }
        pickupArray[14] = { pickup.health, { -982.9041, 489.1714, 69.2396 } }
        pickupArray[15] = { pickup.health, { -683.0677, 623.7474, 78.2548 } }
        pickupArray[16] = { pickup.health, { -952.3976, 270.6275, 33.7117 } }
        pickupArray[17] = { pickup.health, { -1138.702, 244.8181, 3.3991 } }
        pickupArray[18] = { pickup.health, { -1246.8558, 131.4639, 68.5468 } }
        pickupArray[19] = { pickup.armour, { -1315.8434, 294.3044, 70.0519 } }
        pickupArray[20] = { pickup.armour, { -864.2217, 259.6947, 41.0782 } }
        pickupArray[21] = { pickup.armour, { -983.3112, 164.9747, 3.7639 } }
        pickupArray[22] = { pickup.ak47, { -1305.9211, -201.3007, 57.5757 }, 50 }
        pickupArray[23] = { pickup.shotgun, { -1104.5039, -82.9808, 43.7951 }, 20 }
        pickupArray[24] = { pickup.det_grenade, { -902.9615, 175.5488, 48.8213 }, 10 }
        pickupArray[25] = { pickup.shotgun, { -984.1099, 110.8421, 48.8213 }, 20 }
        pickupArray[26] = { pickup.rocket_launcher, { -1169.9432, 88.4637, 58.8166 }, 5 }
        pickupArray[27] = { pickup.grenade, { -1256.7976, 3.8911, 63.8212 }, 10 }
        pickupArray[28] = { pickup.rocket_launcher, { -668.1377, -250.9123, 22.6908 }, 5 }
        pickupArray[29] = { pickup.tec9, { -921.8276, -116.0754, 33.954 }, 50 }
        pickupArray[30] = { pickup.molotov, { -922.4296, -301.4371, 33.6749 }, 10 }
        pickupArray[31] = { pickup.ak47, { -791.9249, -252.9316, 22.3993 }, 50 }
        pickupArray[32] = { pickup.chainsaw, { -987.8137, -202.3344, 33.8258 }, 10 }
        pickupArray[33] = { pickup.sniper, { -784.3, -127.06, 36.29 }, 20 }
        pickupArray[34] = { pickup.sniper, { -1243.7849, -370.3406, 62.8267 }, 20 }
        pickupArray[35] = { pickup.health, { -1308.2848, 67.2151, 69.9911 } }
        pickupArray[36] = { pickup.health, { -847.5316, -156.4884, 33.8156 } }
        pickupArray[37] = { pickup.health, { -785.8389, -178.2265, 27.0342 } }
        pickupArray[38] = { pickup.health, { -669.4155, -249.6792, 22.4053 } }
        pickupArray[39] = { pickup.health, { -1277.0243, -204.3907, 59.6565 } }
        pickupArray[40] = { pickup.health, { -1088.289, -30.9559, 48.8236 } }
        pickupArray[41] = { pickup.armour, { -961.0096, -183.9636, 48.8083 } }
        pickupArray[42] = { pickup.armour, { -1170.2101, -41.2273, 63.1324 } }
        pickupArray[43] = { pickup.sniper, { -770.33, 106.22, 29.43 }, 20 }
        pickupArray[44] = { pickup.ak47, { -254.9323, 380.3705, 83.2303 }, 50 }
        pickupArray[45] = { pickup.shotgun, { -396.644, 211.0263, 63.3694 }, 20 }
        pickupArray[46] = { pickup.rocket_launcher, { -227.5913, 331.338, 3.4584 }, 5 }
        pickupArray[47] = { pickup.ak47, { -455.6807, -21.9207, 3.8213 }, 50 }
        pickupArray[48] = { pickup.rocket_launcher, { -591.9163, -78.0835, 5.1024 }, 5 }
        pickupArray[49] = { pickup.tec9, { -556.5086, 57.8378, 3.8213 }, 50 }
        pickupArray[50] = { pickup.chainsaw, { -656.858, -38.2457, 18.8226 }, 10 }
        pickupArray[51] = { pickup.shotgun, { -588.1567, 116.6647, 18.2485 }, 20 }
        pickupArray[52] = { pickup.shotgun, { -408.2195, 87.539, 3.7254 }, 20 }
        pickupArray[53] = { pickup.rocket_launcher, { -762.0179, -91.6711, 3.0751 }, 5 }
        pickupArray[54] = { pickup.shotgun, { -809.3438, 126.2594, 26.2036 }, 20 }
        pickupArray[55] = { pickup.grenade, { -778.6487, 204.3694, 28.7664 }, 10 }
        pickupArray[56] = { pickup.ak47, { -535.7486, 189.3272, 46.0075 }, 50 }
        pickupArray[57] = { pickup.tec9, { -634.8486, 250.3076, 60.5297 }, 50 }
        pickupArray[58] = { pickup.health, { -677.3319, 205.5225, 53.8198 } }
        pickupArray[59] = { pickup.health, { -402.7343, 366.9131, 90.2975 } }
        pickupArray[60] = { pickup.health, { -231.1376, 191.1937, 12.2247 } }
        pickupArray[61] = { pickup.health, { -465.5269, 54.4311, 3.8213 } }
        pickupArray[62] = { pickup.health, { -667.3107, 104.6015, 18.9694 } }
        pickupArray[63] = { pickup.health, { -495.2516, -188.3703, 1.6884 } }
        pickupArray[64] = { pickup.health, { -634.9911, -120.1295, 6.2981 } }
        pickupArray[65] = { pickup.armour, { -294.3105, 266.0922, 67.1938 } }
        pickupArray[66] = { pickup.armour, { -411.1188, 20.8521, 3.8725 } }
        pickupArray[67] = { pickup.armour, { -732.6067, 47.5126, 3.607 } }
        pickupArray[68] = { pickup.ak47, { -1542.112, -946.6136, 14.4772 }, 50 }
        pickupArray[69] = { pickup.rocket_launcher, { -1342.9647, -835.3528, 18.4852 }, 5 }
        pickupArray[70] = { pickup.molotov, { -1410.8899, -1063.6525, 10.8095 }, 10 }
        pickupArray[71] = { pickup.shotgun, { -1097.3091, -852.4142, 11.0766 }, 20 }
        pickupArray[72] = { pickup.det_grenade, { -1173.0283, -668.4009, 13.7275 }, 10 }
        pickupArray[73] = { pickup.grenade, { -1305.817, -537.5673, 11.0766 }, 10 }
        pickupArray[74] = { pickup.sniper, { -1427.5117, -609.5578, 19.0872 }, 20 }
        pickupArray[75] = { pickup.rocket_launcher, { -1087.1561, -571.8889, 20.3599 }, 5 }
        pickupArray[76] = { pickup.ak47, { -1033.2089, -447.6659, 11.0781 }, 50 }
        pickupArray[77] = { pickup.det_grenade, { -1193.6815, -1039.8694, 3.4423 }, 10 }
        pickupArray[78] = { pickup.health, { -1111.723, -505.8408, 10.8749 } }
        pickupArray[79] = { pickup.health, { -1353.478, -523.0536, 11.0766 } }
        pickupArray[80] = { pickup.health, { -1269.3074, -713.2909, 14.3733 } }
        pickupArray[81] = { pickup.health, { -1495.0115, -1063.3479, 3.4429 } }
        pickupArray[82] = { pickup.health, { -1012.8546, -1224.5356, 10.8095 } }
        pickupArray[83] = { pickup.health, { -1008.8545, -949.3159, 11.1549 } }
        pickupArray[84] = { pickup.health, { -1282.8481, -901.1232, 11.0779 } }
        pickupArray[85] = { pickup.armour, { -1127.4115, -766.7277, 11.0766 } }
        pickupArray[86] = { pickup.armour, { -1554.5155, -908.9347, 14.4785 } }
        pickupArray[87] = { pickup.tec9, { -655.7507, -399.982, 18.6087 }, 50 }
        pickupArray[88] = { pickup.chainsaw, { -631.0912, -718.1263, 18.9172 }, 10 }
        pickupArray[89] = { pickup.det_grenade, { -632.5631, -498.205, 23.3845 }, 10 }
        pickupArray[90] = { pickup.ak47, { -750.754, -520.3548, 10.0086 }, 50 }
        pickupArray[91] = { pickup.molotov, { -839.337, -458.4833, 11.0778 }, 10 }
        pickupArray[92] = { pickup.shotgun, { -849.7783, -649.5356, 13.8124 }, 20 }
        pickupArray[93] = { pickup.tec9, { -549.4403, -971.5536, 10.8012 }, 50 }
        pickupArray[94] = { pickup.grenade, { -928.8517, -750.6072, 11.0779 }, 10 }
        pickupArray[95] = { pickup.rocket_launcher, { -769.9731, -751.7317, 19.2258 }, 5 }
        pickupArray[96] = { pickup.health, { -955.2161, -752.0958, 11.0751 } }
        pickupArray[97] = { pickup.health, { -763.9592, -879.5562, 11.0759 } }
        pickupArray[98] = { pickup.health, { -852.4181, -715.1934, 10.8059 } }
        pickupArray[99] = { pickup.health, { -840.6257, -470.193, 11.0744 } }
        pickupArray[100] = { pickup.health, { -679.5853, -776.7424, 18.8586 } }
        pickupArray[101] = { pickup.health, { -655.3177, -524.1627, 22.8663 } }
        pickupArray[102] = { pickup.armour, { -758.7523, -1054.6404, 7.3285 } }
        pickupArray[103] = { pickup.armour, { -965.5682, -456.2681, 11.0766 } }
        pickupArray[104] = { pickup.armour, { -539.5904, -629.7623, 13.5276 } }
        pickupsTable = pickupArray
      end
    end
    if GameType() == 1 then
      if UseRacePowerups() then
        self:AddRacePickups()
      end
    else
      for k, v in ipairs(pickupsTable) do
        table.insert(self.pickups, CreatePickup(unpack(v)))
      end
    end
    if GameType() == 2 then
      self:AddDTBPickups()
    else
      if GameType() == 3 then
        self:AddCTFPickups()
      end
    end
  end
  self.pickupBlipScript = PickupBlipScript{}:Start(90)
end

function PickupMgr:AddRacePickups()
  local pickupsTable, pickupArray
  if IsServer() then
    pickupsTable = {}
    if GameLocation() == 0 then
      if RaceId() == 0 then
        pickupArray = {}
        pickupArray[1] = { pickup.racegood, { 819, -925, 8 }, 3 }
        pickupArray[2] = { pickup.racebad, { 1038, -184, 5 }, 3 }
        pickupArray[3] = { pickup.racegood, { 807, -318, 7 }, 3 }
        pickupArray[4] = { pickup.racebad, { 835, -748, 15 }, 3 }
        pickupArray[5] = { pickup.racegood, { 1253, -208, 29 }, 3 }
        pickupArray[6] = { pickup.racebad, { 1365, -352, 50 }, 3 }
        pickupArray[7] = { pickup.racegood, { 1231, -636, 20 }, 3 }
        pickupArray[8] = { pickup.racebad, { 1325, -1039, 15 }, 3 }
        pickupsTable = pickupArray
      else
        if RaceId() == 1 then
          pickupArray = {}
          pickupArray[1] = { pickup.racegood, { 1135, -348, 20 }, 3 }
          pickupArray[2] = { pickup.racebad, { 1103, -30, 7 }, 3 }
          pickupArray[3] = { pickup.racegood, { 905, -273, 15 }, 3 }
          pickupArray[4] = { pickup.racebad, { 835, -554, 1 }, 3 }
          pickupArray[5] = { pickup.racegood, { 932, -611, 15 }, 3 }
          pickupArray[6] = { pickup.racebad, { 977, -759, 15 }, 3 }
          pickupArray[7] = { pickup.racegood, { 912, -1030, 8 }, 3 }
          pickupArray[8] = { pickup.racebad, { 1150, -1099, 12 }, 3 }
          pickupArray[9] = { pickup.racegood, { 1174, -1044, 15 }, 3 }
          pickupArray[10] = { pickup.racebad, { 1276, -892, 15 }, 3 }
          pickupArray[11] = { pickup.racegood, { 1144, -739, 15 }, 3 }
          pickupsTable = pickupArray
        else
          if RaceId() == 2 then
            pickupArray = {}
            pickupArray[1] = { pickup.racegood, { 825, -283, 5 }, 3 }
            pickupArray[2] = { pickup.racebad, { 1004, -281, 5 }, 3 }
            pickupArray[3] = { pickup.racegood, { 1063, -457, 15 }, 3 }
            pickupArray[4] = { pickup.racebad, { 934, -611, 15 }, 3 }
            pickupArray[5] = { pickup.racebad, { 1034, -778, 15 }, 3 }
            pickupArray[6] = { pickup.racegood, { 1139, -747, 15 }, 3 }
            pickupArray[7] = { pickup.racebad, { 1007, -632, 15 }, 3 }
            pickupsTable = pickupArray
          else
            if RaceId() == 3 then
              pickupArray = {}
              pickupArray[1] = { pickup.racegood, { 1066, -674, 15 }, 3 }
              pickupArray[2] = { pickup.racebad, { 1062, -460, 15 }, 3 }
              pickupArray[3] = { pickup.racegood, { 809, -211, 0 }, 3 }
              pickupArray[4] = { pickup.racebad, { 1085, -128, 9 }, 3 }
              pickupArray[5] = { pickup.racegood, { 1059, 0, 2 }, 3 }
              pickupArray[6] = { pickup.racebad, { 826, -300, 5 }, 3 }
              pickupArray[7] = { pickup.racegood, { 826, -480, 15 }, 3 }
              pickupArray[8] = { pickup.racebad, { 927, -479, 15 }, 3 }
              pickupArray[9] = { pickup.racegood, { 895, -574, 15 }, 3 }
              pickupArray[10] = { pickup.racebad, { 825, -622, 15 }, 3 }
              pickupArray[11] = { pickup.racegood, { 934, -611, 15 }, 3 }
              pickupArray[12] = { pickup.racebad, { 1166, -720, 15 }, 3 }
              pickupArray[13] = { pickup.racegood, { 1288, -939, 15 }, 3 }
              pickupArray[14] = { pickup.racebad, { 1135, -963, 15 }, 3 }
              pickupsTable = pickupArray
            else
              if RaceId() == 4 then
                pickupArray = {}
                pickupArray[1] = { pickup.racebad, { 1118, -820, 15 }, 3 }
                pickupArray[2] = { pickup.racegood, { 957, -825, 15 }, 3 }
                pickupArray[3] = { pickup.racebad, { 900, -742, 15 }, 3 }
                pickupArray[4] = { pickup.racegood, { 824, -604, 15 }, 3 }
                pickupArray[5] = { pickup.racebad, { 920, -568, 15 }, 3 }
                pickupArray[6] = { pickup.racegood, { 1050, -623, 15 }, 3 }
                pickupsTable = pickupArray
              else
                if RaceId() == 5 then
                  pickupArray = {}
                  pickupArray[1] = { pickup.racegood, { 1039, -919, 15 }, 3 }
                  pickupArray[2] = { pickup.racebad, { 1136, -962, 15 }, 3 }
                  pickupArray[3] = { pickup.racegood, { 1340, -995, 15 }, 3 }
                  pickupArray[4] = { pickup.racebad, { 1105, -1060, 15 }, 3 }
                  pickupArray[5] = { pickup.racegood, { 807, -960, 5 }, 3 }
                  pickupArray[6] = { pickup.racebad, { 835, -686, 15 }, 3 }
                  pickupArray[7] = { pickup.racegood, { 1051, -632, 15 }, 3 }
                  pickupsTable = pickupArray
                else
                  if RaceId() == 6 then
                    pickupArray = {}
                    pickupArray[1] = { pickup.racegood, { 1120, -321, 20 }, 3 }
                    pickupArray[2] = { pickup.racebad, { 1132, -208, 15 }, 3 }
                    pickupArray[3] = { pickup.racegood, { 1015, 5, 2 }, 3 }
                    pickupArray[4] = { pickup.racebad, { 851, -149, 5 }, 3 }
                    pickupArray[5] = { pickup.racegood, { 871, -273, 5 }, 3 }
                    pickupArray[6] = { pickup.racebad, { 981, -333, 10 }, 3 }
                    pickupArray[7] = { pickup.racegood, { 995, -41, 15 }, 3 }
                    pickupArray[8] = { pickup.racebad, { 1033, -476, 15 }, 3 }
                    pickupsTable = pickupArray
                  else
                    if RaceId() == 7 then
                      pickupArray = {}
                      pickupArray[1] = { pickup.racegood, { 857, -499, 15 }, 3 }
                      pickupArray[2] = { pickup.racebad, { 835, -330, 8 }, 3 }
                      pickupArray[3] = { pickup.racegood, { 912, -84, -2 }, 3 }
                      pickupArray[4] = { pickup.racebad, { 1041, -169, 5 }, 3 }
                      pickupArray[5] = { pickup.racegood, { 1157, -203, 19 }, 3 }
                      pickupArray[6] = { pickup.racebad, { 1189, -256, 25 }, 3 }
                      pickupArray[7] = { pickup.racegood, { 1288, -327, 40 }, 3 }
                      pickupArray[8] = { pickup.racebad, { 1145, -421, 21 }, 3 }
                      pickupArray[9] = { pickup.racegood, { 1126, -472, 20 }, 3 }
                      pickupsTable = pickupArray
                    end
                  end
                end
              end
            end
          end
        end
      end
    else
      if GameLocation() == 1 then
        if RaceId() == 0 then
          pickupArray = {}
          pickupArray[1] = { pickup.racebad, { 20, -924, 26 }, 3 }
          pickupArray[2] = { pickup.racegood, { -59, -691, 17 }, 3 }
          pickupArray[3] = { pickup.racebad, { -92, -465, 16 }, 3 }
          pickupArray[4] = { pickup.racegood, { 70, -247, 17 }, 3 }
          pickupArray[5] = { pickup.racebad, { 464, -267, 21 }, 3 }
          pickupArray[6] = { pickup.racegood, { 296, -394, 25 }, 3 }
          pickupArray[7] = { pickup.racebad, { 370, -151, 21 }, 3 }
          pickupArray[8] = { pickup.racegood, { 179, -507, 27 }, 3 }
          pickupsTable = pickupArray
        else
          if RaceId() == 1 then
            pickupArray = {}
            pickupArray[1] = { pickup.racegood, { -18, -477, 19 }, 3 }
            pickupArray[2] = { pickup.racebad, { -51, -293, 16 }, 3 }
            pickupArray[3] = { pickup.racegood, { -77, 76, 16 }, 3 }
            pickupArray[4] = { pickup.racebad, { 91, -17, 16 }, 3 }
            pickupArray[5] = { pickup.racegood, { 256, -151, 21 }, 3 }
            pickupArray[6] = { pickup.racebad, { 373, -394, 21 }, 3 }
            pickupArray[7] = { pickup.racegood, { 303, -690, 26 }, 3 }
            pickupArray[8] = { pickup.racebad, { 155, -905, 26 }, 3 }
            pickupsTable = pickupArray
          else
            if RaceId() == 2 then
              pickupArray = {}
              pickupArray[1] = { pickup.racegood, { 536, -1388, 16 }, 3 }
              pickupArray[2] = { pickup.racebad, { 413, -1303, 26 }, 3 }
              pickupArray[3] = { pickup.racegood, { 170, -11, 26 }, 3 }
              pickupArray[4] = { pickup.racebad, { 143, -979, 26 }, 3 }
              pickupArray[5] = { pickup.racegood, { 256, -523, 26 }, 3 }
              pickupArray[6] = { pickup.racebad, { 106, -300, 16 }, 3 }
              pickupArray[7] = { pickup.racegood, { 257, -122, 21 }, 3 }
              pickupArray[8] = { pickup.racebad, { 328, -262, 21 }, 3 }
              pickupArray[9] = { pickup.racegood, { 440, -388, 21 }, 3 }
              pickupArray[10] = { pickup.racebad, { 417, -667, 26 }, 3 }
              pickupsTable = pickupArray
            else
              if RaceId() == 3 then
                pickupArray = {}
                pickupArray[1] = { pickup.racegood, { -173, -74, 16 }, 3 }
                pickupArray[2] = { pickup.racebad, { 100, -140, 16 }, 3 }
                pickupArray[3] = { pickup.racegood, { 252, -284, 24 }, 3 }
                pickupArray[4] = { pickup.racebad, { 332, -325, 23 }, 3 }
                pickupArray[5] = { pickup.racegood, { 251, -525, 26 }, 3 }
                pickupArray[6] = { pickup.racebad, { 191, -61, 26 }, 3 }
                pickupArray[7] = { pickup.racegood, { 84, -541, 26 }, 3 }
                pickupsTable = pickupArray
              else
                if RaceId() == 4 then
                  pickupArray = {}
                  pickupArray[1] = { pickup.racegood, { 127, -853, 26 }, 3 }
                  pickupArray[2] = { pickup.racebad, { 32, -1051, 26 }, 3 }
                  pickupArray[3] = { pickup.racegood, { -147, -1309, 26 }, 3 }
                  pickupArray[4] = { pickup.racebad, { 42, -1471, 26 }, 3 }
                  pickupArray[5] = { pickup.racegood, { 21, -1594, 26 }, 3 }
                  pickupArray[6] = { pickup.racebad, { 186, -1396, 26 }, 3 }
                  pickupArray[7] = { pickup.racegood, { 275, -1271, 26 }, 3 }
                  pickupArray[8] = { pickup.racebad, { 479, -595, 36 }, 3 }
                  pickupArray[9] = { pickup.racegood, { 297, -399, 25 }, 3 }
                  pickupsTable = pickupArray
                else
                  if RaceId() == 5 then
                    pickupArray = {}
                    pickupArray[1] = { pickup.racegood, { 94, -938, 26 }, 3 }
                    pickupArray[2] = { pickup.racebad, { 146, -1141, 26 }, 3 }
                    pickupArray[3] = { pickup.racegood, { 131, -1364, 26 }, 3 }
                    pickupArray[4] = { pickup.racebad, { 349, -1400, 26 }, 3 }
                    pickupArray[5] = { pickup.racegood, { 274, -1180, 26 }, 3 }
                    pickupArray[6] = { pickup.racebad, { -49, -1013, 26 }, 3 }
                    pickupArray[7] = { pickup.racegood, { -138, -1159, 26 }, 3 }
                    pickupArray[8] = { pickup.racebad, { -165, -1352, 26 }, 3 }
                    pickupArray[9] = { pickup.racegood, { -143, -1543, 26 }, 3 }
                    pickupsTable = pickupArray
                  else
                    if RaceId() == 6 then
                      pickupArray = {}
                      pickupArray[1] = { pickup.racegood, { 376, -898, 25 }, 3 }
                      pickupArray[2] = { pickup.racebad, { 287, -1112, 26 }, 3 }
                      pickupArray[3] = { pickup.racegood, { 192, -1269, 26 }, 3 }
                      pickupArray[4] = { pickup.racebad, { 128, -131, 26 }, 3 }
                      pickupArray[5] = { pickup.racegood, { -44, -1371, 26 }, 3 }
                      pickupArray[6] = { pickup.racebad, { -181, -1458, 26 }, 3 }
                      pickupArray[7] = { pickup.racegood, { 36, -1529, 26 }, 3 }
                      pickupArray[8] = { pickup.racebad, { 160, -1588, 26 }, 3 }
                      pickupArray[9] = { pickup.racegood, { 319, -1535, 24 }, 3 }
                      pickupArray[10] = { pickup.racebad, { 348, -1396, 26 }, 3 }
                      pickupArray[11] = { pickup.racegood, { 401, -1237, 26 }, 3 }
                      pickupsTable = pickupArray
                    else
                      if RaceId() == 7 then
                        pickupArray = {}
                        pickupArray[1] = { pickup.racegood, { -72, -865, 26 }, 3 }
                        pickupArray[2] = { pickup.racebad, { 89, -951, 26 }, 3 }
                        pickupArray[3] = { pickup.racegood, { 164, -806, 26 }, 3 }
                        pickupArray[4] = { pickup.racebad, { 188, -696, 26 }, 3 }
                        pickupArray[5] = { pickup.racegood, { 192, -621, 26 }, 3 }
                        pickupArray[6] = { pickup.racebad, { 136, -541, 26 }, 3 }
                        pickupArray[7] = { pickup.racegood, { -12, -582, 22 }, 3 }
                        pickupsTable = pickupArray
                      end
                    end
                  end
                end
              end
            end
          end
        end
      else
        if GameLocation() == 2 then
          if RaceId() == 0 then
            pickupArray = {}
            pickupArray[1] = { pickup.racebad, { -433, 222, 68 }, 3 }
            pickupArray[2] = { pickup.racegood, { -519, 365, 79 }, 3 }
            pickupArray[3] = { pickup.racebad, { -885, 452, 52 }, 3 }
            pickupArray[4] = { pickup.racegood, { -1244, 382, 69 }, 3 }
            pickupArray[5] = { pickup.racebad, { -1259, 93, 69 }, 3 }
            pickupArray[6] = { pickup.racegood, { -1289, -115, 59 }, 3 }
            pickupArray[7] = { pickup.racebad, { -1256, -214, 52 }, 3 }
            pickupArray[8] = { pickup.racegood, { -894, -226, 30 }, 3 }
            pickupArray[9] = { pickup.racebad, { -973, -130, 34 }, 3 }
            pickupArray[10] = { pickup.racebad, { -1133, -61, 49 }, 3 }
            pickupArray[11] = { pickup.racegood, { -1056, 92, 49 }, 3 }
            pickupsTable = pickupArray
          else
            if RaceId() == 1 then
              pickupArray = {}
              pickupArray[1] = { pickup.racebad, { -1280, -12, 62 }, 3 }
              pickupArray[2] = { pickup.racegood, { -1233, -217, 50 }, 3 }
              pickupArray[3] = { pickup.racebad, { -997, -236, 34 }, 3 }
              pickupArray[4] = { pickup.racegood, { -755, -283, 19 }, 3 }
              pickupArray[5] = { pickup.racebad, { -611, -191, -29 }, 3 }
              pickupArray[6] = { pickup.racegood, { -607, 95, -14 }, 3 }
              pickupArray[7] = { pickup.racebad, { -905, 319, 35 }, 3 }
              pickupArray[8] = { pickup.racegood, { -1173, 486, 68 }, 3 }
              pickupsTable = pickupArray
            else
              if RaceId() == 2 then
                pickupArray = {}
                pickupArray[1] = { pickup.racegood, { -550, 222, 64 }, 3 }
                pickupArray[2] = { pickup.racebad, { -288, 316, 73 }, 3 }
                pickupArray[3] = { pickup.racegood, { -485, 583, 78 }, 3 }
                pickupArray[4] = { pickup.racebad, { -940, 530, 67 }, 3 }
                pickupArray[5] = { pickup.racegood, { -1238, 376, 68 }, 3 }
                pickupArray[6] = { pickup.racebad, { -1141, 179, 59 }, 3 }
                pickupArray[7] = { pickup.racegood, { -995, 122, 49 }, 3 }
                pickupsTable = pickupArray
              else
                if RaceId() == 3 then
                  pickupArray = {}
                  pickupArray[1] = { pickup.racegood, { -1121, 165, 59 }, 3 }
                  pickupArray[2] = { pickup.racebad, { -1246, -223, 51 }, 3 }
                  pickupArray[3] = { pickup.racegood, { -975, -177, 34 }, 3 }
                  pickupArray[4] = { pickup.racegood, { -992, -38, 40 }, 3 }
                  pickupsTable = pickupArray
                else
                  if RaceId() == 4 then
                    pickupArray = {}
                    pickupArray[1] = { pickup.racegood, { -991, -34, 40 }, 3 }
                    pickupArray[2] = { pickup.racebad, { -1067, 92, 49 }, 3 }
                    pickupArray[3] = { pickup.racegood, { -1092, -152, 44 }, 3 }
                    pickupArray[4] = { pickup.racebad, { -870, -234, 29 }, 3 }
                    pickupArray[5] = { pickup.racegood, { -863, -120, 34 }, 3 }
                    pickupArray[6] = { pickup.racebad, { -992, 107, 14 }, 3 }
                    pickupArray[7] = { pickup.racegood, { -1107, 212, 4 }, 3 }
                    pickupsTable = pickupArray
                  else
                    if RaceId() == 5 then
                      pickupArray = {}
                      pickupArray[1] = { pickup.racegood, { -787, 164, 14 }, 3 }
                      pickupArray[2] = { pickup.racebad, { -654, -153, 4 }, 3 }
                      pickupArray[3] = { pickup.racegood, { -449, -175, 4 }, 3 }
                      pickupArray[4] = { pickup.racebad, { -582, -32, 4 }, 3 }
                      pickupArray[5] = { pickup.racegood, { -605, 27, 19 }, 3 }
                      pickupArray[6] = { pickup.racebad, { -772, 140, 29 }, 3 }
                      pickupArray[7] = { pickup.racegood, { -573, 175, 44 }, 3 }
                      pickupArray[8] = { pickup.racebad, { -581, 228, 61 }, 3 }
                      pickupArray[9] = { pickup.racegood, { -287, 317, 74 }, 3 }
                      pickupArray[10] = { pickup.racebad, { -439, 540, 82 }, 3 }
                      pickupArray[11] = { pickup.racegood, { -723, 639, 78 }, 3 }
                      pickupsTable = pickupArray
                    else
                      if RaceId() == 6 then
                        pickupArray = {}
                        pickupArray[1] = { pickup.racegood, { -977, -166, 34 }, 3 }
                        pickupArray[2] = { pickup.racebad, { -914, -127, 34 }, 3 }
                        pickupArray[3] = { pickup.racegood, { -1117, -83, 47 }, 3 }
                        pickupArray[4] = { pickup.racebad, { -1268, 67, 68 }, 3 }
                        pickupArray[5] = { pickup.racegood, { -1129, 172, 58 }, 3 }
                        pickupsTable = pickupArray
                      else
                        if RaceId() == 7 then
                          pickupArray = {}
                          pickupArray[1] = { pickup.racegood, { -995, 122, 49 }, 3 }
                          pickupArray[2] = { pickup.racebad, { -974, -138, 34 }, 3 }
                          pickupArray[3] = { pickup.racegood, { -752, -284, 19 }, 3 }
                          pickupArray[4] = { pickup.racebad, { -590, -375, -12 }, 3 }
                          pickupArray[5] = { pickup.racegood, { -414, 25, -22 }, 3 }
                          pickupArray[6] = { pickup.racebad, { -548, 147, -22 }, 3 }
                          pickupArray[7] = { pickup.racegood, { -841, 203, 22 }, 3 }
                          pickupArray[8] = { pickup.racebad, { -708, 354, 69 }, 3 }
                          pickupArray[9] = { pickup.racegood, { -544, 369, 78 }, 3 }
                          pickupArray[10] = { pickup.racebad, { -314, 263, 63 }, 3 }
                          pickupArray[11] = { pickup.racegood, { -569, 231, 62 }, 3 }
                          pickupsTable = pickupArray
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
    for k, v in ipairs(pickupsTable) do
      table.insert(self.pickups, CreatePickup(unpack(v)))
    end
  end
end

function PickupMgr:AddDTBPickups()
  local pickupsTable, pickupArray
  if IsServer() then
    pickupsTable = {}
    if GameLocation() == 0 then
      pickupArray = {}
      pickupArray[1] = { pickup.tec9, { 1228.0414, -135.8676, 14.9326 }, 50 }
      pickupArray[2] = { pickup.shotgun, { 1253.1915, -87.7361, 14.769 }, 12 }
      pickupArray[3] = { pickup.det_grenade, { 1320.0925, -295.6476, 15.2436 }, 3 }
      pickupArray[4] = { pickup.glock17, { 1208.6989, -141.8298, 14.9326 }, 50 }
      pickupArray[5] = { pickup.ak47, { 1254.3368, -56.8413, 10.2011 }, 50 }
      pickupArray[6] = { pickup.tec9, { 1142.7616, -104.7277, 7.4335 }, 50 }
      pickupArray[7] = { pickup.det_grenade, { 1155.3582, -189.5768, 14.9334 }, 3 }
      pickupArray[8] = { pickup.ak47, { 1069.642, -27.6567, 7.4525 }, 50 }
      pickupArray[9] = { pickup.glock17, { 1142.0704, 110.0923, 0.4439 }, 50 }
      pickupArray[10] = { pickup.molotov, { 1319.9995, -85.2223, 15.0627 }, 5 }
      pickupArray[11] = { pickup.tec9, { 1380.0582, -868.4446, 11.7834 }, 50 }
      pickupArray[12] = { pickup.det_grenade, { 1400.5625, -835.5011, 11.7915 }, 3 }
      pickupArray[13] = { pickup.ak47, { 1331.8387, -828.0793, 14.9858 }, 50 }
      pickupArray[14] = { pickup.tec9, { 1364.1409, -761.0011, 14.6399 }, 50 }
      pickupsTable = pickupArray
    else
      if GameLocation() == 1 then
        pickupArray = {}
        pickupArray[1] = { pickup.rocket_launcher, { 271.9741, -608.0781, 38.0891 }, 5 }
        pickupArray[2] = { pickup.shotgun, { 270.2513, -483.1662, 36.234 }, 12 }
        pickupArray[3] = { pickup.glock17, { 343.0322, -483.2989, 33.8327 }, 50 }
        pickupArray[4] = { pickup.molotov, { 342.5708, -607.2725, 33.8327 }, 5 }
        pickupArray[5] = { pickup.ak47, { 269.0379, -606.4355, 31.4314 }, 50 }
        pickupArray[6] = { pickup.glock17, { 302.045, -606.5057, 31.4314 }, 50 }
        pickupArray[7] = { pickup.grenade, { 303.6243, -484.9482, 31.4314 }, 3 }
        pickupArray[8] = { pickup.tec9, { 268.6298, -481.6583, 31.4314 }, 50 }
        pickupArray[9] = { pickup.det_grenade, { 380.1846, -577.117, 26.1359 }, 3 }
        pickupArray[10] = { pickup.ak47, { 216.4322, -629.4075, 26.1275 }, 50 }
        pickupArray[11] = { pickup.shotgun, { 189.8765, -519.1747, 26.1547 }, 12 }
        pickupArray[12] = { pickup.chainsaw, { 323.3671, -446.6893, 23.4271 }, 100 }
        pickupArray[13] = { pickup.glock17, { 13.1103, -1101.3253, 26.3553 }, 50 }
        pickupArray[14] = { pickup.molotov, { 9.588, -1108.5825, 26.3542 }, 5 }
        pickupArray[15] = { pickup.grenade, { -55.314, -1053.9421, 26.1282 }, 3 }
        pickupArray[16] = { pickup.glock17, { -54.9276, -1024.2247, 26.1281 }, 50 }
        pickupArray[17] = { pickup.tec9, { -55.5742, -951.275, 26.1281 }, 300 }
        pickupArray[18] = { pickup.ak47, { 29.21, -1039.7351, 26.128 }, 50 }
        pickupsTable = pickupArray
      else
        if GameLocation() == 2 then
          pickupArray = {}
          pickupArray[1] = { pickup.rocket_launcher, { -380.4286, 323.9234, 63.8834 }, 5 }
          pickupArray[2] = { pickup.shotgun, { -334.3311, 289.8972, 62.7943 }, 12 }
          pickupArray[3] = { pickup.tec9, { -374.8417, 280.0041, 62.4954 }, 50 }
          pickupArray[4] = { pickup.glock17, { -389.9324, 297.8649, 62.9237 }, 50 }
          pickupArray[5] = { pickup.molotov, { -428.6427, 288.49, 62.9132 }, 5 }
          pickupArray[6] = { pickup.ak47, { -356.5946, 246.4536, 60.8734 }, 50 }
          pickupArray[7] = { pickup.tec9, { -458.5256, 272.4066, 72.583 }, 50 }
          pickupArray[8] = { pickup.det_grenade, { -287.369, 278.9638, 64.8461 }, 3 }
          pickupArray[9] = { pickup.shotgun, { -315.8377, 379.1954, 80.2763 }, 12 }
          pickupArray[10] = { pickup.chainsaw, { -429.9433, 302.8232, 62.8502 }, 100 }
          pickupArray[11] = { pickup.shotgun, { -603.305, 250.2758, 61.1598 }, 12 }
          pickupArray[12] = { pickup.ak47, { -742.1352, 281.0201, 54.1422 }, 50 }
          pickupArray[13] = { pickup.grenade, { -998.2325, 103.2354, 48.8213 }, 3 }
          pickupArray[14] = { pickup.tec9, { -1065.0518, 68.7893, 48.9805 }, 50 }
          pickupArray[15] = { pickup.grenade, { -1082.3717, 54.8619, 58.5615 }, 3 }
          pickupArray[16] = { pickup.glock17, { -1142.4456, 75.1201, 58.7872 }, 50 }
          pickupArray[17] = { pickup.tec9, { -1131.275, 116.7242, 58.8049 }, 50 }
          pickupArray[18] = { pickup.molotov, { -1136.2307, 46.1595, 58.7813 }, 5 }
          pickupArray[19] = { pickup.ak47, { -1115.2126, 32.8264, 58.6842 }, 50 }
          pickupsTable = pickupArray
        end
      end
    end
    for k, v in ipairs(pickupsTable) do
      table.insert(self.pickups, CreatePickup(unpack(v)))
    end
  end
end

function PickupMgr:AddCTFPickups()
  local pickupsTable, pickupArray
  if IsServer() then
    pickupsTable = {}
    if GameLocation() == 0 then
      pickupArray = {}
      pickupArray[1] = { pickup.molotov, { 1228.0414, -135.8676, 14.9326 }, 5 }
      pickupArray[2] = { pickup.glock17, { 1253.1915, -87.7361, 14.769 }, 50 }
      pickupArray[3] = { pickup.rocket_launcher, { 1320.0925, -295.6476, 15.2436 }, 5 }
      pickupArray[4] = { pickup.chainsaw, { 1208.6989, -141.8298, 14.9326 }, 100 }
      pickupArray[5] = { pickup.shotgun, { 1254.3368, -56.8413, 10.2011 }, 20 }
      pickupArray[6] = { pickup.sniper, { 1142.7616, -104.7277, 7.4335 }, 10 }
      pickupArray[7] = { pickup.ak47, { 1155.3582, -189.5768, 14.9334 }, 50 }
      pickupArray[8] = { pickup.tec9, { 1069.642, -27.6567, 7.4525 }, 50 }
      pickupArray[9] = { pickup.sniper, { 1142.0704, 110.0923, 0.4839 }, 10 }
      pickupArray[10] = { pickup.grenade, { 1319.9995, -85.2223, 15.0627 }, 5 }
      pickupArray[11] = { pickup.sniper, { 936.2822, -934.7263, 19.1919 }, 10 }
      pickupArray[12] = { pickup.shotgun, { 946.4348, -848.4921, 14.7965 }, 20 }
      pickupArray[13] = { pickup.grenade, { 776.1117, -880.9234, 14.7052 }, 5 }
      pickupArray[14] = { pickup.ak47, { 847.034, -978.1246, 5.0137 }, 50 }
      pickupArray[15] = { pickup.sniper, { 850.6971, -824.9781, 27.5371 }, 10 }
      pickupArray[16] = { pickup.tec9, { 999.6838, -885.3864, 15.3094 }, 50 }
      pickupArray[17] = { pickup.molotov, { 940.3749, -898.1082, 14.9487 }, 5 }
      pickupArray[18] = { pickup.chainsaw, { 906.7311, -879.193, 19.0427 }, 100 }
      pickupArray[19] = { pickup.rocket_launcher, { 1007.1986, -733.6248, 14.9316 }, 5 }
      pickupArray[20] = { pickup.glock17, { 824.451, -760.0349, 15.0326 }, 50 }
      pickupsTable = pickupArray
    else
      if GameLocation() == 1 then
        pickupArray = {}
        pickupArray[1] = { pickup.tec9, { 232.2829, -996.3204, 22.4038 }, 50 }
        pickupArray[2] = { pickup.grenade, { 393.7349, -1005.792, 26.0778 }, 5 }
        pickupArray[3] = { pickup.shotgun, { 377.9637, -1047.2292, 16.0159 }, 20 }
        pickupArray[4] = { pickup.glock17, { 236.8234, -1135.9171, 22.1276 }, 50 }
        pickupArray[5] = { pickup.molotov, { 329.6372, -1085.4048, 25.9564 }, 5 }
        pickupArray[6] = { pickup.glock17, { 341.0371, -1084.4303, 22.4988 }, 50 }
        pickupArray[7] = { pickup.tec9, { 350.9466, -1086.2032, 25.9584 }, 50 }
        pickupArray[8] = { pickup.ak47, { 398.3732, -1131.4076, 26.1281 }, 50 }
        pickupArray[9] = { pickup.chainsaw, { 321.0258, -1177.017, 15.9656 }, 100 }
        pickupArray[10] = { pickup.tec9, { 397.6284, -1214.019, 26.1281 }, 50 }
        pickupArray[11] = { pickup.det_grenade, { 244.054, -1206.2542, 20.4154 }, 5 }
        pickupArray[12] = { pickup.rocket_launcher, { 168.1948, -1256.3303, 26.1008 }, 5 }
        pickupArray[13] = { pickup.ak47, { 112.6686, -1228.1096, 26.1281 }, 50 }
        pickupArray[14] = { pickup.chainsaw, { -116.3904, -1286.3976, 26.2612 }, 100 }
        pickupArray[15] = { pickup.det_grenade, { -223.6201, -1401.7869, 20.469 }, 5 }
        pickupArray[16] = { pickup.shotgun, { -47.0532, -1390.7488, 26.1117 }, 20 }
        pickupArray[17] = { pickup.ak47, { 79.9428, -1401.7461, 26.1769 }, 50 }
        pickupArray[18] = { pickup.grenade, { -50.9731, -1433.7305, 30.3836 }, 5 }
        pickupArray[19] = { pickup.molotov, { -123.1662, -1432.9751, 26.1041 }, 5 }
        pickupArray[20] = { pickup.glock17, { -88.4226, -1430.7816, 26.1041 }, 50 }
        pickupArray[21] = { pickup.tec9, { -48.6427, -1495.5454, 26.1041 }, 50 }
        pickupArray[22] = { pickup.rocket_launcher, { 106.4159, -1565.711, 23.7467 }, 5 }
        pickupsTable = pickupArray
      else
        if GameLocation() == 2 then
          pickupArray = {}
          pickupArray[1] = { pickup.shotgun, { -648.7451, 67.569, 18.7067 }, 20 }
          pickupArray[2] = { pickup.tec9, { -673.3328, 48.275, 18.7456 }, 50 }
          pickupArray[3] = { pickup.rocket_launcher, { -724.5386, 56.5324, 20.1161 }, 5 }
          pickupArray[4] = { pickup.glock17, { -697.1685, 84.1517, 18.7488 }, 50 }
          pickupArray[5] = { pickup.tec9, { -688.728, 110.4186, 21.1928 }, 50 }
          pickupArray[6] = { pickup.glock17, { -712.7247, 135.4902, 23.5916 }, 50 }
          pickupArray[7] = { pickup.grenade, { -774.2778, 107.899, 29.08677 }, 5 }
          pickupArray[8] = { pickup.det_grenade, { -766.416, 141.9111, 28.82134 }, 5 }
          pickupArray[9] = { pickup.shotgun, { -687.8658, 144.9858, 32.53361 }, 20 }
          pickupArray[10] = { pickup.tec9, { -706.8055, 192.2223, 28.6714 }, 50 }
          pickupArray[11] = { pickup.glock17, { -755.7037, 205.0495, 28.6714 }, 50 }
          pickupArray[12] = { pickup.shotgun, { -775.0208, 204.7395, 28.6899 }, 20 }
          pickupArray[13] = { pickup.chainsaw, { -777.0145, 172.6318, 29.15717 }, 100 }
          pickupArray[14] = { pickup.tec9, { -595.8806, -50.0766, 18.82129 }, 50 }
          pickupArray[15] = { pickup.glock17, { -657.9488, -38.5029, 18.82269 }, 50 }
          pickupArray[16] = { pickup.shotgun, { -609.1042, 109.392, 18.77679 }, 20 }
          pickupArray[17] = { pickup.shotgun, { -751.1454, 215.3735, 49.20685 }, 20 }
          pickupArray[18] = { pickup.tec9, { -713.1217, 239.3442, 53.00784 }, 50 }
          pickupArray[19] = { pickup.glock17, { -547.6193, 174.4182, 43.82134 }, 50 }
          pickupsTable = pickupArray
        end
      end
    end
    for k, v in ipairs(pickupsTable) do
      table.insert(self.pickups, CreatePickup(unpack(v)))
    end
  end
end
