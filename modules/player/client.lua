local health, armor, stamina, money = 100, 100, 100, 0

local function updateMapDisplay()
    if Config.HUD.MapShape == 'none' then
        DisplayRadar(false)
    else
        DisplayRadar(true)
        if Config.HUD.MapShape == 'circle' then
            SetMinimapClipType(1)
        elseif Config.HUD.MapShape == 'square' then
            SetMinimapClipType(0)
        end
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        HideHudComponentThisFrame(1)
        HideHudComponentThisFrame(2)
        HideHudComponentThisFrame(3)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(13)
        HideHudComponentThisFrame(20)
        HideHudComponentThisFrame(22)
        updateMapDisplay()
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.HUD.RefreshRate)
        
        local player = PlayerPedId()
        health = GetEntityHealth(player) - 100
        armor = GetPedArmour(player)
        local maxStamina = 100.0
        local staminaRemaining = GetPlayerSprintStaminaRemaining(PlayerId())
        stamina = math.floor((staminaRemaining / maxStamina) * 100)
        
        SendNUIMessage({
            type = 'updateHUD',
            health = health,
            armor = armor,
            stamina = stamina .. '%',
            money = money
        })
    end
end)

RegisterNetEvent('DeputyFramework:UpdateMoneyUI')
AddEventHandler('DeputyFramework:UpdateMoneyUI', function(newMoney)
    money = newMoney
    SendNUIMessage({
        type = 'updateHUD',
        money = money
    })
end)
