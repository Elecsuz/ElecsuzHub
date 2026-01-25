-- ELECSUZ HUB - MASTER LOADER
local function load(file)
    local url = https://raw.githubusercontent.com/Elecsuz/ElecsuzHub/refs/heads/main/brookhaven%20avatar/" .. file
    loadstring(game:HttpGet(url))()
end

load("security.lua")
load("admin.lua")
load("ui_tabs.lua")
