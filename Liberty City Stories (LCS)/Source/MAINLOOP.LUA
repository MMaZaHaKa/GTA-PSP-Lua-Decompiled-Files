require 'scoresheet'
require 'commentary'

-----------------------------------------------------------
-- main loop

MainLoop = StateMachine{'StateInit'}

main = MainLoop{}

function MainLoop:StateInit()
    return 'StateRunning'
end

function MainLoop:StateRunning()
    if IsServer() then
        Wait(3000)
    end
end

function MainLoop:Commentate(text)
    self.commentary:Print(text)
end

function MainLoop:CleanUp()
    self.scores:Stop()
    self.commentary:CleanUp()
end

function MainLoop:EndGame()
	self:CleanUp()
	EndGame()
end

-----------------------------------------------------------
-- main event handlers

function RegisterPlayerKill(...)
    main.game:RegisterPlayerKill(unpack(arg))
	
	--	Refresh the scores
    if main.scores.scores and main.scores.scores.screen == 0 then
		main.scores.scores:DrawScores()
	end
end

function WaitUntilAllPlayersAlive()
	local players = AllPlayers()
	local i = 1
	
	while i <= table.getn(players) do
		if PlayerHealth(players[i]) == 0 then
			i = 1
		else
			i = i + 1
		end
		Wait(1)
	end
end