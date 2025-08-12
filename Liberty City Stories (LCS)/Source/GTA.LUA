-- General GTA utility functions
-- MattS

require 'stdlib'

-----------------------------------------------------------
-- script

Script = Object{}

function Script:Start(...)
	self.thread = simsch.start(bind(self.Run, self, unpack(arg)))
	return self
end

function Script:IsRunning()
	return self.thread
end

function Script:Stop()

	if self.thread then
		simsch.stop(self.thread)
		self.thread = nil
		self:CleanUp()
	end
	
end

-----------------------------------------------------------
-- state machine

StateMachine = Script{_init = {'state', 'interval'}}

function StateMachine:Run()
    while not self.finished do
        Wait(self.interval)
        local statefunc = self[self.state]
        if not statefunc then
            print('missing state handler: '..self.state)
        else
            self.state = statefunc(self) or self.state        
        end
    end    
    --andyg
    self:CleanUp()    
end

-----------------------------------------------------------
-- text sprite

AddText = Object{}

function AddText:With(settings)
    return self:_clone(settings)
end

function AddText:__call(vals)
    local settings = table.merge(self, vals)
    local spr = TextSprite(settings.player or Player(), 
                           settings.x, settings.y, 
                           settings.align)
    if settings.scale  then spr:Scale(settings.scale)   end
    if settings.style  then spr:Style(settings.style)   end
    if settings.text   then spr:Text(settings.text)     end
    if settings.colour then spr:Colour(settings.colour) end
    return spr
end

-----------------------------------------------------------
-- timed text

TimedRemove = Script{_init = {'obj', 'time'}, time = 5000}

function TimedRemove:Run()
    Wait(self.time)
    self:CleanUp()
end

function TimedRemove:CleanUp()
    self.obj:Remove()
end

-----------------------------------------------------------
-- models

function WaitModel(id)
	local model = id
	Wait(function() return HasModelLoaded(model) end)
end

function LoadModel(id)
	RequestModel(id)
	WaitModel(id)
end

-----------------------------------------------------------
-- player

function WaitLocatePlayerInCar(...)
	while not LocatePlayerInCar(unpack(arg)) do
		Wait(100)
	end
end
