PickupBlipScript = Script{}

function PickupBlipScript:Run(distance)
    while 1 do
        Wait(500)
        DrawPickups(distance)
    end
end

function PickupBlipScript:CleanUp()
end
