require 'gta'
require 'mainloop'
require 'spawn'

require 'PowerUps'
require 'Pickups'
require 'CutscenePlayer'


PowerUpTimer = PowerupTimer() --Possibly change this if this doesn't push the entire function into this or whatever. idk rockstar, looks kinda sus
teamId1 = 0
teamId2 = 1
teamDraw = 99
teamError = 101
hornDebounce = false
testSpawnPoint = 1

DeathMatch = StateMachine{'StateInit'}

function DeathMatch:StateInit(self)

  DbgPrintAllOptions()
  
  self.mypickups = PickupMgr()
  self.mypickups:CreatePickups()
  
  if 0 < GameScoreLimit() then
    self.fraglimit = GameScoreLimit()
  else
    self.fraglimit = nil
  end
  self.scores = {}
  self.teamscores = {}
  self.headshots = 0
  self.winningTeam = teamError
  self.gamePossiblyOver = false
  self.gameOverTestCount = 0
  self.DMTime = nil
  GenerateAmbients(false)
  UseSuperBrakeOnPause(false)
  if IsServer() then
    while not PlayerId() ~= 0 do Wait(100) end
  end
  print("Doing initial spawn")
  DoSpawn(InitialSpawnPoint(PlayerId()))
  if IsServer() then
    if UsePowerups() then
      PowerUpTimer:Start()
      if DoesPowerupExist() < 2 then
        print("Respawning a power up at change sides")
        PowerUpTimer:CreateAPowerUp()
      end
      if DoesPowerupExist() < 2 then
        print("Respawning another power up at change sides")
        PowerUpTimer:CreateAPowerUp()
      end
    end
  end
  Wait(1000)

  if not NoFuckingCutscene() then
    main.scores:Hide(true)
    while not SyncCutScene ~= false do Wait(5) end
	Wait(0)
	RunScriptedCutscene()
	Wait(0)
	while ProcessScriptedCutscene do collectgarbage() Wait(0) end
	main.scores:Hide(false)
  else
	Wait(20)
	ClearSplashScreen()
  end
  GenerateAmbients(true)
  UpdateGameTime(true)
  TeamGameEveryoneIn()
  return "StateRunning"
end

function DeathMatch:CleanUp(self)
  collectgarbage()
  if self.DMTime ~= nil then
    self.DMTime:Remove()
    self.DMTime = nil
  end
  self.mytimer:Stop()
  self.mypickups:Cleanup()
end

function DeathMatch:StateRunning(self)
  local player = Player()
  local players = AllPlayers()

  if not player:IsPlaying() then
    if not self.gamePossiblyOver then
      DoWasted()
    end
  end

  if GameTimeUp() then
  
    collectgarbage()
    self.state = "StateGameWon"
  else

    if 0 < GameTimeLimit() then

      if main.scores.scores then --rockstar why
	  
        if self.DMTime ~= nil then
          self.DMTime:Remove()
          self.DMTime = nil
        end
      else 

        if self.DMTime == nil then
		  self.DMTime = TextSprite(Player(), 470, 85, 2)
		  self.DMTime:Scale(0.4048)
		  self.DMTime:Style(1)
		  self.DMTime:Colour(Player(),GameColour(10))
        end
      end

      if self.DMTime ~= nil then
		self.DMTime:Text(self.DMTime,"^S^"..string.format("%d:%02d",GameTimeMinutes(),GameTimeSeconds()))
      end
    end
  end

  if self.gamePossiblyOver then
    self.gameOverTestCount = self.gameOverTestCount + 1
  end

  if self.gamePossiblyOver then

    if self.gameOverTestCount < 20 then

      self.gamePossiblyOver = false
      for k,ply in pairs(players) do

        if IsTeamGame() then
          self.fraglimit = self.fraglimit - self.TeamScore(self, ply:TeamId, ply)
        else
          self.fraglimit = self.fraglimit - self.Score(self, ply)
        end
        if self.fraglimit <= 0 then
          self.state = "StateGameWon"
          self.winner = ply
          if IsTeamGame() then			
            self.winningTeam = ply:TeamId()
          end
        end
      end
    end
  end

  if IsPlayerPressingHorn(player) then --debug for honking
    if not hornDebounce then
      print("Horntest on")
      hornDebounce = true
    end
  end

  if not IsPlayerPressingHorn(player) then
    hornDebounce = false
  end
end


function DeathMatch:StateGameWon(self)
  UpdateGameTime(false)
  local player = Player()
  local players = AllPlayers()
  if IsTeamGame() then
    if self.TeamScore(self, teamId1) > self.TeamScore(self, teamId2) then
      self.winningTeam = teamId1
    else
      if self.TeamScore(self, teamId2) > self.TeamScore(self, teamId1) then
        self.winningTeam = teamId2
      else
        self.winningTeam = teamDraw
      end
    end
  else
    function L6_2(A0_3, A1_3) --rename all L6_2's in this area to something that makes more sense. HIGHEST_SCORE(), or sumthin.
      return self.Score(self, A0_3) = self.Score(self, A0_3) > self.Score(self, A1_3)
    end
    if table.sort(players, L6_2(players[1],players[2])) == self.Score(players[1],players[2]) then
      self.winner = nil
    else
      self.winner = players[1]
    end
  end

  if IsTeamGame() then

    if self.winningTeam == teamDraw then
      DisplayFinalWinLoseMessage(0, "") --No string?
    else
      if self.winningTeam == player:TeamId() then
        DisplayFinalWinLoseMessage(1, "", self.winningTeam)
      else
        DisplayFinalWinLoseMessage(2, "", self.winningTeam)
      end
    end
  else
    if not self.winner then
      if self.Score(self, player) < self.Score(self, players[1]) then
        DisplayFinalWinLoseMessage(2, " ")
      else
        DisplayFinalWinLoseMessage(0, " ")
      end
    else
      if self.winner:PlayerNum(self.winner) == player:PlayerNum(player) then
        DisplayFinalWinLoseMessage(1, "")
      else
        DisplayFinalWinLoseMessage(2, "")
      end
    end
  end
  main.scores:ToggleUpdate(false)
  main.scores:Show(true)
  Wait(12000)
  main.scores:Hide()
  main:EndGame()
  return "StateRunning"
end

function DeathMatch:Commentate(self, arg)
  main.commentary:Print(arg)
end

function DeathMatch:Score(self, A1_2)
  if not self.scores[A1_2] then
    self.scores[A1_2] = 0
  end
  return self.scores[A1_2]
end

function DeathMatch:TeamScore(self, A1_2)
  if not self.teamscores[A1_2] then
    self.teamscores[A1_2] = 0
  end
  return self.teamscores[A1_2]
end

function RegisterPlayerKill(self, A1_2, A2_2, A3_2) --Does not include DeathMatch:?
  local L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L4_2 = self.state
  if L4_2 ~= "StateGameWon" then
    if A1_2 == A2_2 then
      L4_2 = self.scores
      L6_2 = self
      L5_2 = self.Score
      L7_2 = A1_2
      L5_2 = L5_2(L6_2, L7_2)
      L5_2 = L5_2 - 1
      L4_2[A1_2] = L5_2
      L4_2 = self.teamscores
      L6_2 = A1_2
      L5_2 = A1_2.TeamId
      L5_2 = L5_2(L6_2)
      L7_2 = self
      L6_2 = self.TeamScore
      L9_2 = A1_2
      L8_2 = A1_2.TeamId
      L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
      L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
      L6_2 = L6_2 - 1
      L4_2[L5_2] = L6_2
      L5_2 = self
      L4_2 = self.Commentate
      L6_2 = "^S^"
      L8_2 = A1_2
      L7_2 = A1_2.Name
      L7_2 = L7_2(L8_2)
      L8_2 = "^S^ ^T^MPKSELF"
      L6_2 = L6_2 .. L7_2 .. L8_2
      L4_2(L5_2, L6_2)
    else
      L4_2 = IsTeamGame
      L4_2 = L4_2()
      if L4_2 then
        L5_2 = A1_2
        L4_2 = A1_2.TeamId
        L4_2 = L4_2(L5_2)
        L6_2 = A2_2
        L5_2 = A2_2.TeamId
        L5_2 = L5_2(L6_2)
        if L4_2 ~= L5_2 then
          L4_2 = self.scores
          L6_2 = self
          L5_2 = self.Score
          L7_2 = A2_2
          L5_2 = L5_2(L6_2, L7_2)
          L5_2 = L5_2 + 1
          L4_2[A2_2] = L5_2
          L4_2 = self.teamscores
          L6_2 = A2_2
          L5_2 = A2_2.TeamId
          L5_2 = L5_2(L6_2)
          L7_2 = self
          L6_2 = self.TeamScore
          L9_2 = A2_2
          L8_2 = A2_2.TeamId
          L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
          L6_2 = L6_2 + 1
          L4_2[L5_2] = L6_2
        else
          L4_2 = self.scores
          L6_2 = self
          L5_2 = self.Score
          L7_2 = A2_2
          L5_2 = L5_2(L6_2, L7_2)
          L5_2 = L5_2 - 1
          L4_2[A2_2] = L5_2
          L4_2 = self.teamscores
          L6_2 = A2_2
          L5_2 = A2_2.TeamId
          L5_2 = L5_2(L6_2)
          L7_2 = self
          L6_2 = self.TeamScore
          L9_2 = A2_2
          L8_2 = A2_2.TeamId
          L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
          L6_2 = L6_2 - 1
          L4_2[L5_2] = L6_2
        end
      else
        L4_2 = self.scores
        L6_2 = self
        L5_2 = self.Score
        L7_2 = A2_2
        L5_2 = L5_2(L6_2, L7_2)
        L5_2 = L5_2 + 1
        L4_2[A2_2] = L5_2
      end
      if A3_2 then
        L5_2 = self
        L4_2 = self.Commentate
        L6_2 = "^S^"
        L8_2 = A2_2
        L7_2 = A2_2.Name
        L7_2 = L7_2(L8_2)
        L8_2 = "^S^ ^T^MPK^S^ "
        L10_2 = A1_2
        L9_2 = A1_2.Name
        L9_2 = L9_2(L10_2)
        L10_2 = "^S^ ^T^MPKHEAD"
        L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2
        L4_2(L5_2, L6_2)
        L4_2 = self.headshots
        L4_2 = L4_2 + 1
        self.headshots = L4_2
      else
        L5_2 = self
        L4_2 = self.Commentate
        L6_2 = "^S^"
        L8_2 = A2_2
        L7_2 = A2_2.Name
        L7_2 = L7_2(L8_2)
        L8_2 = "^S^ ^T^MPK^S^ "
        L10_2 = A1_2
        L9_2 = A1_2.Name
        L9_2 = L9_2(L10_2)
        L6_2 = L6_2 .. L7_2 .. L8_2 .. L9_2
        L4_2(L5_2, L6_2)
      end
      L4_2 = self.fraglimit
      if L4_2 and A2_2 then
        L4_2 = 0
        L5_2 = IsTeamGame
        L5_2 = L5_2()
        if L5_2 then
          L5_2 = self.fraglimit
          L7_2 = self
          L6_2 = self.TeamScore
          L9_2 = A2_2
          L8_2 = A2_2.TeamId
          L8_2, L9_2, L10_2, L11_2 = L8_2(L9_2)
          L6_2 = L6_2(L7_2, L8_2, L9_2, L10_2, L11_2)
          L4_2 = L5_2 - L6_2
        else
          L5_2 = self.fraglimit
          L7_2 = self
          L6_2 = self.Score
          L8_2 = A2_2
          L6_2 = L6_2(L7_2, L8_2)
          L4_2 = L5_2 - L6_2
        end
        if L4_2 <= 0 then
          L5_2 = self.winner
          if not L5_2 then
            L5_2 = print
            L6_2 = "Setting gamePossiblyOver "
            L5_2(L6_2)
            L5_2 = true
            self.gamePossiblyOver = L5_2
            self.gameOverTestCount = 0
        end
        elseif L4_2 <= 3 and 1 < L4_2 then
          L5_2 = IsTeamGame
          L5_2 = L5_2()
          if L5_2 then
            L6_2 = self
            L5_2 = self.Commentate
            L7_2 = "^S^"
            L9_2 = A2_2
            L8_2 = A2_2.TeamName
            L8_2 = L8_2(L9_2)
            L9_2 = "^S^ ^T^MPTNEED^S^ "
            L10_2 = L4_2
            L11_2 = "^S^ ^T^MPMORE"
            L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
            L5_2(L6_2, L7_2)
          else
            L6_2 = self
            L5_2 = self.Commentate
            L7_2 = "^S^"
            L9_2 = A2_2
            L8_2 = A2_2.Name
            L8_2 = L8_2(L9_2)
            L9_2 = "^S^ ^T^MPNEED^S^ "
            L10_2 = L4_2
            L11_2 = "^S^ ^T^MPMORE"
            L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
            L5_2(L6_2, L7_2)
          end
        elseif L4_2 == 1 then
          L5_2 = IsTeamGame
          L5_2 = L5_2()
          if L5_2 then
            L6_2 = self
            L5_2 = self.Commentate
            L7_2 = "^S^"
            L9_2 = A2_2
            L8_2 = A2_2.TeamName
            L8_2 = L8_2(L9_2)
            L9_2 = "^S^ ^T^MPTNEED^S^ "
            L10_2 = L4_2
            L11_2 = "^S^ ^T^MP1MORE"
            L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
            L5_2(L6_2, L7_2)
          else
            L6_2 = self
            L5_2 = self.Commentate
            L7_2 = "^S^"
            L9_2 = A2_2
            L8_2 = A2_2.Name
            L8_2 = L8_2(L9_2)
            L9_2 = "^S^ ^T^MPNEED^S^ "
            L10_2 = L4_2
            L11_2 = "^S^ ^T^MP1MORE"
            L7_2 = L7_2 .. L8_2 .. L9_2 .. L10_2 .. L11_2
            L5_2(L6_2, L7_2)
          end
        end
      end
    end
  end
end

function Main()
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
  L2_2 = DeathMatch
  L3_2 = {}
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2
  L2_2 = L2_2.Start
  L2_2 = L2_2(L3_2)
  L1_2.game = L2_2
  L1_2 = main
  L2_2 = L1_2
  L1_2 = L1_2.Start
  L1_2(L2_2)

end

