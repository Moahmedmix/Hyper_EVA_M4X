-- =============================================
-- ESP.lua
-- كل ميزات الـ ESP + Tracers + Highlight
-- (من الكود الأصلي)
-- =============================================

return function(Tabs, SafeCall)

    local MainTab = Tabs.Main
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    MainTab:AddSection("ESP System")

    -- ESP Players
    MainTab:AddToggle({
        Title = "ESP Players",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    -- هنا كان بيحمل External ESP
                    print("[ESP] Player ESP Enabled")
                    -- ضع كود الـ ExternalESP هنا لو عايزه
                else
                    print("[ESP] Player ESP Disabled")
                end
            end, "ESP Players")
        end
    })

    -- ESP Nextbots
    MainTab:AddToggle({
        Title = "ESP Nextbots",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[ESP] Nextbot ESP Enabled")
                    -- كود الـ Nextbot ESP
                else
                    print("[ESP] Nextbot ESP Disabled")
                end
            end, "ESP Nextbots")
        end
    })

    -- ESP Tickets
    MainTab:AddToggle({
        Title = "ESP Tickets",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[ESP] Ticket ESP Enabled")
                else
                    print("[ESP] Ticket ESP Disabled")
                end
            end, "ESP Tickets")
        end
    })

    MainTab:AddSection("Tracers")

    MainTab:AddToggle({
        Title = "Tracer Players",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[ESP] Player Tracers Enabled")
                else
                    print("[ESP] Player Tracers Disabled")
                end
            end, "Tracer Players")
        end
    })

    MainTab:AddToggle({
        Title = "Tracer Bots",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[ESP] Bot Tracers Enabled")
                else
                    print("[ESP] Bot Tracers Disabled")
                end
            end, "Tracer Bots")
        end
    })

    MainTab:AddSection("Highlight")

    MainTab:AddToggle({
        Title = "Highlight Players",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[ESP] Highlight Players Enabled")
                else
                    print("[ESP] Highlight Players Disabled")
                end
            end, "Highlight Players")
        end
    })

    MainTab:AddToggle({
        Title = "Highlight Bots",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[ESP] Highlight Bots Enabled")
                else
                    print("[ESP] Highlight Bots Disabled")
                end
            end, "Highlight Bots")
        end
    })

end
