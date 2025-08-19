Commentary = Script{strings={}, y=4, lineheight=15}

-- Appends a new message to the top left corner
function Commentary:Print(msg)
    -- Can show only 3 messages at a time
    if table.getn(self.strings) > 2 then
        -- So remove the first one if we already have 3
        self.strings[1].text:Remove()
        table.remove(self.strings, 1)
        local y = 4
        for _, str in ipairs(self.strings) do
            str.text:Pos(4, y)
            y = y + self.lineheight
        end
        self.y = self.y - self.lineheight
    end
    table.insert(
        self.strings,
        {
            text=AddText{player=Player(), text=msg, x=4, y=self.y, style=1, scale=0.4048},
            waiter=WaitFunc(7500)
        }
    )
    self.strings[table.getn(self.strings)].text:Flash(30)
    self.y = self.y + self.lineheight
    ShowingCommentary(true)
end

-- Updates the messages in the top left corner. Removes them by moving off the screen
function Commentary:Run()
    while 1 do
        while not self.strings[1] do
            Wait(100)
        end
        
        Wait(self.strings[1].waiter)
        
        -- Makes the messages shift to the top, making the first one go off screen
        local height = 0
        while height < self.lineheight do
            height = height + Wait()
            if height > self.lineheight then
                height = self.lineheight
            end
            local y = 4 - height
            for _, str in ipairs(self.strings) do
                str.text:Pos(4, y)
                y = y + self.lineheight
            end
            self.y = y
        end
        
        self.strings[1].text:Remove()
        table.remove(self.strings, 1)
        if table.getn(self.strings) == 0 then
            ShowingCommentary(false)
        end
    end
end

-- Removes all messages in the top left corner
function Commentary:CleanUp()
    for _, str in ipairs(self.strings) do
        str.text:Remove()
    end
end

-- Displays the WINNER/LOSER message
function DisplayFinalWinLoseMessage(match_result, unused_arg, team)
    local player = Player()
    local sprite = TextSprite(player, 235, 86, 1)
    sprite:Scale(0.9, 2.4)
    sprite:Style(2)
    local comment = nil
    if match_result == 0 then
        sprite:Text("^T^MPDRAW")
    elseif match_result == 1 then
        sprite:Text("^T^WINNER")
        sprite:Colour(GameColour(8))
        if IsTeamGame() then
            local msg = "^S^~y~" .. TeamName(team) .. "^S^ ^T^MPTMWIN"
            comment = AddText{
                x=235, y=125, scale=0.5, align=1,
                text=msg,
                colour=TeamColour(team)
            }
        else
            comment = AddText{
                x=235, y=125, scale=0.5, align=1,
                text="^S^~Y~^T^MPDADDY",
                colour=GameColour(2)
            }
        end
    else
        sprite:Text("^S^~r~^T^MPYL")
        sprite:Colour(GameColour(9))
        if IsTeamGame() then
            local msg = "^S^~r~" .. TeamName(team) .. "^S^ ^T^MPRUN"
            comment = AddText{
                x=235, y=125, scale=0.5, align=1,
                text=msg,
                colour=TeamColour(team)
            }
        else
            comment = AddText{
                x=235, y=125, scale=0.5, align=1,
                text="^S^~r~^T^MPBITCH",
                colour=GameColour(2)
            }
        end
    end
    UseSuperBrakeOnPause(true)
    local i = 0
    while i < 200 do
        DisablePlayer(true)
        ClearMessages()
        collectgarbage()
        Wait(1)
        i = i + 1
    end
    sprite:Remove()
    if comment then
        comment:Remove()
    end
end
