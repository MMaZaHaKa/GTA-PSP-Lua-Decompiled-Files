-- Commentary Printer
-- MattS

Commentary = Script{strings = {}, y = 4, lineheight = 12}

function Commentary:Print(text)
    table.insert(self.strings, 
        {
            text = AddText
            {
                player = Player(), -- add to current player's screen only
                text = text, 
                x = 4, 
                y = self.y,
                style = 1,
                scale = .5
            },
            waiter = WaitFunc(1500) -- leave text up for 3 seconds
        })
    self.y = self.y + self.lineheight
end

function Commentary:Run()
    while 1 do                
        while not self.strings[1] do
            -- wait for a string to be added
            Wait(100)
        end

        -- wait for the first string to time out
        Wait(self.strings[1].waiter)
        
        -- move all the strings up
        local movedBy = 0
        while movedBy < self.lineheight do
            -- move one pixel for each frame elapsed (Wait returns no of frames)
            movedBy = movedBy + Wait()
            -- limit to line height
            if movedBy > self.lineheight then movedBy = self.lineheight end           
            
            -- set the text sprite positions
            local y = 4 - movedBy
            for i,txt in ipairs(self.strings) do
                txt.text:Pos(4, y)
                y = y + self.lineheight
            end            
            -- store position for any new lines being added
            self.y = y
        end
        
        -- remove the top string
		self.strings[1].text:Remove()
		table.remove(self.strings, 1)
    end        
end

function Commentary:CleanUp()
	for i,txt in ipairs(self.strings) do
		txt.text:Remove()
	end
end



function DisplayFinalWinLoseMessage( theWinner, szTheWinner )

	local player = Player()	
	local winLoseHeading = TextSprite(player, 235, 70, 1)
	winLoseHeading:Scale(2.0)
	winLoseHeading:Style(2)
	local txt = nil
	
	if theWinner == 0 then	
		winLoseHeading:Text('^T^MPDRAW')
		winLoseHeading:Colour(GameColour(3))
	else
		if theWinner == 1 then 
			winLoseHeading:Text('^T^WINNER')
			winLoseHeading:Colour(GameColour(3))
		else
			winLoseHeading:Text('^T^LOSER')
			winLoseHeading:Colour(GameColour(0))
		end
				
		txt = AddText{x = 235, y = 125, scale = .5, align = 1, text = szTheWinner, colour = GameColour(2)}
	end
		
	local counter = 0
	while counter < 500 do
		DisablePlayer(true)
		Wait(1)
		counter = counter + 1
	end
	
	winLoseHeading:Remove()
	txt:Remove()
end