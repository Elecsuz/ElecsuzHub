-- ELECSUZ HUB - MASTER LOADER
local function load(file)
    local url = "https://raw.githubusercontent.com/Elecsuz/ElecsuzHub/main/" .. file
    loadstring(game:HttpGet(url))()
end

load("security.lua") -- Önce güvenlik
load("admin.lua")    -- Sonra yetkiler
load("ui_tabs.lua")  -- En son arayüz
