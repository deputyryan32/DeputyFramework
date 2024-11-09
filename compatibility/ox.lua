if GetResourceState('ox_core') == 'started' then
    OX = exports.ox_core

    -- Get player data (OX)
    function DeputyFramework.GetPlayerData(playerId)
        return OX.GetPlayer(playerId)
    end

    -- Add money (OX)
    function DeputyFramework.AddMoney(playerId, amount)
        local player = OX.GetPlayer(playerId)
        if player then
            player.addMoney(amount)
        end
    end

    -- Remove money (OX)
    function DeputyFramework.RemoveMoney(playerId, amount)
        local player = OX.GetPlayer(playerId)
        if player then
            player.removeMoney(amount)
        end
    end
end
