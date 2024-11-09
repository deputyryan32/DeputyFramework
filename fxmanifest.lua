fx_version 'cerulean'
game 'gta5'

name 'DeputyFramework'
description 'A modular, multi-framework compatible FiveM framework with custom HUD'
author 'DeputyMods'
version '1.0.0'

server_scripts {
    '@DiscordAcePerms/config.lua',
    'core/config.lua',
    'core/playerdata.lua',
    'core/permissions.lua',
    'core/utils.lua',
    'compatibility/*.lua',
    'modules/**/server.lua'
}

client_scripts {
    'modules/**/client.lua'
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js',
    'ui/icons/health.png',
    'ui/icons/armor.png',
    'ui/icons/stamina.png',
    'ui/icons/money.png'
}

shared_script 'core/config.lua'
