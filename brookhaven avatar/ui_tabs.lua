local HttpService = game:GetService("HttpService")
local _Plr = game.Players.LocalPlayer

-- RAW LINKINI BURAYA KOY (Örn: Pastebin Raw veya GitHub Gist Raw)
local RawURL = "https://raw.githubusercontent.com/Elecsuz/ElecsuzHub/refs/heads/main/earlyaccess.json"

local IsEarlyAccess = false
-- İnternetten listeyi sessizce kontrol et
local success, result = pcall(function()
    return game:HttpGet(RawURL)
end)

-- IsEarlyAccess kontrolünü bu şekilde değiştir:
if success and result then
    -- Oyuncunun sayısal ID'si listede var mı diye bakar
    if string.find(result, tostring(_Plr.UserId)) then
        IsEarlyAccess = true
    end
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Elecsuz Hub (Brookhaven 🏡 RP)",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Elecsuz Hub (Brookhaven 🏡 RP)",
   LoadingSubtitle = "by Elecsuz",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "ElecsuzHub"
   },
})

Rayfield:Notify({
   Title = "Elecsuz Hub",
   Content = "Elecsuz Hub'ı kullandığınız için teşekkür ederiz (Brookhaven 🏡 RP)",
   Duration = 15,
   Image = 0,
})
Rayfield:Notify({
   Title = "YENİ GÜNCELLEME",
   Content = "V1.2.5 - Ana Sayfadan bakabilirsiniz",
   Duration = 10,
   Image = 0,
})

---TabsHome---
local TabHome = Window:CreateTab("Ana sayfa", 0) -- Title, Image
local Label = TabHome:CreateLabel("Elecsuz Hub'a hoşgeldiniz", tonumber("4483362458"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Label = TabHome:CreateLabel("Script Durumu (🟢) (Stabil)", tonumber("4483362458"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreThemeassas
local Paragraph = TabHome:CreateParagraph({Title = "Yapımcı", Content = "İnstagram - @elecsuz\nTiktok - @elecsuzpeek"})
local Paragraph = TabHome:CreateParagraph({Title = "Öneri", Content = "Scripte eklemimi istediğiniz body varsa tiktoktan yazabilirsiniz"})
local Paragraph = TabHome:CreateParagraph({
    Title = "Güncelleme Günlükleri",
    Content = [[
V1.2.5
Erkek Paketi
Bazı vücutlardaki kafa sorunu düzeltildi (Bu önerin için teşekkür ederim (@kr4_mmpus))
"Custom (Erkek (Vücut)" kategorisi eklendi
"Zombi R15" eklendi
-----------------------------------------------
Kız Paketi
"Custom (Kız (Vücut)" kategorisi eklendi
"Zombi R15" eklendi
-----------------------------------------------
Custom
"Minecraft" kategorisi eklendi
"Mutant Zombi" eklendi
-----------------------------------------------
Arayüzdeki bazı iconlar ve yazılar düzeltildi
Bazı vücut isimleri düzeltildi
]]
})

---Tabs BrookhavenRp---
local Tab1 = Window:CreateTab("Kafalar", 0) -- Title, Image
-- (Kafalar sekmesinin butonlarını buraya ekleyebilirsin)

-- // --- EARLY ACCESS BÖLÜMÜ (Kafalardan Hemen Sonra) --- // --
if IsEarlyAccess then
    local EarlyTab = Window:CreateTab("Bacaklar (Erken Erişim 💎)", 0)
    local Label = EarlyTab:CreateLabel("Burası daha çıkmadı yani bunu herkes kullanamaz", 0, Color3.fromRGB(128, 128, 128), false)
    local Label = EarlyTab:CreateLabel("Korblox", 0, Color3.fromRGB(128, 128, 128), false)
    EarlyTab:CreateButton({
       Name = "Korblox (Sol & Sağ)",
       Callback = function()
            Functions.ChangeWithCloth(0, 0, 0, tonumber("139607718"), tonumber("139607673"), 0)
       end,
    })
    EarlyTab:CreateButton({
       Name = "Korblox (Sol)",
       Callback = function()
            Functions.ChangeWithCloth(0, 0, 0, 0, tonumber("139607673"), 0)
       end,
    })
    EarlyTab:CreateButton({
       Name = "Korblox (Sağ)",
       Callback = function()
            Functions.ChangeWithCloth(0, 0, 0, tonumber("139607718"), 0, 0)
       end,
    })
end
-- // --- EARLY ACCESS SONU --- // --
local Tab2 = Window:CreateTab("Kız Paketi", 0) -- Title, Image
local Tab3 = Window:CreateTab("Erkek Paketi", 0) -- Title, Image
local Tab4 = Window:CreateTab("Custom (BETA)", 0) -- Title, Image
--[[
local Tab5 = Window:CreateTab("Local Oyuncu", 0) -- Title, Image
--]]
---Tabs 1 Classic Heads---
local Label = Tab1:CreateLabel("Klasik Kafalar", tonumber("76356016034708"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab1:CreateButton({
   Name = "Cheeks Head",
   Callback = function()
        Functions.Change(0, 0, 0, 0, 0, tonumber("746767604"))
    end,
})
local Button = Tab1:CreateButton({
   Name = "Narrow Head",
   Callback = function()
        Functions.Change(0, 0, 0, 0, 0, tonumber("746774687"))
    end,
})
local Button = Tab1:CreateButton({
   Name = "Paragon Head",
   Callback = function()
        Functions.Change(0, 0, 0, 0, 0, tonumber("616398268"))
    end,
})
local Button = Tab1:CreateButton({
   Name = "Strong Jaw Head",
   Callback = function()
        Functions.Change(0, 0, 0, 0, 0, tonumber("616399508"))
    end,
})
local Button = Tab1:CreateButton({
   Name = "Chiseled Head",
   Callback = function()
        Functions.Change(0, 0, 0, 0, 0, tonumber("616387160"))
    end,
})

---Character Head---
local Label = Tab1:CreateLabel("Karakter Kafaları", tonumber("76356016034708"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab1:CreateButton({
   Name = "Headless Head",
   Callback = function()
        Functions.Change(0, 0, 0, 0, 0, tonumber("134082579"))
    end,
})
local Button = Tab1:CreateButton({
   Name = "Blazeburner Head (Eski)",
   Callback = function()
        Functions.Change(0, 0, 0, 0, 0, tonumber("3210773801"))
    end,
})
local Button = Tab1:CreateButton({
   Name = "Korblox DeatherWalker Head",
   Callback = function()
        Functions.Change(0, 0, 0, 0, 0, tonumber("16580493236"))
    end,
})
local Label = Tab1:CreateLabel("Mogger Yüzü", tonumber("76356016034708"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab1:CreateButton({
   Name = "Mogger Yüzü V2 (Açık Mavi)",
   Callback = function()
        Functions.Change(0, 0, 0, 0, 0, tonumber("112841165846748"))
    end,
})
local Button = Tab1:CreateButton({
   Name = "Mogger Yüzü V2 (Buz Mavi)",
   Callback = function()
        Functions.Change(0, 0, 0, 0, 0, tonumber("131859023305903"))
    end,
})
local Button = Tab1:CreateButton({
   Name = "Mogger Yüzü V2 (Kahverengi)",
   Callback = function()
        Functions.Change(0, 0, 0, 0, 0, tonumber("113913164256832"))
    end,
})
local Button = Tab1:CreateButton({
   Name = "Mogger Yüzü V2 (Siyah)",
   Callback = function()
        Functions.Change(0, 0, 0, 0, 0, tonumber("76161680030412"))
    end,
})

---tabs 2---
local Label = Tab2:CreateLabel("Blush Moda Bebek (Kız(Kol/Gövde)", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab2:CreateButton({
   Name = "Kadın 1 (Siyah)",
   Callback = function()
        Functions.Change(tonumber("14874108946"), tonumber("122027795919157"), tonumber("80393546275035"), tonumber("14917855371"), tonumber("14917855725"), 0)
    end,
})
local Button = Tab2:CreateButton({
   Name = "Kadın 2 (Siyah)",
   Callback = function()
        Functions.Change(tonumber("72823735643524"), tonumber("116063189738050"), tonumber("132179793557248"), tonumber("124747200980318"), tonumber("119970783353045"), tonumber("100285417254498"))
    end,
})
local Label = Tab2:CreateLabel("Inf15 ince (Kız(Vücut) (YENİ)", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab2:CreateButton({
   Name = "Kız (R6)",
   Callback = function()
        Functions.Change(tonumber("110666428682885"), tonumber("133824606620803"), tonumber("71528622668990"), tonumber("124613379104080"), tonumber("95059594184690"), 0)
    end,
})
local Button = Tab2:CreateButton({
   Name = "Inf15 thin",
   Callback = function()
        Functions.Change(tonumber("99066874388600"), tonumber("110223666067317"), tonumber("139195668026590"), tonumber("84851130850994"), tonumber("124165167882248"), 0)
    end,
})
local Label = Tab2:CreateLabel("Mini Kadın (Kız (Vücut)", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab2:CreateButton({
   Name = "Peluş Chibi Kadın",
   Callback = function()
        Functions.Change(tonumber("84519338962111"), tonumber("104625992479605"), tonumber("89231963593670"), tonumber("101500262169377"), tonumber("130044271500910"), 0)
    end,
})
local Button = Tab2:CreateButton({
   Name = "Chibi Kız Bubbly",
   Callback = function()
        Functions.Change(tonumber("17759625390"), tonumber("17759625333"), tonumber("17759625415"), tonumber("17759626537"), tonumber("17759626879"), 0)
    end,
})
local Button = Tab2:CreateButton({
   Name = "Manga Doll",
   Callback = function()
        Functions.Change(tonumber("97119075795691"), tonumber("72699005696177"), tonumber("122027795919157"), tonumber("80393546275035"), tonumber("125637672664513"), 0)
    end,
})
local Label = Tab2:CreateLabel("Chibi Bebek Kız (Kız (Vücut)", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab2:CreateButton({
   Name = "Chibi Bebek Kız (Siyah/Vücut)",
   Callback = function()
        Functions.Change(tonumber("14775830263"), tonumber("14775830261"), tonumber("14775830259"), tonumber("14775830269"), tonumber("14775830264"), 0)
    end,
})
local Button = Tab2:CreateButton({
   Name = "Chibi Bebek Kız (Beyaz/vücut)",
   Callback = function()
        Functions.Change(tonumber("14785351665"), tonumber("14775830261"), tonumber("14775830259"), tonumber("14775830269"), tonumber("14775830264"), 0)
    end,
})
local Label = Tab2:CreateLabel("Mini Peluş Oyuncak (Kız/Erkek (Vücut)", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab2:CreateButton({
   Name = "Mini Peluş (Siyah)",
   Callback = function()
        Functions.Change(tonumber("14579958702"), tonumber("14583777042"), tonumber("14583777007"), tonumber("14579959249"), tonumber("14579963667"), 0)
    end,
})
local Button = Tab2:CreateButton({
   Name = "Mini Peluş (Beyaz)",
   Callback = function()
        Functions.Change(tonumber("14583777041"), tonumber("14583776823"), tonumber("14583776741"), tonumber("14583776823"), tonumber("14583776741"), 0)
    end,
})
local Label = Tab2:CreateLabel("Custom (Kız (Vücut) (YENİ)", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab2:CreateButton({
   Name = "Zombi R15 (YENİ)",
   Callback = function()
        Functions.Change(tonumber("136940214719972"), tonumber("101737782964523"), tonumber("136697746632711"), tonumber("130937207479796"), tonumber("128953805087357"), 0)
    end,
})
---Tabs 3---
local Label = Tab3:CreateLabel("Mini Peluş Oyuncak (Kız/Erkek (Vücut)", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab3:CreateButton({
   Name = "Mini Peluş (Siyah)",
   Callback = function()
        Functions.Change(tonumber("14579958702"), tonumber("14583777042"), tonumber("14583777007"), tonumber("14579959249"), tonumber("14579963667"), 0)
    end,
})
local Button = Tab3:CreateButton({
   Name = "Mini Peluş (Beyaz)",
   Callback = function()
        Functions.Change(tonumber("14583777041"), tonumber("14583776823"), tonumber("14583776741"), tonumber("14583776823"), tonumber("14583776741"), 0)
    end,
})
local Label = Tab3:CreateLabel("Inf15 ince (Erkek (Vücut)", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab3:CreateButton({
   Name = "2009's R6",
   Callback = function()
        Functions.Change(tonumber("94619376315261"), tonumber("84202891428327"), tonumber("113258817098171"), tonumber("84599596654139"), tonumber("116402158526334"), 0)
    end,
})
local Button = Tab3:CreateButton({
   Name = "Inf15 thin (Renklendirilebilir)",
   Callback = function()
        Functions.Change(tonumber("106230113171341"), tonumber("105492851761090"), tonumber("135713531517616"), tonumber("106340886786756"), tonumber("73265128583697"), 0)
    end,
})
local Button = Tab3:CreateButton({
   Name = "Uzun R15 (Siyah)",
   Callback = function()
        Functions.Change(tonumber("85114883492302"), tonumber("127676087216472"), tonumber("88723740350494"), tonumber("102262728710700"), tonumber("92893876195279"), 0)
    end,
})
local Button = Tab3:CreateButton({
   Name = "Normal R15",
   Callback = function()
        Functions.Change(tonumber("100519121280004"), tonumber("125836929194600"), tonumber("135351350431580"), tonumber("82627053774915"), tonumber("86474686489651"), tonumber("137514556918263"))
    end,
})
local Label = Tab3:CreateLabel("Mini Adam (Erkek Çocuk (Vücut)", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab3:CreateButton({
   Name = "Mini Adam (Gri)",
   Callback = function()
        Functions.Change(tonumber("93074839269016"), tonumber("117079685799715"), tonumber("81502860408959"), tonumber("89658787394734"), tonumber("108834379337347"), 0)
    end,
})
local Label = Tab3:CreateLabel("Kaslı (Erkek (Vücut)", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab3:CreateButton({
   Name = "Kaslı 1",
   Callback = function()
        Functions.Change(tonumber("121532625082697"), tonumber("119216187383922"), tonumber("121634444400488"), tonumber("100229264383618"), tonumber("126161096503611"), 0)
    end,
})
local Label = Tab3:CreateLabel("Custom (Erkek (Vücut) (YENİ)", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab3:CreateButton({
   Name = "Zombi R15 (YENİ)",
   Callback = function()
        Functions.Change(tonumber("109135035435136"), tonumber("129332706620461"), tonumber("89485965199920"), tonumber("140510670003748"), tonumber("115913397983281"), 0)
    end,
})

--Tabs 4--
local Label = Tab4:CreateLabel("BURASI BETA AŞAMASINDA ŞUANLIK BUNLAR VAR YAKINDA DAHA FAZLASI GELİCEK", 0, Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Label = Tab4:CreateLabel("ama çalışıyor kullanabiliriz hiç bir problem çıkmaz", 0, Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Label = Tab4:CreateLabel("Custom Kız/Erkek???", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab4:CreateButton({
   Name = "İskelet",
   Callback = function()
        Functions.Change(tonumber("95993623851154"), tonumber("81797621418627"), tonumber("90507248825226"), tonumber("73903821554644"), tonumber("118042227603051"), tonumber("77734008061862"))
    end,
})
local Button = Tab4:CreateButton({
   Name = "Mini REPO",
   Callback = function()
        Functions.Change(tonumber("133391239416999"), tonumber("137301494386930"), tonumber("87357384184710"), tonumber("117101023704825"), tonumber("125767940563838"), tonumber("111818794467824"))
    end,
})
local Button = Tab4:CreateButton({
   Name = "SüngerBob",
   Callback = function()
        Functions.Change(tonumber("113510137443822"), tonumber("83556472173914"), tonumber("93904783038184"), tonumber("93797324873835"), tonumber("99507476391505"), tonumber("93338393291989"))
    end,
})
local Label = Tab4:CreateLabel("Hayvanlar", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab4:CreateButton({
   Name = "Hamster",
   Callback = function()
        Functions.Change(tonumber("18919352351"), tonumber("18919352769"), tonumber("18919352786"), tonumber("18919352355"), tonumber("18919352354"), tonumber("18919348924"))
    end,
})
local Button = Tab4:CreateButton({
   Name = "Küçük Tavuk",
   Callback = function()
        Functions.Change(tonumber("118010902813828"), tonumber("111420043147221"), tonumber("82832483399845"), tonumber("118663158629251"), tonumber("140184166290659"), tonumber("124272885882231"))
    end,
})
local Button = Tab4:CreateButton({
   Name = "Güvercin",
   Callback = function()
        Functions.Change(tonumber("108606139451045"), tonumber("85828897541190"), tonumber("134006789505304"), tonumber("75417153810267"), tonumber("101883175743454"), tonumber("127070584433499"))
    end,
})
local Label = Tab4:CreateLabel("Minecraft (YENİ)", tonumber("80756285712103"), Color3.fromRGB(128, 128, 128), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab4:CreateButton({
   Name = "Mini Tavuk",
   Callback = function()
        Functions.Change(tonumber("107662325996526"), tonumber("78851503950557"), tonumber("138772340696274"), tonumber("121092674628184"), tonumber("131630280140987"), tonumber("74846704232645"))
    end,
})
local Button = Tab4:CreateButton({
   Name = "Mutant Zombi (YENİ) (boyu küçük oluyor nedense anlamadım)",
   Callback = function()
        Functions.Change(tonumber("111541414629106"), tonumber("82713982533607"), tonumber("111828291154015"), tonumber("70748255873699"), tonumber("139156959540258"), tonumber("99220003790674"))
    end,
})