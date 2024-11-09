if GetResourceState('nd-core') == 'started' then
    NDCore = exports['nd-core']:getSharedObject()

    -- Get player data (ND)
    function DeputyFramework.GetPlayerData(playerId)
        return NDCore.GetPlayer(playerId)
    end

    -- Add money (ND)
    function DeputyFramework.AddMoney(playerId, amount)
        local player = NDCore.GetPlayer(playerId)
        if player then
            player.addMoney(amount)
        end
    end

    -- Remove money (ND)
    function DeputyFramework.RemoveMoney(playerId, amount)
        local player = NDCore.GetPlayer(playerId)
        if player then
            player.removeMoney(amount)
        end
    end
end
