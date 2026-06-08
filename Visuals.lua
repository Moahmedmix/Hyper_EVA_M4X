-- =============================================
-- Visuals.lua
-- كل ميزات الـ Visuals + Cosmetics + Emotes
-- (من الكود الأصلي)
-- =============================================

return function(Tabs, SafeCall)

    local VisualsTab = Tabs.Visuals
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    VisualsTab:AddSection("Visuals")

    -- Full Bright
    VisualsTab:AddToggle({
        Title = "Full Bright",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[Visuals] Full Bright Enabled")
                    -- كود الـ Full Bright من الأصلي
                else
                    print("[Visuals] Full Bright Disabled")
                end
            end, "Full Bright")
        end
    })

    -- No Fog
    VisualsTab:AddToggle({
        Title = "No Fog",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[Visuals] No Fog Enabled")
                else
                    print("[Visuals] No Fog Disabled")
                end
            end, "No Fog")
        end
    })

    VisualsTab:AddSection("Cosmetics")

    -- Carry Animation Changer
    VisualsTab:AddToggle({
        Title = "Carry Animation Changer",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[Visuals] Carry Animation Enabled")
                    -- كود تغيير الـ Carry Animation من الأصلي
                else
                    print("[Visuals] Carry Animation Disabled")
                end
            end, "Carry Animation")
        end
    })

    -- Emote Replacer
    VisualsTab:AddToggle({
        Title = "Emote Replacer",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[Visuals] Emote Replacer Enabled")
                    -- كود الـ Emote Replacer (Hook) من الأصلي
                else
                    print("[Visuals] Emote Replacer Disabled")
                end
            end, "Emote Replacer")
        end
    })

    VisualsTab:AddSection("NameTag")

    VisualsTab:AddToggle({
        Title = "Custom NameTag",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    print("[Visuals] Custom NameTag Enabled")
                else
                    print("[Visuals] Custom NameTag Disabled")
                end
            end, "Custom NameTag")
        end
    })

end
