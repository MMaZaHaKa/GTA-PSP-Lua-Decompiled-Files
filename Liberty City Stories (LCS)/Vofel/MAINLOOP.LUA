require "scoresheet"
require "commentary"

MainLoop = StateMachine{"StateInit"}
main = MainLoop{}

function MainLoop:StateInit()
    return "StateRunning"
end

function MainLoop:StateRunning()
    if IsServer() then
        Wait(3000)
    end
end

function MainLoop:Commentate(msg)
    self.commentary:Print(msg)
end

function MainLoop:CleanUp()
    self.scores:Stop()
    self.commentary:CleanUp()
end

function MainLoop:EndGame()
    self:CleanUp()
    EndGame()
end

function RegisterPlayerKill(...)
    main.game:RegisterPlayerKill(unpack(arg))
    if main.scores.scores then
        if main.scores.scores.screen == 0 then
            main.scores.scores:DrawScores()
        end
    end
end

function WaitUntilAllPlayersAlive()
    local players = AllPlayers()
    local i = 1
    while i <= table.getn(players) do
        if PlayerHealth(players[i]) <= 1 then
            i = 1
        else
            i = i + 1
        end
        Wait(1)
    end
end
