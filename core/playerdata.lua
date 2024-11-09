DeputyFramework = DeputyFramework or {}

local function getPlayerDataPath(license)
    return Config.DataStorage.DataFolder .. license .. '.json'
end

function DeputyFramework.LoadPlayerData(license)
    local path = getPlayerDataPath(license)
    if not fileExists(path) then
        DeputyFramework.SavePlayerData(license, { money = Config.DefaultMoney })
        return { money = Config.DefaultMoney }
    end

    local file = io.open(path, "r")
    local data = json.decode(file:read("*all"))
    file:close()
    return data
end

function DeputyFramework.SavePlayerData(license, data)
    local path = getPlayerDataPath(license)
    local file = io.open(path, "w+")
    file:write(json.encode(data))
    file:close()
end
