local function loadModule(file)
    local url = "https://raw.githubusercontent.com/Elecsuz/ElecsuzHub/refs/heads/main/brookhaven%20avatar/" .. file
    
    pcall(function() 
        local content = game:HttpGet(url)
        if content then
            local func = loadstring(content)
            if func then
                func()
            end
        end
    end)
end

loadModule("security.lua")
loadModule("functions.lua")
loadModule("admin.lua")
loadModule("ui_tabs.lua")
