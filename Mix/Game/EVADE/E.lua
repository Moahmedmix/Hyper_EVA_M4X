--[[ Protected by Lua Guard ]]

( function (...) local _IIIIlIlIIl = warn local _IIIlIIlIIl = error warn = function () end
 error = function () end
 pcall( function () print("\083\099\114\105\112\116\032\108\111\097\100\101\100\032\115\117\099\099\101\115\115\102\117\108\108\121\033") end
 ) task.spawn( function () task.wait(0x5) warn = _IIIIlIlIIl error = _IIIlIIlIIl end
 ) local Players = game:GetService("\080\108\097\121\101\114\115") local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101") local _IlIllllIII = game:GetService("\087\111\114\107\115\112\097\099\101") local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101") local _IIIIIIIllI = Players.LocalPlayer local _IllllIIlll = { ESP = Window:Tab({ Title = "\069\083\080", Icon = "\101\121\101", Locked = false }), } local _lIIllIlIII = _IllllIIlll.ESP local _IIlIllllIl = _lIIllIlIII:Section({ Title = "\080\108\097\121\101\114\032\069\083\080\032\038\032\072\105\103\104\108\105\103\104\116", Side = "\076\101\102\116", Collapsed = true, }) local _IlIlIIIIll = false local _lIlIlllllI = {} local _llllIIIlIl = nil local _lIlIllIIII = false local _IIlIlIlIlI = nil local _lllIIIlllI = {} local _lIIIllIIll = Color3.fromRGB(0xFF, 0xFF, 0xFF) local _lIIllIlIII = Color3.fromRGB(0xFF, 0x0, 0x0) local function _llIIIIIlIl(_lIIIIIIllI) if not _lIIIIIIllI then return nil end
 return _lIIIIIIllI:FindFirstChild("\072\101\097\100") or _lIIIIIIllI:FindFirstChild("\085\112\112\101\114\084\111\114\115\111") or _lIIIIIIllI:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") or _lIIIIIIllI:FindFirstChildWhichIsA("\066\097\115\101\080\097\114\116") end
 local function _llIIIIllIl(player) if not player or not player.Character then return false end
 local _lIlllIlIII = player.Character if _lIlllIlIII:GetAttribute("\068\111\119\110\101\100") == true then return true end
 local _IIlIIlllll = _lIlllIlIII:FindFirstChild("\072\117\109\097\110\111\105\100") if _IIlIIlllll and _IIlIIlllll.Health <= 0x0 then return true end
 return false end
 local function _lllIllIIII(player) if player == _IIIIIIIllI then return end
 local _lIIIIIIllI = player.Character if not _lIIIIIIllI then return end
 local _lllIlIllll = _llIIIIIlIl(_lIIIIIIllI) if not _lllIlIllll then return end
 local _IlIIIIIIll = _lIIIIIIllI:FindFirstChildOfClass("\072\117\109\097\110\111\105\100") if _IlIIIIIIll then pcall( function () _IlIIIIIIll.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None end
 ) pcall( function () _IlIIIIIIll.NameDisplayDistance = 0x0 end
 ) end
 if _lIlIlllllI[player] then _lIlIlllllI[player]:Destroy() end
 local _IlIIllIIll = Instance.new("\066\105\108\108\098\111\097\114\100\071\117\105") _IlIIllIIll.Name = "\080\108\097\121\101\114\069\083\080\095\072\121\112\101\114" _IlIIllIIll.Adornee = _lllIlIllll _IlIIllIIll.Size = UDim2.new(0x0, 0x8C, 0x0, 0x2D) _IlIIllIIll.StudsOffset = Vector3.new(0x0, 3.5, 0x0) _IlIIllIIll.AlwaysOnTop = true _IlIIllIIll.MaxDistance = 0x5DC _IlIIllIIll.Parent = _lllIlIllll local _IlIlIlllll = Instance.new("\084\101\120\116\076\097\098\101\108") _IlIlIlllll.Size = UDim2.new(0x1, 0x0, 0x1, 0x0) _IlIlIlllll.BackgroundTransparency = 0x1 _IlIlIlllll.Text = player.Name _IlIlIlllll.TextColor3 = _lIIIllIIll _IlIlIlllll.TextSize = 0xE _IlIlIlllll.Font = Enum.Font.GothamBold _IlIlIlllll.TextStrokeTransparency = 0.5 _IlIlIlllll.TextStrokeColor3 = Color3.new(0x0, 0x0, 0x0) _IlIlIlllll.Parent = _IlIIllIIll _lIlIlllllI[player] = _IlIIllIIll return _IlIIllIIll end
 local function _IlIllIIlII() for player, _IIIlIlIlII in pairs(_lIlIlllllI) do if _IIIlIlIlII and _IIIlIlIlII.Parent then _IIIlIlIlII:Destroy() end
 end
 _lIlIlllllI = {} end
 local function _lIIllIIIII() if not _IlIlIIIIll then return end
 local _IIIllllIll = _IIIIIIIllI.Character local _lIIllIIIll = _IIIllllIll and _IIIllllIll:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") for player, _IIIlIlIlII in pairs(_lIlIlllllI) do if not player or not player.Parent or not player.Character then if _IIIlIlIlII then _IIIlIlIlII:Destroy() end
 _lIlIlllllI[player] = nil else local _lIIIIIIllI = player.Character local _lllIlIllll = _llIIIIIlIl(_lIIIIIIllI) local _IlIlIlllll = _IIIlIlIlII:FindFirstChildOfClass("\084\101\120\116\076\097\098\101\108") if _lllIlIllll and _IIIlIlIlII.Adornee ~= _lllIlIllll then _IIIlIlIlII.Adornee = _lllIlIllll _IIIlIlIlII.Parent = _lllIlIllll end
 if _lllIlIllll and _IlIlIlllll then local _IIIIIlllII = _llIIIIllIl(player) local _lllIllIlII = _IIIIIlllII and _lIIllIlIII or _lIIIllIIll local _IlIllIIIll = "" if _IIIIIlllII then _IlIllIIIll = "\032\091\068\079\087\078\069\068\093" elseif _lIIIIIIllI:FindFirstChild("\082\101\118\105\118\101\115") then _IlIllIIIll = "\032\091\082\069\086\073\086\069\083\093" end
 local _lIIIIIIIIl = "" if _lIIllIIIll then local _lllllllIII = math.floor((_lllIlIllll.Position - _lIIllIIIll.Position).Magnitude) _lIIIIIIIIl = string.format("\032\091\037\100\109\093", _lllllllIII) end
 local _lIlllIIIlI = player.Name .. _lIIIIIIIIl .. _IlIllIIIll if _IlIlIlllll.Text ~= _lIlllIIIlI then _IlIlIlllll.Text = _lIlllIIIlI end
 if _IlIlIlllll.TextColor3 ~= _lllIllIlII then _IlIlIlllll.TextColor3 = _lllIllIlII end
 end
 end
 end
 for _, player in pairs(Players:GetPlayers()) do if player ~= _IIIIIIIllI and player.Character and not _lIlIlllllI[player] then _lllIllIIII(player) end
 end
 end
 local function _llllIlIIlI(player) if not player or player == _IIIIIIIllI then return end
 if not _lIlIllIIII then return end
 local _lIIIIIIllI = player.Character if not _lIIIIIIllI then return end
 local _IIIIIlllII = _llIIIIllIl(player) local _lllIllIlII = _IIIIIlllII and _lIIllIlIII or _lIIIllIIll if _lllIIIlllI[player] then local _llllIIllII = _lllIIIlllI[player] if _llllIIllII and _llllIIllII.Parent then _llllIIllII.FillColor = _lllIllIlII _llllIIllII.OutlineColor = _lllIllIlII return else _lllIIIlllI[player] = nil end
 end
 local _llllIIllII = Instance.new("\072\105\103\104\108\105\103\104\116") _llllIIllII.Name = "\072\121\112\101\114\072\105\103\104\108\105\103\104\116\095" .. player.Name _llllIIllII.Parent = _lIIIIIIllI _llllIIllII.FillTransparency = 0.3 _llllIIllII.OutlineTransparency = 0x0 _llllIIllII.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop _llllIIllII.FillColor = _lllIllIlII _llllIIllII.OutlineColor = _lllIllIlII _lllIIIlllI[player] = _llllIIllII end
 local function _IlllIlIIll() for player, _llllIIllII in pairs(_lllIIIlllI) do if _llllIIllII and _llllIIllII.Parent then _llllIIllII:Destroy() end
 end
 _lllIIIlllI = {} end
 local function _IlllllIlIl() if not _lIlIllIIII then return end
 for _, player in pairs(Players:GetPlayers()) do if player ~= _IIIIIIIllI then _llllIlIIlI(player) end
 end
 end
 _IIlIllllIl:Toggle({ Title = "\069\083\080\032\080\108\097\121\101\114\115", Flag = "\080\108\097\121\101\114\069\083\080", Desc = "\068\105\115\112\108\097\121\032\112\108\097\121\101\114\032\110\097\109\101\115\032\119\105\116\104\032\100\105\115\116\097\110\099\101\032\097\110\100\032\115\116\097\116\117\115", Value = false, Callback = function (state) _IlIlIIIIll = state if state then _IlIllIIlII() _lIIllIIIII() if _llllIIIlIl then _llllIIIlIl:Disconnect() end
 _llllIIIlIl = RunService.Heartbeat:Connect(_lIIllIIIII) WindUI:Notify({ Title = "\069\083\080", Content = "\080\108\097\121\101\114\115\032\069\083\080\032\069\110\097\098\108\101\100", Duration = 0x2 }) else if _llllIIIlIl then _llllIIIlIl:Disconnect() _llllIIIlIl = nil end
 _IlIllIIlII() WindUI:Notify({ Title = "\069\083\080", Content = "\080\108\097\121\101\114\115\032\069\083\080\032\068\105\115\097\098\108\101\100", Duration = 0x2 }) end
 end
 , }) _IIlIllllIl:Dropdown({ Title = "\078\111\114\109\097\108\032\067\111\108\111\114", Flag = "\078\111\114\109\097\108\067\111\108\111\114\068\114\111\112\100\111\119\110", Values = { "\087\104\105\116\101", "\066\108\111\111\100\032\082\101\100", "\079\099\101\097\110\032\068\101\101\112", "\082\101\100", "\071\114\101\101\110", "\066\108\117\101", "\089\101\108\108\111\119", "\067\121\097\110", "\080\117\114\112\108\101" }, Default = "\087\104\105\116\101", Callback = function (value) local _lIIIIlllIl = { White = Color3.fromRGB(0xFF, 0xFF, 0xFF), ["\066\108\111\111\100\032\082\101\100"] = Color3.fromHex("\035\102\102\050\050\050\050"), ["\079\099\101\097\110\032\068\101\101\112"] = Color3.fromRGB(0x0, 0x44, 0xAA), Red = Color3.fromRGB(0xFF, 0x0, 0x0), Green = Color3.fromRGB(0x0, 0xFF, 0x0), Blue = Color3.fromRGB(0x0, 0x0, 0xFF), Yellow = Color3.fromRGB(0xFF, 0xFF, 0x0), Cyan = Color3.fromRGB(0x0, 0xFF, 0xFF), Purple = Color3.fromRGB(0xFF, 0x0, 0xFF), } _lIIIllIIll = _lIIIIlllIl[value] or Color3.fromRGB(0xFF, 0xFF, 0xFF) if _IlIlIIIIll then _lIIllIIIII() end
 if _lIlIllIIII then _IlllllIlIl() end
 end
 , }) _IIlIllllIl:Dropdown({ Title = "\068\111\119\110\101\100\032\067\111\108\111\114", Flag = "\068\111\119\110\101\100\067\111\108\111\114\068\114\111\112\100\111\119\110", Values = { "\082\101\100", "\066\108\111\111\100\032\082\101\100", "\071\111\108\100\101\110\032\079\114\097\110\103\101", "\079\099\101\097\110\032\068\101\101\112", "\087\104\105\116\101", "\071\114\101\101\110", "\066\108\117\101", "\089\101\108\108\111\119", "\067\121\097\110", "\080\117\114\112\108\101" }, Default = "\082\101\100", Callback = function (value) local _lIIIIlllIl = { Red = Color3.fromRGB(0xFF, 0x0, 0x0), ["\066\108\111\111\100\032\082\101\100"] = Color3.fromHex("\035\102\102\050\050\050\050"), ["\071\111\108\100\101\110\032\079\114\097\110\103\101"] = Color3.fromHex("\035\102\102\097\097\048\048"), ["\079\099\101\097\110\032\068\101\101\112"] = Color3.fromRGB(0x0, 0x44, 0xAA), White = Color3.fromRGB(0xFF, 0xFF, 0xFF), Green = Color3.fromRGB(0x0, 0xFF, 0x0), Blue = Color3.fromRGB(0x0, 0x0, 0xFF), Yellow = Color3.fromRGB(0xFF, 0xFF, 0x0), Cyan = Color3.fromRGB(0x0, 0xFF, 0xFF), Purple = Color3.fromRGB(0xFF, 0x0, 0xFF), } _lIIllIlIII = _lIIIIlllIl[value] or Color3.fromRGB(0xFF, 0x0, 0x0) if _IlIlIIIIll then _lIIllIIIII() end
 if _lIlIllIIII then _IlllllIlIl() end
 end
 , }) _IIlIllllIl:Button({ Title = "\082\101\102\114\101\115\104\032\069\083\080", Desc = "\077\097\110\117\097\108\108\121\032\114\101\102\114\101\115\104\032\097\108\108\032\112\108\097\121\101\114\032\069\083\080", Callback = function () if _IlIlIIIIll then _IlIllIIlII() _lIIllIIIII() WindUI:Notify({ Title = "\069\083\080", Content = "\082\101\102\114\101\115\104\101\100", Duration = 0x1 }) else WindUI:Notify({ Title = "\069\083\080", Content = "\069\110\097\098\108\101\032\069\083\080\032\102\105\114\115\116", Duration = 0x1 }) end
 end
 , }) _IIlIllllIl:Toggle({ Title = "\080\108\097\121\101\114\032\072\105\103\104\108\105\103\104\116", Flag = "\080\108\097\121\101\114\072\105\103\104\108\105\103\104\116", Desc = "\072\105\103\104\108\105\103\104\116\032\112\108\097\121\101\114\115\032\119\105\116\104\032\099\111\108\111\114\115", Value = false, Callback = function (state) _lIlIllIIII = state if state then _IlllIlIIll() _IlllllIlIl() if _IIlIlIlIlI then _IIlIlIlIlI:Disconnect() end
 _IIlIlIlIlI = RunService.Heartbeat:Connect(_IlllllIlIl) WindUI:Notify({ Title = "\072\105\103\104\108\105\103\104\116", Content = "\069\110\097\098\108\101\100", Duration = 0x2 }) else if _IIlIlIlIlI then _IIlIlIlIlI:Disconnect() _IIlIlIlIlI = nil end
 _IlllIlIIll() WindUI:Notify({ Title = "\072\105\103\104\108\105\103\104\116", Content = "\068\105\115\097\098\108\101\100", Duration = 0x2 }) end
 end
 , }) local Players = game:GetService("\080\108\097\121\101\114\115") local _IIIIIIIllI = Players.LocalPlayer if _IIIIIIIllI.Character then task.wait(0x1) if _IlIlIIIIll then _lIIllIIIII() end
 if _lIlIllIIII then _IlllllIlIl() end
 end
 _IIIIIIIllI.CharacterAdded:Connect( function () task.wait(0x1) pcall( function () if _IlIlIIIIll then _IlIllIIlII() _lIIllIIIII() end
 end
 ) pcall( function () if _lIlIllIIII then _IlllIlIIll() _IlllllIlIl() end
 end
 ) end
 ) local _lIllIIIlIl = _IllllIIlll.ESP:Section({ Title = "\078\101\120\116\098\111\116\032\069\083\080\032\038\032\072\105\103\104\108\105\103\104\116", Side = "\076\101\102\116", Collapsed = true, }) local _lIIIllIlll = Color3.fromRGB(0xFF, 0x0, 0x0) local _IIllIlIIlI = Color3.fromRGB(0xFF, 0x0, 0x0) local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101") local _lIIlIIIlIl = false local _IllIIlIIII = false local _IIIIlIlIlI = {} local _lIlIllIlII = {} local _IIIlllIIII = nil local _llIIllIllI = {} local _lIlIllIllI = ReplicatedStorage:FindFirstChild("\078\080\067\115") if _lIlIllIllI then for _, npc in ipairs(_lIlIllIllI:GetChildren()) do table.insert(_llIIllIllI, npc.Name) end
 end
 local function _lIlIIlIlII(model) if not model or not model.Name then return false end
 for _, name in ipairs(_llIIllIllI) do if model.Name == name then return true end
 end
 local _lIIIIIIllI = model.Name:lower() return _lIIIIIIllI:find("\110\101\120\116\098\111\116") or _lIIIIIIllI:find("\115\099\112") or _lIIIIIIllI:find("\109\111\110\115\116\101\114") or _lIIIIIIllI:find("\099\114\101\101\112") or _lIIIIIIllI:find("\101\110\101\109\121") or _lIIIIIIllI:find("\122\111\109\098\105\101") or _lIIIIIIllI:find("\103\104\111\115\116") or _lIIIIIIllI:find("\100\101\109\111\110") end
 local function _llIIllIIlI(model) return model:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") or model:FindFirstChild("\072\101\097\100") or model:FindFirstChild("\084\111\114\115\111") or model:FindFirstChildWhichIsA("\066\097\115\101\080\097\114\116") end
 local _lIIIllIlll = Color3.fromHex("\035\099\099\052\052\102\102") local _IIllIlIIlI = Color3.fromHex("\035\056\056\048\048\099\099") local _lIIlIIIlIl = false local _IllIIlIIII = false local _IIIIlIlIlI = {} local _lIlIllIlII = {} local _IIIlllIIII = nil local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101") local _llIIllIllI = {} local _lIlIllIllI = ReplicatedStorage:FindFirstChild("\078\080\067\115") if _lIlIllIllI then for _, npc in ipairs(_lIlIllIllI:GetChildren()) do table.insert(_llIIllIllI, npc.Name) end
 end
 local function _lIlIIlIlII(model) if not model or not model.Name then return false end
 for _, name in ipairs(_llIIllIllI) do if model.Name == name then return true end
 end
 local _lIIIIIIllI = model.Name:lower() return _lIIIIIIllI:find("\110\101\120\116\098\111\116") or _lIIIIIIllI:find("\115\099\112") or _lIIIIIIllI:find("\109\111\110\115\116\101\114") or _lIIIIIIllI:find("\099\114\101\101\112") or _lIIIIIIllI:find("\101\110\101\109\121") or _lIIIIIIllI:find("\122\111\109\098\105\101") or _lIIIIIIllI:find("\103\104\111\115\116") or _lIIIIIIllI:find("\100\101\109\111\110") end
 local function _llIIllIIlI(model) return model:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") or model:FindFirstChild("\072\101\097\100") or model:FindFirstChild("\084\111\114\115\111") or model:FindFirstChildWhichIsA("\066\097\115\101\080\097\114\116") end
 local function _llIIlIIlll(model) if not model then return end
 local _lllIlIllll = _llIIllIIlI(model) if not _lllIlIllll then return end
 if _IIIIlIlIlI[model] then pcall( function () _IIIIlIlIlI[model]:Destroy() end
 ) end
 local _IlIIllIIll = Instance.new("\066\105\108\108\098\111\097\114\100\071\117\105") _IlIIllIIll.Name = "\078\101\120\116\098\111\116\069\083\080\095\072\121\112\101\114" _IlIIllIIll.Adornee = _lllIlIllll _IlIIllIIll.Size = UDim2.new(0x0, 0x8C, 0x0, 0x2D) _IlIIllIIll.StudsOffset = Vector3.new(0x0, 0x3, 0x0) _IlIIllIIll.AlwaysOnTop = true _IlIIllIIll.MaxDistance = 0x5DC _IlIIllIIll.Parent = _lllIlIllll local _IlIlIlllll = Instance.new("\084\101\120\116\076\097\098\101\108") _IlIlIlllll.Size = UDim2.new(0x1, 0x0, 0x1, 0x0) _IlIlIlllll.BackgroundTransparency = 0x1 _IlIlIlllll.Text = "\9888\65039\032" .. model.Name _IlIlIlllll.TextColor3 = _lIIIllIlll _IlIlIlllll.TextSize = 0xE _IlIlIlllll.Font = Enum.Font.GothamBold _IlIlIlllll.TextStrokeTransparency = 0.5 _IlIlIlllll.TextStrokeColor3 = Color3.new(0x0, 0x0, 0x0) _IlIlIlllll.Parent = _IlIIllIIll _IIIIlIlIlI[model] = _IlIIllIIll return _IlIIllIIll end
 local function _lIllIlIllI() for model, _IIIlIlIlII in pairs(_IIIIlIlIlI) do pcall( function () if _IIIlIlIlII then _IIIlIlIlII:Destroy() end
 end
 ) end
 _IIIIlIlIlI = {} end
 local function _IIIIlIllll() if not _lIIlIIIlIl then return end
 local _IIIllllIll = _IIIIIIIllI.Character local _lIIllIIIll = _IIIllllIll and _IIIllllIll:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") local _lIIIIIlllI = {} local _lIlIllIlll = workspace:FindFirstChild("\071\097\109\101") and workspace.Game:FindFirstChild("\080\108\097\121\101\114\115") if _lIlIllIlll then for _, model in pairs(_lIlIllIlll:GetChildren()) do if model:IsA("\077\111\100\101\108") and _lIlIIlIlII(model) then _lIIIIIlllI[model] = true end
 end
 end
 local _llllllllIl = workspace:FindFirstChild("\078\080\067\115") if _llllllllIl then for _, model in pairs(_llllllllIl:GetChildren()) do if model:IsA("\077\111\100\101\108") and _lIlIIlIlII(model) then _lIIIIIlllI[model] = true end
 end
 end
 for model in pairs(_lIIIIIlllI) do local _lllIlIllll = _llIIllIIlI(model) if _lllIlIllll then if not _IIIIlIlIlI[model] then _llIIlIIlll(model) end
 local _IIIlIlIlII = _IIIIlIlIlI[model] if _IIIlIlIlII then local _IlIlIlllll = _IIIlIlIlII:FindFirstChildOfClass("\084\101\120\116\076\097\098\101\108") if _IlIlIlllll then if _IIIlIlIlII.Adornee ~= _lllIlIllll then _IIIlIlIlII.Adornee = _lllIlIllll _IIIlIlIlII.Parent = _lllIlIllll end
 local _lIIIIIIIIl = "" if _lIIllIIIll then local _lllllllIII = math.floor((_lllIlIllll.Position - _lIIllIIIll.Position).Magnitude) _lIIIIIIIIl = string.format("\032\091\037\100\109\093", _lllllllIII) end
 local _lIlllIIIlI = "\9888\65039\032" .. model.Name .. _lIIIIIIIIl if _IlIlIlllll.Text ~= _lIlllIIIlI then _IlIlIlllll.Text = _lIlllIIIlI end
 if _IlIlIlllll.TextColor3 ~= _lIIIllIlll then _IlIlIlllll.TextColor3 = _lIIIllIlll end
 end
 end
 end
 end
 for model, _IIIlIlIlII in pairs(_IIIIlIlIlI) do if not _lIIIIIlllI[model] or not model.Parent then pcall( function () if _IIIlIlIlII then _IIIlIlIlII:Destroy() end
 end
 ) _IIIIlIlIlI[model] = nil end
 end
 end
 local function _lIlIllIlll(model) if not _IllIIlIIII then return end
 if not model or not model.Parent then return end
 if _lIlIllIlII[model] then local _llllIIllII = _lIlIllIlII[model] if _llllIIllII and _llllIIllII.Parent then _llllIIllII.FillColor = _IIllIlIIlI _llllIIllII.OutlineColor = _IIllIlIIlI return else _lIlIllIlII[model] = nil end
 end
 local _llllIIllII = Instance.new("\072\105\103\104\108\105\103\104\116") _llllIIllII.Name = "\078\101\120\116\098\111\116\072\105\103\104\108\105\103\104\116\095\072\121\112\101\114" _llllIIllII.Parent = model _llllIIllII.FillTransparency = 0.3 _llllIIllII.OutlineTransparency = 0x0 _llllIIllII.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop _llllIIllII.FillColor = _IIllIlIIlI _llllIIllII.OutlineColor = _IIllIlIIlI _lIlIllIlII[model] = _llllIIllII end
 local function _IlIIlllIll() for model, _llllIIllII in pairs(_lIlIllIlII) do pcall( function () if _llllIIllII then _llllIIllII:Destroy() end
 end
 ) end
 _lIlIllIlII = {} end
 local function _lIllllIIll() if not _IllIIlIIII then return end
 local _lIlIllIIII = {} local _lIlIllIlll = workspace:FindFirstChild("\071\097\109\101") and workspace.Game:FindFirstChild("\080\108\097\121\101\114\115") if _lIlIllIlll then for _, model in pairs(_lIlIllIlll:GetChildren()) do if model:IsA("\077\111\100\101\108") and _lIlIIlIlII(model) then _lIlIllIIII[model] = true _lIlIllIlll(model) end
 end
 end
 local _llllllllIl = workspace:FindFirstChild("\078\080\067\115") if _llllllllIl then for _, model in pairs(_llllllllIl:GetChildren()) do if model:IsA("\077\111\100\101\108") and _lIlIIlIlII(model) then _lIlIllIIII[model] = true _lIlIllIlll(model) end
 end
 end
 for model in pairs(_lIlIllIlII) do if not _lIlIllIIII[model] or not model.Parent then pcall( function () if _lIlIllIlII[model] then _lIlIllIlII[model]:Destroy() end
 end
 ) _lIlIllIlII[model] = nil end
 end
 end
 local function _IIlllllIll() if _IIIlllIIII then return end
 _IIIlllIIII = RunService.Heartbeat:Connect( function () if _lIIlIIIlIl then _IIIIlIllll() end
 if _IllIIlIIII then _lIllllIIll() end
 end
 ) end
 local function _lllIlIlIll() if _IIIlllIIII then _IIIlllIIII:Disconnect() _IIIlllIIII = nil end
 _lIllIlIllI() _IlIIlllIll() end
 _lIllIIIlIl:Toggle({ Title = "\078\101\120\116\098\111\116\032\069\083\080", Flag = "\078\101\120\116\098\111\116\069\083\080", Desc = "\068\105\115\112\108\097\121\032\078\101\120\116\098\111\116\032\110\097\109\101\115\032\119\105\116\104\032\100\105\115\116\097\110\099\101\032\040\080\117\114\112\108\101\032\084\104\101\109\101\041", Value = false, Callback = function (state) _lIIlIIIlIl = state if _lIIlIIIlIl or _IllIIlIIII then _IIlllllIll() else _lllIlIlIll() end
 WindUI:Notify({ Title = "\078\101\120\116\098\111\116\032\069\083\080", Content = state and "\069\110\097\098\108\101\100\032\9989" or "\068\105\115\097\098\108\101\100\032\10060", Duration = 0x2 }) end
 , }) _lIllIIIlIl:Toggle({ Title = "\078\101\120\116\098\111\116\032\072\105\103\104\108\105\103\104\116", Flag = "\078\101\120\116\098\111\116\072\105\103\104\108\105\103\104\116", Desc = "\072\105\103\104\108\105\103\104\116\032\078\101\120\116\098\111\116\115\032\119\105\116\104\032\080\117\114\112\108\101\032\099\111\108\111\114", Value = false, Callback = function (state) _IllIIlIIII = state if _lIIlIIIlIl or _IllIIlIIII then _IIlllllIll() else _lllIlIlIll() end
 WindUI:Notify({ Title = "\078\101\120\116\098\111\116\032\072\105\103\104\108\105\103\104\116", Content = state and "\069\110\097\098\108\101\100\032\9989" or "\068\105\115\097\098\108\101\100\032\10060", Duration = 0x2 }) end
 , }) _lIllIIIlIl:Dropdown({ Title = "\078\101\120\116\098\111\116\032\069\083\080\032\067\111\108\111\114", Flag = "\078\101\120\116\098\111\116\069\083\080\067\111\108\111\114\068\114\111\112\100\111\119\110", Values = { "\080\117\114\112\108\101\032\078\101\111\110", "\080\117\114\112\108\101", "\082\101\100", "\071\114\101\101\110", "\066\108\117\101", "\089\101\108\108\111\119", "\067\121\097\110", "\087\104\105\116\101" }, Default = "\080\117\114\112\108\101\032\078\101\111\110", Callback = function (value) local _lIIIIlllIl = { ["\080\117\114\112\108\101\032\078\101\111\110"] = Color3.fromHex("\035\099\099\052\052\102\102"), ["\080\117\114\112\108\101"] = Color3.fromRGB(0x80, 0x0, 0xFF), Red = Color3.fromRGB(0xFF, 0x0, 0x0), Green = Color3.fromRGB(0x0, 0xFF, 0x0), Blue = Color3.fromRGB(0x0, 0x0, 0xFF), Yellow = Color3.fromRGB(0xFF, 0xFF, 0x0), Cyan = Color3.fromRGB(0x0, 0xFF, 0xFF), White = Color3.fromRGB(0xFF, 0xFF, 0xFF), } _lIIIllIlll = _lIIIIlllIl[value] or Color3.fromHex("\035\099\099\052\052\102\102") if _lIIlIIIlIl then for model, _IIIlIlIlII in pairs(_IIIIlIlIlI) do local _IlIlIlllll = _IIIlIlIlII and _IIIlIlIlII:FindFirstChildOfClass("\084\101\120\116\076\097\098\101\108") if _IlIlIlllll then _IlIlIlllll.TextColor3 = _lIIIllIlll end
 end
 end
 end
 , }) _lIllIIIlIl:Dropdown({ Title = "\078\101\120\116\098\111\116\032\072\105\103\104\108\105\103\104\116\032\067\111\108\111\114", Flag = "\078\101\120\116\098\111\116\072\105\103\104\108\105\103\104\116\067\111\108\111\114\068\114\111\112\100\111\119\110", Values = { "\080\117\114\112\108\101\032\068\097\114\107", "\080\117\114\112\108\101", "\082\101\100", "\071\114\101\101\110", "\066\108\117\101", "\089\101\108\108\111\119", "\067\121\097\110", "\087\104\105\116\101" }, Default = "\080\117\114\112\108\101\032\068\097\114\107", Callback = function (value) local _lIIIIlllIl = { ["\080\117\114\112\108\101\032\068\097\114\107"] = Color3.fromHex("\035\056\056\048\048\099\099"), ["\080\117\114\112\108\101"] = Color3.fromRGB(0x80, 0x0, 0xFF), Red = Color3.fromRGB(0xFF, 0x0, 0x0), Green = Color3.fromRGB(0x0, 0xFF, 0x0), Blue = Color3.fromRGB(0x0, 0x0, 0xFF), Yellow = Color3.fromRGB(0xFF, 0xFF, 0x0), Cyan = Color3.fromRGB(0x0, 0xFF, 0xFF), White = Color3.fromRGB(0xFF, 0xFF, 0xFF), } _IIllIlIIlI = _lIIIIlllIl[value] or Color3.fromHex("\035\056\056\048\048\099\099") if _IllIIlIIII then for model, _llllIIllII in pairs(_lIlIllIlII) do if _llllIIllII then _llllIIllII.FillColor = _IIllIlIIlI _llllIIllII.OutlineColor = _IIllIlIIlI end
 end
 end
 end
 , }) _IIIIIIIllI.CharacterAdded:Connect( function () task.wait(0x1) if _lIIlIIIlIl or _IllIIlIIII then _lllIlIlIll() _IIlllllIll() end
 end
 ) print("\091\069\083\080\093\032\078\101\120\116\098\111\116\032\102\101\097\116\117\114\101\115\032\108\111\097\100\101\100\033") local _IllIIIlIII = _lIIllIlIII:Section({ Title = "\080\101\114\102\111\114\109\097\110\099\101\032\038\032\086\105\115\117\097\108\115", Side = "\076\101\102\116", Collapsed = true, }) local _IIlIllIlIl = false local _IlIlIlIIll = nil local _lllIIlIlII = false local _lIIlIllIll = nil local _IlIlIIIIlI = nil _IllIIIlIII:Button({ Title = "\065\110\116\105\032\076\097\103\032\049\032\045\032\066\097\115\105\099\032\067\108\101\097\110", Desc = "\082\101\109\111\118\101\115\032\104\101\097\118\121\032\115\104\097\100\111\119\115\032\097\110\100\032\101\102\102\101\099\116\115", Callback = function () local Lighting = game:GetService("\076\105\103\104\116\105\110\103") local _llIlIIlIlI = workspace:FindFirstChildOfClass("\084\101\114\114\097\105\110") Lighting.GlobalShadows = false Lighting.FogEnd = 0xF4240 Lighting.Brightness = 0x1 if _llIlIIlIlI then _llIlIIlIlI.WaterWaveSize = 0x0 _llIlIIlIlI.WaterWaveSpeed = 0x0 _llIlIIlIlI.WaterReflectance = 0x0 _llIlIIlIlI.WaterTransparency = 0x1 end
 for _, obj in ipairs(workspace:GetDescendants()) do if obj:IsA("\066\097\115\101\080\097\114\116") then obj.Material = Enum.Material.Plastic obj.Reflectance = 0x0 elseif obj:IsA("\068\101\099\097\108") or obj:IsA("\084\101\120\116\117\114\101") then obj:Destroy() elseif obj:IsA("\080\097\114\116\105\099\108\101\069\109\105\116\116\101\114") or obj:IsA("\084\114\097\105\108") then obj:Destroy() elseif obj:IsA("\080\111\105\110\116\076\105\103\104\116") or obj:IsA("\083\112\111\116\076\105\103\104\116") or obj:IsA("\083\117\114\102\097\099\101\076\105\103\104\116") then obj:Destroy() end
 end
 WindUI:Notify({ Title = "\065\110\116\105\032\076\097\103", Content = "\080\101\114\102\111\114\109\097\110\099\101\032\105\109\112\114\111\118\101\100\032\040\076\101\118\101\108\032\049\041", Duration = 0x2 }) end
 , }) _IllIIIlIII:Button({ Title = "\065\110\116\105\032\076\097\103\032\050\032\045\032\077\101\100\105\117\109\032\067\108\101\097\110", Desc = "\073\116\032\114\101\109\111\118\101\115\032\118\105\115\117\097\108\032\101\102\102\101\099\116\115\032\097\110\100\032\112\097\114\116\105\099\108\101\115\046", Callback = function () for _, v in next, game:GetDescendants() do if v:IsA("\080\097\114\116") or v:IsA("\085\110\105\111\110\079\112\101\114\097\116\105\111\110") or v:IsA("\066\097\115\101\080\097\114\116") then v.Material = Enum.Material.SmoothPlastic end
 if v:IsA("\080\097\114\116\105\099\108\101\069\109\105\116\116\101\114") or v:IsA("\083\109\111\107\101") or v:IsA("\069\120\112\108\111\115\105\111\110") or v:IsA("\083\112\097\114\107\108\101\115") or v:IsA("\070\105\114\101") then v.Enabled = false end
 if v:IsA("\066\108\111\111\109\069\102\102\101\099\116") or v:IsA("\066\108\117\114\069\102\102\101\099\116") or v:IsA("\068\101\112\116\104\079\102\070\105\101\108\100\069\102\102\101\099\116") or v:IsA("\083\117\110\082\097\121\115\069\102\102\101\099\116") then v.Enabled = false end
 if v:IsA("\068\101\099\097\108") or v:IsA("\084\101\120\116\117\114\101") then v.Texture = "" end
 if v:IsA("\083\107\121") then v.Parent = nil end
 end
 WindUI:Notify({ Title = "\065\110\116\105\032\076\097\103", Content = "\080\101\114\102\111\114\109\097\110\099\101\032\105\109\112\114\111\118\101\100\032\040\076\101\118\101\108\032\050\041", Duration = 0x2 }) end
 , }) _IllIIIlIII:Button({ Title = "\065\110\116\105\032\076\097\103\032\051\032\045\032\082\101\109\111\118\101\032\084\101\120\116\117\114\101\115", Desc = "\082\101\109\111\118\101\115\032\097\108\108\032\116\101\120\116\117\114\101\115\032\102\114\111\109\032\116\104\101\032\103\097\109\101", Callback = function () for _, part in ipairs(workspace:GetDescendants()) do if part:IsA("\080\097\114\116") or part:IsA("\077\101\115\104\080\097\114\116") or part:IsA("\085\110\105\111\110\079\112\101\114\097\116\105\111\110") then if part:IsA("\080\097\114\116") then part.Material = Enum.Material.SmoothPlastic end
 for _, texture in ipairs(part:GetChildren()) do if texture:IsA("\084\101\120\116\117\114\101") or texture:IsA("\068\101\099\097\108") then texture.Texture = "\114\098\120\097\115\115\101\116\105\100\058\047\047\048" end
 end
 end
 end
 WindUI:Notify({ Title = "\065\110\116\105\032\076\097\103", Content = "\084\101\120\116\117\114\101\115\032\114\101\109\111\118\101\100", Duration = 0x2 }) end
 , }) _IllIIIlIII:Toggle({ Title = "\078\111\032\070\111\103", Desc = "\082\101\109\111\118\101\115\032\102\111\103\032\102\114\111\109\032\116\104\101\032\103\097\109\101", Icon = "\099\108\111\117\100", Value = false, Type = "\084\111\103\103\108\101", Callback = function (state) local Lighting = game:GetService("\076\105\103\104\116\105\110\103") if state then _IlIlIlIIll = Lighting.FogEnd Lighting.FogEnd = 0xF4240 WindUI:Notify({ Title = "\078\111\032\070\111\103", Content = "\070\111\103\032\114\101\109\111\118\101\100", Duration = 0x2 }) else Lighting.FogEnd = _IlIlIlIIll or 0x186A0 WindUI:Notify({ Title = "\078\111\032\070\111\103", Content = "\070\111\103\032\114\101\115\116\111\114\101\100", Duration = 0x2 }) end
 _IIlIllIlIl = state end
 , }) _IllIIIlIII:Toggle({ Title = "\070\117\108\108\032\066\114\105\103\104\116", Desc = "\084\104\101\032\101\110\116\105\114\101\032\103\097\109\101\032\108\105\103\104\116\115\032\117\112", Icon = "\115\117\110", Value = false, Type = "\084\111\103\103\108\101", Callback = function (state) local Lighting = game:GetService("\076\105\103\104\116\105\110\103") if state then _lIIlIllIll = Lighting.Brightness _IlIlIIIIlI = Lighting.Ambient Lighting.Brightness = 0x2 Lighting.Ambient = Color3.fromRGB(0xFF, 0xFF, 0xFF) Lighting.OutdoorAmbient = Color3.fromRGB(0xFF, 0xFF, 0xFF) WindUI:Notify({ Title = "\070\117\108\108\032\066\114\105\103\104\116", Content = "\070\117\108\108\032\098\114\105\103\104\116\032\101\110\097\098\108\101\100", Duration = 0x2 }) else Lighting.Brightness = _lIIlIllIll or 0.5 Lighting.Ambient = _IlIlIIIIlI or Color3.fromRGB(0x7F, 0x7F, 0x7F) Lighting.OutdoorAmbient = Color3.fromRGB(0x7F, 0x7F, 0x7F) WindUI:Notify({ Title = "\070\117\108\108\032\066\114\105\103\104\116", Content = "\070\117\108\108\032\098\114\105\103\104\116\032\100\105\115\097\098\108\101\100", Duration = 0x2 }) end
 _lllIIlIlII = state end
 , }) _IllIIIlIII:Button({ Title = "\082\101\115\101\116\032\065\108\108\032\080\101\114\102\111\114\109\097\110\099\101\032\083\101\116\116\105\110\103\115", Desc = "\065\108\108\032\112\101\114\102\111\114\109\097\110\099\101\032\115\101\116\116\105\110\103\115\032\097\114\101\032\114\101\115\116\111\114\101\100\032\116\111\032\110\111\114\109\097\108\046", Callback = function () local Lighting = game:GetService("\076\105\103\104\116\105\110\103") Lighting.GlobalShadows = true Lighting.Brightness = 0.5 Lighting.Ambient = Color3.fromRGB(0x7F, 0x7F, 0x7F) Lighting.OutdoorAmbient = Color3.fromRGB(0x7F, 0x7F, 0x7F) Lighting.FogEnd = 0x186A0 if _IIlIllIlIl then _IIlIllIlIl = false end
 if _lllIIlIlII then _lllIIlIlII = false end
 WindUI:Notify({ Title = "\082\101\115\101\116", Content = "\065\108\108\032\115\101\116\116\105\110\103\115\032\114\101\115\101\116\032\116\111\032\100\101\102\097\117\108\116", Duration = 0x3 }) end
 , }) local _lIIIIIlIll = _lIIllIlIII:Section({ Title = "\066\097\114\114\105\101\114\115", Side = "\076\101\102\116", Collapsed = true, }) local _llIlIlllII = false local _llIlIllIIl = false local function _IIIllllIII() local _llllIlIlll = workspace:FindFirstChild("\071\097\109\101") if not _llllIlIlll then return nil end
 local _IllllllIIl = _llllIlIlll:FindFirstChild("\077\097\112") if not _IllllllIIl then return nil end
 return _IllllllIIl:FindFirstChild("\073\110\118\105\115\080\097\114\116\115") end
 local function _IIIIIIIIII(state) local _lllllIllll = _IIIllllIII() if not _lllllIllll then WindUI:Notify({ Title = "\066\097\114\114\105\101\114\115", Content = "\073\110\118\105\115\080\097\114\116\115\032\110\111\116\032\102\111\117\110\100", Duration = 0x2 }) return false end
 local _lllIIIlIII = 0x0 for _, obj in ipairs(_lllllIllll:GetDescendants()) do if obj:IsA("\066\097\115\101\080\097\114\116") then obj.CanCollide = not state obj.CanQuery = not state _lllIIIlIII = _lllIIIlIII + 0x1 end
 end
 WindUI:Notify({ Title = "\066\097\114\114\105\101\114\115", Content = string.format("\037\115\032\099\111\108\108\105\115\105\111\110\032\111\099\099\117\114\114\101\100\032\102\111\114\032\037\100\032\112\097\114\116", state and "\068\105\115\097\098\108\101" or "\097\099\116\105\118\097\116\105\111\110", _lllIIIlIII), Duration = 0x2 }) return true end
 local function _IlllIIlIlI(state) local _lllllIllll = _IIIllllIII() if not _lllllIllll then WindUI:Notify({ Title = "\066\097\114\114\105\101\114\115", Content = "\073\110\118\105\115\080\097\114\116\115\032\110\111\116\032\102\111\117\110\100", Duration = 0x2 }) return false end
 local _lllIIIlIII = 0x0 local _llllllllII = state and 0x0 or 0x1 for _, obj in ipairs(_lllllIllll:GetDescendants()) do if obj:IsA("\066\097\115\101\080\097\114\116") or obj:IsA("\068\101\099\097\108") then obj.Transparency = _llllllllII _lllIIIlIII = _lllIIIlIII + 0x1 end
 end
 WindUI:Notify({ Title = "\066\097\114\114\105\101\114\115", Content = string.format("\086\105\115\105\098\105\108\105\116\121\032\037\115\032\102\111\114\032\037\100\032\111\098\106\101\099\116\115", state and "\101\110\097\098\108\101\100" or "\100\105\115\097\098\108\101\100", _lllIIIlIII), Duration = 0x2 }) return true end
 _lIIIIIlIll:Toggle({ Title = "\082\101\109\111\118\101\032\066\097\114\114\105\101\114\115", Desc = "\068\105\115\097\098\108\101\032\098\097\114\114\105\101\114\115\032\040\112\097\115\115\032\116\104\114\111\117\103\104\032\116\104\101\109\041", Icon = "\115\104\105\101\108\100\045\111\102\102", Value = false, Type = "\084\111\103\103\108\101", Callback = function (state) _llIlIlllII = state _IIIIIIIIII(state) end
 , }) _lIIIIIlIll:Toggle({ Title = "\066\097\114\114\105\101\114\115\032\086\105\115\105\098\108\101", Desc = "\083\104\111\119\032\116\114\097\110\115\112\097\114\101\110\116\032\098\097\114\114\105\101\114\115\032\040\109\097\107\101\032\116\104\101\109\032\118\105\115\105\098\108\101\041", Icon = "\101\121\101", Value = false, Type = "\084\111\103\103\108\101", Callback = function (state) _llIlIllIIl = state _IlllIIlIlI(state) if state then local _lllllIllll = _IIIllllIII() if _lllllIllll then _lllllIllll.DescendantAdded:Connect( function (obj) if _llIlIllIIl then task.wait(0.05) if obj:IsA("\066\097\115\101\080\097\114\116") or obj:IsA("\068\101\099\097\108") then obj.Transparency = 0x0 end
 end
 end
 ) end
 end
 end
 , }) end
 )(...)
