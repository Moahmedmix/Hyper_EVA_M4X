-- =============================================
-- Event.lua
-- تبويب الـ Event + Battlepass Modifications
-- (نفس الكود الأصلي)
-- =============================================

return function(Tabs, SafeCall)

    local EventTab = Tabs.Event
    local RunService = game:GetService("RunService")

    EventTab:AddSection("Battlepass Modifications")

    -- Unlocked Time Pass
    local UnlockedPassToggle = EventTab:AddToggle("UnlockedPassToggle", {
        Title = "Unlocked Time Pass",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    if not featureStates.UnlockedPassLoop then
                        featureStates.UnlockedPassLoop = RunService.Heartbeat:Connect(function()
                            pcall(function()
                                local menu = game:GetService("Players").LocalPlayer.PlayerGui.Menu
                                if menu and menu.Views and menu.Views.Battlepass and menu.Views.Battlepass.ViewPass then
                                    local center = menu.Views.Battlepass.ViewPass.Center
                                    if center and center.ViewPass and center.ViewPass.Unlocked then
                                        center.ViewPass.Unlocked.Visible = false
                                    end
                                end
                            end)
                        end)
                    end
                else
                    if featureStates.UnlockedPassLoop then
                        featureStates.UnlockedPassLoop:Disconnect()
                        featureStates.UnlockedPassLoop = nil

                        pcall(function()
                            local menu = game:GetService("Players").LocalPlayer.PlayerGui.Menu
                            if menu and menu.Views and menu.Views.Battlepass and menu.Views.Battlepass.ViewPass then
                                local center = menu.Views.Battlepass.ViewPass.Center
                                if center and center.ViewPass and center.ViewPass.Unlocked then
                                    center.ViewPass.Unlocked.Visible = true
                                end
                            end
                        end)
                    end
                end
            end, "Unlocked Time Pass")
        end
    })

    -- Open Exchange
    local ExchangeOpenToggle = EventTab:AddToggle("ExchangeOpenToggle", {
        Title = "Open Exchange",
        Default = false,
        Callback = function(state)
            SafeCall(function()
                if state then
                    if not featureStates.ExchangeOpenLoop then
                        featureStates.ExchangeOpenLoop = RunService.Heartbeat:Connect(function()
                            pcall(function()
                                local menu = game:GetService("Players").LocalPlayer.PlayerGui.Menu
                                if menu and menu.Views and menu.Views.Battlepass then
                                    if menu.Views.Battlepass.Exchange then
                                        menu.Views.Battlepass.Exchange.Visible = true
                                    end
                                    if menu.Views.Battlepass.ViewPass then
                                        menu.Views.Battlepass.ViewPass.Visible = false
                                    end
                                end
                            end)
                        end)
                    end
                else
                    if featureStates.ExchangeOpenLoop then
                        featureStates.ExchangeOpenLoop:Disconnect()
                        featureStates.ExchangeOpenLoop = nil

                        pcall(function()
                            local menu = game:GetService("Players").LocalPlayer.PlayerGui.Menu
                            if menu and menu.Views and menu.Views.Battlepass then
                                if menu.Views.Battlepass.Exchange then
                                    menu.Views.Battlepass.Exchange.Visible = false
                                end
                                if menu.Views.Battlepass.ViewPass then
                                    menu.Views.Battlepass.ViewPass.Visible = true
                                end
                            end
                        end)
                    end
                end
            end, "Open Exchange")
        end
    })

    EventTab:AddSection("Info")

    EventTab:AddParagraph({
        Title = "Pass 1-9",
        Content = "Buy Items 5"
    })

    EventTab:AddParagraph({
        Title = "Pass 10-18",
        Content = "Buy Items 5"
    })

    EventTab:AddParagraph({
        Title = "Pass 19-25",
        Content = "Buy Items 5"
    })

end
