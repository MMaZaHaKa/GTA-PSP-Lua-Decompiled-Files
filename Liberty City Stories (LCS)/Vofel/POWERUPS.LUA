PowerupTimer = Script{}
lastCreatedIndex = -1
local spawnDelay = 1

function PowerupTimer:Run()
    while 1 do
        if DoesPowerupExist() >= 2 then
            Wait(500)
        else
            Wait(spawnDelay)
            self:CreateAPowerUp()
        end
    end
end

function PowerupTimer:CreateAPowerUp()
    if DoesPowerupExist() >= 2 then
        return
    end
    print("PowerupTimer:CreateAPowerUp()")
    local powerups = {}
    -- Protection Racket
    if GameType() == 2 then
        if GameLocation() == 0 then
            powerups = {
                {pickup.invisible, {1004.3003, -65.4076, 20.6257}, 120},
                {pickup.regenhealth, {968.4836, -280.207, 4.8816}, 120}
            }
        elseif GameLocation() == 1 then
            powerups = {
                {pickup.regenhealth, {48.781, -636.2261, 28.8969}, 120},
                {pickup.invisible, {175.9549, 196.7919, 11.6633}, 120}
            }
        elseif GameLocation() == 2 then
            powerups = {
                {pickup.regenhealth, {-646.4016, 634.6223, 78.0683}, 120},
                {pickup.invisible, {-622.99, -49.69, 18.85}, 120}
            }
        end
    -- Get Stretch
    elseif GameType() == 3 then
        if GameLocation() == 0 then
            powerups = {
                {pickup.invisible, {1280.6178, -388.5768, 34.0868}, 120},
                {pickup.regenhealth, {902.9461, -599.2646, 17.2961}, 120}
            }
        elseif GameLocation() == 1 then
            powerups = {
                {pickup.regenhealth, {-72.7276, -973.564, 26.1281}, 120},
                {pickup.invisible, {323.2275, -1535.823, 23.6694}, 120}
            }
        elseif GameLocation() == 2 then
            powerups = {
                {pickup.invisible, {-757.7564, 147.3491, 10.8511}, 120},
                {pickup.regenhealth, {-518.7, 149.85, 21.78}, 120}
            }
        end
    -- The Hit List/Tanks For The Memories
    elseif GameType() == 5 or GameType() == 4 then
        if GameLocation() == 0 then
            powerups = {
                {pickup.megadamage, {1293.02, -924.86, 14.82}, 120},
                {pickup.killfrenzy, {855.01, -1003.39, 5.49}, 120},
                {pickup.regenhealth, {995.57, -831.59, 15.23}, 120},
                {pickup.megadamage, {825.68, -698.72, 14.92}, 120},
                {pickup.killfrenzy, {1266.89, -688.85, 19.85}, 120},
                {pickup.regenhealth, {1195.73, -348.76, 24.82}, 120},
                {pickup.megadamage, {902.21, -416.87, 14.97}, 120},
                {pickup.killfrenzy, {1050.66, -208.12, 4.82}, 120},
                {pickup.regenhealth, {830.77, -89.64, -2.85}, 120},
                {pickup.killfrenzy, {1064.03, 76.08, 15.24}, 120},
                {pickup.megadamage, {1195.73, -48.56, 9.82}, 120}
            }
        elseif GameLocation() == 1 then
            powerups = {
                {pickup.megadamage, {263.9221, -931.2843, 31.9245}, 120},
                {pickup.killfrenzy, {296.88, -1271.39, 26.01}, 120},
                {pickup.regenhealth, {67.35, -817.34, 26.28}, 120},
                {pickup.megadamage, {1.73, -406.12, 16.01}, 120},
                {pickup.killfrenzy, {445.23, 0.57, 16.36}, 120},
                {pickup.regenhealth, {106.87, 83.67, 16.01}, 120}
            }
        elseif GameLocation() == 2 then
            powerups = {
                {pickup.regenhealth, {-522.68, -222.52, 3.9}, 120},
                {pickup.megadamage, {-639.6958, -26.4413, 18.8226}, 120},
                {pickup.killfrenzy, {-1145.12, 256.83, 3.47}, 120},
                {pickup.regenhealth, {-1132.79, 499.1, 68.22}, 120},
                {pickup.megadamage, {-900.67, 164.58, 48.71}, 120},
                {pickup.invisible, {-642, 634.33, 78.1}, 120},
                {pickup.killfrenzy, {-709.56, 365.68, 68.35}, 120},
                {pickup.regenhealth, {-453.88, -51.61, 3.86}, 120},
                {pickup.megadamage, {-651.53, -175.83, 5.5}, 120},
                {pickup.killfrenzy, {-723.28, -366.47, 15.65}, 120},
                {pickup.megadamage, {-749.93, -614.01, 8.86}, 120}
            }
        end
    -- Liberty City Survivor/The Wedding List
    else
        if GameLocation() == 0 then
            powerups = {
                {pickup.megadamage, {1293.02, -924.86, 14.82}, 120},
                {pickup.invisible, {1164.18, -1091.76, 11.85}, 120},
                {pickup.killfrenzy, {855.01, -1003.39, 5.49}, 120},
                {pickup.regenhealth, {995.57, -831.59, 15.23}, 120},
                {pickup.megadamage, {825.68, -698.72, 14.92}, 120},
                {pickup.invisible, {1062.1, -611.55, 14.96}, 120},
                {pickup.killfrenzy, {1266.89, -688.85, 19.85}, 120},
                {pickup.invisible, {1369.49, -488.58, 51.24}, 120},
                {pickup.regenhealth, {1195.73, -348.76, 24.82}, 120},
                {pickup.megadamage, {902.21, -416.87, 14.97}, 120},
                {pickup.killfrenzy, {1050.66, -208.12, 4.82}, 120},
                {pickup.regenhealth, {830.77, -89.64, -2.85}, 120},
                {pickup.killfrenzy, {1064.03, 76.08, 15.24}, 120},
                {pickup.megadamage, {1195.73, -48.56, 9.82}, 120},
                {pickup.invisible, {1320.23, -129.22, 15.27}, 120}
            }
        elseif GameLocation() == 1 then
            powerups = {
                {pickup.megadamage, {263.9221, -931.2843, 31.9245}, 120},
                {pickup.invisible, {41.82, -1366.32, 26.01}, 120},
                {pickup.killfrenzy, {296.88, -1271.39, 26.01}, 120},
                {pickup.regenhealth, {67.35, -817.34, 26.28}, 120},
                {pickup.megadamage, {1.73, -406.12, 16.01}, 120},
                {pickup.invisible, {353.41, -489.58, 20.36}, 120},
                {pickup.killfrenzy, {445.23, 0.57, 16.36}, 120},
                {pickup.regenhealth, {106.87, 83.67, 16.01}, 120}
            }
        elseif GameLocation() == 2 then
            powerups = {
                {pickup.regenhealth, {-522.68, -222.52, 3.9}, 120},
                {pickup.megadamage, {-639.6958, -26.4413, 18.8226}, 120},
                {pickup.invisible, {-974.94, -217.56, 33.71}, 120},
                {pickup.killfrenzy, {-1145.12, 256.83, 3.47}, 120},
                {pickup.regenhealth, {-1132.79, 499.1, 68.22}, 120},
                {pickup.megadamage, {-900.67, 164.58, 48.71}, 120},
                {pickup.invisible, {-642, 634.33, 78.1}, 120},
                {pickup.killfrenzy, {-709.56, 365.68, 68.35}, 120},
                {pickup.regenhealth, {-453.88, -51.61, 3.86}, 120},
                {pickup.megadamage, {-651.53, -175.83, 5.5}, 120},
                {pickup.invisible, {-473.7, 247.1, 69.88}, 120},
                {pickup.killfrenzy, {-723.28, -366.47, 15.65}, 120},
                {pickup.megadamage, {-749.93, -614.01, 8.86}, 120}
            }
        end
    end
    
    local number_of_powerups = table.getn(powerups)
    -- Why do we test for number_of_powerups?
    if number_of_powerups and 1 <= number_of_powerups then
        local powerup_index = math.random(1, number_of_powerups)

        if powerup_index == lastCreatedIndex then
            powerup_index = powerup_index + 1
            -- And again?
            if powerup_index and number_of_powerups < powerup_index then
                powerup_index = 1
            end
        end

        if lastCreatedIndex ~= powerup_index then
            print("Creating powerup, index == " .. powerup_index)
            CreatePickup(
                powerups[powerup_index][1],  -- type
                powerups[powerup_index][2],  -- location (x, y, z)
                powerups[powerup_index][3]   -- effect duration
            )
        end
        lastCreatedIndex = powerup_index
        spawnDelay = 120000 + math.random(30000, 60000)
        print("Powerup will respawn in " .. spawnDelay .. " Ms")
    end
end
