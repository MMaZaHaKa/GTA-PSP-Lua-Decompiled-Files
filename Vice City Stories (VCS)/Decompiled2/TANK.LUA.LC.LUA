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
L0_1 = require
L1_1 = "SharedLib"
L0_1(L1_1)
L0_1 = CoreLib
L0_1 = L0_1()
coreLib = L0_1
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
L0_1 = 6
TANKEVENT_IM_IN_DA_TANK = L0_1
L0_1 = Tank
function L1_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2
  L1_2 = DbgPrintAllOptions
  L1_2()
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.Init
  L1_2(L2_2)
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.WaitForAllPlayersToJoin
  L1_2(L2_2)
  L1_2 = GenerateAmbients
  L2_2 = false
  L1_2(L2_2)
  L1_2 = true
  A0_2.OkToPutSomeoneInTank = L1_2
  L1_2 = {}
  A0_2.TankSpawnPoints = L1_2
  L1_2 = {}
  A0_2.PlayerSpawnPoints = L1_2
  L1_2 = nil
  L2_2 = UseLCFiles
  L2_2 = L2_2()
  if L2_2 then
    L2_2 = dofile
    L3_2 = GetDiskPrepend
    L3_2 = L3_2()
    L4_2 = "LUA/TankData.lua.lc"
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  else
    L2_2 = dofile
    L3_2 = GetDiskPrepend
    L3_2 = L3_2()
    L4_2 = "LUA/TankData.lua"
    L3_2 = L3_2 .. L4_2
    L2_2 = L2_2(L3_2)
    L1_2 = L2_2
  end
  L2_2 = {}
  L3_2 = {}
  L4_2 = L1_2
  L4_2, L5_2 = L4_2()
  L3_2 = L5_2
  L2_2 = L4_2
  L4_2 = table
  L4_2 = L4_2.clone
  L5_2 = L2_2
  L4_2 = L4_2(L5_2)
  A0_2.TankSpawnPoints = L4_2
  L4_2 = table
  L4_2 = L4_2.clone
  L5_2 = L3_2
  L4_2 = L4_2(L5_2)
  A0_2.PlayerSpawnPoints = L4_2
  L1_2 = nil
  L4_2 = collectgarbage
  L4_2()
  L4_2 = UseSuperBrakeOnPause
  L5_2 = false
  L4_2(L5_2)
  L4_2 = false
  A0_2.removeSplashTextNow = L4_2
  L4_2 = {}
  A0_2.allPlayerDamage = L4_2
  L5_2 = A0_2
  L4_2 = A0_2.ClearDamageArray
  L4_2(L5_2)
  L4_2 = {}
  A0_2.scores = L4_2
  L4_2 = PickupMgr
  L4_2 = L4_2()
  A0_2.mypickups = L4_2
  L4_2 = A0_2.mypickups
  L5_2 = L4_2
  L4_2 = L4_2.CreatePickups
  L4_2(L5_2)
  L4_2 = false
  A0_2.InATank = L4_2
  A0_2.winningPlayer = 0
  L4_2 = IsServer
  L4_2 = L4_2()
  if L4_2 then
    L4_2 = GameElapsedMs
    L4_2 = L4_2()
    A0_2.LastSentInTankMsg = L4_2
    L4_2 = UsePowerups
    L4_2 = L4_2()
    if L4_2 then
      L4_2 = PowerUpTimer
      L5_2 = L4_2
      L4_2 = L4_2.Start
      L4_2(L5_2)
    end
  end
  L4_2 = Wait
  L5_2 = 1000
  L4_2(L5_2)
  L4_2 = {}
  A0_2.players = L4_2
  L4_2 = {}
  A0_2.totalmins = L4_2
  L4_2 = {}
  A0_2.totalseconds = L4_2
  L4_2 = AllPlayers
  L4_2 = L4_2()
  A0_2.allplayers = L4_2
  L4_2 = ipairs
  L5_2 = A0_2.allplayers
  L4_2, L5_2, L6_2, L7_2 = L4_2(L5_2)
  for L6_2, L7_2 in L4_2, L5_2 do
    L8_2 = print
    L9_2 = "Insert "
    L10_2 = L6_2
    L9_2 = L9_2 .. L10_2
    L8_2(L9_2)
    L8_2 = table
    L8_2 = L8_2.insert
    L9_2 = A0_2.players
    L10_2 = L7_2
    L8_2(L9_2, L10_2)
  end
  L4_2 = 0
  while L4_2 <= 8 do
    L5_2 = A0_2.totalmins
    L5_2[L4_2] = 0
    L5_2 = A0_2.totalseconds
    L5_2[L4_2] = 0
    L4_2 = L4_2 + 1
  end
  L5_2 = Player
  L6_2 = PlayerId
  L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L6_2()
  L5_2 = L5_2(L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  A0_2.localplayer = L5_2
  L5_2 = Player
  L5_2 = L5_2()
  A0_2.tankDamage = 0
  L6_2 = false
  A0_2.SplashTextIsOnScreen = L6_2
  A0_2.tankDam = nil
  A0_2.tankDmgTxt = nil
  A0_2.tanktime = nil
  L7_2 = A0_2
  L6_2 = A0_2.ShowHUD
  L8_2 = false
  L6_2(L7_2, L8_2)
  L6_2 = coreLib
  L7_2 = L6_2
  L6_2 = L6_2.ToggleEndOfGame
  L8_2 = false
  L6_2(L7_2, L8_2)
  L6_2 = TankMessagePump
  L6_2 = L6_2()
  A0_2.myMessagePump = L6_2
  L6_2 = A0_2.myMessagePump
  L7_2 = L6_2
  L6_2 = L6_2.Start
  L6_2(L7_2)
  L6_2 = Wait
  L7_2 = 100
  L6_2(L7_2)
  A0_2.currentTank = nil
  L6_2 = IsServer
  L6_2 = L6_2()
  if L6_2 then
    L7_2 = A0_2
    L6_2 = A0_2.GetTankRespawnPosition
    L6_2 = L6_2(L7_2)
    L7_2 = CreateVehicle
    L8_2 = TankModel
    L8_2 = L8_2()
    L9_2 = L6_2
    L10_2 = L6_2[4]
    L11_2 = nil
    L12_2 = nil
    L13_2 = true
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    A0_2.currentTank = L7_2
    L7_2 = VehicleAdd3dMarker
    L8_2 = A0_2.currentTank
    L7_2(L8_2)
    L7_2 = VehicleSetCarDoorLocks
    L8_2 = A0_2.currentTank
    L9_2 = CARLOCK_UNLOCKED
    L7_2(L8_2, L9_2)
  end
  L6_2 = true
  A0_2.StartGameRunForTank = L6_2
  A0_2.TankRadarBlip = nil
  L6_2 = A0_2.localplayer
  L7_2 = L6_2
  L6_2 = L6_2.PlayerNum
  L6_2 = L6_2(L7_2)
  L7_2 = playerintank
  if L6_2 ~= L7_2 then
    L6_2 = main
    L7_2 = A0_2.PlayerSpawnPoints
    L6_2.vSpawnPoints = L7_2
    L6_2 = DoSpawn
    L7_2 = InitialSpawnPoint
    L8_2 = PlayerId
    L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L8_2()
    L7_2 = L7_2(L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L8_2 = false
    L9_2 = GameLocation
    L9_2, L10_2, L11_2, L12_2, L13_2 = L9_2()
    L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
    L7_2 = print
    L8_2 = "^S^ "
    L9_2 = PlayerId
    L9_2 = L9_2()
    L10_2 = "^S^ "
    L11_2 = InitialSpawnPoint
    L12_2 = PlayerId
    L12_2, L13_2 = L12_2()
    L11_2 = L11_2(L12_2, L13_2)
    L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
    L7_2(L8_2)
    L7_2 = A0_2.localplayer
    L8_2 = L7_2
    L7_2 = L7_2.Respawn
    L9_2 = L6_2
    L10_2 = L6_2[4]
    L7_2(L8_2, L9_2, L10_2)
  end
  L6_2 = {}
  A0_2.client = L6_2
  L6_2 = IsServer
  L6_2 = L6_2()
  if L6_2 then
    L6_2 = pairs
    L7_2 = A0_2.players
    L6_2, L7_2, L8_2, L9_2 = L6_2(L7_2)
    for L8_2, L9_2 in L6_2, L7_2 do
      L10_2 = A0_2.client
      L11_2 = MultiTankClient
      L12_2 = {}
      L13_2 = L9_2
      L12_2[1] = L13_2
      L11_2 = L11_2(L12_2)
      L12_2 = L11_2
      L11_2 = L11_2.Start
      L11_2 = L11_2(L12_2)
      L10_2[L9_2] = L11_2
    end
  end
  L6_2 = IsServer
  L6_2 = L6_2()
  if L6_2 then
    L6_2 = ServerReadyToGo
    L7_2 = true
    L6_2(L7_2)
    L6_2 = Wait
    L7_2 = 500
    L6_2(L7_2)
  end
  L6_2 = Wait
  L7_2 = 100
  L6_2(L7_2)
  L6_2 = NoFuckingCutscene
  L6_2 = L6_2()
  if not L6_2 then
    L6_2 = main
    L6_2 = L6_2.scores
    L7_2 = L6_2
    L6_2 = L6_2.Hide
    L8_2 = true
    L6_2(L7_2, L8_2)
    L6_2 = Wait
    L7_2 = 5
    L6_2(L7_2)
    goto lbl_267
    repeat
      L6_2 = Wait
      L7_2 = 5
      L6_2(L7_2)
      ::lbl_267::
      L6_2 = SyncCutScene
      L6_2 = L6_2()
      L7_2 = false
    until L6_2 ~= L7_2
    L6_2 = RunScriptedCutscene
    L6_2()
    L6_2 = Wait
    L7_2 = 0
    L6_2(L7_2)
    goto lbl_281
    repeat
      L6_2 = Wait
      L7_2 = 0
      L6_2(L7_2)
      ::lbl_281::
      L6_2 = ProcessScriptedCutscene
      L6_2 = L6_2()
    until not L6_2
    L6_2 = main
    L6_2 = L6_2.scores
    L7_2 = L6_2
    L6_2 = L6_2.Hide
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
  L7_2 = A0_2
  L6_2 = A0_2.ShowHUD
  L8_2 = true
  L6_2(L7_2, L8_2)
  L6_2 = SetGameTime
  L7_2 = GameTimeLimit
  L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2 = L7_2()
  L6_2(L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2)
  L6_2 = GameElapsedMs
  L7_2 = 0
  L6_2(L7_2)
  L6_2 = UpdateGameTime
  L7_2 = true
  L6_2(L7_2)
  L6_2 = coreLib
  L7_2 = L6_2
  L6_2 = L6_2.Commentate
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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
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
        L3_2 = print
        L4_2 = "Tank is Wrecked, creating another"
        L3_2(L4_2)
        L3_2 = CreateVehicle
        L4_2 = TankModel
        L4_2 = L4_2()
        L5_2 = L2_2
        L6_2 = L2_2[4]
        L7_2 = nil
        L8_2 = nil
        L9_2 = true
        L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
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
    L3_2 = L1_2
    L2_2 = L1_2.InATank
    L2_2 = L2_2(L3_2)
    if not L2_2 then
      L2_2 = print
      L3_2 = "Putting myself in a tank"
      L2_2(L3_2)
      L3_2 = A0_2
      L2_2 = A0_2.TransferPlayerToTank
      L2_2(L3_2)
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
      goto lbl_74
    end
    L1_2 = IsServer
    L1_2 = L1_2()
    if not L1_2 then
      goto lbl_74
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
      L3_2 = GetEveryonePeerGroupId
      L3_2 = L3_2()
      L4_2 = L1_2
      L5_2 = 3
      L6_2 = pickupicon
      L6_2 = L6_2.tank
      L2_2 = L2_2(L3_2, L4_2, L5_2, L6_2)
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
  ::lbl_74::
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
      L4_2 = coreLib
      L5_2 = L4_2
      L4_2 = L4_2.ToggleEndOfGame
      L6_2 = true
      L4_2(L5_2, L6_2)
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
  local L1_2, L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2
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
    L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2()
    L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  end
  L3_2 = PlayerHealth
  L4_2 = Player
  L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L4_2()
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  if not (L3_2 <= 1) then
    L3_2 = IsLocalPlayerInVehicle
    L3_2 = L3_2()
    if not L3_2 then
      L3_2 = IsLocalPlayerDrowning
      L3_2 = L3_2()
      if not L3_2 then
        L3_2 = A0_2.localplayer
        L4_2 = L3_2
        L3_2 = L3_2.IsPlaying
        L3_2 = L3_2(L4_2)
        if L3_2 then
          goto lbl_82
        end
      end
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
  ::lbl_82::
  L3_2 = print
  L4_2 = "creating a tank in TransferPlayerToTank()"
  L3_2(L4_2)
  L3_2 = CreateVehicle
  L4_2 = TankModel
  L4_2 = L4_2()
  L5_2 = L2_2
  L6_2 = L2_2[4]
  L7_2 = nil
  L8_2 = nil
  L9_2 = true
  L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2, L8_2, L9_2)
  A0_2.currentTank = L3_2
  L3_2 = VehicleAdd3dMarker
  L4_2 = A0_2.currentTank
  L3_2(L4_2)
  L3_2 = SetPosition
  L4_2 = Player
  L5_2 = PlayerId
  L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2 = L5_2()
  L4_2 = L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2)
  L5_2 = L1_2
  L3_2(L4_2, L5_2)
  L3_2 = WarpPlayerIntoCar
  L4_2 = PlayerId
  L4_2 = L4_2()
  L5_2 = A0_2.currentTank
  L3_2(L4_2, L5_2)
  L3_2 = true
  A0_2.InATank = L3_2
  L4_2 = A0_2
  L3_2 = A0_2.DoSendEvent
  L5_2 = TANKEVENT_IM_IN_DA_TANK
  L6_2 = 0
  L7_2 = 0
  L8_2 = 0
  L3_2(L4_2, L5_2, L6_2, L7_2, L8_2)
  L3_2 = Player
  L3_2 = L3_2()
  L4_2 = ShowRadar
  L5_2 = true
  L4_2(L5_2)
  L4_2 = CameraFadeIn
  L5_2 = 5
  L4_2(L5_2)
  L5_2 = A0_2
  L4_2 = A0_2.DisplayTankMessage
  L6_2 = "^T^MPTNKGA"
  L7_2 = 1500
  L8_2 = "^T^MPTNKGB"
  L9_2 = {}
  L10_2 = 255
  L11_2 = 255
  L12_2 = 255
  L13_2 = 255
  L9_2[1] = L10_2
  L9_2[2] = L11_2
  L9_2[3] = L12_2
  L9_2[4] = L13_2
  L10_2 = {}
  L11_2 = 255
  L12_2 = 255
  L13_2 = 255
  L14_2 = 255
  L10_2[1] = L11_2
  L10_2[2] = L12_2
  L10_2[3] = L13_2
  L10_2[4] = L14_2
  L4_2(L5_2, L6_2, L7_2, L8_2, L9_2, L10_2)
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
    if not L2_2 then
      break
    end
    L2_2 = IsPlayerDead
    L3_2 = Player
    L3_2, L4_2 = L3_2()
    L2_2 = L2_2(L3_2, L4_2)
  until L2_2
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
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.IsEndOfGame
  L1_2 = L1_2(L2_2)
  if L1_2 then
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
  if L2_2 < 0 then
    L2_2 = 0
  end
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
    L5_2 = GameElapsedMs
    L5_2 = L5_2()
    L6_2 = A0_2.LastSentInTankMsg
    L5_2 = L5_2 - L6_2
    L6_2 = A0_2.OkToPutSomeoneInTank
    L7_2 = true
    if L6_2 == L7_2 then
      L6_2 = GameElapsedMs
      L6_2 = L6_2()
      A0_2.LastSentInTankMsg = L6_2
      L7_2 = A1_2
      L6_2 = A1_2.PlayerNum
      L6_2 = L6_2(L7_2)
      L7_2 = playerintank
      if L6_2 == L7_2 then
        L7_2 = A0_2
        L6_2 = A0_2.PlayerWhoDamagedTankMost
        L6_2 = L6_2(L7_2)
        L7_2 = playerintank
        if L6_2 ~= L7_2 then
          playerintank = L6_2
        else
          L8_2 = A0_2
          L7_2 = A0_2.ChoosePlayerInTank
          L7_2(L8_2)
        end
        L7_2 = TargetPlayer
        L8_2 = playerintank
        L7_2(L8_2)
        L7_2 = print
        L8_2 = "The Tank is dead, Long live the Tank : "
        L9_2 = playerintank
        L8_2 = L8_2 .. L9_2
        L7_2(L8_2)
        L7_2 = false
        A0_2.OkToPutSomeoneInTank = L7_2
        L8_2 = A0_2
        L7_2 = A0_2.DoSendEvent
        L9_2 = TANKEVENT_PLAYERINTANK
        L10_2 = playerintank
        L11_2 = 0
        L12_2 = 0
        L7_2(L8_2, L9_2, L10_2, L11_2, L12_2)
      end
    end
  else
    L6_2 = A1_2
    L5_2 = A1_2.PlayerNum
    L5_2 = L5_2(L6_2)
    L6_2 = playerintank
    if L5_2 == L6_2 then
      L5_2 = print
      L6_2 = "Clearing player in tank for client"
      L5_2(L6_2)
      L5_2 = -1
      playerintank = L5_2
    end
  end
  L6_2 = A2_2
  L5_2 = A2_2.Name
  L5_2 = L5_2(L6_2)
  L7_2 = A1_2
  L6_2 = A1_2.Name
  L6_2 = L6_2(L7_2)
  if A1_2 == A2_2 then
    L7_2 = coreLib
    L8_2 = L7_2
    L7_2 = L7_2.Commentate
    L9_2 = "^S^"
    L10_2 = L6_2
    L11_2 = "^S^ ^T^MPKSELF"
    L9_2 = L9_2 .. L10_2 .. L11_2
    L7_2(L8_2, L9_2)
  elseif A3_2 then
    L7_2 = coreLib
    L8_2 = L7_2
    L7_2 = L7_2.Commentate
    L9_2 = "^S^"
    L10_2 = L5_2
    L11_2 = "^S^ ^T^MPK^S^ "
    L12_2 = L6_2
    L13_2 = "^S^ ^T^MPKHEAD"
    L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2
    L7_2(L8_2, L9_2)
  else
    L7_2 = coreLib
    L8_2 = L7_2
    L7_2 = L7_2.Commentate
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
  L1_2 = coreLib
  L2_2 = L1_2
  L1_2 = L1_2.IsEndOfGame
  L1_2 = L1_2(L2_2)
  if not L1_2 then
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
  goto lbl_363
  repeat
    L1_2 = GetEvent
    L1_2 = L1_2()
    L2_2 = coreLib
    L3_2 = L2_2
    L2_2 = L2_2.IsEndOfGame
    L2_2 = L2_2(L3_2)
    if L2_2 then
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
      L7_2 = A0_2.totalmins
      L7_2 = L7_2[L3_2]
      if L7_2 < 0 then
        L7_2 = A0_2.totalmins
        L7_2[L3_2] = 0
      end
      L7_2 = A0_2.totalseconds
      L7_2 = L7_2[L3_2]
      if L7_2 < 0 then
        L7_2 = A0_2.totalseconds
        L7_2[L3_2] = 0
      end
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
          if L7_2 < 0 then
            L7_2 = 0
          end
          if L8_2 < 0 then
            L8_2 = 0
          end
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
        L7_2 = coreLib
        L8_2 = L7_2
        L7_2 = L7_2.ToggleEndOfGame
        L9_2 = true
        L7_2(L8_2, L9_2)
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
                L10_2 = Player
                L11_2 = playerintank
                L10_2 = L10_2(L11_2)
                L11_2 = L10_2
                L10_2 = L10_2.Name
                L10_2 = L10_2(L11_2)
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
                  L9_2 = Player
                  L10_2 = playerintank
                  L9_2 = L9_2(L10_2)
                  L10_2 = L9_2
                  L9_2 = L9_2.Name
                  L9_2 = L9_2(L10_2)
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
            else
              L7_2 = TANKEVENT_IM_IN_DA_TANK
              if L2_2 == L7_2 then
                L7_2 = IsServer
                L7_2 = L7_2()
                if L7_2 then
                  L7_2 = true
                  A0_2.OkToPutSomeoneInTank = L7_2
                end
              end
            end
          end
        end
      end
    end
    ::lbl_363::
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
    L5_2 = L2_2
    L4_2 = L2_2.PlayerNum
    L4_2 = L4_2(L5_2)
    L5_2 = 420
    L6_2 = 105
    L7_2 = 2
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.tankDam = L3_2
    L3_2 = A0_2.tankDam
    L4_2 = L3_2
    L3_2 = L3_2.Scale
    L5_2 = 0.8878
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
    L5_2 = "^T^MPTNKDM"
    L3_2(L4_2, L5_2)
    L3_2 = TextSprite
    L5_2 = L2_2
    L4_2 = L2_2.PlayerNum
    L4_2 = L4_2(L5_2)
    L5_2 = 475
    L6_2 = 105
    L7_2 = 2
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.tankDmgTxt = L3_2
    L3_2 = A0_2.tankDmgTxt
    L4_2 = L3_2
    L3_2 = L3_2.Scale
    L5_2 = 0.8878
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
    L5_2 = L2_2
    L4_2 = L2_2.PlayerNum
    L4_2 = L4_2(L5_2)
    L5_2 = 470
    L6_2 = 85
    L7_2 = 2
    L3_2 = L3_2(L4_2, L5_2, L6_2, L7_2)
    A0_2.tanktime = L3_2
    L3_2 = A0_2.tanktime
    L4_2 = L3_2
    L3_2 = L3_2.Scale
    L5_2 = 0.8878
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
  L6_2 = coreLib
  L7_2 = L6_2
  L6_2 = L6_2.Commentate
  L8_2 = "^S^"
  L9_2 = A1_2
  L10_2 = "^S^ "
  L11_2 = A3_2
  L8_2 = L8_2 .. L9_2 .. L10_2 .. L11_2
  L6_2(L7_2, L8_2)
end
L0_1.DisplayTankMessage = L1_1
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
  goto lbl_44
  repeat
    L1_2 = Wait
    L2_2 = 10
    L1_2(L2_2)
    ::lbl_44::
    L1_2 = IsPlayerCreationQueued
    L1_2 = L1_2()
  until not L1_2
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
