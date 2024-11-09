if GetResourceState('qb-core') == 'started' then
    QBCore = exports['qb-core']:GetCoreObject()

    -- Get player data (QBCore)
    function DeputyFramework.GetPlayerData(playerId)
        return QBCore.Functions.GetPlayer(playerId)
    end

    -- Add money (QBCore)
    function DeputyFramework.AddMoney(playerId, amount)
        local Player = QBCore.Functions.GetPlayer(playerId)
        if Player then
            Player.Functions.AddMoney('cash', amount)
        end
    end

    -- Remove money (QBCore)
    function DeputyFramework.RemoveMoney(playerId, amount)
        local Player = QBCore.Functions.GetPlayer(playerId)
        if Player then
            Player.Functions.RemoveMoney('cash', amount)
        end
    end
end
