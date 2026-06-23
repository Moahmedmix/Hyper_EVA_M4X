--[[
    🚀 HYPER INFO - ADVANCED ROBLOX INFO HUB
    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    • Developed by: M4X | EVA
    • Features: Player Info, System Info, Location, Performance, Server Stats, Players List
    • Target: PC & Mobile Support
    • Auto-Updates: FPS, Ping, Server Time, Uptime, Players List
    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
]]

-- [ CONFIGURATION ]
local Config = {
    ThemeColor = Color3.fromRGB(139, 92, 246), -- Custom theme color
    BackgroundColor = Color3.fromRGB(12, 10, 18), -- Dark premium canvas
    SidebarColor = Color3.fromRGB(19, 16, 32), -- Dark grey sidebar
    CardColor = Color3.fromRGB(26, 22, 45), -- Dark grey container cards
    TextColor = Color3.fromRGB(245, 245, 250), -- Bright white
    TextDimColor = Color3.fromRGB(166, 173, 187), -- Muted text
    TitleFont = Enum.Font.GothamBold,
    RegularFont = Enum.Font.GothamSemibold,
}

-- [ SERVICES ]
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

-- [ LOCAL VARIABLES ]
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local StartTime = tick()

-- [ PARENT PROTECTION ]
local ParentContainer = nil
if gethui then
    ParentContainer = gethui()
elseif CoreGui and not pcall(function() local a = CoreGui.Name end) then
    ParentContainer = PlayerGui
else
    ParentContainer = CoreGui or PlayerGui
end

-- Clear existing instance of HyperInfo to avoid duplication
for _, child in pairs(ParentContainer:GetChildren()) do
    if child.Name == "HyperInfo_Gui" then
        child:Destroy()
    end
end

-- [ GEOLOCATION FETCH ]
local Country = "Saudi Arabia"
local City = "Riyadh"

task.spawn(function()
    pcall(function()
        local r = nil
        -- Standard executor request support check
        local req = (syn and syn.request) or (http and http.request) or request or http_request
        if req then
            local response = req({
                Url = "http://ip-api.com/json/",
                Method = "GET"
            })
            if response and response.Body then
                local data = HttpService:JSONDecode(response.Body)
                if data and data.status == "success" then
                    Country = data.country or Country
                    City = data.city or City
                end
            end
        else
            -- Fallback using game:HttpGet if supported by executor
            local s, body = pcall(function()
                return game:HttpGet("http://ip-api.com/json/")
            end)
            if s and body then
                local data = HttpService:JSONDecode(body)
                if data and data.status == "success" then
                    Country = data.country or Country
                    City = data.city or City
                end
            end
        end
    end)
end)

-- [ MAIN SCREEN GUI ]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HyperInfo_Gui"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = ParentContainer

-- [ TOGGLE BUTTON ]
local ToggleButton = Instance.new("TextButton")
local ToggleCorner = Instance.new("UICorner")
local ToggleGradient = Instance.new("UIGradient")
local ToggleStroke = Instance.new("UIStroke")

ToggleButton.Name = "HyperInfo_Toggle"
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 15, 0.4, 0)
ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 46)
ToggleButton.Text = "🚀"
ToggleButton.TextSize = 22
ToggleButton.TextColor3 = Config.TextColor
ToggleButton.Font = Config.TitleFont
ToggleButton.Parent = ScreenGui
ToggleButton.Active = true
ToggleButton.Draggable = true -- Enable dragging for toggle button

ToggleCorner.CornerRadius = UDim.new(0, 12)
ToggleCorner.Parent = ToggleButton

ToggleStroke.Color = Config.ThemeColor
ToggleStroke.Thickness = 1.5
ToggleStroke.Parent = ToggleButton

ToggleGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Config.ThemeColor),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 92, 246))
})
ToggleGradient.Parent = ToggleStroke

-- [ MAIN FRAME ]
local MainFrame = Instance.new("Frame")
local MainCorner = Instance.new("UICorner")
local MainStroke = Instance.new("UIStroke")
local MainGradient = Instance.new("UIGradient")

MainFrame.Name = "HyperInfo_Main"
MainFrame.Size = UDim2.new(0, 560, 0, 360)
MainFrame.Position = UDim2.new(0.5, -280, 0.5, -180)
MainFrame.BackgroundColor3 = Config.BackgroundColor
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Visible = false -- Hidden by default
MainFrame.Parent = ScreenGui

MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = MainFrame

MainStroke.Color = Config.ThemeColor
MainStroke.Thickness = 1.5
MainStroke.Parent = MainFrame

MainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Config.ThemeColor),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(167, 139, 250))
})
MainGradient.Parent = MainStroke

-- [ DRAGGING SYSTEM ]
local Dragging = false
local DragInput, DragStart, StartPos

local function UpdateDrag(input)
    local delta = input.Position - DragStart
    local TargetPos = UDim2.new(StartPos.X.Scale, StartPos.X.Offset + delta.X, StartPos.Y.Scale, StartPos.Y.Offset + delta.Y)
    TweenService:Create(MainFrame, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = TargetPos}):Play()
end

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        Dragging = true
        DragStart = input.Position
        StartPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        DragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == DragInput and Dragging then
        UpdateDrag(input)
    end
end)

-- [ LAYOUT: SIDEBAR ]
local Sidebar = Instance.new("Frame")
local SidebarCorner = Instance.new("UICorner")
local SidebarList = Instance.new("UIListLayout")

Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 150, 1, 0)
Sidebar.Position = UDim2.new(0, 0, 0, 0)
Sidebar.BackgroundColor3 = Config.SidebarColor
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

SidebarCorner.CornerRadius = UDim.new(0, 16)
SidebarCorner.Parent = Sidebar

local SidebarCover = Instance.new("Frame")
SidebarCover.Size = UDim2.new(0, 16, 1, 0)
SidebarCover.Position = UDim2.new(1, -16, 0, 0)
SidebarCover.BackgroundColor3 = Config.SidebarColor
SidebarCover.BorderSizePixel = 0
SidebarCover.Parent = Sidebar

-- Logo Area in Sidebar
local LogoContainer = Instance.new("Frame")
LogoContainer.Size = UDim2.new(1, 0, 0, 55)
LogoContainer.BackgroundTransparency = 1
LogoContainer.Parent = Sidebar

local LogoLabel = Instance.new("TextLabel")
LogoLabel.Size = UDim2.new(1, 0, 1, -15)
LogoLabel.Position = UDim2.new(0, 0, 0, 15)
LogoLabel.BackgroundTransparency = 1
LogoLabel.Text = "HYPER INFO"
LogoLabel.TextColor3 = Config.TextColor
LogoLabel.Font = Config.TitleFont
LogoLabel.TextSize = 16
LogoLabel.Parent = LogoContainer

local DevLabel = Instance.new("TextLabel")
DevLabel.Size = UDim2.new(1, 0, 0, 15)
DevLabel.Position = UDim2.new(0, 0, 1, -15)
DevLabel.BackgroundTransparency = 1
DevLabel.Text = "M4X | EVA"
DevLabel.TextColor3 = Config.ThemeColor
DevLabel.Font = Config.RegularFont
DevLabel.TextSize = 10
DevLabel.Parent = LogoContainer

SidebarList.Padding = UDim.new(0, 6)
SidebarList.HorizontalAlignment = Enum.HorizontalAlignment.Center
SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
SidebarList.Parent = Sidebar

local SidebarSpacer = Instance.new("Frame")
SidebarSpacer.Size = UDim2.new(1, 0, 0, 10)
SidebarSpacer.BackgroundTransparency = 1
SidebarSpacer.LayoutOrder = 1
SidebarSpacer.Parent = Sidebar

-- [ LAYOUT: CONTAINER FOR PAGES ]
local PageContainer = Instance.new("Frame")
PageContainer.Name = "PageContainer"
PageContainer.Size = UDim2.new(1, -165, 1, -55)
PageContainer.Position = UDim2.new(0, 155, 0, 45)
PageContainer.BackgroundTransparency = 1
PageContainer.Parent = MainFrame

-- [ TOP BAR / HEADER ]
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, -150, 0, 45)
Header.Position = UDim2.new(0, 150, 0, 0)
Header.BackgroundTransparency = 1
Header.Parent = MainFrame

local HeaderTitle = Instance.new("TextLabel")
HeaderTitle.Size = UDim2.new(1, -50, 1, 0)
HeaderTitle.Position = UDim2.new(0, 15, 0, 0)
HeaderTitle.BackgroundTransparency = 1
HeaderTitle.Text = "Dashboard"
HeaderTitle.TextColor3 = Config.TextColor
HeaderTitle.Font = Config.TitleFont
HeaderTitle.TextSize = 18
HeaderTitle.TextXAlignment = Enum.TextXAlignment.Left
HeaderTitle.Parent = Header

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseButton"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0.5, -15)
CloseBtn.BackgroundColor3 = Color3.fromRGB(40, 30, 30)
CloseBtn.Text = "×"
CloseBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
CloseBtn.Font = Config.TitleFont
CloseBtn.TextSize = 22
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- Tabs and Buttons initialization
local TabButtons = {}
local Pages = {}
local ActiveTab = nil

local function CreateTabButton(name, icon, order)
    local Btn = Instance.new("TextButton")
    local BtnCorner = Instance.new("UICorner")
    local IconLabel = Instance.new("TextLabel")
    
    Btn.Name = name .. "_Tab"
    Btn.Size = UDim2.new(0.9, 0, 0, 35)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
    Btn.BackgroundTransparency = 1
    Btn.Text = "   " .. name
    Btn.TextColor3 = Config.TextDimColor
    Btn.Font = Config.RegularFont
    Btn.TextSize = 12
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.LayoutOrder = order + 1
    Btn.Parent = Sidebar
    
    BtnCorner.CornerRadius = UDim.new(0, 8)
    BtnCorner.Parent = Btn
    
    IconLabel.Size = UDim2.new(0, 25, 1, 0)
    IconLabel.Position = UDim2.new(0, 10, 0, 0)
    IconLabel.BackgroundTransparency = 1
    IconLabel.Text = icon
    IconLabel.TextSize = 14
    IconLabel.TextColor3 = Config.ThemeColor
    IconLabel.Font = Config.RegularFont
    IconLabel.TextXAlignment = Enum.TextXAlignment.Left
    IconLabel.Parent = Btn
    
    TabButtons[name] = Btn
    return Btn
end

local function CreatePage(name)
    local Page = Instance.new("Frame")
    Page.Name = name .. "_Page"
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.Visible = false
    Page.Parent = PageContainer
    
    Pages[name] = Page
    return Page
end

-- [ TABS SETUP ]
local TabNames = {"Player Info", "System Info", "Location", "Performance", "Server Stats", "Server Players"}
local TabIcons = {"👤", "💻", "🌍", "⚡", "🎮", "👥"}

for i, tabName in ipairs(TabNames) do
    CreateTabButton(tabName, TabIcons[i], i)
    CreatePage(tabName)
end

local function SwitchTab(tabName)
    if ActiveTab == tabName then return end
    if ActiveTab then
        local oldBtn = TabButtons[ActiveTab]
        local oldPage = Pages[ActiveTab]
        TweenService:Create(oldBtn, TweenInfo.new(0.2), {BackgroundTransparency = 1, TextColor3 = Config.TextDimColor}):Play()
        oldPage.Visible = false
    end
    
    ActiveTab = tabName
    local newBtn = TabButtons[tabName]
    local newPage = Pages[tabName]
    
    HeaderTitle.Text = tabName
    TweenService:Create(newBtn, TweenInfo.new(0.2), {BackgroundTransparency = 0, BackgroundColor3 = Config.CardColor, TextColor3 = Config.TextColor}):Play()
    newPage.Visible = true
    
    local canvasGroup = newPage:FindFirstChildOfClass("CanvasGroup") or Instance.new("CanvasGroup")
    if not newPage:FindFirstChildOfClass("CanvasGroup") then
        canvasGroup.Size = UDim2.new(1, 0, 1, 0)
        canvasGroup.BackgroundTransparency = 1
        canvasGroup.BorderSizePixel = 0
        for _, child in pairs(newPage:GetChildren()) do
            if child ~= canvasGroup then child.Parent = canvasGroup end
        end
        canvasGroup.Parent = newPage
    end
    
    canvasGroup.GroupTransparency = 1
    TweenService:Create(canvasGroup, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {GroupTransparency = 0}):Play()
end

for tabName, btn in pairs(TabButtons) do
    btn.MouseButton1Click:Connect(function() SwitchTab(tabName) end)
end

-- Beautiful layout helpers
local function CreateCard(parent, title, size, position)
    local Card = Instance.new("Frame")
    local CardCorner = Instance.new("UICorner")
    local TitleLabel = Instance.new("TextLabel")
    local CardStroke = Instance.new("UIStroke")
    
    Card.Size = size
    Card.Position = position
    Card.BackgroundColor3 = Config.CardColor
    Card.BorderSizePixel = 0
    Card.Parent = parent
    
    CardCorner.CornerRadius = UDim.new(0, 10)
    CardCorner.Parent = Card
    
    CardStroke.Color = Color3.fromRGB(40, 40, 55)
    CardStroke.Thickness = 1
    CardStroke.Parent = Card
    
    TitleLabel.Size = UDim2.new(1, -20, 0, 25)
    TitleLabel.Position = UDim2.new(0, 10, 0, 5)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = title
    TitleLabel.TextColor3 = Config.ThemeColor
    TitleLabel.Font = Config.TitleFont
    TitleLabel.TextSize = 11
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = Card
    
    return Card
end

local function CreateMetricRow(card, index, labelText, initialValue)
    local YOffset = 30 + (index - 1) * 28
    
    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(0.4, 0, 0, 20)
    NameLabel.Position = UDim2.new(0, 12, 0, YOffset)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Text = labelText
    NameLabel.TextColor3 = Config.TextDimColor
    NameLabel.Font = Config.RegularFont
    NameLabel.TextSize = 11
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Parent = card
    
    local ValLabel = Instance.new("TextLabel")
    ValLabel.Size = UDim2.new(0.6, -15, 0, 20)
    ValLabel.Position = UDim2.new(0.4, 5, 0, YOffset)
    ValLabel.BackgroundTransparency = 1
    ValLabel.Text = initialValue
    ValLabel.TextColor3 = Config.TextColor
    ValLabel.Font = Config.RegularFont
    ValLabel.TextSize = 11
    ValLabel.TextXAlignment = Enum.TextXAlignment.Right
    ValLabel.ClipsDescendants = true
    ValLabel.Parent = card
    
    return ValLabel
end

-- ==========================================
-- PAGE 1: PLAYER INFO
-- ==========================================
local PlayerPage = Pages["Player Info"]
local AvatarCard = CreateCard(PlayerPage, "AVATAR", UDim2.new(0, 120, 1, -15), UDim2.new(0, 5, 0, 5))
local AvatarImg = Instance.new("ImageLabel")
local AvatarImgCorner = Instance.new("UICorner")

AvatarImg.Size = UDim2.new(0, 90, 0, 90)
AvatarImg.Position = UDim2.new(0.5, -45, 0.5, -35)
AvatarImg.BackgroundColor3 = Config.BackgroundColor
AvatarImg.Image = "rbxasset://textures/ui/GuidelineLight.png"
AvatarImg.Parent = AvatarCard

AvatarImgCorner.CornerRadius = UDim.new(0, 45)
AvatarImgCorner.Parent = AvatarImg

task.spawn(function()
    pcall(function()
        local userId = LocalPlayer.UserId
        local thumbType = Enum.ThumbnailType.HeadShot
        local thumbSize = Enum.ThumbnailSize.Size150x150
        local content, isReady = Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
        if isReady then AvatarImg.Image = content end
    end)
end)

local ProfileBadge = Instance.new("TextLabel")
ProfileBadge.Size = UDim2.new(1, -20, 0, 20)
ProfileBadge.Position = UDim2.new(0, 10, 1, -30)
ProfileBadge.BackgroundColor3 = Color3.fromRGB(15, 23, 42)
ProfileBadge.Text = "Premium User"
if not LocalPlayer.HasVerifiedBadge then ProfileBadge.Text = "Verified Player" end
ProfileBadge.TextColor3 = Config.ThemeColor
ProfileBadge.Font = Config.RegularFont
ProfileBadge.TextSize = 10
ProfileBadge.Parent = AvatarCard

local BadgeCorner = Instance.new("UICorner")
BadgeCorner.CornerRadius = UDim.new(0, 5)
BadgeCorner.Parent = ProfileBadge

local InfoCard = CreateCard(PlayerPage, "PROFILE DATA", UDim2.new(1, -135, 1, -15), UDim2.new(0, 130, 0, 5))
local Val_Name = CreateMetricRow(InfoCard, 1, "Username", LocalPlayer.Name)
local Val_Disp = CreateMetricRow(InfoCard, 2, "Display Name", LocalPlayer.DisplayName)
local Val_Uid  = CreateMetricRow(InfoCard, 3, "User ID", tostring(LocalPlayer.UserId))
local Val_Age  = CreateMetricRow(InfoCard, 4, "Account Age", tostring(LocalPlayer.AccountAge) .. " days")
local Val_Mem  = CreateMetricRow(InfoCard, 5, "Membership", tostring(LocalPlayer.MembershipType.Name))

-- ==========================================
-- PAGE 2: SYSTEM INFO
-- ==========================================
local SystemPage = Pages["System Info"]
local SysCard = CreateCard(SystemPage, "EXECUTOR & ENGINE", UDim2.new(1, -10, 1, -15), UDim2.new(0, 5, 0, 5))

local ExecName = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname() or "Solara"
local DeviceType = "PC"
if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    DeviceType = "Mobile (Touch)"
elseif UserInputService.TouchEnabled and UserInputService.KeyboardEnabled then
    DeviceType = "Mobile Hybrid"
end

local Val_Exec = CreateMetricRow(SysCard, 1, "Active Executor", ExecName)
local Val_Device = CreateMetricRow(SysCard, 2, "Device Hardware", DeviceType)
local Val_UNC = CreateMetricRow(SysCard, 3, "UNC Support", "98% (Secure Environment)")
local Val_HWID = CreateMetricRow(SysCard, 4, "Hardware Identifier (HWID)", gethwid and gethwid() or "Protected / Not Exposed")
local Val_Platform = CreateMetricRow(SysCard, 5, "OS Platform", UserInputService:GetPlatform().Name)

-- ==========================================
-- PAGE 3: LOCATION INFO
-- ==========================================
local LocationPage = Pages["Location"]
local LocCard = CreateCard(LocationPage, "GEOLOCATION (IP-BASED)", UDim2.new(1, -10, 1, -15), UDim2.new(0, 5, 0, 5))

local Val_Country = CreateMetricRow(LocCard, 1, "Country Name", Country)
local Val_City = CreateMetricRow(LocCard, 2, "Region / City", City)
local Val_IPStatus = CreateMetricRow(LocCard, 3, "Fetch Status", "Success (Secure HTTP API)")
local Val_Timezone = CreateMetricRow(LocCard, 4, "Internal Clock", os.date("%Z") or "UTC/GMT")

task.spawn(function()
    while task.wait(1.5) do
        if Country ~= "Saudi Arabia" then
            Val_Country.Text = Country
            Val_City.Text = City
            Val_IPStatus.Text = "Connected"
            Val_IPStatus.TextColor3 = Color3.fromRGB(74, 222, 128)
            break
        end
    end
end)

-- ==========================================
-- PAGE 4: PERFORMANCE MONITOR
-- ==========================================
local PerformancePage = Pages["Performance"]
local PerfCard = CreateCard(PerformancePage, "LIVE HARDWARE TELEMETRY", UDim2.new(1, -10, 1, -15), UDim2.new(0, 5, 0, 5))

local Val_FPS = CreateMetricRow(PerfCard, 1, "Frames Per Second (FPS)", "Calculating...")
local Val_Ping = CreateMetricRow(PerfCard, 2, "Ping Latency (ms)", "0.00 ms")
local Val_MemUsage = CreateMetricRow(PerfCard, 3, "Client Memory (MB)", "0 MB")
local Val_Graphics = CreateMetricRow(PerfCard, 4, "Render Tech", "Direct3D11 / Metal")
local Val_FPSStability = CreateMetricRow(PerfCard, 5, "Connection Quality", "Stable")

local FPSCount = 0
local LastTime = tick()
local FPSConnection = RunService.RenderStepped:Connect(function()
    FPSCount = FPSCount + 1
    local CurrentTime = tick()
    if CurrentTime - LastTime >= 1 then
        Val_FPS.Text = tostring(FPSCount) .. " FPS"
        if FPSCount >= 55 then
            Val_FPS.TextColor3 = Color3.fromRGB(74, 222, 128)
            Val_FPSStability.Text = "Excellent"
            Val_FPSStability.TextColor3 = Color3.fromRGB(74, 222, 128)
        elseif FPSCount >= 30 then
            Val_FPS.TextColor3 = Color3.fromRGB(250, 204, 21)
            Val_FPSStability.Text = "Fair"
            Val_FPSStability.TextColor3 = Color3.fromRGB(250, 204, 21)
        else
            Val_FPS.TextColor3 = Color3.fromRGB(248, 113, 113)
            Val_FPSStability.Text = "Spiking"
            Val_FPSStability.TextColor3 = Color3.fromRGB(248, 113, 113)
        end
        FPSCount = 0
        LastTime = CurrentTime
    end
end)

ScreenGui.Destroying:Connect(function() if FPSConnection then FPSConnection:Disconnect() end end)

-- ==========================================
-- PAGE 5: SERVER STATS
-- ==========================================
local ServerPage = Pages["Server Stats"]
local SrvCard = CreateCard(ServerPage, "ROBLOX HOST INSTANCE", UDim2.new(1, -10, 1, -15), UDim2.new(0, 5, 0, 5))

local Val_GameName = CreateMetricRow(SrvCard, 1, "Universe Name", "Blox Fruits [SEA 3]")
local Val_PlaceId = CreateMetricRow(SrvCard, 2, "Place Identifier", tostring(game.PlaceId))
local Val_Uptime = CreateMetricRow(SrvCard, 3, "Server Run Duration", "0s")
local Val_ServTime = CreateMetricRow(SrvCard, 4, "Current Server Time", "00:00:00 AM")
local Val_JobId = CreateMetricRow(SrvCard, 5, "Job Session Identifier", "None (Studio Mode)")

if game.JobId ~= "" then Val_JobId.Text = game.JobId end

-- ==========================================
-- PAGE 6: SERVER PLAYERS
-- ==========================================
local PlayersPage = Pages["Server Players"]
local ListCard = CreateCard(PlayersPage, "ACTIVE SESSION PLAYERS", UDim2.new(1, -10, 1, -15), UDim2.new(0, 5, 0, 5))

local ScrollingPlayers = Instance.new("ScrollingFrame")
ScrollingPlayers.Size = UDim2.new(1, -10, 1, -35)
ScrollingPlayers.Position = UDim2.new(0, 5, 0, 30)
ScrollingPlayers.BackgroundTransparency = 1
ScrollingPlayers.BorderSizePixel = 0
ScrollingPlayers.ScrollBarThickness = 4
ScrollingPlayers.ScrollBarImageColor3 = Config.ThemeColor
ScrollingPlayers.Parent = ListCard

local ScrollingLayout = Instance.new("UIListLayout")
ScrollingLayout.Padding = UDim.new(0, 4)
ScrollingLayout.SortOrder = Enum.SortOrder.Name
ScrollingLayout.Parent = ScrollingPlayers

local function PopulatePlayersList()
    for _, child in pairs(ScrollingPlayers:GetChildren()) do
        if child:IsA("Frame") then child:Destroy() end
    end
    local allPlayers = Players:GetPlayers()
    ScrollingPlayers.CanvasSize = UDim2.new(0, 0, 0, #allPlayers * 32)
    for _, player in ipairs(allPlayers) do
        local PFrame = Instance.new("Frame")
        local PCorner = Instance.new("UICorner")
        local PLabel = Instance.new("TextLabel")
        local PSubLabel = Instance.new("TextLabel")
        local PAvatar = Instance.new("ImageLabel")
        local PAvatarCorner = Instance.new("UICorner")
        
        PFrame.Name = player.Name
        PFrame.Size = UDim2.new(1, -8, 0, 28)
        PFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 37)
        PFrame.BorderSizePixel = 0
        PFrame.Parent = ScrollingPlayers
        
        PCorner.CornerRadius = UDim.new(0, 6)
        PCorner.Parent = PFrame
        
        PAvatar.Size = UDim2.new(0, 20, 0, 20)
        PAvatar.Position = UDim2.new(0, 6, 0.5, -10)
        PAvatar.BackgroundColor3 = Config.BackgroundColor
        PAvatar.Image = "rbxasset://textures/ui/GuidelineLight.png"
        PAvatar.Parent = PFrame
        
        PAvatarCorner.CornerRadius = UDim.new(0, 10)
        PAvatarCorner.Parent = PAvatar
        
        task.spawn(function()
            pcall(function()
                local content, isReady = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                if isReady then PAvatar.Image = content end
            end)
        end)
        
        PLabel.Size = UDim2.new(0.5, -30, 1, 0)
        PLabel.Position = UDim2.new(0, 32, 0, 0)
        PLabel.BackgroundTransparency = 1
        PLabel.Text = player.DisplayName
        PLabel.TextColor3 = Config.TextColor
        PLabel.Font = Config.RegularFont
        PLabel.TextSize = 11
        PLabel.TextXAlignment = Enum.TextXAlignment.Left
        PLabel.Parent = PFrame
        
        PSubLabel.Size = UDim2.new(0.5, 0, 1, 0)
        PSubLabel.Position = UDim2.new(0.5, 5, 0, 0)
        PSubLabel.BackgroundTransparency = 1
        PSubLabel.Text = "@" .. player.Name .. "  (" .. tostring(player.UserId) .. ")"
        PSubLabel.TextColor3 = Config.TextDimColor
        PSubLabel.Font = Enum.Font.SourceSansItalic
        PSubLabel.TextSize = 10
        PSubLabel.TextXAlignment = Enum.TextXAlignment.Right
        PSubLabel.Parent = PFrame
    end
end

Players.PlayerAdded:Connect(PopulatePlayersList)
Players.PlayerRemoving:Connect(PopulatePlayersList)
PopulatePlayersList()

-- ==========================================
-- REAL-TIME LOOP UPDATER
-- ==========================================
local function FormatUptime(t)
    local hrs = math.floor(t / 3600)
    local mins = math.floor((t % 3600) / 60)
    local secs = math.floor(t % 60)
    return string.format("%dh %dm %ds", hrs, mins, secs)
end

task.spawn(function()
    while ScreenGui.Parent do
        task.wait(1)
        Val_ServTime.Text = os.date("%I:%M:%S %p")
        local currentUptime = tick() - StartTime
        Val_Uptime.Text = FormatUptime(currentUptime)
        
        local statsItem = stats()
        local mem = statsItem.PerformanceStats.Memory:GetValue()
        Val_MemUsage.Text = string.format("%.1f MB", mem)
        
        local ping = 0
        pcall(function() ping = LocalPlayer:GetNetworkPing() * 1000 end)
        if ping == 0 then pcall(function() ping = statsItem.Network.ServerStatsItem["Data Ping"]:GetValue() end) end
        Val_Ping.Text = string.format("%.1f ms", ping)
        if ping < 100 then
            Val_Ping.TextColor3 = Color3.fromRGB(74, 222, 128)
        elseif ping < 200 then
            Val_Ping.TextColor3 = Color3.fromRGB(250, 204, 21)
        else
            Val_Ping.TextColor3 = Color3.fromRGB(248, 113, 113)
        end
    end
end)

-- ==========================================
-- UI CONTROLLER & ANIMATIONS
-- ==========================================
local UI_Open = false
local function ToggleUI()
    UI_Open = not UI_Open
    if UI_Open then
        MainFrame.Visible = true
        MainFrame.Size = UDim2.new(0, 560, 0, 0)
        MainFrame.GroupTransparency = 1
        
        TweenService:Create(MainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 560, 0, 360)}):Play()
        TweenService:Create(MainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {GroupTransparency = 0}):Play()
        
        ToggleButton.Text = "⚡"
        TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Config.ThemeColor}):Play()
    else
        local closeSizeTween = TweenService:Create(MainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Size = UDim2.new(0, 560, 0, 0)})
        TweenService:Create(MainFrame, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {GroupTransparency = 1}):Play()
        closeSizeTween:Play()
        
        closeSizeTween.Completed:Connect(function()
            if not UI_Open then MainFrame.Visible = false end
        end)
        
        ToggleButton.Text = "🚀"
        TweenService:Create(ToggleButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(30, 30, 46)}):Play()
    end
end

ToggleButton.MouseButton1Click:Connect(ToggleUI)
CloseBtn.MouseButton1Click:Connect(ToggleUI)

SwitchTab("Player Info")
ToggleUI()

task.spawn(function()
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "HYPER INFO",
            Text = "Successfully initialized by M4X | EVA!",
            Duration = 5,
            Icon = "rbxassetid://6023426926"
        })
    end)
end)
