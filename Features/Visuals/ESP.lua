--[[
    ╔══════════════════════════════════════════════════╗
    ║     Highlight Downed Players - WindUI Edition     ║
    ║         By M4X | EVA | AMAL                      ║
    ╚══════════════════════════════════════════════════╝
--]]

local module = {}

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local playerHighlights = {}
local highlightConnection = nil
local isEnabled = false
local WindUI = nil
local Options = nil

function module:Init(windUI, options)
    WindUI = windUI
    Options = options or {}
    print("Highlight Downed Players module initialized")
end

local function isPlayerDowned(player)
    if not player or not player.Character then return false end
    
    local character = player.Character
    
    if character:GetAttribute("Downed") then return true end
    
    local ragdollsFolder = workspace:FindFirstChild("Game") and workspace.Game:FindFirstChild("Ragdolls")
    if ragdollsFolder and ragdollsFolder:FindFirstChild(player.Name) then return true end
    
    local humanoid = character:FindFirstChild("Humanoid")
    if humanoid and humanoid.Health <= 0 then return true end
    
    return false
end

local function updatePlayerHighlight(player)
    if not player or player == LocalPlayer then return end
    if not isEnabled then return end
    
    local character = player.Character
    if not character then return end
    
    local isDowned = isPlayerDowned(player)
    
    if playerHighlights[player] then
        local highlight = playerHighlights[player]
        if highlight and highlight.Parent then
            highlight.FillColor = isDowned and Color3.fromRGB(255, 255, 0) or Color3.fromRGB(255, 255, 255)
            highlight.OutlineColor = isDowned and Color3.fromRGB(255, 200, 0) or Color3.fromRGB(200, 200, 200)
            return
        else
            playerHighlights[player] = nil
        end
    end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "DraconicHighlight_" .. player.Name
    highlight.Parent = character
    highlight.FillTransparency = 0.3
    highlight.OutlineTransparency = 0
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillColor = isDowned and Color3.fromRGB(255, 255, 0) or Color3.fromRGB(255, 255, 255)
    highlight.OutlineColor = isDowned and Color3.fromRGB(255, 200, 0) or Color3.fromRGB(200, 200, 200)
    
    playerHighlights[player] = highlight
end

local function removePlayerHighlight(player)
    if playerHighlights[player] then
        local highlight = playerHighlights[player]
        if highlight and highlight.Parent then highlight:Destroy() end
        playerHighlights[player] = nil
    end
end

local function clearAllHighlights()
    for player, highlight in pairs(playerHighlights) do
        if highlight and highlight.Parent then highlight:Destroy() end
    end
    playerHighlights = {}
end

local function updateAllHighlights()
    if not isEnabled then return end
    
    local currentPlayers = {}
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            currentPlayers[player] = true
            updatePlayerHighlight(player)
        end
    end
    
    for player in pairs(playerHighlights) do
        if not currentPlayers[player] then removePlayerHighlight(player) end
    end
end

function module:Start()
    if isEnabled then return end
    isEnabled = true
    
    updateAllHighlights()
    
    if highlightConnection then highlightConnection:Disconnect() end
    
    highlightConnection = RunService.Heartbeat:Connect(function()
        if isEnabled then updateAllHighlights() end
    end)
    
    Players.PlayerAdded:Connect(function(newPlayer)
        if isEnabled then task.wait(0.5) updatePlayerHighlight(newPlayer) end
    end)
    
    Players.PlayerRemoving:Connect(function(leavingPlayer)
        if isEnabled then removePlayerHighlight(leavingPlayer) end
    end)
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            player.CharacterAdded:Connect(function()
                if isEnabled then task.wait(0.5) updatePlayerHighlight(player) end
            end)
        end
    end
    
    Players.PlayerAdded:Connect(function(newPlayer)
        if newPlayer ~= LocalPlayer then
            newPlayer.CharacterAdded:Connect(function()
                if isEnabled then task.wait(0.5) updatePlayerHighlight(newPlayer) end
            end)
        end
    end)
    
    if WindUI then
        WindUI:Notify({ Title = "Highlight Players", Description = "Enabled", Duration = 3 })
    end
    
    print("Highlight Players module started")
end

function module:Stop()
    if not isEnabled then return end
    isEnabled = false
    
    if highlightConnection then highlightConnection:Disconnect() highlightConnection = nil end
    
    clearAllHighlights()
    
    if WindUI then
        WindUI:Notify({ Title = "Highlight Players", Description = "Disabled", Duration = 3 })
    end
    
    print("Highlight Players module stopped")
end

function module:Toggle()
    if isEnabled then self:Stop() else self:Start() end
    return isEnabled
end

function module:IsEnabled()
    return isEnabled
end

function module:Refresh()
    if isEnabled then updateAllHighlights() end
end

-- =============================================
-- WindUI Integration
-- =============================================
function module:BuildUI(tab)
    local Sec = tab:Section({ Title = "Highlight Players", Icon = "eye", Opened = true })
    
    Sec:Toggle({ Title = "Enable", Value = false, Callback = function(v)
        if v then module:Start() else module:Stop() end
    end })
    
    Sec:Button({ Title = "Refresh Highlights", Callback = function()
        module:Refresh()
        if WindUI then WindUI:Notify({ Title = "Highlight", Description = "Refreshed!", Duration = 2 }) end
    end })
end

return module
