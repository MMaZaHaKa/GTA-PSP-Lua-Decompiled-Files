require "gta"


local function is_button_pressed(buttons, buttonDown)
    if buttons[buttonDown] ~= buttonDown() then
        buttons[buttonDown] = buttonDown()
        if buttons[buttonDown] then
            return true
        end
    end
    return false
end

-- menu class
local Menu = {}
Menu.__index = Menu

setmetatable(Menu, {
    __call = function(cls, ...)
        return cls.new(unpack(arg))
    end
})

function Menu.new(args)
    local self = {}
    setmetatable(self, Menu)
    self.options = args.options
    self.x = args.x or 240
    self.y = args.y or 136
    self.wrap = (args.wrap ~= false)
    self.is_vertical = (args.vertical ~= false)
    self.show_ui = (args.show_ui ~= false)
    self.toStr = args.toStr or tostring
    self.colour = args.colour or function() return GameColour(10) end

    if self.is_vertical then
        self.previous_button = UpDown
        self.next_button = DownDown
    else
        self.previous_button = LeftDown
        self.next_button = RightDown
    end
    self.buttons = {
        [self.previous_button] = self.previous_button(),
        [self.next_button] = self.next_button(),
        [CrossDown] = CrossDown(),
    }
    self.option_sprite = AddText{x = self.x, y = self.y, align = 1, scale = 0.5, style = 1}
    self:select_option(1)
    if self.show_ui then
        self.move_sprite = AddText{x = 470, y = 228, align = 2, scale = 0.3, style = 1, colour = GameColour(10)}
        self.move_sprite:Text(self.is_vertical and "^S^Up/Down :    Move" or "^S^Left/Right :    Move")
        self.select_sprite = AddText{
            x = 469, y = 240, align = 2, scale = 0.3, style = 1, colour = GameColour(10), text = "^S^\226  : Select",  -- X
        }
    end
    return self
end

function Menu:select_option(index)
    local option = self.options[index]
    self.option_sprite:Colour(self.colour(option))
    self.option_sprite:Text("^S^" .. self.toStr(option))
    self.index = index
end

function Menu:previous_option()
    local index = self.index - 1
    if index < 1 then
        index = self.wrap and table.getn(self.options) or 1
    end
    return index
end

function Menu:next_option()
    local index = self.index + 1
    if index > table.getn(self.options) then
        index = self.wrap and 1 or table.getn(self.options)
    end
    return index
end

function Menu:process()
    while not is_button_pressed(self.buttons, CrossDown) do
        Wait(1)
        if is_button_pressed(self.buttons, self.previous_button) then
            self:select_option(self:previous_option())
        end
        if is_button_pressed(self.buttons, self.next_button) then
            self:select_option(self:next_option())
        end
    end

    self:clean_up()
    return self.options[self.index], self.index
end

function Menu:clean_up()
    self.option_sprite:Remove()
    self.option_sprite = nil
    if self.show_ui then
        self.move_sprite:Remove()
        self.select_sprite:Remove()
        self.move_sprite = nil
        self.select_sprite = nil
    end
end


-- password class
local Password = {}
Password.__index = Password

setmetatable(Password, {
    __call = function(cls, ...)
        return cls.new(unpack(arg))
    end
})

function Password.new(args)
    local self = {}
    setmetatable(self, Password)
    self.alphabet = args.alphabet
    self.x = args.x or 240
    self.y = args.y or 136
    self.wrap = (args.wrap ~= false)

    self.buttons = {
        [CrossDown] = CrossDown(),
        [CircleDown] = CircleDown(),
        [TriangleDown] = TriangleDown(),
        [StartDown] = StartDown(),
        [UpDown] = UpDown(),
        [DownDown] = DownDown(),
        [LeftDown] = LeftDown(),
        [RightDown] = RightDown(),
    }
    self.character_width = 16  -- must be even to avoid issues
    self.character_index = 0
    self.characters = {}
    self.flash_time = 0

    self.ui_sprites = {
        move_button = AddText{x = 379, y = 180, align = 2, scale = 0.3, style = 1, colour = GameColour(10)},
        move_prompt = AddText{x = 469, y = 180, align = 2, scale = 0.3, style = 1, colour = GameColour(10)},
        select_button = AddText{x = 379, y = 192, align = 2, scale = 0.3, style = 1, colour = GameColour(10)},
        select_prompt = AddText{x = 469, y = 192, align = 2, scale = 0.3, style = 1, colour = GameColour(10)},
        colour_button = AddText{x = 380, y = 204, align = 2, scale = 0.3, style = 1, colour = GameColour(10)},
        colour_prompt = AddText{x = 469, y = 204, align = 2, scale = 0.3, style = 1, colour = GameColour(10)},
        remove_button = AddText{x = 380, y = 216, align = 2, scale = 0.3, style = 1, colour = GameColour(10)},
        remove_prompt = AddText{x = 469, y = 216, align = 2, scale = 0.3, style = 1, colour = GameColour(10)},
        add_button = AddText{
            x = 380, y = 228, align = 2, scale = 0.3, style = 1, colour = GameColour(10), text = "^S^\226  :",  -- X
        },
        add_prompt = AddText{
            x = 469, y = 228, align = 2, scale = 0.3, style = 1, colour = GameColour(10), text = "^S^Add Character",
        },
        confirm_button = AddText{
            x = 379, y = 240, align = 2, scale = 0.3, style = 1, colour = GameColour(10), text = "^S^Start :",
        },
        confirm_prompt = AddText{
            x = 469, y = 240, align = 2, scale = 0.3, style = 1, colour = GameColour(10), text = "^S^New Game",
        },
    }

    return self
end

function Password:change_character(index, newOptionFunc)
    local character = self.characters[index]
    local colour_index = math.floor((character.index - 1) / 64)
    local new_index = 64 * colour_index + math.mod(character[newOptionFunc](character) - 1, 64) + 1
    character:select_option(new_index)
    self.flash_time = GameElapsedMs() + 1000
end

function Password:select_character(index)
    if index == self.character_index then
        return
    end

    -- restore previous character if it was flashed out
    if self.character_index ~= 0 then
        local character = self.characters[self.character_index]
        if character.option_sprite:Text() == "" then
            character:select_option(character.index)
        end
    end
    self.character_index = index
end

function Password:previous_character()
    local index = self.character_index - 1
    if index < 1 then
        index = self.wrap and table.getn(self.characters) or 1
    end
    return index
end

function Password:next_character()
    local index = self.character_index + 1
    if index > table.getn(self.characters) then
        index = self.wrap and 1 or table.getn(self.characters)
    end
    return index
end

local function painter(option)
    local colours = {w = GameColour(10), r = GameColour(0), b = GameColour(1), g = GameColour(2)}
    return colours[string.sub(option, 1, 1)]
end

function Password:add_character(index)
    local number_of_characters = table.getn(self.characters)
    for i = 1, number_of_characters do
        local character = self.characters[i]
        if i <= index then
            character.x = character.x - self.character_width / 2
        else
            character.x = character.x + self.character_width / 2
        end
        character.option_sprite:Pos(character.x, character.y, 10)
    end

    local base_x = self.x - self.character_width / 2 * math.mod(number_of_characters, 2)
    local character_sprite = Menu{
        options = self.alphabet,
        x = base_x - self.character_width * (math.floor(number_of_characters / 2) - index),
        y = 30,
        show_ui = false,
        toStr = function(option) return string.sub(option, 2, 2) end,
        colour = painter,
    }
    if number_of_characters == 0 then
        self.ui_sprites.select_button:Text("^S^Up/Down :")
        self.ui_sprites.select_prompt:Text("^S^Change Character")
        self.ui_sprites.colour_button:Text("^S^\224  :")  -- △
        self.ui_sprites.colour_prompt:Text("^S^Change Colour")
        self.ui_sprites.remove_button:Text("^S^\227  :")  -- O
        self.ui_sprites.remove_prompt:Text("^S^Remove Character")
        self.ui_sprites.confirm_prompt:Text("^S^Confirm Password")
    elseif number_of_characters == 1 then
        self.ui_sprites.move_button:Text("^S^Left/Right :")
        self.ui_sprites.move_prompt:Text("^S^Move")
    end
    table.insert(self.characters, index + 1, character_sprite)
    self:select_character(index + 1)
    self.flash_time = GameElapsedMs() + 500
end

function Password:remove_character(index)
    local character = table.remove(self.characters, index)
    character:clean_up()

    local number_of_characters = table.getn(self.characters)
    for i = 1, number_of_characters do
        local character = self.characters[i]
        if i < index then
            character.x = character.x + self.character_width / 2
        else
            character.x = character.x - self.character_width / 2
        end
        character.option_sprite:Pos(character.x, character.y, 10)
    end

    self.character_index = (index == 1 and number_of_characters > 0) and 1 or (index - 1)
    self.flash_time = GameElapsedMs() + 500

    if number_of_characters == 1 then
        self.ui_sprites.move_button:Text("^S^")
        self.ui_sprites.move_prompt:Text("^S^")
    elseif number_of_characters == 0 then
        self.ui_sprites.select_button:Text("^S^")
        self.ui_sprites.select_prompt:Text("^S^")
        self.ui_sprites.colour_button:Text("^S^")
        self.ui_sprites.colour_prompt:Text("^S^")
        self.ui_sprites.remove_button:Text("^S^")
        self.ui_sprites.remove_prompt:Text("^S^")
        self.ui_sprites.confirm_prompt:Text("^S^New Game")
    end
end

function Password:flash_character(index)
    if self.flash_time - GameElapsedMs() > 0 then
        return
    end

    local character = self.characters[index]
    if character.option_sprite:Text() == "" then
        character:select_option(character.index)
        self.flash_time = GameElapsedMs() + 1000
    else
        character.option_sprite:Text("")
        self.flash_time = GameElapsedMs() + 300
    end
end


function Password:process()
    while not is_button_pressed(self.buttons, StartDown) do
        Wait(1)

        -- changing a specific password character
        if self.character_index > 0 and is_button_pressed(self.buttons, UpDown) then
            self:change_character(self.character_index, "previous_option")
        end
        if self.character_index > 0 and is_button_pressed(self.buttons, DownDown) then
            self:change_character(self.character_index, "next_option")
        end

        -- going through password characters
        if self.character_index > 0 and is_button_pressed(self.buttons, LeftDown) then
            self:select_character(self:previous_character())
            self.flash_time = GameElapsedMs()
        end
        if self.character_index > 0 and is_button_pressed(self.buttons, RightDown) then
            self:select_character(self:next_character())
            self.flash_time = GameElapsedMs()
        end

        -- adding a character
        if is_button_pressed(self.buttons, CrossDown) then
            self:add_character(self.character_index)
        end
        -- removing a character
        if self.character_index > 0 and is_button_pressed(self.buttons, CircleDown) then
            self:remove_character(self.character_index)
        end

        -- change character's colour
        if self.character_index > 0 and is_button_pressed(self.buttons, TriangleDown) then
            local character = self.characters[self.character_index]
            character:select_option(math.mod(character.index + 63, 256) + 1)
            self.flash_time = GameElapsedMs() + 1000
        end

        -- flash current character
        if self.character_index > 0 then
            self:flash_character(self.character_index)
        end
    end

    if self.character_index == 0 then
        return nil
    end

    self:clean_up()

    local result = {}
    for _, character in ipairs(self.characters) do
        local option = character.options[character.index]
        table.insert(result, "~")
        table.insert(result, string.sub(option, 1, 1))
        table.insert(result, "~")
        table.insert(result, string.sub(option, 2, 2))
    end
    return table.concat(result)
end

function Password:clean_up()
    for _, character in ipairs(self.characters) do
        character:clean_up()
    end
    for key, sprite in pairs(self.ui_sprites) do
        sprite:Remove()
        self.ui_sprites[key] = nil
    end
end


return {
    Menu = Menu,
    Password = Password,
}
