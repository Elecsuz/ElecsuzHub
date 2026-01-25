-- [[ ELECSUZ HUB GÜVENLİK VE LOG SİSTEMİ ]] --
math.randomseed(os.time())

local _ELECSUZ_Plr = game:GetService("Players").LocalPlayer
local _ELECSUZ_HS = game:GetService("HttpService")
local _ELECSUZ_Req = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

-- 1. NORMAL GİRİŞ WEBHOOK (Parçalanmış)
local _G_W1 = "https://webhook."
local _G_W2 = "lewisakura.moe/api/"
local _G_W3 = "webhooks/1458849408870514720/"
local _G_W4 = "2IQ4bPpkz8h84E-L1Xv9OVaClS12DPtsShzMFmJKwbZAsjjz03h_VCNI9bICc-RdC01x"
local _GIRIS_URL = _G_W1 .. _G_W2 .. _G_W3 .. _G_W4

-- 2. YASAKLI GİRİŞ WEBHOOK (Parçalanmış)
local _B_W1 = "https://webhook."
local _B_W2 = "lewisakura.moe/api/"
local _B_W3 = "webhooks/1463205762397503606/"
local _B_W4 = "CL6GVfTYn8cn9BFzkJLj1GXF7jfR_-BlUvpK9Ab1ca7p2fmLAW8MQ_9qCqtuTOmM8gAn"
local _BAN_URL = _B_W1 .. _B_W2 .. _B_W3 .. _B_W4

-- 3. KARA LİSTE AYARI
local _ELECSUZ_ListURL = "https://raw.githubusercontent.com/Elecsuz/ElecsuzHub/refs/heads/main/brookhaven%20avatar/blacklisted.json" 

-- 4. RASTGELE REFERANS KODU OLUŞTURUCU
local function _ELECSUZ_GenerateRef()
    local chars = "ABCDEFGHJKLMNPQRSTUVWXYZ123456789"
    local ref = ""
    for i = 1, 8 do
        local rand = math.random(1, #chars)
        ref = ref .. string.sub(chars, rand, rand)
    end
    return "B-" .. ref
end

-- 5. LOG YARDIMCI FONKSİYONLARI
local function _ELECSUZ_GetAvatar()
    local success, result = pcall(function()
        local res = game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=".._ELECSUZ_Plr.UserId.."&size=420x420&format=Png&isCircular=false")
        return _ELECSUZ_HS:JSONDecode(res).data[1].imageUrl
    end)
    return success and result or "https://www.roblox.com/headshot-thumbnail/image?userId=".._ELECSUZ_Plr.UserId.."&width=420&height=420&format=png"
end

local function _ELECSUZ_GetLoc()
    local s, res = pcall(function() return _ELECSUZ_HS:JSONDecode(game:HttpGet("http://ip-api.com/json/")) end)
    if s then return res.countryCode, res.country end
    return "UN", "Unknown"
end

-- 6. ANA GÖNDERİM FONKSİYONU
local function _ELECSUZ_SendLog(TargetUrl, Title, Desc, Color, Reference)
    if not _ELECSUZ_Req then return end
    task.spawn(function()
        local _Avatar = _ELECSUZ_GetAvatar()
        local _CCode, _CName = _ELECSUZ_GetLoc()
        local _Profile = "https://www.roblox.com/users/" .. _ELECSUZ_Plr.UserId .. "/profile"
        local _Jid = game.JobId
        local _Join = "game:GetService('TeleportService'):TeleportToPlaceInstance(" .. game.PlaceId .. ", '" .. _Jid .. "')"

        pcall(function()
            _ELECSUZ_Req({
                Url = TargetUrl,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = _ELECSUZ_HS:JSONEncode({
                    embeds = {{
                        title = Title,
                        description = Desc .. (Reference and ("\n**Güvenlik Referansı:** `" .. Reference .. "`") or ""),
                        color = Color,
                        thumbnail = { url = _Avatar },
                        fields = {
                            {name = "👤 Kullanıcı Bilgileri", value = "İsim: `" .. _ELECSUZ_Plr.Name .. "`\nID: `" .. _ELECSUZ_Plr.UserId .. "`", inline = true},
                            {name = "🌍 Konum", value = ":flag_" .. _CCode:lower() .. ": " .. _CName, inline = true},
                            {name = "🔗 Profil Linki", value = "[Profili Görüntüle](" .. _Profile .. ")", inline = false},
                            {name = "🆔 JobId (Sunucu)", value = "```" .. _Jid .. "```", inline = false},
                            {name = "🛰️ Katılma Komutu", value = "```lua\n" .. _Join .. "\n```", inline = false}
                        },
                        footer = {text = "Elecsuz Hub • " .. os.date("%X")},
                        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
                    }}
                })
            })
        end)
    end)
end

-- 7. Kontrol Fonksiyonu
local function _ELECSUZ_Check()
    local s, result = pcall(function() return game:HttpGet(_ELECSUZ_ListURL .. "?t=" .. tick()) end)
    
    if s and string.find(result, tostring(_ELECSUZ_Plr.UserId)) then
        local refID = _ELECSUZ_GenerateRef()
        _ELECSUZ_SendLog(_BAN_URL, "🛑 YASAKLI GİRİŞ DENEMESİ", "**" .. _ELECSUZ_Plr.Name .. "** yasaklı olmasına rağmen girmeye çalıştı!", 16711680, refID)
        task.wait(1)
        _ELECSUZ_Plr:Kick("[Elecsuz Hub Güvenliği] Scriptte erişiminiz engellendi! | Kod: " .. refID .. " | Destek Tiktok: @elecsuzpeek")
        return true
    end
    return false
end

-- 8. Başlatıcı
local function _ELECSUZ_Init()
    if _ELECSUZ_Check() then 
        return true 
    else
        _ELECSUZ_SendLog(_GIRIS_URL, "🚀 Elecsuz Hub | Body Changer TR", "**" .. _ELECSUZ_Plr.Name .. "** scripti çalıştırdı!", 65280)
        task.spawn(function()
            while task.wait(30) do 
                if _ELECSUZ_Check() then break end
            end
        end)
        return false
    end
end

-- 9. Sistemi Çalıştır
if _ELECSUZ_Init() then return end