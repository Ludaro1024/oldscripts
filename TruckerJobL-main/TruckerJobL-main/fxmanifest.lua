fx_version 'cerulean'
game 'gta5'

name "Trucker job"
author 'Sukra, Ludaro'
description 'Trucker Job for esx'
version '3.0'

shared_scripts {
	'config.lua',
    '@es_extended/imports.lua'
}

client_scripts {
	'@NativeUILua_Reloaded/src/NativeUIReloaded.lua',
    	'@NativeUI/NativeUI.lua',
	'client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua'
	'server.lua',
}
