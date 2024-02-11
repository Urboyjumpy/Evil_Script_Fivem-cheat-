-- Evil FiveM Cheat Script

-- Function to enable god mode
function enableGodMode()
    SetEntityInvincible(PlayerPedId(), true)
end

-- Function to disable god mode
function disableGodMode()
    SetEntityInvincible(PlayerPedId(), false)
end

-- Function to spawn a vehicle of your choice
function spawnVehicle(vehicleName)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local vehicleHash = GetHashKey(vehicleName)
    RequestModel(vehicleHash)
    while not HasModelLoaded(vehicleHash) do
        Citizen.Wait(0)
    end
    local vehicle = CreateVehicle(vehicleHash, playerCoords.x, playerCoords.y, playerCoords.z, GetEntityHeading(PlayerPedId()), true, false)
    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
end

-- Main cheat function
function main()
    while true do
        -- Listen for cheat commands
        Citizen.Wait(0)
        if IsControlJustPressed(0, 289) then -- Change this control to your desired cheat activation key (default: F1)
            -- Enable god mode
            enableGodMode()
        elseif IsControlJustPressed(0, 288) then -- Change this control to your desired cheat deactivation key (default: F2)
            -- Disable god mode
            disableGodMode()
        elseif IsControlJustPressed(0, 289) then -- Change this control to your desired cheat activation key (default: F3)
            -- Spawn a vehicle
            spawnVehicle("adder") -- Change "adder" to the desired vehicle model
        end
    end
end

-- Start the main cheat loop
Citizen.CreateThread(main)
