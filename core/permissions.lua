DeputyFramework = DeputyFramework or {}

function DeputyFramework.HasPermission(playerId, permission)
    return IsPlayerAceAllowed(playerId, permission)
end

RegisterCommand('kick', function(source, args)
    if DeputyFramework.HasPermission(source, Config.Permissions.Admin) then
        local targetId = tonumber(args[1])
        DropPlayer(targetId, 'You have been kicked by an admin.')
    else
        TriggerClientEvent('DeputyFramework:Notify', source, 'Insufficient permissions.')
    end
end, false)
