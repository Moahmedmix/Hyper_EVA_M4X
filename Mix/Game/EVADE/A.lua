--[[ Protected by Lua Guard ]]

( function (...) local _lllIllIlII = { Auto = Window:Tab({ Title = "\065\117\116\111\032\070\097\114\109", Icon = "\115\119\111\114\100\115", Locked = false }), } if not _lllIllIlII.Auto then _lllIllIlII.Auto = Window:Tab({ Title = "\065\117\116\111\032\070\097\114\109", Icon = "\115\119\111\114\100\115", Locked = false }) end
 local _IIIIIIIlII = _lllIllIlII.Auto pcall( function () local Players = game:GetService("\080\108\097\121\101\114\115") local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101") local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101") local _IIIlIlllll = Players.LocalPlayer local _IlIlllIlII = false local _llIlIllIII = false local _IIlIIlIllI = false local _lIIlIIIllI = 0x1F4 local _IIIIlIllIl = { afk = nil, ticket = nil, cash = nil } local _lllIIlllII = nil local function _lllIlIllII() if _lllIIlllII and _lllIIlllII.Parent then return end
 _lllIIlllII = Instance.new("\080\097\114\116") _lllIIlllII.Name = "\072\121\112\101\114\070\097\114\109\080\108\097\116\102\111\114\109" _lllIIlllII.Anchored = true _lllIIlllII.CanCollide = true _lllIIlllII.Transparency = 0.5 _lllIIlllII.Material = Enum.Material.Neon _lllIIlllII.Color = Color3.fromRGB(0x0, 0x44, 0xAA) _lllIIlllII.Size = Vector3.new(0xA, 0x1, 0xA) _lllIIlllII.Position = Vector3.new(0x64, _lIIlIIIllI, 0x64) _lllIIlllII.Parent = workspace local _lIlIlIIlIl = Instance.new("\083\101\108\101\099\116\105\111\110\066\111\120") _lIlIlIIlIl.Adornee = _lllIIlllII _lIlIlIIlIl.Color3 = Color3.fromRGB(0x0, 0x44, 0xAA) _lIlIlIIlIl.Transparency = 0.5 _lIlIlIIlIl.LineThickness = 0.05 _lIlIlIIlIl.Parent = _lllIIlllII end
 local function _llIlllllll() if _lllIIlllII then _lllIIlllII:Destroy() _lllIIlllII = nil end
 end
 local function _IIlllIllll() if _IIIIlIllIl.afk then return end
 _lllIlIllII() _IIIIlIllIl.afk = RunService.RenderStepped:Connect( function () if not _IlIlllIlII then return end
 local _lIIIIIIIll = _IIIlIlllll.Character if not _lIIIIIIIll then return end
 local _IllllIIIII = _lIIIIIIIll:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if not _IllllIIIII then return end
 if _lIIIIIIIll:GetAttribute("\068\111\119\110\101\100") then pcall( function () local _lllIIIlIII = ReplicatedStorage:FindFirstChild("\069\118\101\110\116\115") and ReplicatedStorage.Events:FindFirstChild("\080\108\097\121\101\114") and ReplicatedStorage.Events.Player:FindFirstChild("\067\104\097\110\103\101\080\108\097\121\101\114\077\111\100\101") if _lllIIIlIII then _lllIIIlIII:FireServer(true) end
 end
 ) task.wait(0.5) return end
 _IllllIIIII.CFrame = _lllIIlllII.CFrame + Vector3.new(0x0, 0x3, 0x0) end
 ) WindUI:Notify({ Title = "\065\070\075\032\070\097\114\109", Content = "\083\116\097\114\116\101\100\032\097\116\032\104\101\105\103\104\116\058\032" .. _lIIlIIIllI, Duration = 0x2 }) end
 local function _lIIIlIIlIl() if _IIIIlIllIl.afk then _IIIIlIllIl.afk:Disconnect() _IIIIlIllIl.afk = nil end
 if not _llIlIllIII and not _IIlIIlIllI then _llIlllllll() end
 WindUI:Notify({ Title = "\065\070\075\032\070\097\114\109", Content = "\083\116\111\112\112\101\100", Duration = 0x2 }) end
 local function _lllIIIIIIl() if _IIIIlIllIl.ticket then return end
 _IIIIlIllIl.ticket = RunService.RenderStepped:Connect( function () if not _llIlIllIII then return end
 local _lIIIIIIIll = _IIIlIlllll.Character if not _lIIIIIIIll then return end
 local _IllllIIIII = _lIIIIIIIll:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if not _IllllIIIII then return end
 if _lIIIIIIIll:GetAttribute("\068\111\119\110\101\100") then pcall( function () local _lllIIIlIII = ReplicatedStorage:FindFirstChild("\069\118\101\110\116\115") and ReplicatedStorage.Events:FindFirstChild("\080\108\097\121\101\114") and ReplicatedStorage.Events.Player:FindFirstChild("\067\104\097\110\103\101\080\108\097\121\101\114\077\111\100\101") if _lllIIIlIII then _lllIIIlIII:FireServer(true) end
 end
 ) task.wait(0.5) return end
 local _IIlIIlllll = workspace:FindFirstChild("\071\097\109\101") and workspace.Game:FindFirstChild("\069\102\102\101\099\116\115") and workspace.Game.Effects:FindFirstChild("\084\105\099\107\101\116\115") if _IIlIIlllll then local _IlIlIIIlII = nil local _IlIIlllIll = math.huge for _, ticket in pairs(_IIlIIlllll:GetChildren()) do local _llllIlllII = ticket:IsA("\077\111\100\101\108") and (ticket:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") or ticket:FindFirstChildWhichIsA("\066\097\115\101\080\097\114\116")) or ticket if _llllIlllII and _llllIlllII:IsA("\066\097\115\101\080\097\114\116") then local _lIIIllIIIl = (_IllllIIIII.Position - _llllIlllII.Position).Magnitude if _lIIIllIIIl < _IlIIlllIll then _IlIIlllIll = _lIIIllIIIl _IlIlIIIlII = _llllIlllII end
 end
 end
 if _IlIlIIIlII then _IllllIIIII.CFrame = _IlIlIIIlII.CFrame + Vector3.new(0x0, 0x5, 0x0) task.wait(0.05) return end
 end
 if _lllIIlllII and _IlIlllIlII then _IllllIIIII.CFrame = _lllIIlllII.CFrame + Vector3.new(0x0, 0x3, 0x0) end
 end
 ) WindUI:Notify({ Title = "\084\105\099\107\101\116\032\070\097\114\109", Content = "\083\116\097\114\116\101\100\032\099\111\108\108\101\099\116\105\110\103\032\116\105\099\107\101\116\115\033", Duration = 0x2 }) end
 local function _lIlIIlIlII() if _IIIIlIllIl.ticket then _IIIIlIllIl.ticket:Disconnect() _IIIIlIllIl.ticket = nil end
 WindUI:Notify({ Title = "\084\105\099\107\101\116\032\070\097\114\109", Content = "\083\116\111\112\112\101\100", Duration = 0x2 }) end
 local function _IIllIlllll() if _IIIIlIllIl.cash then return end
 _IIIIlIllIl.cash = RunService.Stepped:Connect( function () if not _IIlIIlIllI then return end
 local _lIIIIIIIll = _IIIlIlllll.Character if not _lIIIIIIIll then return end
 local _IllllIIIII = _lIIIIIIIll:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if not _IllllIIIII then return end
 local _lIIlIIIlII = workspace:FindFirstChild("\071\097\109\101") if not _lIIlIIIlII then return end
 local _IlllIIIIIl = _lIIlIIIlII:FindFirstChild("\080\108\097\121\101\114\115") if not _IlllIIIIIl then return end
 for _, playerModel in pairs(_IlllIIIIIl:GetChildren()) do if playerModel:IsA("\077\111\100\101\108") and playerModel:GetAttribute("\068\111\119\110\101\100") then local _IlIllIIlIl = playerModel:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116") if _IlIllIIlIl then _IllllIIIII.CFrame = _IlIllIIlIl.CFrame + Vector3.new(0x0, 0x5, 0x0) task.wait(0.1) pcall( function () local _IlIIllIIII = ReplicatedStorage:FindFirstChild("\069\118\101\110\116\115") and ReplicatedStorage.Events:FindFirstChild("\067\104\097\114\097\099\116\101\114") and ReplicatedStorage.Events.Character:FindFirstChild("\073\110\116\101\114\097\099\116") if _IlIIllIIII then _IlIIllIIII:FireServer("\082\101\118\105\118\101", true, playerModel.Name) end
 end
 ) task.wait(0.5) return end
 end
 end
 end
 ) WindUI:Notify({ Title = "\067\097\115\104\032\070\097\114\109", Content = "\083\116\097\114\116\101\100\032\114\101\118\105\118\105\110\103\032\100\111\119\110\101\100\032\112\108\097\121\101\114\115\033", Duration = 0x2 }) end
 local function _llllIIIIll() if _IIIIlIllIl.cash then _IIIIlIllIl.cash:Disconnect() _IIIIlIllIl.cash = nil end
 WindUI:Notify({ Title = "\067\097\115\104\032\070\097\114\109", Content = "\083\116\111\112\112\101\100", Duration = 0x2 }) end
 local _lIllllllll = _IIIIIIIlII:Section({ Title = "\070\097\114\109\032\083\121\115\116\101\109\115", Side = "\076\101\102\116", Collapsed = false, }) _lIllllllll:Slider({ Title = "\065\070\075\032\080\108\097\116\102\111\114\109\032\072\101\105\103\104\116", Desc = "\072\101\105\103\104\116\032\111\102\032\116\104\101\032\065\070\075\032\112\108\097\116\102\111\114\109\032\040\053\048\048\045\051\048\048\048\041", Value = { Min = 0x1F4, Max = 0xBB8, Default = 0x1F4 }, Step = 0x32, Callback = function (value) _lIIlIIIllI = value if _lllIIlllII then _lllIIlllII.Position = Vector3.new(0x64, _lIIlIIIllI, 0x64) end
 end
 }) _lIllllllll:Toggle({ Title = "\065\070\075\032\070\097\114\109", Desc = "\083\116\097\121\032\111\110\032\097\032\115\097\102\101\032\112\108\097\116\102\111\114\109\032\097\119\097\121\032\102\114\111\109\032\100\097\110\103\101\114", Value = false, Callback = function (state) _IlIlllIlII = state if state then _IIlllIllll() else _lIIIlIIlIl() end
 end
 }) _lIllllllll:Toggle({ Title = "\084\105\099\107\101\116\032\070\097\114\109", Desc = "\065\117\116\111\109\097\116\105\099\097\108\108\121\032\099\111\108\108\101\099\116\032\116\105\099\107\101\116\115\032\102\114\111\109\032\116\104\101\032\109\097\112", Value = false, Callback = function (state) _llIlIllIII = state if state then _lllIIIIIIl() else _lIlIIlIlII() end
 end
 , Locked = true, }) _lIllllllll:Toggle({ Title = "\067\097\115\104\032\070\097\114\109", Desc = "\082\101\118\105\118\101\032\100\111\119\110\101\100\032\112\108\097\121\101\114\115\032\116\111\032\101\097\114\110\032\109\111\110\101\121", Value = false, Callback = function (state) _IIlIIlIllI = state if state then _IIllIlllll() else _llllIIIIll() end
 end
 }) _lIllllllll:Button({ Title = "\083\116\111\112\032\065\108\108\032\070\097\114\109\115", Desc = "\069\109\101\114\103\101\110\099\121\032\115\116\111\112\032\097\108\108\032\102\097\114\109\105\110\103\032\097\099\116\105\118\105\116\105\101\115", Callback = function () if _IlIlllIlII then _IlIlllIlII = false _lIIIlIIlIl() end
 if _llIlIllIII then _llIlIllIII = false _lIlIIlIlII() end
 if _IIlIIlIllI then _IIlIIlIllI = false _llllIIIIll() end
 WindUI:Notify({ Title = "\069\109\101\114\103\101\110\099\121\032\083\116\111\112", Content = "\065\108\108\032\102\097\114\109\115\032\115\116\111\112\112\101\100", Duration = 0x2 }) end
 }) _lIllllllll:Paragraph({ Title = "\078\111\116\101", Content = "\8226\032\065\070\075\032\070\097\114\109\058\032\084\101\108\101\112\111\114\116\115\032\116\111\032\097\032\115\097\102\101\032\112\108\097\116\102\111\114\109\092\110\8226\032\084\105\099\107\101\116\032\070\097\114\109\058\032\067\111\108\108\101\099\116\115\032\116\105\099\107\101\116\115\032\097\117\116\111\109\097\116\105\099\097\108\108\121\092\110\8226\032\067\097\115\104\032\070\097\114\109\058\032\082\101\118\105\118\101\115\032\100\111\119\110\101\100\032\112\108\097\121\101\114\115\032\102\111\114\032\109\111\110\101\121" }) _IIIlIlllll.CharacterAdded:Connect( function () task.wait(0x1) if _IlIlllIlII then _lIIIlIIlIl() _IIlllIllll() end
 if _llIlIllIII then _lIlIIlIlII() _lllIIIIIIl() end
 if _IIlIIlIllI then _llllIIIIll() _IIllIlllll() end
 end
 ) print("\091\070\097\114\109\032\083\121\115\116\101\109\115\093\032\076\111\097\100\101\100\032\115\117\099\099\101\115\115\102\117\108\108\121\033") end
 ) end
 )(...)
