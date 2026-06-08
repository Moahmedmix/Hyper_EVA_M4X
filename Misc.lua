-- =============================================
-- Misc.lua
-- كل ميزات الـ Misc (من الكود الأصلي)
-- =============================================

return function(Tabs, SafeCall)

    local MiscTab = Tabs.Misc
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local UserInputService = game:GetService("UserInputService")

    MiscTab:AddSection("Movement")

    -- Speed
    MiscTab:AddSlider({
        Title = "Speed",
        Default = 16,
        Min = 16,
        Max = 200,
        Callback = function(value)
            SafeCall(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.WalkSpeed = value
                end
            end, "Speed")
        end
    })

    -- Jump Power
    MiscTab:AddSlider({
        Title = "Jump Power",
        Default = 50,
        Min = 50,
        Max = 300,
        Callback = function(value)
            SafeCall(function()
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                    LocalPlayer.Character.Humanoid.JumpPower = value
                end
            end, "Jump Power")
        end
    })

    MiscTab:AddSection("Advanced Movement")

    -- Infinite Slide
    MiscTab:AddToggle({
        Title = "Infinite Slide",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[Misc] Infinite Slide Enabled")
                    -- ضع كود الـ Infinite Slide هنا من الأصلي
                else
                    print("[Misc] Infinite Slide Disabled")
                end
            end, "Infinite Slide")
        end
    })

    -- Bunny Hop
    MiscTab:AddToggle({
        Title = "Bunny Hop",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[Misc] Bunny Hop Enabled")
                    -- كود الـ Bunny Hop من الأصلي
                else
                    print("[Misc] Bunny Hop Disabled")
                end
            end, "Bunny Hop")
        end
    })

    MiscTab:AddSection("Utilities")

    -- Gravity
    MiscTab:AddSlider({
        Title = "Gravity",
        Default = 196.2,
        Min = 0,
        Max = 500,
        Callback = function(value)
            SafeCall(function()
                workspace.Gravity = value
            end, "Gravity")
        end
    })

    -- Lag Switch (Demon Mode)
    MiscTab:AddToggle({
        Title = "Lag Switch (Demon Mode)",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[Misc] Lag Switch Enabled")
                    -- كود الـ Lag Switch من الأصلي
                else
                    print("[Misc] Lag Switch Disabled")
                end
            end, "Lag Switch")
        end
    })

    MiscTab:AddSection("Anti AFK")

    MiscTab:AddToggle({
        Title = "Anti AFK",
        Default = true,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[Misc] Anti AFK Enabled")
                    -- كود الـ Anti AFK من الأصلي
                else
                    print("[Misc] Anti AFK Disabled")
                end
            end, "Anti AFK")
        end
    })

end
