fx_version 'cerulean'
game 'gta5'

author 'Catusse'
description 'Sistema di Crafting - Recon Development'
version '1.1.0'

shared_scripts {
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}