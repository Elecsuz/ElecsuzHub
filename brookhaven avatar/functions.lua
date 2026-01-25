-- [[ ELECSUZ HUB - MERKEZİ MOTOR MODÜLÜ ]] --
getgenv().Functions = {} -- İsmi "Functions" olarak güncellendi

local RE = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody")
local Wear = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear")
local LP = game.Players.LocalPlayer

-- 1. ANA DEĞİŞİM FONKSİYONU
Functions.Change = function(t, ra, la, rl, ll, h)
    local args = {
        [1] = {
            [1] = tonumber(t or 0),
            [2] = tonumber(ra or 0),
            [3] = tonumber(la or 0),
            [4] = tonumber(rl or 0),
            [5] = tonumber(ll or 0),
            [6] = tonumber(h or 0)
        }
    }
    pcall(function()
        RE:InvokeServer(unpack(args))
    end)
end

-- 2. KIYAFET KORUMALI DEĞİŞİM (Bacaklar ve Paketler İçin)
Functions.ChangeWithCloth = function(t, ra, la, rl, ll, h)
    local char = LP.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    
    if hum then
        local success, desc = pcall(function() return hum:GetAppliedDescription() end)
        if success and desc then
            Functions.Change(t or desc.Torso, ra or desc.RightArm, la or desc.LeftArm, rl or desc.RightLeg, ll or desc.LeftLeg, h or desc.Head)
            
            task.wait(0.3)
            if desc.Shirt > 0 then Wear:InvokeServer(desc.Shirt) end
            if desc.Pants > 0 then Wear:InvokeServer(desc.Pants) end
        end
    end
end

-- 3. RESET FONKSİYONU
Functions.Reset = function()
    Functions.Change(0, 0, 0, 0, 0, 0)
end