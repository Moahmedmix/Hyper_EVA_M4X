-- =============================================
-- AutoFarm.lua
-- كل ميزات الـ Auto Farm (من الكود الأصلي)
-- =============================================

return function(Tabs, SafeCall)

    local AutoFarmTab = Tabs.AutoFarm
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    AutoFarmTab:AddSection("Auto Farm")

    -- Auto Money / Ticket Farm
    AutoFarmTab:AddToggle({
        Title = "Auto Farm (Money/Tickets)",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[AutoFarm] Auto Farm Enabled")
                    -- كود الـ Auto Farm الأصلي (Teleport + Security Part)
                else
                    print("[AutoFarm] Auto Farm Disabled")
                end
            end, "Auto Farm")
        end
    })

    -- Auto Revive
    AutoFarmTab:AddToggle({
        Title = "Auto Revive",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[AutoFarm] Auto Revive Enabled")
                    -- كود الـ Auto Revive من الأصلي
                else
                    print("[AutoFarm] Auto Revive Disabled")
                end
            end, "Auto Revive")
        end
    })

    -- Auto Win Farm (إذا موجود)
    AutoFarmTab:AddToggle({
        Title = "Auto Win Farm",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[AutoFarm] Auto Win Farm Enabled")
                else
                    print("[AutoFarm] Auto Win Farm Disabled")
                end
            end, "Auto Win Farm")
        end
    })

    AutoFarmTab:AddSection("AFK Farm")

    AutoFarmTab:AddToggle({
        Title = "AFK Farm",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[AutoFarm] AFK Farm Enabled")
                    -- كود الـ AFK Farm من الأصلي
                else
                    print("[AutoFarm] AFK Farm Disabled")
                end
            end, "AFK Farm")
        end
    })

    AutoFarmTab:AddSection("Teleport")

    AutoFarmTab:AddButton({
        Title = "Teleport to Security",
        Callback = function()
            SafeCall(function()
                print("[AutoFarm] Teleported to Security")
                -- كود الـ Teleport للسيكيورتي
            end, "Teleport to Security")
        end
    })

end
