-- =============================================
-- Main.lua - Hyper v1.0.0
-- By M4X EVA AMAL JANA
-- =============================================

local CorrectKey = "M4X0101"

-- ==================== KEY SYSTEM ====================
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
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
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
    submitButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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

-- ==================== WIND UI ====================
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

-- ==================== WINDOW ====================
local Window = WindUI:CreateWindow({
    Title = "Hyper v1.0.0",
    SubTitle = "By M4X EVA AMAL JANA",
    Size = UDim2.fromOffset(520, 400),
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl,
    Search = true
})

_G.Window = Window

-- ==================== TABS ====================
local Tabs = {
    Main     = Window:Tab({ Title = "Main",     Icon = "home" }),
    AutoFarm = Window:Tab({ Title = "Auto Farm", Icon = "clock" }),
    Event    = Window:Tab({ Title = "Event",    Icon = "calendar" }),
    Visuals  = Window:Tab({ Title = "Visuals",  Icon = "folder" }),
    Misc     = Window:Tab({ Title = "Misc",     Icon = "list" }),
}

-- ==================== CUSTOM BLACK FLOATING BUTTON (بدون لوجو) ====================
local function CreateBlackFloatingButton()
    local CoreGui = game:GetService("CoreGui")
    local RunService = game:GetService("RunService")

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "HyperFloatingButton"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = CoreGui

    local button = Instance.new("Frame")
    button.Size = UDim2.new(0, 55, 0, 55)
    button.Position = UDim2.new(0.88, 0, 0.45, 0)
    button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    button.BackgroundTransparency = 0.15
    button.BorderSizePixel = 0
    button.Active = true
    button.Draggable = true
    button.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1, 0)
    corner.Parent = button

    -- Spinning Ring 1
    local ring1 = Instance.new("Frame")
    ring1.Size = UDim2.new(1.15, 0, 1.15, 0)
    ring1.Position = UDim2.new(-0.075, 0, -0.075, 0)
    ring1.BackgroundTransparency = 1
    ring1.Parent = button

    local stroke1 = Instance.new("UIStroke")
    stroke1.Color = Color3.fromRGB(50, 50, 50)
    stroke1.Thickness = 2.5
    stroke1.Parent = ring1

    local ring1Corner = Instance.new("UICorner")
    ring1Corner.CornerRadius = UDim.new(1, 0)
    ring1Corner.Parent = ring1

    -- Spinning Ring 2
    local ring2 = Instance.new("Frame")
    ring2.Size = UDim2.new(0.9, 0, 0.9, 0)
    ring2.Position = UDim2.new(0.05, 0, 0.05, 0)
    ring2.BackgroundTransparency = 1
    ring2.Parent = button

    local stroke2 = Instance.new("UIStroke")
    stroke2.Color = Color3.fromRGB(70, 70, 70)
    stroke2.Thickness = 2
    stroke2.Parent = ring2

    local ring2Corner = Instance.new("UICorner")
    ring2Corner.CornerRadius = UDim.new(1, 0)
    ring2Corner.Parent = ring2

    -- Spinning Animation
    RunService.RenderStepped:Connect(function(delta)
        if button and button.Parent then
            ring1.Rotation = (ring1.Rotation + 110 * delta) % 360
            ring2.Rotation = (ring2.Rotation - 80 * delta) % 360
        end
    end)

    return screenGui
end

CreateBlackFloatingButton()

-- ==================== LOAD MODULES ====================
local function LoadModule(name)
    pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Moahmedmix/Hyper_M4X_EVADE/refs/heads/main/" .. name .. ".lua"))()(Tabs, SafeCall)
    end)
end

-- Load modules (هتضيف الباقي لما تخلصهم)
LoadModule("Event")
LoadModule("ESP")
LoadModule("AutoFarm")
LoadModule("Visuals")
LoadModule("Misc")

print("✅ Hyper v1.0.0 Loaded Successfully - By M4X EVA AMAL JANA")
