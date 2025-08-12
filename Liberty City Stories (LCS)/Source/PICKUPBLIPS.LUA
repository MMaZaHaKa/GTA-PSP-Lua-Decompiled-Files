-- pickup blips
-- matts

-- displays blips for nearby pickups

PickupBlipScript = Script{}

function PickupBlipScript:Run(dist)
    while 1 do
        --davidh...
        Wait(500)
        DrawPickups(dist)
    end    
end

function PickupBlipScript:CleanUp()
    
end
