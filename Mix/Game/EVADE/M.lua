--[[ Protected by Lua Guard ]]

( function (...) local _lllIlIllIl = { Misc = Window:Tab({ Title = "\077\105\115\099", Icon = "\115\111\108\097\114\058\098\111\120\045\109\105\110\105\109\097\108\105\115\116\105\099\045\111\117\116\108\105\110\101", Locked = false }) } if not _lllIlIllIl.Misc then _lllIlIllIl.Misc = Window:Tab({ Title = "\077\105\115\099", Icon = "\115\111\108\097\114\058\098\111\120\045\109\105\110\105\109\097\108\105\115\116\105\099\045\111\117\116\108\105\110\101", Locked = false }) end
 if not MainTab then MainTab = _lllIlIllIl and _lllIlIllIl.Misc end
 local Players = game:GetService("\080\108\097\121\101\114\115") local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101") local _lllllIIIlI = game:GetService("\087\111\114\107\115\112\097\099\101") local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101") local _lllIIIllII = Players.LocalPlayer local _lIIIIIlIII = _lllIlIllIl.Misc:Section({ Title = "\080\108\097\121\101\114\032\109\111\100\105\102\105\099\097\116\105\111\110\115", Side = "\076\101\102\116", Collapsed = true, }) local _IllIIIIlIl = { Friction = true, AirStrafeAcceleration = true, JumpHeight = true, RunDeaccel = true, JumpSpeedMultiplier = true, JumpCap = true, SprintCap = true, WalkSpeedMultiplier = true, BhopEnabled = true, Speed = true, AirAcceleration = true, RunAccel = true, SprintAcceleration = true, } getgenv().ApplyMode = "\085\110\111\112\116\105\109\105\122\101\100" local _lllIIIIIll = false local _lIIlllIIIl = workspace.Game.Stats local _lIIIlIIIll = workspace.Game.Players local _llIIIIIlIl = false local _IIIIIlllII = { Speed = "\049\053\048\048", JumpCap = "\049", AirStrafeAcceleration = "\049\056\055" } local function _IIIllIIlll() local _llIlIIIIII = game.Players.LocalPlayer if not _llIlIIIIII then return false end
 for _, model in pairs(_lIIIlIIIll:GetChildren()) do if model.Name == _llIlIIIIII.Name then return true end
 end
 return false end
 local function _IlIIlllIll() if not _lIIlllIIIl then return false end
 local _lllIIIIIIl = _lIIlllIIIl:GetAttribute("\082\111\117\110\100\083\116\097\114\116\101\100") local _IlIIlIllIl = _lIIlllIIIl:GetAttribute("\084\105\109\101\114") return _lllIIIIIIl == false and _IlIIlIllIl == 0x3 end
 local function _IlIIIlIllI() local _IIIIIIlIIl = {} for _, obj in pairs(getgc(true)) do if typeof(obj) == "\116\097\098\108\101" then local _IIllllIIII = true for field in pairs(_IllIIIIlIl) do if rawget(obj, field) == nil then _IIllllIIII = false break end
 end
 if _IIllllIIII then table.insert(_IIIIIIlIIl, obj) end
 end
 end
 return _IIIIIIlIIl end
 local function _IIIIllIllI(callback) if not _IIIllIIlll() then return end
 local _IllIIIIIlI = _IlIIIlIllI() if #_IllIIIIIlI == 0x0 then return end
 if getgenv().ApplyMode == "\079\112\116\105\109\105\122\101\100" then task.spawn( function () for i, tableObj in ipairs(_IllIIIIIlI) do if tableObj and typeof(tableObj) == "\116\097\098\108\101" then pcall(callback, tableObj) end
 if i % 0x3 == 0x0 then task.wait() end
 end
 end
 ) else for i, tableObj in ipairs(_IllIIIIIlI) do if tableObj and typeof(tableObj) == "\116\097\098\108\101" then pcall(callback, tableObj) end
 end
 end
 end
 local function _IlllllllII() local _llIIllIIll = { {field = "\083\112\101\101\100", value = tonumber(_IIIIIlllII.Speed)}, {field = "\074\117\109\112\067\097\112", value = tonumber(_IIIIIlllII.JumpCap)}, {field = "\065\105\114\083\116\114\097\102\101\065\099\099\101\108\101\114\097\116\105\111\110", value = tonumber(_IIIIIlllII.AirStrafeAcceleration)} } for _, setting in ipairs(_llIIllIIll) do if setting.value and tostring(setting.value) ~= "\049\053\048\048" and tostring(setting.value) ~= "\049" and tostring(setting.value) ~= "\049\056\055" then _IIIIllIllI( function (obj) obj[setting.field] = setting.value end
 ) end
 end
 end
 local function _IllIllIIII() if not _IlIIlllIll() or _lllIIIIIll then return end
 _lllIIIIIll = true local _llIIllIIll = { {field = "\083\112\101\101\100", value = tonumber(_IIIIIlllII.Speed), delay = math.random(0x1, 0xE)}, {field = "\074\117\109\112\067\097\112", value = tonumber(_IIIIIlllII.JumpCap), delay = math.random(0x1, 0xE)}, {field = "\065\105\114\083\116\114\097\102\101\065\099\099\101\108\101\114\097\116\105\111\110", value = tonumber(_IIIIIlllII.AirStrafeAcceleration), delay = math.random(0x1, 0xE)} } for _, setting in ipairs(_llIIllIIll) do if setting.value and tostring(setting.value) ~= "\049\053\048\048" and tostring(setting.value) ~= "\049" and tostring(setting.value) ~= "\049\056\055" then task.spawn( function () task.wait(setting.delay) _IIIIllIllI( function (obj) obj[setting.field] = setting.value end
 ) end
 ) end
 end
 end
 local _IIlIIllIlI local _IIllIIllII local function _IlIlIllllI() if _IIlIIllIlI then _IIlIIllIlI:Disconnect() end
 if _IIllIIllII then _IIllIIllII:Disconnect() end
 if _lIIlllIIIl then _IIlIIllIlI = _lIIlllIIIl:GetAttributeChangedSignal("\082\111\117\110\100\083\116\097\114\116\101\100"):Connect( function () local _lllIIIIIIl = _lIIlllIIIl:GetAttribute("\082\111\117\110\100\083\116\097\114\116\101\100") if _lllIIIIIIl == true then _lllIIIIIll = false end
 end
 ) _IIllIIllII = _lIIlllIIIl:GetAttributeChangedSignal("\084\105\109\101\114"):Connect( function () if _IlIIlllIll() and not _lllIIIIIll then _IllIllIIII() end
 end
 ) end
 end
 _IlIlIllllI() task.spawn( function () while true do task.wait(0.5) local _IlIlIlllII = _IIIllIIlll() if _IlIlIlllII and not _llIIIIIlIl then _llIIIIIlIl = true _IlllllllII() elseif not _IlIlIlllII and _llIIIIIlIl then _llIIIIIlIl = false end
 end
 end
 ) local function _IllllIIlIl(config) return function (input) local _IIIlIIIlII = tonumber(input) if not _IIIlIIIlII then return end
 if config.min and _IIIlIIIlII < config.min then return end
 if config.max and _IIIlIIIlII > config.max then return end
 _IIIIIlllII[config.field] = input _IIIIllIllI( function (obj) obj[config.field] = _IIIlIIIlII end
 ) end
 end
 local _IIIllIlllI = _lIIIIIlIII:Input({ Title = "\083\112\101\101\100", Flag = "\083\112\101\101\100\073\110\112\117\116", Placeholder = "\049\053\048\048", Value = "\049\053\048\048", Callback = _IllllIIlIl({ field = "\083\112\101\101\100", min = 0x5AA, max = 0x5F5E100 }) }) local _lIllllIIIl = _lIIIIIlIII:Input({ Title = "\074\117\109\112\032\067\097\112", Flag = "\074\117\109\112\067\097\112\073\110\112\117\116", Placeholder = "\049", Value = "\049", Callback = _IllllIIlIl({ field = "\074\117\109\112\067\097\112", min = 0.1, max = 0x4C4B40 }) }) local _IlIllllIll = _lIIIIIlIII:Input({ Title = "\083\116\114\097\102\101\032\115\112\101\101\100", Flag = "\083\116\114\097\102\101\073\110\112\117\116", Placeholder = "\049\056\055", Value = "\049\056\055", Callback = _IllllIIlIl({ field = "\065\105\114\083\116\114\097\102\101\065\099\099\101\108\101\114\097\116\105\111\110", min = 0x1, max = 0x3B9ACA00 }) }) _lIIIIIlIII:Dropdown({ Title = "\083\101\108\101\099\116\032\065\112\112\108\121\032\077\101\116\104\111\100", Flag = "\065\112\112\108\121\077\101\116\104\111\100\068\114\111\112\100\111\119\110", Values = {"\085\110\111\112\116\105\109\105\122\101\100", "\079\112\116\105\109\105\122\101\100"}, Multi = false, Default = "\085\110\111\112\116\105\109\105\122\101\100", Callback = function (value) getgenv().ApplyMode = value end
 , }) local _llllIlIllI = _lllIlIllIl.Misc:Section({ Title = "\089\111\117\114\115\101\108\102", Side = "\076\101\102\116", Collapsed = true, }) local _IIIIlIlllI = ReplicatedStorage:WaitForChild("\069\118\101\110\116\115"):WaitForChild("\080\108\097\121\101\114") local _IlIIIlIIIl = _IIIIlIlllI:WaitForChild("\067\104\097\110\103\101\080\108\097\121\101\114\077\111\100\101") if _IlIIIlIIIl and _IlIIIlIIIl:IsA("\082\101\109\111\116\101\069\118\101\110\116") then _IlIIIlIIIl.OnClientEvent:Connect( function () task.wait(0.1) end
 ) end
 local Players = game:GetService("\080\108\097\121\101\114\115") local _llIlIIIIII = Players.LocalPlayer local _IllllIlIll = { AutoSelfRevive = false, SelfReviveMethod = "\083\112\097\119\110\112\111\105\110\116" } local _llIlIIIIlI = nil local _IIlIllllIl = nil local _IlllIlIllI = nil local _llIIIlllII = false local function _IlIIIIIlIl(_llllIIllII) if not _llllIIllII then return end
 local _IIIIIlIlll = _llllIIllII:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") local _lIIIIlIIlI = _llllIIllII:GetAttribute("\068\111\119\110\101\100") if not _lIIIIlIIlI then return end
 if _IllllIlIll.SelfReviveMethod == "\083\112\097\119\110\112\111\105\110\116" then if not _llIIIlllII then _llIIIlllII = true pcall( function () ReplicatedStorage.Events.Player.ChangePlayerMode:FireServer(true) end
 ) task.delay(0.5, function () _llIIIlllII = false end
 ) end
 elseif _IllllIlIll.SelfReviveMethod == "\082\101\118\105\118\101" then if _IIIIIlIlll then _llIlIIIIlI = _IIIIIlIlll.Position end
 pcall( function () ReplicatedStorage.Events.Player.ChangePlayerMode:FireServer(true) end
 ) task.spawn( function () local _IIllIIlIII local _IIlIllllll = tick() repeat _IIllIIlIII = _llIlIIIIII.Character task.wait(0.05) until _IIllIIlIII and _IIllIIlIII:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") or (tick() - _IIlIllllll > 1.5) local _IlllIIlIll = _IIllIIlIII and _IIllIIlIII:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if _llIlIIIIlI and _IlllIIlIll then _IlllIIlIll.CFrame = CFrame.new(_llIlIIIIlI) task.wait(0.1) end
 end
 ) end
 end
 local function _IIlllIllll(_llllIIllII) if _IIlIllllIl then _IIlIllllIl:Disconnect() _IIlIllllIl = nil end
 if not _llllIIllII then return end
 _IIlIllllIl = _llllIIllII:GetAttributeChangedSignal("\068\111\119\110\101\100"):Connect( function () if _llllIIllII:GetAttribute("\068\111\119\110\101\100") then _IlIIIIIlIl(_llllIIllII) end
 end
 ) end
 local function _lIIlIlIIIl() if _IIlIllllIl then _IIlIllllIl:Disconnect() _IIlIllllIl = nil end
 end
 if _IlllIlIllI then _IlllIlIllI:Disconnect() end
 _IlllIlIllI = _llIlIIIIII.CharacterAdded:Connect( function (_IIllIIlIII) task.wait(0.5) if _IllllIlIll.AutoSelfRevive then _IIlllIllll(_IIllIIlIII) end
 end
 ) _llllIlIllI:Dropdown({ Title = "\082\101\115\112\097\119\110\032\077\101\116\104\111\100", Flag = "\082\101\115\112\097\119\110\077\101\116\104\111\100\068\114\111\112\100\111\119\110", Values = {"\083\112\097\119\110\112\111\105\110\116", "\082\101\118\105\118\101"}, Default = "\083\112\097\119\110\112\111\105\110\116", Callback = function (value) _IllllIlIll.SelfReviveMethod = value end
 }) _llllIlIllI:Toggle({ Title = "\065\117\116\111\032\082\101\118\105\118\101", Flag = "\065\117\116\111\082\101\118\105\118\101\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) _IllllIlIll.AutoSelfRevive = _IIlIIllllI if _IIlIIllllI then if _llIlIIIIII.Character then _IIlllIllll(_llIlIIIIII.Character) end
 WindUI:Notify({ Title = "\065\117\116\111\032\082\101\118\105\118\101", Content = "\069\110\097\098\108\101\100", Duration = 0x2 }) else _lIIlIlIIIl() WindUI:Notify({ Title = "\065\117\116\111\032\082\101\118\105\118\101", Content = "\068\105\115\097\098\108\101\100", Duration = 0x2 }) end
 end
 }) _llllIlIllI:Button({ Title = "\082\101\115\112\097\119\110\032\078\111\119", Callback = function () _IlIIIIIlIl(_llIlIIIIII.Character) end
 }) if _llIlIIIIII.Character and _IllllIlIll.AutoSelfRevive then _IIlllIllll(_llIlIIIIII.Character) end
 local _lIIIlIlIlI = nil local function _llIlIIIlII() local _lIlIIlIIll = game:GetService("\067\111\114\101\071\117\105") local _IlllIIIlIl = _lIlIIlIIll:FindFirstChild("\082\101\118\105\118\101\070\108\111\097\116\105\110\103\066\117\116\116\111\110") if _IlllIIIlIl then _IlllIIIlIl:Destroy() end
 local _IIIIlIllll = Instance.new("\083\099\114\101\101\110\071\117\105") _IIIIlIllll.Name = "\082\101\118\105\118\101\070\108\111\097\116\105\110\103\066\117\116\116\111\110" _IIIIlIllll.ResetOnSpawn = false _IIIIlIllll.Parent = _lIlIIlIIll local _lIlIIlIlll = Instance.new("\084\101\120\116\066\117\116\116\111\110") _lIlIIlIlll.Size = UDim2.new(0x0, 0xA0, 0x0, 0x37) local _IlIIllIIIl = (workspace.CurrentCamera.ViewportSize.X / 0x2) - 0x50 local _IllIllllII = (workspace.CurrentCamera.ViewportSize.Y / 0x2) - 0x1B _lIlIIlIlll.Position = UDim2.new(0x0, _IlIIllIIIl, 0x0, _IllIllllII) _lIlIIlIlll.Text = "\082\069\086\073\086\069" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _lIlIIlIlll.TextColor3 = Color3.fromHex("\035\102\102\099\099\099\099") _lIlIIlIlll.Font = Enum.Font.GothamBold _lIlIIlIlll.TextSize = 0xE _lIlIIlIlll.AutoButtonColor = false _lIlIIlIlll.Parent = _IIIIlIllll local _IlIIIllIlI = Instance.new("\085\073\067\111\114\110\101\114") _IlIIIllIlI.CornerRadius = UDim.new(0.2, 0x0) _IlIIIllIlI.Parent = _lIlIIlIlll local _lIIlllllIl = Instance.new("\085\073\083\116\114\111\107\101") _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIIlllllIl.Thickness = 0x2 _lIIlllllIl.Parent = _lIlIIlIlll local _IlIlIllIll = false local _llIIlIIllI, _IIIllIIIIl _lIlIIlIlll.InputBegan:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = true _llIIlIIllI = input.Position _IIIllIIIIl = _lIlIIlIlll.Position _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _lIlIIlIlll.Text = "\068\082\065\071\046\046\046" end
 end
 ) _lIlIIlIlll.InputChanged:Connect( function (input) if _IlIlIllIll and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then local _lllIIlIllI = input.Position - _llIIlIIllI _lIlIIlIlll.Position = UDim2.new(0x0, _IIIllIIIIl.X.Offset + _lllIIlIllI.X, 0x0, _IIIllIIIIl.Y.Offset + _lllIIlIllI.Y) end
 end
 ) _lIlIIlIlll.InputEnded:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = false _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIlIIlIlll.Text = "\082\069\086\073\086\069" end
 end
 ) local function _IlllIllIll() if not _IlIlIllIll then _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\051\100\048\048\048\048") _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _lIlIIlIlll.Text = "\082\069\086\073\086\073\078\071\046\046\046" _IlIIIIIlIl(_llIlIIIIII.Character) task.wait(0.5) _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIlIIlIlll.Text = "\082\069\086\073\086\069" end
 end
 _lIlIIlIlll.MouseButton1Click:Connect(_IlllIllIll) _lIlIIlIlll.TouchTap:Connect(_IlllIllIll) return _IIIIlIllll end
 _llllIlIllI:Toggle({ Title = "\083\104\111\119\032\082\101\118\105\118\101\032\066\117\116\116\111\110", Value = false, Callback = function (_IIlIIllllI) if _IIlIIllllI then _lIIIlIlIlI = _llIlIIIlII() else if _lIIIlIlIlI then pcall( function () _lIIIlIlIlI:Destroy() end
 ) _lIIIlIlIlI = nil end
 end
 end
 }) local _IIIllIIIlI = _lllIlIllIl.Misc:Section({ Title = "\073\110\116\101\114\097\099\116\105\111\110\115", Side = "\076\101\102\116", Collapsed = true, }) local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101") local TweenService = game:GetService("\084\119\101\101\110\083\101\114\118\105\099\101") local UserInputService = game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101") local _lIlIIlllIl = Players.LocalPlayer local _lllIlllIlI = _lIlIIlllIl:WaitForChild("\080\108\097\121\101\114\071\117\105") local _lIlIlIlllI = ReplicatedStorage:WaitForChild("\069\118\101\110\116\115"):WaitForChild("\067\104\097\114\097\099\116\101\114"):WaitForChild("\073\110\116\101\114\097\099\116") getgenv().AutoCarryEnabled = false getgenv().AutoReviveEnabled = false getgenv().AutoCarryDelay = 0.000001 getgenv().AutoReviveDelay = 0x1 getgenv().AutoCarryPosition = UDim2.new(0.5, -0x6E, 0x0, 0x32) getgenv().AutoRevivePosition = UDim2.new(0.5, -0x6E, 0x0, 0x78) local _IIlIIIIlll = 0x0 local _IIlIIlIIlI = 0x0 local function _IlIlIIIIII() local _lIlIIlIIll = game:GetService("\067\111\114\101\071\117\105") local _IlllIIIlIl = _lIlIIlIIll:FindFirstChild("\067\097\114\114\121\070\108\111\097\116\105\110\103\066\117\116\116\111\110") if _IlllIIIlIl then _IlllIIIlIl:Destroy() end
 local _IIIIlIllll = Instance.new("\083\099\114\101\101\110\071\117\105") _IIIIlIllll.Name = "\067\097\114\114\121\070\108\111\097\116\105\110\103\066\117\116\116\111\110" _IIIIlIllll.ResetOnSpawn = false _IIIIlIllll.Parent = _lIlIIlIIll local _lIlIIlIlll = Instance.new("\084\101\120\116\066\117\116\116\111\110") _lIlIIlIlll.Size = UDim2.new(0x0, 0xA0, 0x0, 0x37) local _IlIIllIIIl = (workspace.CurrentCamera.ViewportSize.X / 0x2) - 0x50 local _IllIllllII = (workspace.CurrentCamera.ViewportSize.Y / 0x2) - 0x1B _lIlIIlIlll.Position = UDim2.new(0x0, _IlIIllIIIl, 0x0, _IllIllllII) _lIlIIlIlll.Text = "\067\065\082\082\089\058\032\079\070\070" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _lIlIIlIlll.TextColor3 = Color3.fromHex("\035\102\102\099\099\099\099") _lIlIIlIlll.Font = Enum.Font.GothamBold _lIlIIlIlll.TextSize = 0xE _lIlIIlIlll.AutoButtonColor = false _lIlIIlIlll.Parent = _IIIIlIllll local _IlIIIllIlI = Instance.new("\085\073\067\111\114\110\101\114") _IlIIIllIlI.CornerRadius = UDim.new(0.2, 0x0) _IlIIIllIlI.Parent = _lIlIIlIlll local _lIIlllllIl = Instance.new("\085\073\083\116\114\111\107\101") _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIIlllllIl.Thickness = 0x2 _lIIlllllIl.Parent = _lIlIIlIlll local _IlIlIllIll = false local _llIIlIIllI, _IIIllIIIIl _lIlIIlIlll.InputBegan:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = true _llIIlIIllI = input.Position _IIIllIIIIl = _lIlIIlIlll.Position _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _lIlIIlIlll.Text = "\068\082\065\071\046\046\046" end
 end
 ) _lIlIIlIlll.InputChanged:Connect( function (input) if _IlIlIllIll and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then local _lllIIlIllI = input.Position - _llIIlIIllI _lIlIIlIlll.Position = UDim2.new(0x0, _IIIllIIIIl.X.Offset + _lllIIlIllI.X, 0x0, _IIIllIIIIl.Y.Offset + _lllIIlIllI.Y) end
 end
 ) _lIlIIlIlll.InputEnded:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = false _lIIlllllIl.Color = getgenv().AutoCarryEnabled and Color3.fromHex("\035\102\102\052\052\052\052") or Color3.fromHex("\035\054\054\048\048\048\048") _lIlIIlIlll.Text = getgenv().AutoCarryEnabled and "\067\065\082\082\089\058\032\079\078" or "\067\065\082\082\089\058\032\079\070\070" end
 end
 ) local function _IlllIllIll() if not _IlIlIllIll then _lIlIIlIlll.Text = "\067\065\082\082\089\058\032\065\067\084\073\086\069" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\051\100\048\048\048\048") _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") getgenv().AutoCarryEnabled = not getgenv().AutoCarryEnabled _lIlIIlIlll.Text = getgenv().AutoCarryEnabled and "\067\065\082\082\089\058\032\079\078" or "\067\065\082\082\089\058\032\079\070\070" _lIlIIlIlll.BackgroundColor3 = getgenv().AutoCarryEnabled and Color3.fromHex("\035\051\100\048\048\048\048") or Color3.fromHex("\035\049\097\048\048\048\048") _lIIlllllIl.Color = getgenv().AutoCarryEnabled and Color3.fromHex("\035\102\102\052\052\052\052") or Color3.fromHex("\035\054\054\048\048\048\048") if CarryToggle then CarryToggle:SetValue(getgenv().AutoCarryEnabled) end
 end
 end
 _lIlIIlIlll.MouseButton1Click:Connect(_IlllIllIll) _lIlIIlIlll.TouchTap:Connect(_IlllIllIll) return _IIIIlIllll end
 local function _llIlIIIlII() local _lIlIIlIIll = game:GetService("\067\111\114\101\071\117\105") local _IlllIIIlIl = _lIlIIlIIll:FindFirstChild("\082\101\118\105\118\101\070\108\111\097\116\105\110\103\066\117\116\116\111\110") if _IlllIIIlIl then _IlllIIIlIl:Destroy() end
 local _IIIIlIllll = Instance.new("\083\099\114\101\101\110\071\117\105") _IIIIlIllll.Name = "\082\101\118\105\118\101\070\108\111\097\116\105\110\103\066\117\116\116\111\110" _IIIIlIllll.ResetOnSpawn = false _IIIIlIllll.Parent = _lIlIIlIIll local _lIlIIlIlll = Instance.new("\084\101\120\116\066\117\116\116\111\110") _lIlIIlIlll.Size = UDim2.new(0x0, 0xA0, 0x0, 0x37) local _IlIIllIIIl = (workspace.CurrentCamera.ViewportSize.X / 0x2) - 0x50 local _IllIllllII = (workspace.CurrentCamera.ViewportSize.Y / 0x2) - 0x1B _lIlIIlIlll.Position = UDim2.new(0x0, _IlIIllIIIl, 0x0, _IllIllllII) _lIlIIlIlll.Text = "\082\069\086\073\086\069\058\032\079\070\070" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _lIlIIlIlll.TextColor3 = Color3.fromHex("\035\102\102\099\099\099\099") _lIlIIlIlll.Font = Enum.Font.GothamBold _lIlIIlIlll.TextSize = 0xE _lIlIIlIlll.AutoButtonColor = false _lIlIIlIlll.Parent = _IIIIlIllll local _IlIIIllIlI = Instance.new("\085\073\067\111\114\110\101\114") _IlIIIllIlI.CornerRadius = UDim.new(0.2, 0x0) _IlIIIllIlI.Parent = _lIlIIlIlll local _lIIlllllIl = Instance.new("\085\073\083\116\114\111\107\101") _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIIlllllIl.Thickness = 0x2 _lIIlllllIl.Parent = _lIlIIlIlll local _IlIlIllIll = false local _llIIlIIllI, _IIIllIIIIl _lIlIIlIlll.InputBegan:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = true _llIIlIIllI = input.Position _IIIllIIIIl = _lIlIIlIlll.Position _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _lIlIIlIlll.Text = "\068\082\065\071\046\046\046" end
 end
 ) _lIlIIlIlll.InputChanged:Connect( function (input) if _IlIlIllIll and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then local _lllIIlIllI = input.Position - _llIIlIIllI _lIlIIlIlll.Position = UDim2.new(0x0, _IIIllIIIIl.X.Offset + _lllIIlIllI.X, 0x0, _IIIllIIIIl.Y.Offset + _lllIIlIllI.Y) end
 end
 ) _lIlIIlIlll.InputEnded:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = false _lIIlllllIl.Color = getgenv().AutoReviveEnabled and Color3.fromHex("\035\102\102\052\052\052\052") or Color3.fromHex("\035\054\054\048\048\048\048") _lIlIIlIlll.Text = getgenv().AutoReviveEnabled and "\082\069\086\073\086\069\058\032\079\078" or "\082\069\086\073\086\069\058\032\079\070\070" end
 end
 ) local function _IlllIllIll() if not _IlIlIllIll then _lIlIIlIlll.Text = "\082\069\086\073\086\069\058\032\065\067\084\073\086\069" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\051\100\048\048\048\048") _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") getgenv().AutoReviveEnabled = not getgenv().AutoReviveEnabled _lIlIIlIlll.Text = getgenv().AutoReviveEnabled and "\082\069\086\073\086\069\058\032\079\078" or "\082\069\086\073\086\069\058\032\079\070\070" _lIlIIlIlll.BackgroundColor3 = getgenv().AutoReviveEnabled and Color3.fromHex("\035\051\100\048\048\048\048") or Color3.fromHex("\035\049\097\048\048\048\048") _lIIlllllIl.Color = getgenv().AutoReviveEnabled and Color3.fromHex("\035\102\102\052\052\052\052") or Color3.fromHex("\035\054\054\048\048\048\048") if ReviveToggle then ReviveToggle:SetValue(getgenv().AutoReviveEnabled) end
 end
 end
 _lIlIIlIlll.MouseButton1Click:Connect(_IlllIllIll) _lIlIIlIlll.TouchTap:Connect(_IlllIllIll) return _IIIIlIllll end
 local _lIIIlIlIIl = nil local _lIIIlIlIlI = nil _IIIllIIIlI:Toggle({ Title = "\083\104\111\119\032\067\097\114\114\121\032\066\117\116\116\111\110", Flag = "\067\097\114\114\121\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) if _IIlIIllllI then _lIIIlIlIIl = _IlIlIIIIII() else if _lIIIlIlIIl then pcall( function () _lIIIlIlIIl:Destroy() end
 ) _lIIIlIlIIl = nil end
 getgenv().AutoCarryEnabled = false end
 end
 }) _IIIllIIIlI:Input({ Title = "\067\097\114\114\121\032\068\101\108\097\121\032\040\115\041", Flag = "\067\097\114\114\121\068\101\108\097\121\073\110\112\117\116", Placeholder = "\048\046\048\048\048\049", Value = tostring(getgenv().AutoCarryDelay), Callback = function (_IIIlIIIlII) local _IlllIIllII = tonumber(_IIIlIIIlII) if _IlllIIllII and _IlllIIllII > 0x0 then getgenv().AutoCarryDelay = _IlllIIllII end
 end
 }) _IIIllIIIlI:Toggle({ Title = "\083\104\111\119\032\082\101\118\105\118\101\032\066\117\116\116\111\110", Flag = "\082\101\118\105\118\101\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) if _IIlIIllllI then _lIIIlIlIlI = _llIlIIIlII() else if _lIIIlIlIlI then pcall( function () _lIIIlIlIlI:Destroy() end
 ) _lIIIlIlIlI = nil end
 getgenv().AutoReviveEnabled = false end
 end
 }) _IIIllIIIlI:Input({ Title = "\082\101\118\105\118\101\032\068\101\108\097\121\032\040\115\041", Flag = "\082\101\118\105\118\101\068\101\108\097\121\073\110\112\117\116", Placeholder = "\048\046\049", Value = tostring(getgenv().AutoReviveDelay), Callback = function (_IIIlIIIlII) local _IlllIIllII = tonumber(_IIIlIIIlII) if _IlllIIllII and _IlllIIllII > 0x0 then getgenv().AutoReviveDelay = _IlllIIllII end
 end
 }) RunService.RenderStepped:Connect( function () if getgenv().AutoCarryEnabled then local _lllIllllII = _lIlIIlllIl.Character and _lIlIIlllIl.Character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if _lllIllllII then for _, _llIlIIIIII in ipairs(Players:GetPlayers()) do if _llIlIIIIII ~= _lIlIIlllIl and _llIlIIIIII.Character and _llIlIIIIII.Character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") and _llIlIIIIII.Character:FindFirstChild("\072\117\109\097\110\111\105\100") then local _IIIIlIIIlI = _llIlIIIIII.Character.HumanoidRootPart local _IIIlIlllIl = _llIlIIIIII.Character.Humanoid if (_lllIllllII.Position - _IIIIlIIIlI.Position).Magnitude <= 0xA and _IIIlIlllIl.Health <= 0x0 then if tick() - (getgenv().AutoCarryLast or 0x0) >= getgenv().AutoCarryDelay then _lIlIlIlllI:FireServer("\067\097\114\114\121", nil, _llIlIIIIII.Name) getgenv().AutoCarryLast = tick() end
 end
 end
 end
 end
 end
 if getgenv().AutoReviveEnabled then local _lllIllllII = _lIlIIlllIl.Character and _lIlIIlllIl.Character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if _lllIllllII then for _, _llIlIIIIII in ipairs(Players:GetPlayers()) do if _llIlIIIIII ~= _lIlIIlllIl and _llIlIIIIII.Character and _llIlIIIIII.Character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") and _llIlIIIIII.Character:FindFirstChild("\072\117\109\097\110\111\105\100") then local _IIIIlIIIlI = _llIlIIIIII.Character.HumanoidRootPart local _IIIlIlllIl = _llIlIIIIII.Character.Humanoid if (_lllIllllII.Position - _IIIIlIIIlI.Position).Magnitude <= 0xA and _IIIlIlllIl.Health <= 0x0 then if tick() - (getgenv().AutoReviveLast or 0x0) >= getgenv().AutoReviveDelay then _lIlIlIlllI:FireServer("\082\101\118\105\118\101", true, _llIlIIIIII.Name) getgenv().AutoReviveLast = tick() end
 end
 end
 end
 end
 end
 end
 ) local function _IllIIIIIII() local _IllIlIlIlI, err = pcall( function () print("\091\073\110\102\105\110\105\116\101\032\083\108\105\100\101\093\032\076\111\097\100\105\110\103\032\109\111\100\117\108\101\046\046\046") local _llIlIllIIl = nil if _lllIlIllIl and _lllIlIllIl.Misc then _llIlIllIIl = _lllIlIllIl.Misc elseif Window and Window.Tabs then for _, tab in pairs(Window.Tabs) do if tab and (tab.Title == "\077\105\115\099" or tab.Title == "\077\105\115\099\101\108\108\097\110\101\111\117\115") then _llIlIllIIl = tab break end
 end
 end
 if not _llIlIllIIl then print("\091\073\110\102\105\110\105\116\101\032\083\108\105\100\101\093\032\069\114\114\111\114\058\032\077\105\115\099\032\116\097\098\032\110\111\116\032\102\111\117\110\100\044\032\115\107\105\112\112\105\110\103\046\046\046") return end
 local _lIllIllllI = _llIlIllIIl:Section({ Title = "\073\110\102\105\110\105\116\101\032\083\108\105\100\101", Side = "\076\101\102\116", Collapsed = true, }) if not _lIllIllllI then print("\091\073\110\102\105\110\105\116\101\032\083\108\105\100\101\093\032\069\114\114\111\114\058\032\070\097\105\108\101\100\032\116\111\032\099\114\101\097\116\101\032\115\101\099\116\105\111\110\044\032\115\107\105\112\112\105\110\103\046\046\046") return end
 local _IllIIlIIIl = false local _llIIlIlllI = -0x8 local _IllllIlIll = {} local _lIIIIllllI = nil local _IIIIIllllI = nil local _llIIlIIIll = nil local _llIlIIlIll = false local _IlIIIllIII = { "\070\114\105\099\116\105\111\110", "\065\105\114\083\116\114\097\102\101\065\099\099\101\108\101\114\097\116\105\111\110", "\074\117\109\112\072\101\105\103\104\116", "\082\117\110\068\101\097\099\099\101\108", "\074\117\109\112\083\112\101\101\100\077\117\108\116\105\112\108\105\101\114", "\074\117\109\112\067\097\112", "\083\112\114\105\110\116\067\097\112", "\087\097\108\107\083\112\101\101\100\077\117\108\116\105\112\108\105\101\114", "\066\104\111\112\069\110\097\098\108\101\100", "\083\112\101\101\100", "\065\105\114\065\099\099\101\108\101\114\097\116\105\111\110", "\082\117\110\065\099\099\101\108", "\083\112\114\105\110\116\065\099\099\101\108\101\114\097\116\105\111\110" } local function _IIIllIlllI(tbl) if type(tbl) ~= "\116\097\098\108\101" then return false end
 for _, key in ipairs(_IlIIIllIII) do if rawget(tbl, key) == nil then return false end
 end
 return true end
 local function _lllllIIlII() _IllllIlIll = {} for _, obj in pairs(getgc(true)) do if _IIIllIlllI(obj) then table.insert(_IllllIlIll, obj) end
 end
 return #_IllllIlIll > 0x0 end
 local function _IlllIIlllI(value) pcall( function () if #_IllllIlIll > 0x0 and _llIIlIIIll == value then return end
 local _lIIIlIlIIl = 0x0 for _, tbl in ipairs(_IllllIlIll) do pcall( function () tbl.Friction = value _lIIIlIlIIl = _lIIIlIlIIl + 0x1 end
 ) end
 if _lIIIlIlIIl == 0x0 then _llIIlIIIll = nil if _llIlIIlIll then return end
 _llIlIIlIll = true task.defer( function () _llIlIIlIll = false _lllllIIlII() _llIIlIIIll = nil if _IllIIlIIIl then _IlllIIlllI(value) end
 end
 ) return end
 _llIIlIIIll = value end
 ) end
 local function _lIIllIIlIl() local _lIllIlIIll = workspace:FindFirstChild("\071\097\109\101") if not _lIllIlIIll then return nil end
 local _lllIIIlllI = _lIllIlIIll:FindFirstChild("\080\108\097\121\101\114\115") if not _lllIIIlllI then return nil end
 return _lllIIIlllI:FindFirstChild(_lllIIIllII.Name) end
 local function _IlIlllIIII() if not _IllIIlIIIl then return end
 local _IIllIIIIlI = _lIIllIIlIl() if not _IIllIIIIlI then return end
 local _IIlIIllllI = _IIllIIIIlI:GetAttribute("\083\116\097\116\101") if _IIlIIllllI == "\083\108\105\100\101" then pcall( function () _IIllIIIIlI:SetAttribute("\083\116\097\116\101", "\069\109\111\116\105\110\103\083\108\105\100\101") end
 ) elseif _IIlIIllllI == "\069\109\111\116\105\110\103\083\108\105\100\101" then _IlllIIlllI(_llIIlIlllI) else _IlllIIlllI(0x5) end
 end
 local function _llIlllllII() if not _IllIIlIIIl then return end
 for i = 0x1, 0x5 do task.wait(0.5) if _lIIllIIlIl() then break end
 end
 task.wait(0.5) _IllllIlIll = {} _llIIlIIIll = nil _llIlIIlIll = false task.defer( function () if not _IllIIlIIIl then return end
 _lllllIIlII() _llIIlIIIll = nil end
 ) end
 local function _llllIIllII(enabled) pcall( function () _IllIIlIIIl = enabled if enabled then _IllllIlIll = {} _llIIlIIIll = nil _llIlIIlIll = false task.defer( function () if not _IllIIlIIIl then return end
 _lllllIIlII() _llIIlIIIll = nil end
 ) _lIIllIIlIl() if not _IIIIIllllI then _IIIIIllllI = _lllIIIllII.CharacterAdded:Connect(_llIlllllII) end
 if _lllIIIllII.Character then task.spawn(_llIlllllII) end
 if _lIIIIllllI then _lIIIIllllI:Disconnect() end
 _lIIIIllllI = RunService.Heartbeat:Connect(_IlIlllIIII) if WindUI and WindUI.Notify then WindUI:Notify({ Title = "\073\110\102\105\110\105\116\101\032\083\108\105\100\101", Content = "\069\110\097\098\108\101\100\032\124\032\070\114\105\099\116\105\111\110\058\032" .. _llIIlIlllI, Duration = 0x2 }) end
 else if _lIIIIllllI then _lIIIIllllI:Disconnect() _lIIIIllllI = nil end
 if _IIIIIllllI then _IIIIIllllI:Disconnect() _IIIIIllllI = nil end
 local _llIllIIIll = _IllllIlIll _IllllIlIll = {} _llIIlIIIll = nil _llIlIIlIll = false task.defer( function () for _, tbl in ipairs(_llIllIIIll) do pcall( function () tbl.Friction = 0x5 end
 ) end
 end
 ) if WindUI and WindUI.Notify then WindUI:Notify({ Title = "\073\110\102\105\110\105\116\101\032\083\108\105\100\101", Content = "\068\105\115\097\098\108\101\100", Duration = 0x2 }) end
 end
 end
 ) end
 local function _lIlIlIlIlI(newValue) _llIIlIlllI = newValue if _IllIIlIIIl then _IlllIIlllI(_llIIlIlllI) end
 end
 pcall( function () _lllIIIllII.CharacterAdded:Connect( function () task.wait(0x1) if _IllIIlIIIl then _IllllIlIll = {} _llIIlIIIll = nil _llIlIIlIll = false task.defer( function () _lllllIIlII() _llIIlIIIll = nil end
 ) end
 end
 ) end
 ) local _IllIllIIll = false _lIllIllllI:Toggle({ Title = "\073\110\102\105\110\105\116\101\032\083\108\105\100\101", Flag = "\073\110\102\105\110\105\116\101\083\108\105\100\101\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) pcall( function () _IllIllIIll = _IIlIIllllI _llllIIllII(_IIlIIllllI) end
 ) end
 }) print("\091\073\110\102\105\110\105\116\101\032\083\108\105\100\101\093\032\077\111\100\117\108\101\032\108\111\097\100\101\100\032\115\117\099\099\101\115\115\102\117\108\108\121\032\105\110\032\077\105\115\099\032\116\097\098") end
 ) if not _IllIlIlIlI then print("\091\073\110\102\105\110\105\116\101\032\083\108\105\100\101\093\032\069\114\114\111\114\058\032" .. tostring(err)) print("\091\073\110\102\105\110\105\116\101\032\083\108\105\100\101\093\032\083\107\105\112\112\105\110\103\032\109\111\100\117\108\101\046\046\046") end
 end
 _IllIIIIIII() local Players = game:GetService("\080\108\097\121\101\114\115") local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101") local UserInputService = game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101") local Debris = game:GetService("\068\101\098\114\105\115") local _lllIIIllII = Players.LocalPlayer local _lllIIIllll = workspace.CurrentCamera getgenv().AutoTrimpEnabled = false getgenv().BackTrimpEnabled = false getgenv().AutoTrimpBaseSpeed = 0x3C getgenv().AutoTrimpStartSpeed = 33.5 getgenv().AutoTrimpIncrementRate = 1.5 getgenv().AutoTrimpMode = "\067\111\110\115\116\097\110\116" local _llIlIlIIII = getgenv().AutoTrimpBaseSpeed local _IIlllIllll = tick() local _IlIIIllIlI = nil local _lIIIlllIIl = nil local function _IIllllIlll(_IIIlIIIlII) return math.floor(_IIIlIIIlII * 0xA) / 0xA end
 local function _IIllIlIlII() local _IIllllIIII, spd = pcall( function () return _lllIIIllII.PlayerGui.Shared.HUD.Overlay.Default.CharacterInfo.Item.Speedometer.Players end
 ) if _IIllllIIII then return spd end
 return nil end
 local function _IlIIIllIlI() if not _lIIIlllIIl then _lIIIlllIIl = _IIllIlIlII() if not _lIIIlllIIl then return end
 end
 _lIIIlllIIl.Text = tostring(_IIllllIlll(_llIlIlIIII)) end
 local function _IllIIIIIll() if getgenv().AutoTrimpMode == "\067\111\110\115\116\097\110\116" then _llIlIlIIII = getgenv().AutoTrimpBaseSpeed else _llIlIlIIII = getgenv().AutoTrimpStartSpeed end
 if _lIIIlllIIl then _IlIIIllIlI() end
 end
 RunService.RenderStepped:Connect( function () if not getgenv().AutoTrimpEnabled and not getgenv().BackTrimpEnabled then if _IlIIIllIlI then _IlIIIllIlI:Destroy() end
 _IlIIIllIlI = nil return end
 local _llllIIllII = _lllIIIllII.Character if not _llllIIllII then return end
 local _lIllllIIlI = _llllIIllII:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") local _IIlIIIIllI = _llllIIllII:FindFirstChild("\072\117\109\097\110\111\105\100") if not _lIllllIIlI or not _IIlIIIIllI then return end
 _lIIIlllIIl = _IIllIlIlII() local _lIIIllIlll = tick() - _IIlllIllll _IIlllIllll = tick() if getgenv().AutoTrimpMode == "\067\111\110\115\116\097\110\116" then _llIlIlIIII = getgenv().AutoTrimpBaseSpeed end
 if getgenv().AutoTrimpMode == "\073\110\099\114\101\109\101\110\116\097\108" then local _lIIIIIlIlI = getgenv().AutoTrimpIncrementRate * _lIIIllIlll _llIlIlIIII = _llIlIlIIII + _lIIIIIlIlI end
 if _IlIIIllIlI then _IlIIIllIlI:Destroy() end
 local _IlllIIIIll = _lllIIIllll.CFrame.LookVector _IlllIIIIll = Vector3.new(_IlllIIIIll.X, 0x0, _IlllIIIIll.Z) if _IlllIIIIll.Magnitude ~= 0x0 then _IlllIIIIll = _IlllIIIIll.Unit end
 if getgenv().BackTrimpEnabled then _IlllIIIIll = -_IlllIIIIll end
 local _llIIlIIIlI = Instance.new("\066\111\100\121\086\101\108\111\099\105\116\121") _llIIlIIIlI.Velocity = _IlllIIIIll * _llIlIlIIII _llIIlIIIlI.MaxForce = Vector3.new(4e5, 0x0, 4e5) _llIIlIIIlI.P = 0x4E2 _llIIlIIIlI.Parent = _lIllllIIlI Debris:AddItem(_llIIlIIIlI, 0.1) _IlIIIllIlI = _llIIlIIIlI if _lIIIlllIIl then _IlIIIllIlI() end
 end
 ) local _IllIIIIlll = nil local _lIIIllIIll = nil local function _lIIIIlIllI() if _IllIIIIlll then _IllIIIIlll:Destroy() _IllIIIIlll = nil end
 local _IIIIlIllll = Instance.new("\083\099\114\101\101\110\071\117\105") _IIIIlIllll.Name = "\065\117\116\111\084\114\105\109\112\070\108\111\097\116\105\110\103" _IIIIlIllll.ResetOnSpawn = false _IIIIlIllll.Parent = game:GetService("\067\111\114\101\071\117\105") local _llIlIlllII = Instance.new("\070\114\097\109\101") _llIlIlllII.Size = UDim2.new(0x0, 0xAA, 0x0, 0x2C) _llIlIlllII.Position = UDim2.new(0.5, -0x55, 0x0, 0x32) _llIlIlllII.AnchorPoint = Vector2.new(0.5, 0x0) _llIlIlllII.BackgroundTransparency = 0x1 _llIlIlllII.Parent = _IIIIlIllll local _IIlIllIIII = Instance.new("\084\101\120\116\066\117\116\116\111\110") _IIlIllIIII.Size = UDim2.new(0x1, 0x0, 0x1, 0x0) _IIlIllIIII.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _IIlIllIIII.BackgroundTransparency = 0.15 _IIlIllIIII.Text = "\084\082\073\077\080\058\032\079\070\070" _IIlIllIIII.Font = Enum.Font.GothamBold _IIlIllIIII.TextSize = 0x10 _IIlIllIIII.TextColor3 = Color3.fromHex("\035\102\102\099\099\099\099") _IIlIllIIII.AutoButtonColor = false _IIlIllIIII.Parent = _llIlIlllII local _IlIIIllIlI = Instance.new("\085\073\067\111\114\110\101\114") _IlIIIllIlI.CornerRadius = UDim.new(0.2, 0x0) _IlIIIllIlI.Parent = _IIlIllIIII local _lIIlllllIl = Instance.new("\085\073\083\116\114\111\107\101") _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIIlllllIl.Thickness = 0x2 _lIIlllllIl.Parent = _IIlIllIIII _IIlIllIIII.MouseButton1Click:Connect( function () getgenv().AutoTrimpEnabled = not getgenv().AutoTrimpEnabled _IIlIllIIII.Text = "\084\114\105\109\112\058\032" .. (getgenv().AutoTrimpEnabled and "\079\078" or "\079\070\070") _IIlIllIIII.BackgroundColor3 = getgenv().AutoTrimpEnabled and Color3.fromHex("\035\051\100\048\048\048\048") or Color3.fromHex("\035\049\097\048\048\048\048") _lIIlllllIl.Color = getgenv().AutoTrimpEnabled and Color3.fromHex("\035\102\102\052\052\052\052") or Color3.fromHex("\035\054\054\048\048\048\048") if not getgenv().AutoTrimpEnabled then if _IlIIIllIlI then _IlIIIllIlI:Destroy() end
 _IlIIIllIlI = nil _IllIIIIIll() end
 end
 ) local _IlIlIllIll, dragInput, _llIIlIIllI, _IIIllIIIIl = false, nil, Vector2.new(), _llIlIlllII.Position local function _IIllIlIIll(input) local _lllIIlIllI = input.Position - _llIIlIIllI _llIlIlllII.Position = UDim2.new(_IIIllIIIIl.X.Scale, _IIIllIIIIl.X.Offset + _lllIIlIllI.X, _IIIllIIIIl.Y.Scale, _IIIllIIIIl.Y.Offset + _lllIIlIllI.Y) end
 _IIlIllIIII.InputBegan:Connect( function (input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then _IlIlIllIll = true dragInput = input _llIIlIIllI = input.Position _IIIllIIIIl = _llIlIlllII.Position _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _IIlIllIIII.Text = "\068\082\065\071\046\046\046" input.Changed:Connect( function () if input.UserInputState == Enum.UserInputState.End then _IlIlIllIll = false _lIIlllllIl.Color = getgenv().AutoTrimpEnabled and Color3.fromHex("\035\102\102\052\052\052\052") or Color3.fromHex("\035\054\054\048\048\048\048") _IIlIllIIII.Text = "\084\114\105\109\112\058\032" .. (getgenv().AutoTrimpEnabled and "\079\078" or "\079\070\070") end
 end
 ) end
 end
 ) _IIlIllIIII.InputChanged:Connect( function (input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
 end
 ) UserInputService.InputChanged:Connect( function (input) if _IlIlIllIll and input == dragInput then _IIllIlIIll(input) end
 end
 ) _IIIIlIllll.Enabled = false _IllIIIIlll = _IIIIlIllll return _IIIIlIllll end
 local function _IIlIIIIlII() if _lIIIllIIll then _lIIIllIIll:Destroy() _lIIIllIIll = nil end
 local _IIIIlIllll = Instance.new("\083\099\114\101\101\110\071\117\105") _IIIIlIllll.Name = "\066\097\099\107\084\114\105\109\112\070\108\111\097\116\105\110\103" _IIIIlIllll.ResetOnSpawn = false _IIIIlIllll.Parent = game:GetService("\067\111\114\101\071\117\105") local _llIlIlllII = Instance.new("\070\114\097\109\101") _llIlIlllII.Size = UDim2.new(0x0, 0xAA, 0x0, 0x2C) _llIlIlllII.Position = UDim2.new(0.5, -0x55, 0x0, 0x64) _llIlIlllII.AnchorPoint = Vector2.new(0.5, 0x0) _llIlIlllII.BackgroundTransparency = 0x1 _llIlIlllII.Parent = _IIIIlIllll local _IIlIllIIII = Instance.new("\084\101\120\116\066\117\116\116\111\110") _IIlIllIIII.Size = UDim2.new(0x1, 0x0, 0x1, 0x0) _IIlIllIIII.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _IIlIllIIII.BackgroundTransparency = 0.15 _IIlIllIIII.Text = "\066\065\067\075\058\032\079\070\070" _IIlIllIIII.Font = Enum.Font.GothamBold _IIlIllIIII.TextSize = 0x10 _IIlIllIIII.TextColor3 = Color3.fromHex("\035\102\102\099\099\099\099") _IIlIllIIII.AutoButtonColor = false _IIlIllIIII.Parent = _llIlIlllII local _IlIIIllIlI = Instance.new("\085\073\067\111\114\110\101\114") _IlIIIllIlI.CornerRadius = UDim.new(0.2, 0x0) _IlIIIllIlI.Parent = _IIlIllIIII local _lIIlllllIl = Instance.new("\085\073\083\116\114\111\107\101") _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIIlllllIl.Thickness = 0x2 _lIIlllllIl.Parent = _IIlIllIIII _IIlIllIIII.MouseButton1Click:Connect( function () getgenv().BackTrimpEnabled = not getgenv().BackTrimpEnabled _IIlIllIIII.Text = "\066\065\067\075\058\032" .. (getgenv().BackTrimpEnabled and "\079\078" or "\079\070\070") _IIlIllIIII.BackgroundColor3 = getgenv().BackTrimpEnabled and Color3.fromHex("\035\051\100\048\048\048\048") or Color3.fromHex("\035\049\097\048\048\048\048") _lIIlllllIl.Color = getgenv().BackTrimpEnabled and Color3.fromHex("\035\102\102\052\052\052\052") or Color3.fromHex("\035\054\054\048\048\048\048") if not getgenv().BackTrimpEnabled and not getgenv().AutoTrimpEnabled then if _IlIIIllIlI then _IlIIIllIlI:Destroy() end
 _IlIIIllIlI = nil _IllIIIIIll() end
 end
 ) local _IlIlIllIll, dragInput, _llIIlIIllI, _IIIllIIIIl = false, nil, Vector2.new(), _llIlIlllII.Position local function _IIllIlIIll(input) local _lllIIlIllI = input.Position - _llIIlIIllI _llIlIlllII.Position = UDim2.new(_IIIllIIIIl.X.Scale, _IIIllIIIIl.X.Offset + _lllIIlIllI.X, _IIIllIIIIl.Y.Scale, _IIIllIIIIl.Y.Offset + _lllIIlIllI.Y) end
 _IIlIllIIII.InputBegan:Connect( function (input) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then _IlIlIllIll = true dragInput = input _llIIlIIllI = input.Position _IIIllIIIIl = _llIlIlllII.Position _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _IIlIllIIII.Text = "\068\082\065\071\046\046\046" input.Changed:Connect( function () if input.UserInputState == Enum.UserInputState.End then _IlIlIllIll = false _lIIlllllIl.Color = getgenv().BackTrimpEnabled and Color3.fromHex("\035\102\102\052\052\052\052") or Color3.fromHex("\035\054\054\048\048\048\048") _IIlIllIIII.Text = "\066\065\067\075\058\032" .. (getgenv().BackTrimpEnabled and "\079\078" or "\079\070\070") end
 end
 ) end
 end
 ) _IIlIllIIII.InputChanged:Connect( function (input) if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then dragInput = input end
 end
 ) UserInputService.InputChanged:Connect( function (input) if _IlIlIllIll and input == dragInput then _IIllIlIIll(input) end
 end
 ) _IIIIlIllll.Enabled = false _lIIIllIIll = _IIIIlIllll return _IIIIlIllll end
 local _llIlIllIIl = nil if _lllIlIllIl and _lllIlIllIl.Misc then _llIlIllIIl = _lllIlIllIl.Misc else print("\091\065\117\116\111\084\114\105\109\112\093\032\077\105\115\099\032\116\097\098\032\110\111\116\032\102\111\117\110\100\033") return end
 local _lIIIIIlIII = _llIlIllIIl:Section({ Title = "\065\117\116\111\032\084\114\105\109\112", Side = "\076\101\102\116", Collapsed = false, }) _lIIIIIlIII:Toggle({ Title = "\069\110\097\098\108\101\032\065\117\116\111\084\114\105\109\112\032\040\070\111\114\119\097\114\100\041", Flag = "\065\117\116\111\084\114\105\109\112\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) getgenv().AutoTrimpEnabled = _IIlIIllllI if not _IIlIIllllI then if not getgenv().BackTrimpEnabled then if _IlIIIllIlI then _IlIIIllIlI:Destroy() end
 _IlIIIllIlI = nil _IllIIIIIll() end
 end
 end
 }) _lIIIIIlIII:Toggle({ Title = "\069\110\097\098\108\101\032\066\097\099\107\084\114\105\109\112\032\040\066\097\099\107\119\097\114\100\041", Flag = "\066\097\099\107\084\114\105\109\112\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) getgenv().BackTrimpEnabled = _IIlIIllllI if not _IIlIIllllI and not getgenv().AutoTrimpEnabled then if _IlIIIllIlI then _IlIIIllIlI:Destroy() end
 _IlIIIllIlI = nil _IllIIIIIll() end
 end
 }) _lIIIIIlIII:Space() _lIIIIIlIII:Dropdown({ Title = "\083\112\101\101\100\032\077\111\100\101", Flag = "\065\117\116\111\084\114\105\109\112\077\111\100\101\068\114\111\112\100\111\119\110", Values = { "\067\111\110\115\116\097\110\116", "\073\110\099\114\101\109\101\110\116\097\108" }, Default = "\067\111\110\115\116\097\110\116", Callback = function (value) getgenv().AutoTrimpMode = value _IllIIIIIll() end
 }) getgenv().AutoTrimpMode = "\067\111\110\115\116\097\110\116" _IllIIIIIll() _lIIIIIlIII:Space() _lIIIIIlIII:Input({ Title = "\066\097\115\101\032\083\112\101\101\100\032\040\067\111\110\115\116\097\110\116\032\077\111\100\101\041", Flag = "\065\117\116\111\084\114\105\109\112\066\097\115\101\083\112\101\101\100\073\110\112\117\116", Value = tostring(getgenv().AutoTrimpBaseSpeed), Placeholder = "\069\110\116\101\114\032\098\097\115\101\032\115\112\101\101\100", Numeric = true, Callback = function (value) local _IIllIlIlIl = tonumber(value) if _IIllIlIlIl and _IIllIlIlIl > 0x0 then getgenv().AutoTrimpBaseSpeed = _IIllIlIlIl if getgenv().AutoTrimpMode == "\067\111\110\115\116\097\110\116" then _IllIIIIIll() end
 end
 end
 }) _lIIIIIlIII:Input({ Title = "\083\116\097\114\116\032\083\112\101\101\100\032\040\073\110\099\114\101\109\101\110\116\097\108\032\077\111\100\101\041", Flag = "\065\117\116\111\084\114\105\109\112\083\116\097\114\116\083\112\101\101\100\073\110\112\117\116", Value = tostring(getgenv().AutoTrimpStartSpeed), Placeholder = "\083\112\101\101\100\032\116\111\032\115\116\097\114\116\032\102\114\111\109", Numeric = true, Callback = function (value) local _IIllIlIlIl = tonumber(value) if _IIllIlIlIl and _IIllIlIlIl >= 0x0 then getgenv().AutoTrimpStartSpeed = _IIllIlIlIl if getgenv().AutoTrimpMode == "\073\110\099\114\101\109\101\110\116\097\108" then _IllIIIIIll() end
 end
 end
 }) _lIIIIIlIII:Input({ Title = "\073\110\099\114\101\109\101\110\116\032\082\097\116\101\032\040\083\112\101\101\100\032\112\101\114\032\115\101\099\111\110\100\041", Flag = "\065\117\116\111\084\114\105\109\112\073\110\099\114\101\109\101\110\116\082\097\116\101\073\110\112\117\116", Value = tostring(getgenv().AutoTrimpIncrementRate), Placeholder = "\083\112\101\101\100\032\105\110\099\114\101\097\115\101\032\112\101\114\032\115\101\099\111\110\100", Numeric = true, Callback = function (value) local _IIllIlIlIl = tonumber(value) if _IIllIlIlIl and _IIllIlIlIl > 0x0 then getgenv().AutoTrimpIncrementRate = _IIllIlIlIl end
 end
 }) _lIIIIIlIII:Space() _lIIIIIlIII:Button({ Title = "\082\101\115\101\116\032\083\112\101\101\100", Callback = function () _IllIIIIIll() if WindUI and WindUI.Notify then WindUI:Notify({ Title = "\065\117\116\111\084\114\105\109\112", Content = "\083\112\101\101\100\032\114\101\115\101\116\032\116\111\032" .. math.floor(_llIlIlIIII), Duration = 0x2 }) end
 end
 }) _lIIIIIlIII:Space() local _llIllIIlll = nil local _llIllllllI = nil _lIIIIIlIII:Toggle({ Title = "\083\104\111\119\032\084\114\105\109\112\032\070\108\111\097\116\105\110\103\032\066\117\116\116\111\110", Flag = "\065\117\116\111\084\114\105\109\112\070\108\111\097\116\105\110\103\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) if _IIlIIllllI then _llIllIIlll = _lIIIIlIllI() _llIllIIlll.Enabled = true else if _llIllIIlll then _llIllIIlll:Destroy() _llIllIIlll = nil end
 end
 end
 }) _lIIIIIlIII:Toggle({ Title = "\083\104\111\119\032\066\097\099\107\084\114\105\109\112\032\070\108\111\097\116\105\110\103\032\066\117\116\116\111\110", Flag = "\066\097\099\107\084\114\105\109\112\070\108\111\097\116\105\110\103\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) if _IIlIIllllI then _llIllllllI = _IIlIIIIlII() _llIllllllI.Enabled = true else if _llIllllllI then _llIllllllI:Destroy() _llIllllllI = nil end
 end
 end
 }) print("\091\065\117\116\111\084\114\105\109\112\093\032\085\073\032\108\111\097\100\101\100\032\115\117\099\099\101\115\115\102\117\108\108\121\032\105\110\032\077\105\115\099\032\116\097\098\033") pcall( function () local Players = game:GetService("\080\108\097\121\101\114\115") local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101") local UserInputService = game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101") local _lllIIIllII = Players.LocalPlayer local _IllIIlIIlI = false local _lIIlllIIlI = "\066\111\117\110\099\101" local _lIllIlllIl = "\065\099\099\101\108\101\114\097\116\105\111\110" local _lllIlIIllI = -0.5 local _lIlllIllIl = false local _lIlIIlIIIl = false local _lIlIlIllII = false local _lIIllIIlIl = 0x186A0 local _lIlIllllll = 0.25 local _lIlllIlIIl = 0x32 local _lIIIlIllll = nil local _IlIlIIIlII = nil local _lIlIIIIIll = false local _lIlIIIIlll = {} local _IIlIIIllIl = nil local _lllIlIIIll = nil local _llIlIIlIll = nil local _IlIlIIIIIl = 0x0 local _llIIlIlIlI = { down = nil, up = nil } local _IllIlIIlII = nil local function _IIlIlIlIlI() pcall( function () if _lllIIIllII and _lllIIIllII.Character then _IIlIIIllIl = _lllIIIllII.Character _lllIlIIIll = _IIlIIIllIl:FindFirstChildOfClass("\072\117\109\097\110\111\105\100") _llIlIIlIll = _IIlIIIllIl:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") end
 end
 ) end
 local function _IIIllIlIII() if not (_IIlIIIllIl and _lllIlIIIll and _llIlIIlIll) then return false end
 local _IllIlIlIlI, result = pcall( function () local _IIlIIllllI = _lllIlIIIll:GetState() if _IIlIIllllI == Enum.HumanoidStateType.Jumping or _IIlIIllllI == Enum.HumanoidStateType.Freefall then return false end
 local _IllIIIllII = RaycastParams.new() _IllIIIllII.FilterType = Enum.RaycastFilterType.Blacklist _IllIIIllII.FilterDescendantsInstances = {_IIlIIIllIl} return workspace:Raycast(_llIlIIlIll.Position, Vector3.new(0x0, -0x4, 0x0), _IllIIIllII) ~= nil end
 ) return _IllIlIlIlI and result or false end
 local function _IlIlIlllll() pcall( function () _lIlIIIIlll = {} local _IllIlIlIlI, gc = pcall( function () return getgc(true) end
 ) if not _IllIlIlIlI then return end
 for _, obj in pairs(gc) do if type(obj) == "\116\097\098\108\101" and rawget(obj, "\070\114\105\099\116\105\111\110") then table.insert(_lIlIIIIlll, { obj = obj, _IIlIlIIIlI = obj.Friction }) end
 end
 end
 ) end
 local function _lIllIIllll() pcall( function () local _lIlIlllllI = _IllIIlIIlI or (_lIlllIllIl and _lIlIIlIIIl) if _lIlIlllllI and _lIllIlllIl == "\065\099\099\101\108\101\114\097\116\105\111\110" then if #_lIlIIIIlll == 0x0 then _IlIlIlllll() end
 for _, t in ipairs(_lIlIIIIlll) do if t.obj then pcall( function () t.obj.Friction = _lllIlIIllI end
 ) end
 end
 else for _, t in ipairs(_lIlIIIIlll) do if t.obj and t.original then pcall( function () t.obj.Friction = t.original end
 ) end
 end
 end
 end
 ) end
 local function _lllIlIllII() if not _lIlIIIIIll then return end
 local _lIlIlllllI = _IllIIlIIlI or (_lIlllIllIl and _lIlIIlIIIl) if not _lIlIlllllI then return end
 if not _IIlIIIllIl or not _IIlIIIllIl.Parent then _IIlIlIlIlI() end
 if not (_lllIlIIIll and _llIlIIlIll) then return end
 local _llllIllIII = tick() if _lIIlllIIlI == "\082\101\097\108\105\115\116\105\099" then pcall( function () local _IlIIllIIIl = _lllIIIllII:FindFirstChild("\080\108\097\121\101\114\083\099\114\105\112\116\115") if _IlIIllIIIl then local _IIIlIIIlIl = _IlIIllIIIl:FindFirstChild("\069\118\101\110\116\115") if _IIIlIIIlIl then local _IlIIlIIIll = _IIIlIIIlIl:FindFirstChild("\116\101\109\112\111\114\097\114\121\095\101\118\101\110\116\115") if _IlIIlIIIll then if _IlIIlIIIll:FindFirstChild("\074\117\109\112\082\101\097\099\116") then _IlIIlIIIll.JumpReact:Fire() end
 if _IlIIlIIIll:FindFirstChild("\069\110\100\074\117\109\112") then _IlIIlIIIll.EndJump:Fire() end
 end
 end
 end
 end
 ) else if _IIIllIlIII() and (_llllIllIII - _IlIlIIIIIl) > _lIlIllllll then pcall( function () _lllIlIIIll:ChangeState(Enum.HumanoidStateType.Jumping) _lllIlIIIll.JumpPower = _lIlllIlIIl end
 ) _IlIlIIIIIl = _llllIllIII end
 end
 end
 local function _IIlllIIIll() if _lIIIlIllll then return end
 _lIlIIIIIll = true _IlIlIlllll() _lIllIIllll() _lIIIlIllll = RunService.Heartbeat:Connect(_lllIlIllII) end
 local function _lllIlllIIl() if _lIIIlIllll then _lIIIlIllll:Disconnect() _lIIIlIllll = nil end
 _lIlIIIIIll = false _lIlIIlIIIl = false _lIllIIllll() end
 local function _lIllIlIllI() if _IlIlIIIlII then _IlIlIIIlII:Disconnect() end
 _IlIlIIIlII = RunService.Heartbeat:Connect( function (dt) if not _lIlIlIllII or not _IllIIlIIlI then return end
 pcall( function () local _IIIIIlIlll = _lllIIIllII.Character and _lllIIIllII.Character:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if _IIIIIlIlll then local _IIlIlllIlI = _IIIIIlIlll.Orientation _IIIIIlIlll.Orientation = Vector3.new(_IIlIlllIlI.X, _IIlIlllIlI.Y + (_lIIllIIlIl * dt), _IIlIlllIlI.Z) end
 end
 ) end
 ) end
 local function _lIllllIllI() if _IlIlIIIlII then _IlIlIIIlII:Disconnect() _IlIlIIIlII = nil end
 end
 local function _IlIlIIlIll() if _lIlIlIllII and _IllIIlIIlI then _lIllIlIllI() else _lIllllIllI() end
 end
 local function _llIlIlIlll() pcall( function () if _llIIlIlIlI.down then _llIIlIlIlI.down:Disconnect() _llIIlIlIlI.down = nil end
 if _llIIlIlIlI.up then _llIIlIlIlI.up:Disconnect() _llIIlIlIlI.up = nil end
 end
 ) end
 local function _IIlllIIlIl() pcall( function () if not _lllIIIllII then return end
 _llIlIlIlll() local _IIIIIlllIl = _lllIIIllII:FindFirstChild("\080\108\097\121\101\114\071\117\105") if not _IIIIIlllIl then return end
 local _IlIlIIIlll = _IIIIIlllIl:FindFirstChild("\084\111\117\099\104\071\117\105") if not _IlIlIIIlll then return end
 local _lIIIlllIIl = _IlIlIIIlll:FindFirstChild("\084\111\117\099\104\067\111\110\116\114\111\108\070\114\097\109\101") if not _lIIIlllIIl then return end
 local _IlIlIllllI = _lIIIlllIIl:FindFirstChild("\074\117\109\112\066\117\116\116\111\110") if not _IlIlIllllI then return end
 _llIIlIlIlI.down = _IlIlIllllI.MouseButton1Down:Connect( function () if _lIlllIllIl then _lIlIIlIIIl = true if not _IllIIlIIlI then _IIlllIIIll() end
 end
 end
 ) _llIIlIlIlI.up = _IlIlIllllI.MouseButton1Up:Connect( function () if _lIlllIllIl then _lIlIIlIIIl = false if not _IllIIlIIlI then _lllIlllIIl() end
 end
 end
 ) end
 ) end
 local function _llIllIlIIl() local _lIlIIlIIll = game:GetService("\067\111\114\101\071\117\105") local _IlllIIIlIl = _lIlIIlIIll:FindFirstChild("\066\104\111\112\070\108\111\097\116\105\110\103\066\117\116\116\111\110") if _IlllIIIlIl then _IlllIIIlIl:Destroy() end
 local _IIIIlIllll = Instance.new("\083\099\114\101\101\110\071\117\105") _IIIIlIllll.Name = "\066\104\111\112\070\108\111\097\116\105\110\103\066\117\116\116\111\110" _IIIIlIllll.ResetOnSpawn = false _IIIIlIllll.Parent = _lIlIIlIIll local _lIlIIlIlll = Instance.new("\084\101\120\116\066\117\116\116\111\110") _lIlIIlIlll.Size = UDim2.new(0x0, 0xA0, 0x0, 0x37) local _IlIIllIIIl = (workspace.CurrentCamera.ViewportSize.X / 0x2) - 0x50 local _IllIllllII = (workspace.CurrentCamera.ViewportSize.Y / 0x2) - 0x1B _lIlIIlIlll.Position = UDim2.new(0x0, _IlIIllIIIl, 0x0, _IllIllllII) _lIlIIlIlll.Text = "\066\072\079\080\058\032\079\070\070" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _lIlIIlIlll.TextColor3 = Color3.fromHex("\035\102\102\099\099\099\099") _lIlIIlIlll.Font = Enum.Font.GothamBold _lIlIIlIlll.TextSize = 0xE _lIlIIlIlll.AutoButtonColor = false _lIlIIlIlll.Parent = _IIIIlIllll local _IlIIIllIlI = Instance.new("\085\073\067\111\114\110\101\114") _IlIIIllIlI.CornerRadius = UDim.new(0.2, 0x0) _IlIIIllIlI.Parent = _lIlIIlIlll local _lIIlllllIl = Instance.new("\085\073\083\116\114\111\107\101") _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIIlllllIl.Thickness = 0x2 _lIIlllllIl.Parent = _lIlIIlIlll local _IlIlIllIll = false local _llIIlIIllI, _IIIllIIIIl _lIlIIlIlll.InputBegan:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = true _llIIlIIllI = input.Position _IIIllIIIIl = _lIlIIlIlll.Position _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _lIlIIlIlll.Text = "\068\082\065\071\046\046\046" end
 end
 ) _lIlIIlIlll.InputChanged:Connect( function (input) if _IlIlIllIll and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then local _lllIIlIllI = input.Position - _llIIlIIllI _lIlIIlIlll.Position = UDim2.new(0x0, _IIIllIIIIl.X.Offset + _lllIIlIllI.X, 0x0, _IIIllIIIIl.Y.Offset + _lllIIlIllI.Y) end
 end
 ) _lIlIIlIlll.InputEnded:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = false _lIIlllllIl.Color = _IllIIlIIlI and Color3.fromHex("\035\102\102\052\052\052\052") or Color3.fromHex("\035\054\054\048\048\048\048") _lIlIIlIlll.Text = _IllIIlIIlI and "\066\072\079\080\058\032\079\078" or "\066\072\079\080\058\032\079\070\070" end
 end
 ) local function _IlllIllIll() if not _IlIlIllIll then _lIlIIlIlll.Text = "\066\072\079\080\058\032\065\067\084\073\086\069" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\051\100\048\048\048\048") _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _IllIIlIIlI = not _IllIIlIIlI if _IllIIlIIlI then _IIlllIIIll() _IIlllIIlIl() _IlIlIIlIll() else _lllIlllIIl() _lIllllIllI() _lIlIIlIIIl = false end
 _lIlIIlIlll.Text = _IllIIlIIlI and "\066\072\079\080\058\032\079\078" or "\066\072\079\080\058\032\079\070\070" _lIlIIlIlll.BackgroundColor3 = _IllIIlIIlI and Color3.fromHex("\035\051\100\048\048\048\048") or Color3.fromHex("\035\049\097\048\048\048\048") _lIIlllllIl.Color = _IllIIlIIlI and Color3.fromHex("\035\102\102\052\052\052\052") or Color3.fromHex("\035\054\054\048\048\048\048") pcall( function () if _lIlllIllll then _lIlllIllll:SetValue(_IllIIlIIlI) end
 end
 ) end
 end
 _lIlIIlIlll.MouseButton1Click:Connect(_IlllIllIll) _lIlIIlIlll.TouchTap:Connect(_IlllIllIll) return _IIIIlIllll end
 local function _llIllIIIII() pcall( function () if _IllIlIIlII then local _IIlllIIIIl = _IllIlIIlII:FindFirstChildOfClass("\084\101\120\116\066\117\116\116\111\110") if _IIlllIIIIl then _IIlllIIIIl.Text = _IllIIlIIlI and "\066\072\079\080\058\032\079\078" or "\066\072\079\080\058\032\079\070\070" _IIlllIIIIl.BackgroundColor3 = _IllIIlIIlI and Color3.fromHex("\035\051\100\048\048\048\048") or Color3.fromHex("\035\049\097\048\048\048\048") end
 end
 end
 ) end
 UserInputService.InputBegan:Connect( function (input, gameProcessed) if gameProcessed then return end
 if input.KeyCode == Enum.KeyCode.Space then if _lIlllIllIl then _lIlIIlIIIl = true if not _IllIIlIIlI then _IIlllIIIll() end
 end
 end
 end
 ) UserInputService.InputEnded:Connect( function (input) if input.KeyCode == Enum.KeyCode.Space then if _lIlllIllIl then _lIlIIlIIIl = false if not _IllIIlIIlI then _lllIlllIIl() end
 end
 end
 end
 ) local function _llIlIIlIII(_llllIIllII) task.wait(0.6) _IIlIIIllIl = _llllIIllII if _llllIIllII then pcall( function () _lllIlIIIll = _llllIIllII:WaitForChild("\072\117\109\097\110\111\105\100", 0x3) _llIlIIlIll = _llllIIllII:WaitForChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116", 0x3) end
 ) end
 if _IllIIlIIlI then _lIllIIllll() _IlIlIIlIll() end
 end
 _lllIIIllII.CharacterAdded:Connect(_llIlIIlIII) if _lllIIIllII.Character then _llIlIIlIII(_lllIIIllII.Character) end
 local _IIllIlIlIl = _lllIlIllIl.Misc:Section({ Title = "\065\117\116\111\032\074\117\109\112", Side = "\076\101\102\116", Collapsed = false, }) _IIllIlIlIl:Dropdown({ Title = "\065\117\116\111\032\074\117\109\112\032\084\121\112\101", Flag = "\065\117\116\111\074\117\109\112\084\121\112\101\068\114\111\112\100\111\119\110", Values = { "\066\111\117\110\099\101", "\082\101\097\108\105\115\116\105\099" }, Default = "\066\111\117\110\099\101", Callback = function (value) _lIIlllIIlI = value end
 }) _IIllIlIlIl:Toggle({ Title = "\082\111\116\097\116\105\111\110\032\051\054\048", Flag = "\082\111\116\097\116\105\111\110\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) _lIlIlIllII = _IIlIIllllI _IlIlIIlIll() WindUI:Notify({ Title = "\082\111\116\097\116\105\111\110", Content = _IIlIIllllI and "\069\110\097\098\108\101\100" or "\068\105\115\097\098\108\101\100", Duration = 0x2 }) end
 }) local _lIlllIllll = _IIllIlIlIl:Toggle({ Title = "\066\117\110\110\121\032\072\111\112", Flag = "\066\117\110\110\121\072\111\112\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) _IllIIlIIlI = _IIlIIllllI if _IIlIIllllI then _IIlllIIIll() _IIlllIIlIl() _IlIlIIlIll() WindUI:Notify({ Title = "\066\117\110\110\121\032\072\111\112", Content = "\069\110\097\098\108\101\100", Duration = 0x2 }) else _lllIlllIIl() _lIllllIllI() _lIlIIlIIIl = false WindUI:Notify({ Title = "\066\117\110\110\121\032\072\111\112", Content = "\068\105\115\097\098\108\101\100", Duration = 0x2 }) end
 _llIllIIIII() end
 }) _IIllIlIlIl:Toggle({ Title = "\066\104\111\112\032\072\111\108\100\032\040\072\111\108\100\032\083\112\097\099\101\047\074\117\109\112\041", Flag = "\066\104\111\112\072\111\108\100\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) _lIlllIllIl = _IIlIIllllI if _IIlIIllllI then _IIlllIIlIl() WindUI:Notify({ Title = "\066\104\111\112\032\072\111\108\100", Content = "\069\110\097\098\108\101\100\032\045\032\072\111\108\100\032\106\117\109\112\032\098\117\116\116\111\110", Duration = 0x2 }) else _lIlIIlIIIl = false _llIlIlIlll() if not _IllIIlIIlI then _lllIlllIIl() end
 WindUI:Notify({ Title = "\066\104\111\112\032\072\111\108\100", Content = "\068\105\115\097\098\108\101\100", Duration = 0x2 }) end
 _llIllIIIII() end
 }) _IIllIlIlIl:Slider({ Title = "\074\117\109\112\032\080\111\119\101\114", Flag = "\074\117\109\112\080\111\119\101\114\083\108\105\100\101\114", Value = { Min = 0x1E, Max = 0x96, Default = 0x32 }, Callback = function (value) _lIlllIlIIl = value end
 }) _IIllIlIlIl:Dropdown({ Title = "\066\104\111\112\032\077\111\100\101", Flag = "\066\104\111\112\077\111\100\101\068\114\111\112\100\111\119\110", Values = { "\065\099\099\101\108\101\114\097\116\105\111\110", "\078\111\032\065\099\099\101\108\101\114\097\116\105\111\110" }, Default = "\065\099\099\101\108\101\114\097\116\105\111\110", Callback = function (value) _lIllIlllIl = value if _IllIIlIIlI or _lIlllIllIl then _lIllIIllll() end
 end
 }) _IIllIlIlIl:Slider({ Title = "\066\104\111\112\032\065\099\099\101\108\101\114\097\116\105\111\110", Flag = "\066\104\111\112\065\099\099\101\108\083\108\105\100\101\114", Value = { Min = -0xA, Max = -0.1, Default = -0.5 }, Step = 0.1, Callback = function (value) _lllIlIIllI = value if (_IllIIlIIlI or _lIlllIllIl) and _lIllIlllIl == "\065\099\099\101\108\101\114\097\116\105\111\110" then _lIllIIllll() end
 end
 }) _IIllIlIlIl:Slider({ Title = "\074\117\109\112\032\067\111\111\108\100\111\119\110\032\040\083\101\099\111\110\100\115\041", Flag = "\074\117\109\112\067\111\111\108\100\111\119\110\083\108\105\100\101\114", Value = { Min = 0.05, Max = 0.5, Default = 0.25 }, Step = 0.01, Callback = function (value) _lIlIllllll = value end
 }) _IIllIlIlIl:Toggle({ Title = "\066\104\111\112\032\066\117\116\116\111\110\032\071\085\073", Flag = "\066\104\111\112\066\117\116\116\111\110\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) if _IIlIIllllI then _IllIlIIlII = _llIllIlIIl() else if _IllIlIIlII then pcall( function () _IllIlIIlII:Destroy() end
 ) _IllIlIIlII = nil end
 end
 end
 }) print("\091\065\117\116\111\032\074\117\109\112\093\032\076\111\097\100\101\100\032\115\117\099\099\101\115\115\102\117\108\108\121\032\105\110\032\077\105\115\099\032\116\097\098\033") end
 ) local _llIIlIlIII = _lllIlIllIl.Misc:Section({ Title = "\069\109\111\116\101\032\109\111\100\105\102\105\099\097\116\105\111\110\115", Side = "\076\101\102\116", Collapsed = true, }) local _lIlIlIIlIl = {} local _IlIlllIIII = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101"):FindFirstChild("\073\116\101\109\115") if _IlIlllIIII then local _lIlIIIlIlI = _IlIlllIIII:FindFirstChild("\069\109\111\116\101\115") if _lIlIIIlIlI then for _, module in ipairs(_lIlIIIlIlI:GetChildren()) do if module:IsA("\077\111\100\117\108\101\083\099\114\105\112\116") then local _IIllllIIII, data = pcall(require, module) if _IIllllIIII and data and data.EmoteInfo then _lIlIlIIlIl[module.Name] = data.EmoteInfo.SpeedMult end
 end
 end
 end
 end
 local function _IlIIIlIllI(v) if not _IlIlllIIII then return end
 local _lIlIIIlIlI = _IlIlllIIII:FindFirstChild("\069\109\111\116\101\115") if not _lIlIIIlIlI then return end
 for _, module in ipairs(_lIlIIIlIlI:GetChildren()) do if module:IsA("\077\111\100\117\108\101\083\099\114\105\112\116") then local _IIllllIIII, data = pcall(require, module) if _IIllllIIII and data and data.EmoteInfo and data.EmoteInfo.SpeedMult ~= 0x0 then data.EmoteInfo.SpeedMult = v end
 end
 end
 end
 local function _IIIlIIIllI() if not _IlIlllIIII then return end
 local _lIlIIIlIlI = _IlIlllIIII:FindFirstChild("\069\109\111\116\101\115") if not _lIlIIIlIlI then return end
 for _, module in ipairs(_lIlIIIlIlI:GetChildren()) do if module:IsA("\077\111\100\117\108\101\083\099\114\105\112\116") then local _IIlIlIIIlI = _lIlIlIIlIl[module.Name] if _IIlIlIIIlI then local _IIllllIIII, data = pcall(require, module) if _IIllllIIII and data and data.EmoteInfo then data.EmoteInfo.SpeedMult = _IIlIlIIIlI end
 end
 end
 end
 end
 local _IllIIIIlIl = { Friction = true, AirStrafeAcceleration = true, JumpHeight = true, RunDeaccel = true, JumpSpeedMultiplier = true, JumpCap = true, SprintCap = true, WalkSpeedMultiplier = true, BhopEnabled = true, Speed = true, AirAcceleration = true, RunAccel = true, SprintAcceleration = true } local function _IlIIIlIllI() local _IIIIIIlIIl = {} for _, obj in pairs(getgc(true)) do if typeof(obj) == "\116\097\098\108\101" then local _IIllllIIII = true for field in pairs(_IllIIIIlIl) do if rawget(obj, field) == nil then _IIllllIIII = false break end
 end
 if _IIllllIIII then table.insert(_IIIIIIlIIl, obj) end
 end
 end
 return _IIIIIIlIIl end
 local function _lIlIlIlIlI(speedMultiplier) local _IllIIIIIlI = _IlIIIlIllI() for _, tableObj in ipairs(_IllIIIIIlI) do if tableObj and typeof(tableObj) == "\116\097\098\108\101" then pcall( function () tableObj.WalkSpeedMultiplier = speedMultiplier end
 ) end
 end
 end
 local function _llIlllIllI() local _lllllllIIl = workspace.Game and workspace.Game.Players if not _lllllllIIl then return nil end
 return _lllllllIIl:FindFirstChild(_lllIIIllII.Name) end
 local _IIllIllIII = nil local _IIlIIllllI = nil local _IIllIIlIlI = 1.5 local function _lIIlIllIIl(obj) if _IIlIIllllI then _IIlIIllllI:Disconnect() _IIlIIllllI = nil end
 _IIllIllIII = obj if not obj then return end
 local function _IIllIlIllI() local _IIlIIllllI = obj:GetAttribute("\083\116\097\116\101") local _IIIllIIIll = (_IIlIIllllI == "\069\109\111\116\105\110\103") and _IIllIIlIlI or 1.5 _lIlIlIlIlI(_IIIllIIIll) end
 _IIllIlIllI() _IIlIIllllI = obj:GetAttributeChangedSignal("\083\116\097\116\101"):Connect(_IIllIlIllI) end
 local function _lIlIllIIIl() _IIllIIlIlI = 1.5 _lIlIlIlIlI(1.5) if _IIlIIllllI then _IIlIIllllI:Disconnect() _IIlIIllllI = nil end
 end
 local function _lIIIllIIll(speedValue) if not _IlIlllIIII then return end
 local _lIlIIIlIlI = _IlIlllIIII:FindFirstChild("\069\109\111\116\101\115") if not _lIlIIIlIlI then return end
 for _, emoteModule in ipairs(_lIlIIIlIlI:GetChildren()) do if emoteModule:IsA("\077\111\100\117\108\101\083\099\114\105\112\116") then local _IllIlIlIlI, emoteData = pcall(require, emoteModule) if _IllIlIlIlI and emoteData and emoteData.EmoteInfo and emoteData.EmoteInfo.SpeedMult == 0x0 then emoteData.EmoteInfo.SpeedMult = speedValue end
 end
 end
 end
 local function _IIIllIlIll() _IIIlIIIllI() _lIlIllIIIl() if _IIlIIllllI then _IIlIIllllI:Disconnect() _IIlIIllllI = nil end
 end
 _IllllIlIll = _IllllIlIll or {} _IllllIlIll.EmoteSpeedValue = 0x2 local _IlllIIlIll = "\078\097\104" local _lllIIllIIl = 1.5 local function _IlllIlllIl(mode) _IlllIIlIll = mode if mode == "\078\097\104" then _IIIllIlIll() elseif mode == "\076\101\103\105\116" then _lIlIllIIIl() if _IIlIIllllI then _IIlIIllllI:Disconnect() _IIlIIllllI = nil end
 _IlIIIlIllI(_lllIIllIIl) elseif mode == "\077\117\108\116\105\112\108\105\101\114\032\115\112\101\101\100" then _IIIlIIIllI() _lIlIllIIIl() _lIIlIllIIl(_llIlllIllI()) task.spawn( function () while _IlllIIlIll == "\077\117\108\116\105\112\108\105\101\114\032\115\112\101\101\100" do task.wait(0x2) local _IIlIlIllII = _llIlllIllI() if _IIlIlIllII ~= _IIllIllIII then _lIIlIllIIl(_IIlIlIllII) elseif _IIllIllIII then local _IIlIIllllI = _IIllIllIII:GetAttribute("\083\116\097\116\101") local _IIIllIIIll = (_IIlIIllllI == "\069\109\111\116\105\110\103") and _IIllIIlIlI or 1.5 _lIlIlIlIlI(_IIIllIIIll) end
 end
 end
 ) end
 end
 local function _llllllIIlI(newValue) _lllIIllIIl = newValue if _IlllIIlIll == "\076\101\103\105\116" then _IlIIIlIllI(newValue) elseif _IlllIIlIll == "\077\117\108\116\105\112\108\105\101\114\032\115\112\101\101\100" then _IIllIIlIlI = newValue end
 end
 _llIIlIlIII:Dropdown({ Title = "\069\109\111\116\101\032\083\112\101\101\100\032\077\111\100\101", Flag = "\069\109\111\116\101\083\112\101\101\100\077\111\100\101\068\114\111\112\100\111\119\110", Values = { "\078\097\104", "\076\101\103\105\116", "\077\117\108\116\105\112\108\105\101\114\032\115\112\101\101\100" }, Default = "\078\097\104", Callback = function (value) _IlllIlllIl(value) if WindUI and WindUI.Notify then WindUI:Notify({ Title = "\069\109\111\116\101\032\083\112\101\101\100", Content = "\077\111\100\101\058\032" .. value, Duration = 0x2 }) end
 end
 }) _llIIlIlIII:Input({ Title = "\069\109\111\116\101\032\083\112\101\101\100\032\086\097\108\117\101", Flag = "\069\109\111\116\101\083\112\101\101\100\086\097\108\117\101\073\110\112\117\116", Description = "\067\104\097\110\103\101\115\032\116\104\101\032\097\110\105\109\097\116\105\111\110\032\115\112\101\101\100\032\111\102\032\121\111\117\114\032\101\109\111\116\101\115", Placeholder = "\049\053\048\048", Numeric = true, Callback = function (value) local _IIllIlIlIl = tonumber(value) if not _IIllIlIlIl or _IIllIlIlIl <= 0x0 then return end
 _IllllIlIll.EmoteSpeedValue = _IIllIlIlIl local _IIIlIlIIII = _IIllIlIlIl / 0x3E8 _llllllIIlI(_IIIlIlIIII) end
 }) _llIIlIlIII:Button({ Title = "\065\112\112\108\121\032\116\111\032\085\110\119\097\108\107\097\098\108\101\032\069\109\111\116\101\115", Desc = "\065\112\112\108\105\101\115\032\115\112\101\101\100\032\116\111\032\101\109\111\116\101\115\032\116\104\097\116\032\110\111\114\109\097\108\108\121\032\099\097\110\039\116\032\109\111\118\101", Callback = function () _lIIIllIIll(_lllIIllIIl) if WindUI and WindUI.Notify then WindUI:Notify({ Title = "\069\109\111\116\101\032\083\112\101\101\100", Content = "\065\112\112\108\105\101\100\032\116\111\032\117\110\119\097\108\107\097\098\108\101\032\101\109\111\116\101\115", Duration = 0x2 }) end
 end
 }) _llIIlIlIII:Button({ Title = "\082\101\115\101\116\032\065\108\108\032\069\109\111\116\101\032\083\112\101\101\100\115", Desc = "\082\101\115\116\111\114\101\115\032\097\108\108\032\101\109\111\116\101\032\115\112\101\101\100\115\032\116\111\032\111\114\105\103\105\110\097\108\032\118\097\108\117\101\115", Callback = function () _IIIllIlIll() _IlllIIlIll = "\078\097\104" if WindUI and WindUI.Notify then WindUI:Notify({ Title = "\069\109\111\116\101\032\083\112\101\101\100", Content = "\065\108\108\032\115\112\101\101\100\115\032\114\101\115\101\116\032\116\111\032\111\114\105\103\105\110\097\108", Duration = 0x2 }) end
 end
 }) pcall( function () local Players = game:GetService("\080\108\097\121\101\114\115") local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101") local UserInputService = game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101") local _lllIIIllII = Players.LocalPlayer if not _lllIlIllIl or not _lllIlIllIl.Misc then warn("\091\076\097\103\032\083\119\105\116\099\104\093\032\077\105\115\099\032\084\097\098\032\110\111\116\032\102\111\117\110\100\033") return end
 local _llIlIllIIl = _lllIlIllIl.Misc local _lIIlllIlII = false local _lIIlIllllI = "\070\049\050" local _IIIlllIIIl = false local _IllIlIIlII = nil local _lIlIIIlIlI = 1.5 local _llIlIllIII = 0xF4240 local function _llIllIIlIl() if not _lIIlllIlII or _IIIlllIIIl then return end
 _IIIlllIIIl = true local _IIlIllllll = tick() while tick() - _IIlIllllll < _lIlIIIlIlI do for i = 0x1, _llIlIllIII do local _lIlIIlIlIl = math.random(0x1, 0xF4240) * math.random(0x1, 0xF4240) local _lIIIIIIIIl = math.sqrt(math.random(0x1, 0xF4240)) local _llllIlIIII = _lIlIIlIlIl / math.random(0x1, 0x2710) end
 end
 _IIIlllIIIl = false end
 local function _lIlIlIIlll() local _lIlIIlIIll = game:GetService("\067\111\114\101\071\117\105") local _IlllIIIlIl = _lIlIIlIIll:FindFirstChild("\076\097\103\083\119\105\116\099\104\070\108\111\097\116\105\110\103\066\117\116\116\111\110\071\085\073") if _IlllIIIlIl then pcall( function () _IlllIIIlIl:Destroy() end
 ) end
 local _IIIIlIllll = Instance.new("\083\099\114\101\101\110\071\117\105") _IIIIlIllll.Name = "\076\097\103\083\119\105\116\099\104\070\108\111\097\116\105\110\103\066\117\116\116\111\110\071\085\073" _IIIIlIllll.ResetOnSpawn = false _IIIIlIllll.Parent = _lIlIIlIIll local _lIlIIlIlll = Instance.new("\084\101\120\116\066\117\116\116\111\110") _lIlIIlIlll.Size = UDim2.new(0x0, 0xA0, 0x0, 0x37) local _IlIIllIIIl = (workspace.CurrentCamera.ViewportSize.X / 0x2) - 0x50 local _IllIllllII = (workspace.CurrentCamera.ViewportSize.Y / 0x2) - 0x1B _lIlIIlIlll.Position = UDim2.new(0x0, _IlIIllIIIl, 0x0, _IllIllllII) _lIlIIlIlll.Text = "\076\065\071\058\032\079\070\070" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _lIlIIlIlll.TextColor3 = Color3.fromHex("\035\102\102\099\099\099\099") _lIlIIlIlll.Font = Enum.Font.GothamBold _lIlIIlIlll.TextSize = 0xE _lIlIIlIlll.AutoButtonColor = false _lIlIIlIlll.Parent = _IIIIlIllll local _IlIIIllIlI = Instance.new("\085\073\067\111\114\110\101\114") _IlIIIllIlI.CornerRadius = UDim.new(0.2, 0x0) _IlIIIllIlI.Parent = _lIlIIlIlll local _lIIlllllIl = Instance.new("\085\073\083\116\114\111\107\101") _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIIlllllIl.Thickness = 0x2 _lIIlllllIl.Parent = _lIlIIlIlll local _IlIlIllIll = false local _llIIlIIllI, _IIIllIIIIl _lIlIIlIlll.InputBegan:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = true _llIIlIIllI = input.Position _IIIllIIIIl = _lIlIIlIlll.Position _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _lIlIIlIlll.Text = "\068\082\065\071\046\046\046" end
 end
 ) _lIlIIlIlll.InputChanged:Connect( function (input) if _IlIlIllIll and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then local _lllIIlIllI = input.Position - _llIIlIIllI _lIlIIlIlll.Position = UDim2.new(0x0, _IIIllIIIIl.X.Offset + _lllIIlIllI.X, 0x0, _IIIllIIIIl.Y.Offset + _lllIIlIllI.Y) end
 end
 ) _lIlIIlIlll.InputEnded:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = false _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIlIIlIlll.Text = "\076\065\071\058\032\079\070\070" end
 end
 ) local function _IlllIllIll() if not _IlIlIllIll and _lIIlllIlII then _lIlIIlIlll.Text = "\076\065\071\058\032\065\067\084\073\086\069" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\051\100\048\048\048\048") _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _llIllIIlIl() _lIlIIlIlll.Text = "\076\065\071\058\032\079\070\070" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") end
 end
 _lIlIIlIlll.MouseButton1Click:Connect(_IlllIllIll) _lIlIIlIlll.TouchTap:Connect(_IlllIllIll) return _IIIIlIllll end
 local _IIIlIllIII = _llIlIllIIl:Section({ Title = "\076\097\103\032\083\119\105\116\099\104", Side = "\076\101\102\116", }) _IIIlIllIII:Toggle({ Title = "\069\110\097\098\108\101\032\076\097\103\032\083\119\105\116\099\104", Flag = "\076\097\103\083\119\105\116\099\104\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) _lIIlllIlII = _IIlIIllllI end
 , }) _IIIlIllIII:Slider({ Title = "\076\097\103\032\068\117\114\097\116\105\111\110\032\040\115\101\099\111\110\100\115\041", Flag = "\076\097\103\068\117\114\097\116\105\111\110\083\108\105\100\101\114", Value = { Min = 0.1, Max = 0x5, Default = 1.5 }, Step = 0.1, Callback = function (value) _lIlIIIlIlI = value end
 , }) _IIIlIllIII:Slider({ Title = "\076\097\103\032\073\110\116\101\110\115\105\116\121", Flag = "\076\097\103\073\110\116\101\110\115\105\116\121\083\108\105\100\101\114", Value = { Min = 0x186A0, Max = 0x4C4B40, Default = 0xF4240 }, Callback = function (value) _llIlIllIII = value end
 , }) _IIIlIllIII:Toggle({ Title = "\083\104\111\119\032\070\108\111\097\116\105\110\103\032\066\117\116\116\111\110", Flag = "\076\097\103\070\108\111\097\116\105\110\103\066\117\116\116\111\110\084\111\103\103\108\101", Value = false, Callback = function (_IIlIIllllI) if _IIlIIllllI then _IllIlIIlII = _lIlIlIIlll() else if _IllIlIIlII then pcall( function () _IllIlIIlII:Destroy() end
 ) _IllIlIIlII = nil end
 end
 end
 , }) _IIIlIllIII:Keybind({ Title = "\076\097\103\032\075\101\121\098\105\110\100", Flag = "\076\097\103\075\101\121\098\105\110\100", Default = "\070\049\050", Mode = "\080\114\101\115\115", Callback = _llIllIIlIl, ChangedCallback = function (newKey) _lIIlIllllI = newKey end
 , }) _IIIlIllIII:Button({ Title = "\084\114\105\103\103\101\114\032\076\097\103\032\078\111\119", Callback = _llIllIIlIl, }) UserInputService.InputBegan:Connect( function (input, gameProcessed) if gameProcessed then return end
 if input.KeyCode == Enum.KeyCode[_lIIlIllllI] then _llIllIIlIl() end
 end
 ) print("\091\072\121\112\101\114\032\080\117\114\101\032\076\097\103\032\083\119\105\116\099\104\093\032\076\111\097\100\101\100\032\115\117\099\099\101\115\115\102\117\108\108\121\032\119\105\116\104\111\117\116\032\101\120\116\114\097\115\033") end
 ) pcall( function () local Players = game:GetService("\080\108\097\121\101\114\115") local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101") local UserInputService = game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101") local _lllIIIllII = Players.LocalPlayer if not _lllIlIllIl then warn("\091\068\101\109\111\110\032\077\111\100\101\093\032\084\097\098\115\032\110\111\116\032\102\111\117\110\100\033") return end
 local _llIlIllIIl = _lllIlIllIl.Misc if not _llIlIllIIl then warn("\091\068\101\109\111\110\032\077\111\100\101\093\032\077\105\115\099\084\097\098\032\110\111\116\032\102\111\117\110\100\033") return end
 local function _IIIlIlIIll(title, content, duration) pcall( function () if WindUI and WindUI.Notify then WindUI:Notify({ Title = title, Content = content, Duration = duration or 0x2 }) else print("\091" .. title .. "\093\032" .. content) end
 end
 ) end
 local _IlIlllIlII = false local _lIIIlIlIIl = "\075" local _lIlIlllllI = false local _IllIlIIlII = nil local _IIIlllIlIl = 0x64 local _llllllllII = 0x50 local _lIlIIIlIlI = 0.3 local _llIlIllIII = 0xF4240 local function _IllllllllI() local _IIlIllllll = tick() while tick() - _IIlIllllll < _lIlIIIlIlI do for i = 0x1, _llIlIllIII do local _lIlIIlIlIl = math.random(0x1, 0xF4240) * math.random(0x1, 0xF4240) local _lIIIIIIIIl = math.sqrt(math.random(0x1, 0xF4240)) local _llllIlIIII = _lIlIIlIlIl / math.random(0x1, 0x2710) end
 end
 end
 local function _IllIIIlIlI() local _llllIIllII = _lllIIIllII.Character if not _llllIIllII then return false end
 local _IIIIIlIlll = _llllIIllII:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if not _IIIIIlIlll then return false end
 local _IIIIllllII = _IIIIIlIlll.Position.Y local _lIIIlllllI = _IIIIllllII + _IIIlllIlIl local _lIlllllIlI = Instance.new("\066\111\100\121\086\101\108\111\099\105\116\121") _lIlllllIlI.MaxForce = Vector3.new(0x0, 1e9, 0x0) _lIlllllIlI.Velocity = Vector3.new(0x0, _llllllllII, 0x0) _lIlllllIlI.Parent = _IIIIIlIlll local _IIlIllllll = tick() while _IIIIIlIlll and _IIIIIlIlll.Position.Y < _lIIIlllllI and (tick() - _IIlIllllll < 0x3) do task.wait() end
 _lIlllllIlI:Destroy() local _IIIlIIlIll = _IIIIIlIlll and _IIIIIlIlll.Position.Y or _IIIIllllII local _lIIllllIlI = _IIIlIIlIll - _IIIIllllII _IIIlIlIIll("\068\101\109\111\110\032\077\111\100\101", "\082\111\115\101\032" .. math.floor(_lIIllllIlI) .. "\032\109\101\116\101\114\115", 0x2) return true end
 local function _lllIIlIllI() if not _IlIlllIlII then _IIIlIlIIll("\068\101\109\111\110\032\077\111\100\101", "\069\110\097\098\108\101\032\068\101\109\111\110\032\077\111\100\101\032\102\105\114\115\116", 0x2) return end
 if _lIlIlllllI then return end
 _lIlIlllllI = true _IIIlIlIIll("\068\101\109\111\110\032\077\111\100\101", "\065\099\116\105\118\097\116\105\110\103\046\046\046", 0x1) _IllllllllI() _IllIIIlIlI() _lIlIlllllI = false end
 local function _lllIIIIIlI(_IIlIIllllI) _IlIlllIlII = _IIlIIllllI _IIIlIlIIll("\068\101\109\111\110\032\077\111\100\101", _IIlIIllllI and "\069\110\097\098\108\101\100" or "\068\105\115\097\098\108\101\100", 0x2) end
 local function _IllIIIlIll() local _lIlIIlIIll = game:GetService("\067\111\114\101\071\117\105") local _IlllIIIlIl = _lIlIIlIIll:FindFirstChild("\068\101\109\111\110\070\108\111\097\116\105\110\103\066\117\116\116\111\110") if _IlllIIIlIl then _IlllIIIlIl:Destroy() end
 local _IIIIlIllll = Instance.new("\083\099\114\101\101\110\071\117\105") _IIIIlIllll.Name = "\068\101\109\111\110\070\108\111\097\116\105\110\103\066\117\116\116\111\110" _IIIIlIllll.ResetOnSpawn = false _IIIIlIllll.Parent = _lIlIIlIIll local _lIlIIlIlll = Instance.new("\084\101\120\116\066\117\116\116\111\110") _lIlIIlIlll.Size = UDim2.new(0x0, 0xA0, 0x0, 0x37) local _IlIIllIIIl = (workspace.CurrentCamera.ViewportSize.X / 0x2) - 0x50 local _IllIllllII = (workspace.CurrentCamera.ViewportSize.Y / 0x2) - 0x1B _lIlIIlIlll.Position = UDim2.new(0x0, _IlIIllIIIl, 0x0, _IllIllllII) _lIlIIlIlll.Text = "\068\069\077\079\078" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _lIlIIlIlll.TextColor3 = Color3.fromHex("\035\102\102\099\099\099\099") _lIlIIlIlll.Font = Enum.Font.GothamBold _lIlIIlIlll.TextSize = 0x10 _lIlIIlIlll.AutoButtonColor = false _lIlIIlIlll.Parent = _IIIIlIllll local _IlIIIllIlI = Instance.new("\085\073\067\111\114\110\101\114") _IlIIIllIlI.CornerRadius = UDim.new(0.2, 0x0) _IlIIIllIlI.Parent = _lIlIIlIlll local _lIIlllllIl = Instance.new("\085\073\083\116\114\111\107\101") _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIIlllllIl.Thickness = 0x2 _lIIlllllIl.Parent = _lIlIIlIlll local _IlIlIllIll = false local _llIIlIIllI = nil local _IIIllIIIIl = nil _lIlIIlIlll.InputBegan:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = true _llIIlIIllI = input.Position _IIIllIIIIl = _lIlIIlIlll.Position _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _lIlIIlIlll.Text = "\068\082\065\071\046\046\046" end
 end
 ) _lIlIIlIlll.InputChanged:Connect( function (input) if _IlIlIllIll then if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement then local _lllIIlIllI = input.Position - _llIIlIIllI local _llllIllIII = _IIIllIIIIl.X.Offset + _lllIIlIllI.X local _IlIIlIlIIl = _IIIllIIIIl.Y.Offset + _lllIIlIllI.Y _lIlIIlIlll.Position = UDim2.new(0x0, _llllIllIII, 0x0, _IlIIlIlIIl) end
 end
 end
 ) _lIlIIlIlll.InputEnded:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = false _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIlIIlIlll.Text = "\068\069\077\079\078" end
 end
 ) local function _lIlIIlIllI() _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\051\100\048\048\048\048") _lIlIIlIlll.TextColor3 = Color3.fromRGB(0xFF, 0xFF, 0xFF) _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _lllIIlIllI() _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _lIlIIlIlll.TextColor3 = Color3.fromHex("\035\102\102\099\099\099\099") _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") end
 _lIlIIlIlll.MouseButton1Click:Connect( function () if not _IlIlIllIll then _lIlIIlIllI() end
 end
 ) _lIlIIlIlll.TouchTap:Connect( function () if not _IlIlIllIll then _lIlIIlIllI() end
 end
 ) return _IIIIlIllll end
 local function _IlIllIllll() if _IllIlIIlII then local _IIlllIIIIl = _IllIlIIlII:FindFirstChildOfClass("\084\101\120\116\066\117\116\116\111\110") if _IIlllIIIIl then _IIlllIIIIl.Text = "\068\069\077\079\078" _IIlllIIIIl.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _IIlllIIIIl.TextColor3 = Color3.fromHex("\035\102\102\099\099\099\099") end
 end
 end
 UserInputService.InputBegan:Connect( function (input, gameProcessed) if gameProcessed then return end
 if input.KeyCode == Enum.KeyCode[_lIIIlIlIIl] then _lllIIlIllI() end
 end
 ) local _lllIllIIIl = _llIlIllIIl:Section({ Title = "\068\101\109\111\110\032\077\111\100\101", Side = "\076\101\102\116", Collapsed = false, }) _lllIllIIIl:Toggle({ Title = "\069\110\097\098\108\101\032\068\101\109\111\110\032\077\111\100\101", Value = false, Callback = _lllIIIIIlI, }) _lllIllIIIl:Slider({ Title = "\082\105\115\101\032\072\101\105\103\104\116\032\040\109\101\116\101\114\115\041", Value = { Min = 0xA, Max = 0x1F4, Default = 0x64 }, Callback = function (value) _IIIlllIlIl = value end
 , }) _lllIllIIIl:Slider({ Title = "\082\105\115\101\032\083\112\101\101\100", Value = { Min = 0x14, Max = 0xC8, Default = 0x50 }, Callback = function (value) _llllllllII = value end
 , }) _lllIllIIIl:Slider({ Title = "\076\097\103\032\068\117\114\097\116\105\111\110\032\040\115\101\099\111\110\100\115\041", Value = { Min = 0.1, Max = 0x2, Default = 0.3 }, Step = 0.1, Callback = function (value) _lIlIIIlIlI = value end
 , }) _lllIllIIIl:Slider({ Title = "\076\097\103\032\073\110\116\101\110\115\105\116\121", Value = { Min = 0x186A0, Max = 0x4C4B40, Default = 0xF4240 }, Callback = function (value) _llIlIllIII = value end
 , }) _lllIllIIIl:Toggle({ Title = "\083\104\111\119\032\070\108\111\097\116\105\110\103\032\066\117\116\116\111\110", Value = false, Callback = function (_IIlIIllllI) if _IIlIIllllI then _IllIlIIlII = _IllIIIlIll() else if _IllIlIIlII then pcall( function () _IllIlIIlII:Destroy() end
 ) _IllIlIIlII = nil end
 end
 end
 , }) _lllIllIIIl:Keybind({ Title = "\068\101\109\111\110\032\075\101\121\098\105\110\100", Default = "\075", Mode = "\080\114\101\115\115", Callback = _lllIIlIllI, ChangedCallback = function (newKey) _lIIIlIlIIl = newKey end
 , }) _lllIllIIIl:Button({ Title = "\065\099\116\105\118\097\116\101\032\068\101\109\111\110\032\077\111\100\101\032\078\111\119", Callback = _lllIIlIllI, }) print("\091\068\101\109\111\110\032\077\111\100\101\093\032\076\111\097\100\101\100\032\115\117\099\099\101\115\115\102\117\108\108\121\033") _IIIlIlIIll("\068\101\109\111\110\032\077\111\100\101", "\083\101\099\116\105\111\110\032\076\111\097\100\101\100\032\083\117\099\099\101\115\115\102\117\108\108\121\033", 0x3) end
 ) pcall( function () local Players = game:GetService("\080\108\097\121\101\114\115") local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101") local UserInputService = game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101") local _lllIIIllII = Players.LocalPlayer local _IIIlIlllIl = false local _lIlIlIllll = workspace.Gravity local _IllIIlIlII = 0xA local _IIIllIllll = "\071" local _lIllIIllll = nil local function _IlIllIlIlI() _IIIlIlllIl = not _IIIlIlllIl if _IIIlIlllIl then workspace.Gravity = _IllIIlIlII else workspace.Gravity = _lIlIlIllll end
 if _lIllIIllll then local _IIlllIIIIl = _lIllIIllll:FindFirstChildOfClass("\084\101\120\116\066\117\116\116\111\110") if _IIlllIIIIl then _IIlllIIIIl.Text = _IIIlIlllIl and "\071\082\065\086\073\084\089\058\032\079\078" or "\071\082\065\086\073\084\089\058\032\079\070\070" end
 end
 end
 local function _lIIIlllIll() local _lIlIIlIIll = game:GetService("\067\111\114\101\071\117\105") local _IlllIIIlIl = _lIlIIlIIll:FindFirstChild("\071\114\097\118\105\116\121\070\108\111\097\116\105\110\103\066\117\116\116\111\110") if _IlllIIIlIl then _IlllIIIlIl:Destroy() end
 local _IIIIlIllll = Instance.new("\083\099\114\101\101\110\071\117\105") _IIIIlIllll.Name = "\071\114\097\118\105\116\121\070\108\111\097\116\105\110\103\066\117\116\116\111\110" _IIIIlIllll.ResetOnSpawn = false _IIIIlIllll.Parent = _lIlIIlIIll local _lIlIIlIlll = Instance.new("\084\101\120\116\066\117\116\116\111\110") _lIlIIlIlll.Size = UDim2.new(0x0, 0xA0, 0x0, 0x37) local _IlIIllIIIl = (workspace.CurrentCamera.ViewportSize.X / 0x2) - 0x50 local _IllIllllII = (workspace.CurrentCamera.ViewportSize.Y / 0x2) - 0x1B _lIlIIlIlll.Position = UDim2.new(0x0, _IlIIllIIIl, 0x0, _IllIllllII) _lIlIIlIlll.Text = "\071\082\065\086\073\084\089\058\032\079\070\070" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\049\097\048\048\048\048") _lIlIIlIlll.TextColor3 = Color3.fromHex("\035\102\102\099\099\099\099") _lIlIIlIlll.Font = Enum.Font.GothamBold _lIlIIlIlll.TextSize = 0xE _lIlIIlIlll.AutoButtonColor = false _lIlIIlIlll.Parent = _IIIIlIllll local _IlIIIllIlI = Instance.new("\085\073\067\111\114\110\101\114") _IlIIIllIlI.CornerRadius = UDim.new(0.2, 0x0) _IlIIIllIlI.Parent = _lIlIIlIlll local _lIIlllllIl = Instance.new("\085\073\083\116\114\111\107\101") _lIIlllllIl.Color = Color3.fromHex("\035\054\054\048\048\048\048") _lIIlllllIl.Thickness = 0x2 _lIIlllllIl.Parent = _lIlIIlIlll local _IlIlIllIll = false local _llIIlIIllI, _IIIllIIIIl _lIlIIlIlll.InputBegan:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = true _llIIlIIllI = input.Position _IIIllIIIIl = _lIlIIlIlll.Position _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _lIlIIlIlll.Text = "\068\082\065\071\046\046\046" end
 end
 ) _lIlIIlIlll.InputChanged:Connect( function (input) if _IlIlIllIll and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then local _lllIIlIllI = input.Position - _llIIlIIllI _lIlIIlIlll.Position = UDim2.new(0x0, _IIIllIIIIl.X.Offset + _lllIIlIllI.X, 0x0, _IIIllIIIIl.Y.Offset + _lllIIlIllI.Y) end
 end
 ) _lIlIIlIlll.InputEnded:Connect( function (input) if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then _IlIlIllIll = false _lIIlllllIl.Color = _IIIlIlllIl and Color3.fromHex("\035\102\102\052\052\052\052") or Color3.fromHex("\035\054\054\048\048\048\048") _lIlIIlIlll.Text = _IIIlIlllIl and "\071\082\065\086\073\084\089\058\032\079\078" or "\071\082\065\086\073\084\089\058\032\079\070\070" end
 end
 ) local function _IlllIllIll() if not _IlIlIllIll then _lIlIIlIlll.Text = "\071\082\065\086\073\084\089\058\032\065\067\084\073\086\069" _lIlIIlIlll.BackgroundColor3 = Color3.fromHex("\035\051\100\048\048\048\048") _lIIlllllIl.Color = Color3.fromHex("\035\102\102\052\052\052\052") _IlIllIlIlI() _lIlIIlIlll.Text = _IIIlIlllIl and "\071\082\065\086\073\084\089\058\032\079\078" or "\071\082\065\086\073\084\089\058\032\079\070\070" _lIlIIlIlll.BackgroundColor3 = _IIIlIlllIl and Color3.fromHex("\035\051\100\048\048\048\048") or Color3.fromHex("\035\049\097\048\048\048\048") _lIIlllllIl.Color = _IIIlIlllIl and Color3.fromHex("\035\102\102\052\052\052\052") or Color3.fromHex("\035\054\054\048\048\048\048") if _lIlIlIIIlI then _lIlIlIIIlI:SetValue(_IIIlIlllIl) end
 end
 end
 _lIlIIlIlll.MouseButton1Click:Connect(_IlllIllIll) _lIlIIlIlll.TouchTap:Connect(_IlllIllIll) return _IIIIlIllll end
 UserInputService.InputBegan:Connect( function (input, gameProcessed) if gameProcessed then return end
 if input.KeyCode == Enum.KeyCode[_IIIllIllll] then _IlIllIlIlI() if _lIlIlIIIlI then _lIlIlIIIlI:SetValue(_IIIlIlllIl) end
 end
 end
 ) local _lIIllIIlIl = _lllIlIllIl.Misc:Section({ Title = "\071\114\097\118\105\116\121\032\067\111\110\116\114\111\108", Side = "\076\101\102\116", Collapsed = true, }) local _lIlIlIIIlI = _lIIllIIlIl:Toggle({ Title = "\071\114\097\118\105\116\121", Desc = "\077\111\100\105\102\121\032\119\111\114\107\115\112\097\099\101\032\103\114\097\118\105\116\121", Value = false, Callback = function (_IIlIIllllI) _IIIlIlllIl = _IIlIIllllI if _IIlIIllllI then workspace.Gravity = _IllIIlIlII else workspace.Gravity = _lIlIlIllll end
 if _lIllIIllll then local _IIlllIIIIl = _lIllIIllll:FindFirstChildOfClass("\084\101\120\116\066\117\116\116\111\110") if _IIlllIIIIl then _IIlllIIIIl.Text = _IIIlIlllIl and "\071\082\065\086\073\084\089\058\032\079\078" or "\071\082\065\086\073\084\089\058\032\079\070\070" end
 end
 end
 }) _lIIllIIlIl:Input({ Title = "\071\114\097\118\105\116\121\032\086\097\108\117\101", Desc = "\068\101\102\097\117\108\116\058\032\049\048\032\040\076\111\119\101\114\032\061\032\108\101\115\115\032\103\114\097\118\105\116\121\041", Default = "\049\048", Placeholder = "\049\048", Numeric = true, Callback = function (value) local _IIllIlIlIl = tonumber(value) if _IIllIlIlIl and _IIllIlIlIl > 0x0 then _IllIIlIlII = _IIllIlIlIl if _IIIlIlllIl then workspace.Gravity = _IllIIlIlII end
 WindUI:Notify({ Title = "\071\114\097\118\105\116\121", Content = "\083\101\116\032\116\111\058\032" .. _IIllIlIlIl, Duration = 0x1 }) elseif _IIllIlIlIl and _IIllIlIlIl <= 0x0 then WindUI:Notify({ Title = "\069\114\114\111\114", Content = "\071\114\097\118\105\116\121\032\109\117\115\116\032\098\101\032\112\111\115\105\116\105\118\101", Duration = 0x2 }) end
 end
 }) _lIIllIIlIl:Toggle({ Title = "\083\104\111\119\032\070\108\111\097\116\105\110\103\032\066\117\116\116\111\110", Desc = "\083\104\111\119\047\104\105\100\101\032\103\114\097\118\105\116\121\032\102\108\111\097\116\105\110\103\032\098\117\116\116\111\110", Value = false, Callback = function (_IIlIIllllI) if _IIlIIllllI then _lIllIIllll = _lIIIlllIll() else if _lIllIIllll then _lIllIIllll:Destroy() _lIllIIllll = nil end
 end
 end
 }) _lIIllIIlIl:Keybind({ Title = "\071\114\097\118\105\116\121\032\075\101\121\098\105\110\100", Default = "\071", Mode = "\084\111\103\103\108\101", Callback = function () _IlIllIlIlI() if _lIlIlIIIlI then _lIlIlIIIlI:SetValue(_IIIlIlllIl) end
 end
 , ChangedCallback = function (newKey) _IIIllIllll = newKey end
 }) _lIIllIIlIl:Button({ Title = "\082\101\115\101\116\032\071\114\097\118\105\116\121", Desc = "\082\101\115\101\116\032\116\111\032\111\114\105\103\105\110\097\108\032\103\097\109\101\032\103\114\097\118\105\116\121", Callback = function () _lIlIlIllll = workspace.Gravity _IllIIlIlII = _lIlIlIllll if _IIIlIlllIl then workspace.Gravity = _IllIIlIlII end
 WindUI:Notify({ Title = "\071\114\097\118\105\116\121", Content = "\082\101\115\101\116\032\116\111\058\032" .. _lIlIlIllll, Duration = 0x2 }) end
 }) print("\091\071\114\097\118\105\116\121\032\083\121\115\116\101\109\093\032\076\111\097\100\101\100\032\115\117\099\099\101\115\115\102\117\108\108\121\032\105\110\032\077\105\115\099\032\116\097\098\033") end
 ) local Players = game:GetService("\080\108\097\121\101\114\115") local UserInputService = game:GetService("\085\115\101\114\073\110\112\117\116\083\101\114\118\105\099\101") local _lllIIIllII = Players.LocalPlayer local _llIIIIIlIl = false local function _lIlIIlIIII() pcall( function () local _IIllIlIlIl = _lllIIIllII.Character if not _IIllIlIlIl then print("\10060\032\078\111\032\099\104\097\114\097\099\116\101\114\032\102\111\117\110\100") return end
 local _IIlIIIIllI = _IIllIlIlIl:FindFirstChild("\072\117\109\097\110\111\105\100") if not _IIlIIIIllI then print("\032\078\111\032\104\117\109\097\110\111\105\100\032\102\111\117\110\100") return end
 print("\069\109\111\116\101\032\112\108\097\121\101\100\033") local _lIIllIlIII = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101") local _lIlIIIlIlI = _lIIllIlIII:FindFirstChild("\069\109\111\116\101\115") if _lIlIIIlIlI then local _lIllllIlII = _lIlIIIlIlI:GetChildren()[math.random(0x1, #_lIlIIIlIlI:GetChildren())] if _lIllllIlII then local _llllIllIll = _IIlIIIIllI:LoadAnimation(_lIllllIlII) if _llllIllIll then _llllIllIll:Play() print("\032\069\109\111\116\101\032\097\110\105\109\097\116\105\111\110\032\112\108\097\121\105\110\103") end
 end
 end
 end
 ) end
 UserInputService.InputBegan:Connect( function (input, gameProcessed) if gameProcessed then return end
 if input.KeyCode == Enum.KeyCode.LeftControl or input.KeyCode == Enum.KeyCode.RightControl then if _llIIIIIlIl then _lIlIIlIIII() end
 end
 end
 ) print("\032\069\109\111\116\101\032\111\110\032\067\116\114\108\032\108\111\097\100\101\100\032\115\117\099\099\101\115\115\102\117\108\108\121\033") end
 )(...)
