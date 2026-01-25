-- [[ ELECSUZ HUB - MODÜLER ADMİN SİSTEMİ ]] --
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local TS = game:GetService("TeleportService")

-- Global Değişkenleri Hazırla (Eğer daha önce tanımlanmadıysa)
getgenv().AdminUsername = "eha121" 
getgenv().TargetToKick = getgenv().TargetToKick or nil
getgenv().TargetToRejoin = getgenv().TargetToRejoin or nil

-- [[ 1. KOMUT DİNLEYİCİ ]] --
LP.Chatted:Connect(function(msg)
    -- Sadece senin ismin komut verebilir
    if LP.Name == getgenv().AdminUsername then
        local args = string.split(msg:lower(), " ")
        local cmd = args[1]
        local targetName = args[2]

        if (cmd == "e.kick" or cmd == "e.rejoin") and targetName then
            for _, v in pairs(Players:GetPlayers()) do
                if v.Name:lower():find(targetName) or v.DisplayName:lower():find(targetName) then
                    if cmd == "e.kick" then
                        getgenv().TargetToKick = v.Name
                    elseif cmd == "e.rejoin" then
                        getgenv().TargetToRejoin = v.Name
                    end
                end
            end
        end
    end
end)

-- [[ 2. SÜREKLİ KONTROL DÖNGÜSÜ ]] --
task.spawn(function()
    while task.wait(0.5) do
        -- KICK KONTROLÜ
        if getgenv().TargetToKick and LP.Name == getgenv().TargetToKick then
            getgenv().TargetToKick = nil
            LP:Kick("[Elecsuz Hub Güvenliği] Script yetkilisi tarafından sunucudan uzaklaştırıldınız.")
        end

        -- REJOIN KONTROLÜ (4 Saniye Beklemeli)
        if getgenv().TargetToRejoin and LP.Name == getgenv().TargetToRejoin then
            getgenv().TargetToRejoin = nil
            
            -- Bildirim Gönder
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Elecsuz Hub",
                Text = "4 saniye içinde sunucuya yeniden bağlanacaksınız...",
                Duration = 4
            })

            task.wait(4)

            local success, err = pcall(function()
                if #Players:GetPlayers() <= 1 then
                    TS:Teleport(game.PlaceId, LP)
                else
                    TS:TeleportToPlaceInstance(game.PlaceId, game.JobId, LP)
                end
            end)
            
            if not success then 
                TS:Teleport(game.PlaceId, LP) 
            end
        end
    end
end)