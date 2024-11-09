if GetResourceState('es_extended') == 'started' then
    ESX = exports['es_extended']:getSharedObject()

    -- Get player data (ESX)
    function DeputyFramework.GetPlayerData(playerId)
        return ESX.GetPlayerFromId(playerId)
    end

    -- Add money (ESX)
    function DeputyFramework.AddMoney(playerId, amount)
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer then
            xPlayer.addMoney(amount)
        end
    end

    -- Remove money (ESX)
    function DeputyFramework.RemoveMoney(playerId, amount)
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer then
            xPlayer.removeMoney(amount)
        end
    end
end
