-- =============================================
-- Main.lua - Hyper v1.0.0 (Modular)
-- By M4X EVA AMAL JANA
-- =============================================

local CorrectKey = "M4X0101"

-- ==================== KEY SYSTEM GUI ====================
local KeyVerified = false

local function ShowKeySystem()
    local CoreGui = game:GetService("CoreGui")
    local keyGui = Instance.new("ScreenGui")
    keyGui.Name = "HyperKeySystem"
    keyGui.ResetOnSpawn = false
    keyGui.Parent = CoreGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 320, 0, 180)
    frame.Position = UDim2.new(0.5, -160, 0.5, -90)
    frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    frame.BorderSizePixel = 0
    frame.Parent = keyGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 45)
    title.BackgroundTransparency = 1
    title.Text = "Hyper Key System"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20
    title.Parent = frame

    local keyInput = Instance.new("TextBox")
    keyInput.Size = UDim2.new(0.85, 0, 0, 42)
    keyInput.Position = UDim2.new(0.075, 0, 0.32, 0)
    keyInput.PlaceholderText = "Enter your key..."
    keyInput.Text = ""
    keyInput.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    keyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    keyInput.Font = Enum.Font.Gotham
    keyInput.TextSize = 16
    keyInput.Parent = frame

    local inputCorner = Instance.new("UICorner")
    inputCorner.CornerRadius = UDim.new(0, 6)
    inputCorner.Parent = keyInput

    local submitButton = Instance.new("TextButton")
    submitButton.Size = UDim2.new(0.5, 0, 0, 38)
    submitButton.Position = UDim2.new(0.25, 0, 0.68, 0)
    submitButton.Text = "Verify Key"
    submitButton.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
    submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    submitButton.Font = Enum.Font.GothamBold
    submitButton.TextSize = 16
    submitButton.Parent = frame

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = submitButton

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, 0, 0, 25)
    statusLabel.Position = UDim2.new(0, 0, 0.92, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = ""
    statusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    statusLabel.Font = Enum.Font.Gotham
    statusLabel.TextSize = 13
    statusLabel.Parent = frame

    local function VerifyKey()
        if keyInput.Text == CorrectKey then
            KeyVerified = true
            keyGui:Destroy()
        else
            statusLabel.Text = "❌ Wrong Key! Try again."
            keyInput.Text = ""
            task.delay(2, function()
                if statusLabel and statusLabel.Parent then
                    statusLabel.Text = ""
                end
            end)
        end
    end

    submitButton.MouseButton1Click:Connect(VerifyKey)
    keyInput.FocusLost:Connect(function(enterPressed)
        if enterPressed then VerifyKey() end
    end)
end

ShowKeySystem()
repeat task.wait() until KeyVerified

-- ==================== LOAD WIND UI ====================
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- ==================== LOAD PROTECTION ====================
local Protection = loadstring(game:HttpGet("https://raw.githubusercontent.com/Moahmedmix/Hyper_M4X_EVADE/refs/heads/main/Protection.lua"))()

local function SafeCall(func, title)
    return Protection.SafeCall(func, title)
end

-- ==================== CREATE WINDOW ====================
local Window = WindUI:CreateWindow({
    Title = "Hyper v1.0.0",
    SubTitle = "By M4X EVA AMAL JANA",
    Size = UDim2.fromOffset(520, 400),
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl,
    Search = true
})

_G.Window = Window

-- ==================== CREATE TABS ====================
local Tabs = {
    Main     = Window:Tab({ Title = "Main",     Icon = "home" }),
    AutoFarm = Window:Tab({ Title = "Auto Farm", Icon = "clock" }),
    Event    = Window:Tab({ Title = "Event",    Icon = "calendar" }),
    Visuals  = Window:Tab({ Title = "Visuals",  Icon = "folder" }),
    Misc     = Window:Tab({ Title = "Misc",     Icon = "list" }),
}

-- ==================== LOAD MODULES FROM GITHUB ====================
SafeCall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Moahmedmix/Hyper_M4X_EVADE/refs/heads/main/Event.lua"))()(Tabs.Event, SafeCall)
end, "Load Event Module")

SafeCall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Moahmedmix/Hyper_M4X_EVADE/refs/heads/main/ESP.lua"))()(Tabs.Main, SafeCall)
end, "Load ESP Module")

SafeCall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Moahmedmix/Hyper_M4X_EVADE/refs/heads/main/AutoFarm.lua"))()(Tabs.AutoFarm, SafeCall)
end, "Load AutoFarm Module")

SafeCall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Moahmedmix/Hyper_M4X_EVADE/refs/heads/main/Visuals.lua"))()(Tabs.Visuals, SafeCall)
end, "Load Visuals Module")

SafeCall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Moahmedmix/Hyper_M4X_EVADE/refs/heads/main/Misc.lua"))()(Tabs.Misc, SafeCall)
end, "Load Misc Module")

print("✅ Hyper v1.0.0 Modular Loaded Successfully - By M4X EVA AMAL JANA")
