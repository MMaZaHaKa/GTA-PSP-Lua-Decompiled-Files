require "stdlib"

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

StateMachine = Script{_init={"state", "interval"}}

function StateMachine:Run()
    while not self.finished do
        Wait(self.interval)
        local handler = self[self.state]
        if not handler then
            print("missing state handler: " .. self.state)
        else
            local new_state = handler(self)
            if not new_state then
                new_state = self.state
            end
            self.state = new_state
        end
    end
    self:CleanUp()
end

AddText = Object{}

function AddText:With(param)
    return self:_clone(param)
end

function AddText:__call(param)
    local text_obj = table.merge(self, param)
    local sprite = TextSprite(text_obj.player or Player(), text_obj.x, text_obj.y, text_obj.align)

    if text_obj.scale then
        sprite:Scale(text_obj.scale)
    end

    if text_obj.style then
        sprite:Style(text_obj.style)
    end

    if text_obj.text then
        sprite:Text(text_obj.text)
    end

    if text_obj.colour then
        sprite:Colour(text_obj.colour)
    end

    if text_obj.wrapX then
        sprite:WrapX(text_obj.wrapX)
    end

    return sprite
end

TimedRemove = Script{_init={"obj", "time"}, time=5000}

function TimedRemove:Run()
    Wait(self.time)
    self:CleanUp()
end

function TimedRemove:CleanUp()
    self.obj:Remove()
end

function WaitModel(model)
    local model = model
    Wait(function ()
        return HasModelLoaded(model)
    end)
end

function LoadModel(model)
    RequestModel(model)
    WaitModel(model)
end

function WaitLocatePlayerInCar(...)
    while not LocatePlayerInCar(unpack(arg)) do
        Wait(100)
    end
end
