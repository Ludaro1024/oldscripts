fx_version('cerulean')
games({ 'gta5' })
lua54 'yes'
client_scripts{ 
"client/*.lua", 
}
server_scripts { 
    '@mysql-async/lib/MySQL.lua',
    "server/*.lua" 
}
shared_scripts {
    "config.lua",
}
