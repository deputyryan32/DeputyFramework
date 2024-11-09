local health, armor, stamina, money = 100, 100, 100, 0

-- Update the HUD data every second
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000) -- 1-second interval
        
        local player = PlayerPedId()
        health = GetEntityHealth(player) - 100 -- Adjusted base health
        armor = GetPedArmour(player)
        stamina = math.floor(GetPlayerSprintStaminaRemaining(PlayerId()) * 100)
        
        -- Debug print statements to confirm values
        print("HUD Values - Health:", health, "Armor:", armor, "Stamina:", stamina, "Money:", money)

        -- Send data to the NUI
        SendNUIMessage({
            type = 'updateHUD',
            health = health,
            armor = armor,
            stamina = stamina,
            money = money
        })
    end
end)

-- Example event to update money, which you can trigger from the server
RegisterNetEvent('DeputyFramework:UpdateMoney')
AddEventHandler('DeputyFramework:UpdateMoney', function(newMoney)
    money = newMoney
    SendNUIMessage({
        type = 'updateHUD',
        money = money
    })
end)
