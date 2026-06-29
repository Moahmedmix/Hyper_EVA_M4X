-- ===== تعطيل المخرجات أولاً =====
print = function() end

-- ================================
-- الحتة اللي هتضيفها في السكربت الأساسي
-- ================================

-- 1️⃣ دالة جلب الصورة (حطها في بداية السكربت بعد تحميل WindUI)
local function GetPlayerAvatar()
    local userId = game:GetService("Players").LocalPlayer.UserId
    return "rbxthumb://type=AvatarHeadShot&id=" .. userId .. "&w=150&h=150"
end


-- ===== تحميل WindUI =====
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
if not WindUI then
    WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end

WindUI.TransparencyValue = 0.15
WindUI:SetTheme("Dark")
WindUI.Notify = function() end
local Window = WindUI:CreateWindow({
    Title = "Neo Hyper v1.0",
    Icon = "solar:crown-minimalistic-outline",
    Author = "By M4X EVA",
    HideSearchBar = true,
  --  NewElements = true,
    Theme = "Dark",
    Folder = "Hyper_V1",
    Size = UDim2.fromOffset(550, 450),
    
    -- ✅ User Card
    User = {
        Enabled = true,
        Anonymous = false,
        Image = GetPlayerAvatar(),
        Title = game:GetService("Players").LocalPlayer.DisplayName,
        Description = "@" .. game:GetService("Players").LocalPlayer.Name,
        Callback = function()
            WindUI:Notify({
                Title = "Profile",
                Content = "Player: " .. game:GetService("Players").LocalPlayer.Name,
                Duration = 2
            })
        end,
    },
    
    --[[ KeySystem = {                                                   
        Note = "Example Key System. With platoboost.",              
        API = {                                                     
            { -- PlatoBoost
                Type = "platoboost",                                
                ServiceId = 26331,
                Secret = "83088530-751f-4d3c-9a51-97effbd2e826",
            },                                                      
        },                                                          
    }, ]]                                                              
})


Window:EditOpenButton({
    Title = "NEO HYPER",
    Icon = "solar:crown-minimalistic-outline",
    IconColor = Color3.fromRGB(255, 215, 0),
    CornerRadius = UDim.new(1, 0),
    StrokeThickness = 1.5,
    StrokeColor = Color3.fromRGB(200, 50, 0),
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 50, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0)),
    }),
    Enabled = true,
    Draggable = true,
    Size = UDim2.new(0, 130, 0, 32),
    TextColor = Color3.fromRGB(255, 255, 255),
    TextSize = 14,
    Font = Enum.Font.GothamBold,
})

-- ============================================
-- GitHub Module Links Configuration (Ordered)
-- ============================================
local files = {
    {name = "Home",     url = "https://raw.githubusercontent.com/Moahmedmix/Hyper_EVA_M4X/refs/heads/main/Mix/Game/EVADE/H.lua"},
    {name = "Auto",     url = "https://raw.githubusercontent.com/Moahmedmix/Hyper_EVA_M4X/refs/heads/main/Mix/Game/EVADE/A.lua"},
    {name = "ESP",      url = "https://raw.githubusercontent.com/Moahmedmix/Hyper_EVA_M4X/refs/heads/main/Mix/Game/EVADE/E.lua"},
    {name = "Misc",     url = "https://raw.githubusercontent.com/Moahmedmix/Hyper_EVA_M4X/refs/heads/main/Mix/Game/EVADE/M.lua"},
    {name = "VIP",      url = "https://raw.githubusercontent.com/Moahmedmix/Hyper_EVA_M4X/refs/heads/main/Mix/Game/EVADE/V.lua"},
--  {name = "Se",       url = "https://raw.githubusercontent.com/mixmix-mi/Neo/refs/heads/main/S.lua"},
 -- {name = "se",       url = "https://raw.githubusercontent.com/Moahmedmix/Hyper_EVA_M4X/refs/heads/main/Mix/Game/EVADE/se.lua"}
}

-- ============================================
-- Loop to Fetch and Execute Modules
-- ============================================
for _, module in ipairs(files) do
    local moduleName = module.name
    local url = module.url

    local success, content = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success and content then
        local runCode, err = loadstring(content)
        if runCode then
            task.spawn(function()
                runCode(Window, ConfigManager, mainConfig)
            end)
        end
    end
    
    task.wait(0.1)
end

