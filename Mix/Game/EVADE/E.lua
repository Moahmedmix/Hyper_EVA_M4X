--[[ Protected by Lua Guard ]]

(function(...) 
-- ================================
-- منع ظهور الأخطاء (يُحط في أول الملف)
-- ================================

local _llIllIllIl = warn
local _IlIllIIIll = error
warn = function() end
error = function() end

pcall(function()
    -- كل الكود بتاعك هنا
    print("\083\099\114\105\112\116\032\108\111\097\100\101\100\032\115\117\099\099\101\115\115\102\117\108\108\121\033")
end)

task.spawn(function()
    task.wait(0x5)
    warn = _llIllIllIl
    error = _IlIllIIIll
end)

-- ============================================
-- تعريف الخدمات (في بداية الكود)
-- ============================================
local Players = game:GetService("\080\108\097\121\101\114\115")
local RunService = game:GetService("\082\117\110\083\101\114\118\105\099\101")
local _IIllIllIIl = game:GetService("\087\111\114\107\115\112\097\099\101")
local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101")
local _lIIlllIlIl = Players.LocalPlayer

-- ============================================
-- تعريف التابات
-- ============================================
local _IIllIIlIll = {
    ESP = Window:Tab({ Title = "\069\083\080", Icon = "\101\121\101", Locked = false }),
}
-- ================================
-- تبويب ESP
-- ================================
local _IllIIlIllI = _IIllIIlIll.ESP

-- ================================
-- Player ESP & Highlight (في نفس القسم)
-- ================================
local _IlIIIlIlll = _IllIIlIllI:Section({
    Title = "\080\108\097\121\101\114\032\069\083\080\032\038\032\072\105\103\104\108\105\103\104\116",
    Side = "\076\101\102\116",
    Collapsed = true,
})

-- ================================
-- المتغيرات العامة
-- ================================
local _IIIIllIlIl = false
local _lIlIlIIlll = {}
local _lIIIIIllll = nil
local _IlllIlllII = false
local _IIlIlllllI = nil
local _lIlllIIIIl = {}
-- الألوان المثالية لـ 
local _llllIlllII = Color3.fromRGB(0xFF, 0xFF, 0xFF)    -- أبيض
local _IIllllllIl = Color3.fromRGB(0xFF, 0x0, 0x0)        -- أحمر
-- ================================
-- دوال مشتركة
-- ================================

local function _lllIllllII(_IIlIllllIl)
    if not _IIlIllllIl then return nil end
    return _IIlIllllIl:FindFirstChild("\072\101\097\100")
        or _IIlIllllIl:FindFirstChild("\085\112\112\101\114\084\111\114\115\111")
        or _IIlIllllIl:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
        or _IIlIllllIl:FindFirstChildWhichIsA("\066\097\115\101\080\097\114\116")
end

local function _IIlIllllII(player)
    if not player or not player.Character then return false end
    local _lIIlIIIlIl = player.Character
    if _lIIlIIIlIl:GetAttribute("\068\111\119\110\101\100") == true then return true end
    local _lIIIIllIII = _lIIlIIIlIl:FindFirstChild("\072\117\109\097\110\111\105\100")
    if _lIIIIllIII and _lIIIIllIII.Health <= 0x0 then return true end
    return false
end
-- ================================
-- 0x1. ESP اللاعبين
-- ================================

local function _IIlIIIIlII(player)
    if player == _lIIlllIlIl then return end
    local _IIlIllllIl = player.Character
    if not _IIlIllllIl then return end
    
    local _IIlllIllll = _lllIllllII(_IIlIllllIl)
    if not _IIlllIllll then return end
    
    -- إخفاء الاسم الأصلي
    local _lllIIIlIII = _IIlIllllIl:FindFirstChildOfClass("\072\117\109\097\110\111\105\100")
    if _lllIIIlIII then
        pcall(function()
            _lllIIIlIII.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        end)
        pcall(function()
            _lllIIIlIII.NameDisplayDistance = 0x0
        end)
    end
    
    if _lIlIlIIlll[player] then
        _lIlIlIIlll[player]:Destroy()
    end
    
    local _lIIlIIllII = Instance.new("\066\105\108\108\098\111\097\114\100\071\117\105")
    _lIIlIIllII.Name = "\080\108\097\121\101\114\069\083\080\095\072\121\112\101\114"
    _lIIlIIllII.Adornee = _IIlllIllll
    _lIIlIIllII.Size = UDim2.new(0x0, 0x8C, 0x0, 0x2D)
    _lIIlIIllII.StudsOffset = Vector3.new(0x0, 3.5, 0x0)
    _lIIlIIllII.AlwaysOnTop = true
    _lIIlIIllII.MaxDistance = 0x5DC
    _lIIlIIllII.Parent = _IIlllIllll
    
    local _IlllllllIl = Instance.new("\084\101\120\116\076\097\098\101\108")
    _IlllllllIl.Size = UDim2.new(0x1, 0x0, 0x1, 0x0)
    _IlllllllIl.BackgroundTransparency = 0x1
    _IlllllllIl.Text = player.Name
    _IlllllllIl.TextColor3 = _llllIlllII  -- أبيض
    _IlllllllIl.TextSize = 0xE
    _IlllllllIl.Font = Enum.Font.GothamBold
    _IlllllllIl.TextStrokeTransparency = 0.5
    _IlllllllIl.TextStrokeColor3 = Color3.new(0x0, 0x0, 0x0)
    _IlllllllIl.Parent = _lIIlIIllII
    
    _lIlIlIIlll[player] = _lIIlIIllII
    return _lIIlIIllII
end

local function _lIlllllllI()
    for player, _IllIIllIIl in pairs(_lIlIlIIlll) do
        if _IllIIllIIl and _IllIIllIIl.Parent then
            _IllIIllIIl:Destroy()
        end
    end
    _lIlIlIIlll = {}
end

local function _lIIIllIlIl()
    if not _IIIIllIlIl then return end
    
    local _llIlIIllII = _lIIlllIlIl.Character
    local _IIlIIIIIll = _llIlIIllII and _llIlIIllII:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
    
    for player, _IllIIllIIl in pairs(_lIlIlIIlll) do
        if not player or not player.Parent or not player.Character then
            if _IllIIllIIl then _IllIIllIIl:Destroy() end
            _lIlIlIIlll[player] = nil
        else
            local _IIlIllllIl = player.Character
            local _IIlllIllll = _lllIllllII(_IIlIllllIl)
            local _IlllllllIl = _IllIIllIIl:FindFirstChildOfClass("\084\101\120\116\076\097\098\101\108")
            
            if _IIlllIllll and _IllIIllIIl.Adornee ~= _IIlllIllll then
                _IllIIllIIl.Adornee = _IIlllIllll
                _IllIIllIIl.Parent = _IIlllIllll
            end
            
            if _IIlllIllll and _IlllllllIl then
                local _IlIlIlIIII = _IIlIllllII(player)
                local _IlIlIllIll = _IlIlIlIIII and _IIllllllIl or _llllIlllII  -- أحمر للداون, أبيض للطبيعي
                
                local _llIllIIIIl = ""
                if _IlIlIlIIII then
                    _llIllIIIIl = "\032\091\068\079\087\078\069\068\093"
                elseif _IIlIllllIl:FindFirstChild("\082\101\118\105\118\101\115") then
                    _llIllIIIIl = "\032\091\082\069\086\073\086\069\083\093"
                end
                
                local _IIIIllIIIl = ""
                if _IIlIIIIIll then
                    local _lllllllllI = math.floor((_IIlllIllll.Position - _IIlIIIIIll.Position).Magnitude)
                    _IIIIllIIIl = string.format("\032\091\037\100\109\093", _lllllllllI)
                end
                
                local _IlIIlIIlII = player.Name .. _IIIIllIIIl .. _llIllIIIIl
                if _IlllllllIl.Text ~= _IlIIlIIlII then
                    _IlllllllIl.Text = _IlIIlIIlII
                end
                if _IlllllllIl.TextColor3 ~= _IlIlIllIll then
                    _IlllllllIl.TextColor3 = _IlIlIllIll
                end
            end
        end
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= _lIIlllIlIl and player.Character and not _lIlIlIIlll[player] then
            _IIlIIIIlII(player)
        end
    end
end

-- ================================
-- 0x2. هايلايت اللاعبين (بنفس ألوان ESP)
-- ================================

local function _IIIlIIIlIl(player)
    if not player or player == _lIIlllIlIl then return end
    if not _IlllIlllII then return end
    
    local _IIlIllllIl = player.Character
    if not _IIlIllllIl then return end
    
    local _IlIlIlIIII = _IIlIllllII(player)
    local _IlIlIllIll = _IlIlIlIIII and _IIllllllIl or _llllIlllII  -- أحمر للداون, أبيض للطبيعي
    
    if _lIlllIIIIl[player] then
        local _IlIIlllIlI = _lIlllIIIIl[player]
        if _IlIIlllIlI and _IlIIlllIlI.Parent then
            _IlIIlllIlI.FillColor = _IlIlIllIll
            _IlIIlllIlI.OutlineColor = _IlIlIllIll
            return
        else
            _lIlllIIIIl[player] = nil
        end
    end
    
    local _IlIIlllIlI = Instance.new("\072\105\103\104\108\105\103\104\116")
    _IlIIlllIlI.Name = "\072\121\112\101\114\072\105\103\104\108\105\103\104\116\095" .. player.Name
    _IlIIlllIlI.Parent = _IIlIllllIl
    _IlIIlllIlI.FillTransparency = 0.3
    _IlIIlllIlI.OutlineTransparency = 0x0
    _IlIIlllIlI.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    _IlIIlllIlI.FillColor = _IlIlIllIll
    _IlIIlllIlI.OutlineColor = _IlIlIllIll
    
    _lIlllIIIIl[player] = _IlIIlllIlI
end

local function _lIllllllIl()
    for player, _IlIIlllIlI in pairs(_lIlllIIIIl) do
        if _IlIIlllIlI and _IlIIlllIlI.Parent then
            _IlIIlllIlI:Destroy()
        end
    end
    _lIlllIIIIl = {}
end

local function _IlIlIlIlIl()
    if not _IlllIlllII then return end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= _lIIlllIlIl then
            _IIIlIIIlIl(player)
        end
    end
end

-- ================================
-- عناصر التحكم في الواجهة
-- ================================
-- Toggle ESP
_IlIIIlIlll:Toggle({
    Title = "\069\083\080\032\080\108\097\121\101\114\115",
    Flag = "\080\108\097\121\101\114\069\083\080",  -- 👈 أضف ده
    Desc = "\068\105\115\112\108\097\121\032\112\108\097\121\101\114\032\110\097\109\101\115\032\119\105\116\104\032\100\105\115\116\097\110\099\101\032\097\110\100\032\115\116\097\116\117\115",
    Value = false,
    Callback = function(state)
        _IIIIllIlIl = state
        if state then
            _lIlllllllI()
            _lIIIllIlIl()
            if _lIIIIIllll then _lIIIIIllll:Disconnect() end
            _lIIIIIllll = RunService.Heartbeat:Connect(_lIIIllIlIl)
            WindUI:Notify({ Title = "\069\083\080", Content = "\080\108\097\121\101\114\115\032\069\083\080\032\069\110\097\098\108\101\100", Duration = 0x2 })
        else
            if _lIIIIIllll then
                _lIIIIIllll:Disconnect()
                _lIIIIIllll = nil
            end
            _lIlllllllI()
            WindUI:Notify({ Title = "\069\083\080", Content = "\080\108\097\121\101\114\115\032\069\083\080\032\068\105\115\097\098\108\101\100", Duration = 0x2 })
        end
    end,
})

-- لون ESP العادي (أبيض)
_IlIIIlIlll:Dropdown({
    Title = "\078\111\114\109\097\108\032\067\111\108\111\114",
    Flag = "\078\111\114\109\097\108\067\111\108\111\114\068\114\111\112\100\111\119\110",  -- 👈 أضف ده
    Values = { "\087\104\105\116\101", "\066\108\111\111\100\032\082\101\100", "\079\099\101\097\110\032\068\101\101\112", "\082\101\100", "\071\114\101\101\110", "\066\108\117\101", "\089\101\108\108\111\119", "\067\121\097\110", "\080\117\114\112\108\101" },
    Default = "\087\104\105\116\101",
    Callback = function(value)
        local _IlIlIIlllI = {
            White = Color3.fromRGB(0xFF, 0xFF, 0xFF),
            ["\066\108\111\111\100\032\082\101\100"] = Color3.fromHex("\035\102\102\050\050\050\050"),
            ["\079\099\101\097\110\032\068\101\101\112"] = Color3.fromRGB(0x0, 0x44, 0xAA),
            Red = Color3.fromRGB(0xFF, 0x0, 0x0),
            Green = Color3.fromRGB(0x0, 0xFF, 0x0),
            Blue = Color3.fromRGB(0x0, 0x0, 0xFF),
            Yellow = Color3.fromRGB(0xFF, 0xFF, 0x0),
            Cyan = Color3.fromRGB(0x0, 0xFF, 0xFF),
            Purple = Color3.fromRGB(0xFF, 0x0, 0xFF),
        }
        _llllIlllII = _IlIlIIlllI[value] or Color3.fromRGB(0xFF, 0xFF, 0xFF)
        if _IIIIllIlIl then
            _lIIIllIlIl()
        end
        if _IlllIlllII then
            _IlIlIlIlIl()
        end
    end,
})

-- لون ESP للميتين (أحمر)
_IlIIIlIlll:Dropdown({
    Title = "\068\111\119\110\101\100\032\067\111\108\111\114",
    Flag = "\068\111\119\110\101\100\067\111\108\111\114\068\114\111\112\100\111\119\110",  -- 👈 أضف ده
    Values = { "\082\101\100", "\066\108\111\111\100\032\082\101\100", "\071\111\108\100\101\110\032\079\114\097\110\103\101", "\079\099\101\097\110\032\068\101\101\112", "\087\104\105\116\101", "\071\114\101\101\110", "\066\108\117\101", "\089\101\108\108\111\119", "\067\121\097\110", "\080\117\114\112\108\101" },
    Default = "\082\101\100",
    Callback = function(value)
        local _IlIlIIlllI = {
            Red = Color3.fromRGB(0xFF, 0x0, 0x0),
            ["\066\108\111\111\100\032\082\101\100"] = Color3.fromHex("\035\102\102\050\050\050\050"),
            ["\071\111\108\100\101\110\032\079\114\097\110\103\101"] = Color3.fromHex("\035\102\102\097\097\048\048"),
            ["\079\099\101\097\110\032\068\101\101\112"] = Color3.fromRGB(0x0, 0x44, 0xAA),
            White = Color3.fromRGB(0xFF, 0xFF, 0xFF),
            Green = Color3.fromRGB(0x0, 0xFF, 0x0),
            Blue = Color3.fromRGB(0x0, 0x0, 0xFF),
            Yellow = Color3.fromRGB(0xFF, 0xFF, 0x0),
            Cyan = Color3.fromRGB(0x0, 0xFF, 0xFF),
            Purple = Color3.fromRGB(0xFF, 0x0, 0xFF),
        }
        _IIllllllIl = _IlIlIIlllI[value] or Color3.fromRGB(0xFF, 0x0, 0x0)
        if _IIIIllIlIl then
            _lIIIllIlIl()
        end
        if _IlllIlllII then
            _IlIlIlIlIl()
        end
    end,
})

-- زر Refresh (Button مش محتاج Flag)
_IlIIIlIlll:Button({
    Title = "\082\101\102\114\101\115\104\032\069\083\080",
    Desc = "\077\097\110\117\097\108\108\121\032\114\101\102\114\101\115\104\032\097\108\108\032\112\108\097\121\101\114\032\069\083\080",
    Callback = function()
        if _IIIIllIlIl then
            _lIlllllllI()
            _lIIIllIlIl()
            WindUI:Notify({ Title = "\069\083\080", Content = "\082\101\102\114\101\115\104\101\100", Duration = 0x1 })
        else
            WindUI:Notify({ Title = "\069\083\080", Content = "\069\110\097\098\108\101\032\069\083\080\032\102\105\114\115\116", Duration = 0x1 })
        end
    end,
})

-- Toggle Highlight
_IlIIIlIlll:Toggle({
    Title = "\080\108\097\121\101\114\032\072\105\103\104\108\105\103\104\116",
    Flag = "\080\108\097\121\101\114\072\105\103\104\108\105\103\104\116",  -- 👈 أضف ده
    Desc = "\072\105\103\104\108\105\103\104\116\032\112\108\097\121\101\114\115\032\119\105\116\104\032\099\111\108\111\114\115",
    Value = false,
    Callback = function(state)
        _IlllIlllII = state
        if state then
            _lIllllllIl()
            _IlIlIlIlIl()
            if _IIlIlllllI then _IIlIlllllI:Disconnect() end
            _IIlIlllllI = RunService.Heartbeat:Connect(_IlIlIlIlIl)
            WindUI:Notify({ Title = "\072\105\103\104\108\105\103\104\116", Content = "\069\110\097\098\108\101\100", Duration = 0x2 })
        else
            if _IIlIlllllI then
                _IIlIlllllI:Disconnect()
                _IIlIlllllI = nil
            end
            _lIllllllIl()
            WindUI:Notify({ Title = "\072\105\103\104\108\105\103\104\116", Content = "\068\105\115\097\098\108\101\100", Duration = 0x2 })
        end
    end,
})

-- ============================================
-- 🛠️ Services & Player Definition
-- ============================================
local Players = game:GetService("\080\108\097\121\101\114\115")
local _lIIlllIlIl = Players.LocalPlayer

-- Wait for the _IIlIllllIl to exist for the first time
if _lIIlllIlIl.Character then
    task.wait(0x1)
    if _IIIIllIlIl then _lIIIllIlIl() end
    if _IlllIlllII then _IlIlIlIlIl() end
end

-- ============================================
-- 🔄 Character Added Event
-- ============================================
_lIIlllIlIl.CharacterAdded:Connect(function()
    task.wait(0x1)
    
    -- We use pcall to prevent errors if these functions are not loaded yet
    pcall(function()
        if _IIIIllIlIl then
            _lIlllllllI()
            _lIIIllIlIl()
        end
    end)
    
    pcall(function()
        if _IlllIlllII then
            _lIllllllIl()
            _IlIlIlIlIl()
        end
    end)
end)




-- ================================
-- Nextbot ESP & Highlight
-- ===============================
local _lIlIIllIIl = _IIllIIlIll.ESP:Section({  -- غير من _IllIIlIllI إلى _IIllIIlIll.ESP
    Title = "\078\101\120\116\098\111\116\032\069\083\080\032\038\032\072\105\103\104\108\105\103\104\116",
    Side = "\076\101\102\116",
    Collapsed = true,
})

-- ================================
-- متغيرات الألوان لـ Nextbot
-- ================================
local _IllIllIlll = Color3.fromRGB(0xFF, 0x0, 0x0)
local _IIIIllIIlI = Color3.fromRGB(0xFF, 0x0, 0x0)
local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101")

-- ================================
-- متغيرات Nextbot ESP
-- ================================
local _IIlIllIllI = false
local _IlIlllIlII = false
local _lIlIIIIIlI = {}
local _lIIlIIllll = {}
local _lIIlIllIIl = nil

-- قائمة أسماء الـ Nextbots من ReplicatedStorage
local _lllllIlIlI = {}
local _IllIlllllI = ReplicatedStorage:FindFirstChild("\078\080\067\115")
if _IllIlllllI then
    for _, npc in ipairs(_IllIlllllI:GetChildren()) do
        table.insert(_lllllIlIlI, npc.Name)
    end
end

-- ================================
-- دالة التحقق من Nextbot
-- ================================
local function _IIlllIllII(model)
    if not model or not model.Name then return false end
    
    for _, name in ipairs(_lllllIlIlI) do
        if model.Name == name then return true end
    end
    
    local _IlIlIlIIIl = model.Name:lower()
    return _IlIlIlIIIl:find("\110\101\120\116\098\111\116") or 
           _IlIlIlIIIl:find("\115\099\112") or 
           _IlIlIlIIIl:find("\109\111\110\115\116\101\114") or
           _IlIlIlIIIl:find("\099\114\101\101\112") or
           _IlIlIlIIIl:find("\101\110\101\109\121") or
           _IlIlIlIIIl:find("\122\111\109\098\105\101") or
           _IlIlIlIIIl:find("\103\104\111\115\116") or
           _IlIlIlIIIl:find("\100\101\109\111\110")
end

-- ================================
-- دالة للحصول على أفضل جزء للـ ESP
-- ================================
local function _IIIIlIllll(model)
    return model:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
        or model:FindFirstChild("\072\101\097\100")
        or model:FindFirstChild("\084\111\114\115\111")
        or model:FindFirstChildWhichIsA("\066\097\115\101\080\097\114\116")
end
-- ================================
-- متغيرات الألوان لـ Nextbot (بنفسجي)
-- ================================
local _IllIllIlll = Color3.fromHex("\035\099\099\052\052\102\102")        -- بنفسجي ناري ساطع
local _IIIIllIIlI = Color3.fromHex("\035\056\056\048\048\099\099")  -- بنفسجي غامق
-- ================================
-- متغيرات Nextbot ESP
-- ================================
local _IIlIllIllI = false
local _IlIlllIlII = false
local _lIlIIIIIlI = {}
local _lIIlIIllll = {}
local _lIIlIllIIl = nil
local ReplicatedStorage = game:GetService("\082\101\112\108\105\099\097\116\101\100\083\116\111\114\097\103\101")

-- قائمة أسماء الـ Nextbots من ReplicatedStorage
local _lllllIlIlI = {}
local _IllIlllllI = ReplicatedStorage:FindFirstChild("\078\080\067\115")
if _IllIlllllI then
    for _, npc in ipairs(_IllIlllllI:GetChildren()) do
        table.insert(_lllllIlIlI, npc.Name)
    end
end
-- ================================
-- دالة التحقق من Nextbot
-- ================================
local function _IIlllIllII(model)
    if not model or not model.Name then return false end
    
    for _, name in ipairs(_lllllIlIlI) do
        if model.Name == name then return true end
    end
    
    local _IlIlIlIIIl = model.Name:lower()
    return _IlIlIlIIIl:find("\110\101\120\116\098\111\116") or 
           _IlIlIlIIIl:find("\115\099\112") or 
           _IlIlIlIIIl:find("\109\111\110\115\116\101\114") or
           _IlIlIlIIIl:find("\099\114\101\101\112") or
           _IlIlIlIIIl:find("\101\110\101\109\121") or
           _IlIlIlIIIl:find("\122\111\109\098\105\101") or
           _IlIlIlIIIl:find("\103\104\111\115\116") or
           _IlIlIlIIIl:find("\100\101\109\111\110")
end
-- ================================
-- دالة للحصول على أفضل جزء للـ ESP
-- ================================
local function _IIIIlIllll(model)
    return model:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
        or model:FindFirstChild("\072\101\097\100")
        or model:FindFirstChild("\084\111\114\115\111")
        or model:FindFirstChildWhichIsA("\066\097\115\101\080\097\114\116")
end

-- ================================
-- 0x1. ESP للـ Nextbots (بنفسجي)
-- ================================
local function _IIIIlllIII(model)
    if not model then return end
    
    local _IIlllIllll = _IIIIlIllll(model)
    if not _IIlllIllll then return end
    
    if _lIlIIIIIlI[model] then
        pcall(function() _lIlIIIIIlI[model]:Destroy() end)
    end
    
    local _lIIlIIllII = Instance.new("\066\105\108\108\098\111\097\114\100\071\117\105")
    _lIIlIIllII.Name = "\078\101\120\116\098\111\116\069\083\080\095\072\121\112\101\114"
    _lIIlIIllII.Adornee = _IIlllIllll
    _lIIlIIllII.Size = UDim2.new(0x0, 0x8C, 0x0, 0x2D)
    _lIIlIIllII.StudsOffset = Vector3.new(0x0, 0x3, 0x0)
    _lIIlIIllII.AlwaysOnTop = true
    _lIIlIIllII.MaxDistance = 0x5DC
    _lIIlIIllII.Parent = _IIlllIllll
    
    local _IlllllllIl = Instance.new("\084\101\120\116\076\097\098\101\108")
    _IlllllllIl.Size = UDim2.new(0x1, 0x0, 0x1, 0x0)
    _IlllllllIl.BackgroundTransparency = 0x1
    _IlllllllIl.Text = "\9888\65039\032" .. model.Name
    _IlllllllIl.TextColor3 = _IllIllIlll
    _IlllllllIl.TextSize = 0xE
    _IlllllllIl.Font = Enum.Font.GothamBold
    _IlllllllIl.TextStrokeTransparency = 0.5
    _IlllllllIl.TextStrokeColor3 = Color3.new(0x0, 0x0, 0x0)
    _IlllllllIl.Parent = _lIIlIIllII
    
    _lIlIIIIIlI[model] = _lIIlIIllII
    return _lIIlIIllII
end

local function _IIIlIlllII()
    for model, _IllIIllIIl in pairs(_lIlIIIIIlI) do
        pcall(function() if _IllIIllIIl then _IllIIllIIl:Destroy() end end)
    end
    _lIlIIIIIlI = {}
end

local function _lIlIIlIlll()
    if not _IIlIllIllI then return end
    
    local _llIlIIllII = _lIIlllIlIl.Character
    local _IIlIIIIIll = _llIlIIllII and _llIlIIllII:FindFirstChild("\072\117\109\097\110\111\105\100\082\111\111\116\080\097\114\116")
    local _lllllIllll = {}
    
    -- البحث عن الـ Nextbots في Game/Players
    local _IlIlIIIllI = workspace:FindFirstChild("\071\097\109\101") and workspace.Game:FindFirstChild("\080\108\097\121\101\114\115")
    if _IlIlIIIllI then
        for _, model in pairs(_IlIlIIIllI:GetChildren()) do
            if model:IsA("\077\111\100\101\108") and _IIlllIllII(model) then
                _lllllIllll[model] = true
            end
        end
    end
    
    -- البحث عن الـ Nextbots في NPCs
    local _IllIlIllIl = workspace:FindFirstChild("\078\080\067\115")
    if _IllIlIllIl then
        for _, model in pairs(_IllIlIllIl:GetChildren()) do
            if model:IsA("\077\111\100\101\108") and _IIlllIllII(model) then
                _lllllIllll[model] = true
            end
        end
    end
    
    -- تحديث المسافات وإنشاء الـ ESP الجديد
    for model in pairs(_lllllIllll) do
        local _IIlllIllll = _IIIIlIllll(model)
        if _IIlllIllll then
            if not _lIlIIIIIlI[model] then
                _IIIIlllIII(model)
            end
            
            local _IllIIllIIl = _lIlIIIIIlI[model]
            if _IllIIllIIl then
                local _IlllllllIl = _IllIIllIIl:FindFirstChildOfClass("\084\101\120\116\076\097\098\101\108")
                if _IlllllllIl then
                    if _IllIIllIIl.Adornee ~= _IIlllIllll then
                        _IllIIllIIl.Adornee = _IIlllIllll
                        _IllIIllIIl.Parent = _IIlllIllll
                    end
                    
                    local _IIIIllIIIl = ""
                    if _IIlIIIIIll then
                        local _lllllllllI = math.floor((_IIlllIllll.Position - _IIlIIIIIll.Position).Magnitude)
                        _IIIIllIIIl = string.format("\032\091\037\100\109\093", _lllllllllI)
                    end
                    
                    local _IlIIlIIlII = "\9888\65039\032" .. model.Name .. _IIIIllIIIl
                    if _IlllllllIl.Text ~= _IlIIlIIlII then
                        _IlllllllIl.Text = _IlIIlIIlII
                    end
                    if _IlllllllIl.TextColor3 ~= _IllIllIlll then
                        _IlllllllIl.TextColor3 = _IllIllIlll
                    end
                end
            end
        end
    end
    
    -- إزالة الـ ESP للـ Nextbots اللي اختفت
    for model, _IllIIllIIl in pairs(_lIlIIIIIlI) do
        if not _lllllIllll[model] or not model.Parent then
            pcall(function() if _IllIIllIIl then _IllIIllIIl:Destroy() end end)
            _lIlIIIIIlI[model] = nil
        end
    end
end

-- ================================
-- 0x2. هايلايت الـ Nextbots (بنفسجي)
-- ================================
local function _lIlIllIlII(model)
    if not _IlIlllIlII then return end
    if not model or not model.Parent then return end
    
    if _lIIlIIllll[model] then
        local _IlIIlllIlI = _lIIlIIllll[model]
        if _IlIIlllIlI and _IlIIlllIlI.Parent then
            _IlIIlllIlI.FillColor = _IIIIllIIlI
            _IlIIlllIlI.OutlineColor = _IIIIllIIlI
            return
        else
            _lIIlIIllll[model] = nil
        end
    end
    
    local _IlIIlllIlI = Instance.new("\072\105\103\104\108\105\103\104\116")
    _IlIIlllIlI.Name = "\078\101\120\116\098\111\116\072\105\103\104\108\105\103\104\116\095\072\121\112\101\114"
    _IlIIlllIlI.Parent = model
    _IlIIlllIlI.FillTransparency = 0.3
    _IlIIlllIlI.OutlineTransparency = 0x0
    _IlIIlllIlI.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    _IlIIlllIlI.FillColor = _IIIIllIIlI
    _IlIIlllIlI.OutlineColor = _IIIIllIIlI
    
    _lIIlIIllll[model] = _IlIIlllIlI
end

local function _llllIIIlII()
    for model, _IlIIlllIlI in pairs(_lIIlIIllll) do
        pcall(function() if _IlIIlllIlI then _IlIIlllIlI:Destroy() end end)
    end
    _lIIlIIllll = {}
end

local function _IIllllIlIl()
    if not _IlIlllIlII then return end
    
    local _lIlIIIIlll = {}
    
    local _IlIlIIIllI = workspace:FindFirstChild("\071\097\109\101") and workspace.Game:FindFirstChild("\080\108\097\121\101\114\115")
    if _IlIlIIIllI then
        for _, model in pairs(_IlIlIIIllI:GetChildren()) do
            if model:IsA("\077\111\100\101\108") and _IIlllIllII(model) then
                _lIlIIIIlll[model] = true
                _lIlIllIlII(model)
            end
        end
    end
    
    local _IllIlIllIl = workspace:FindFirstChild("\078\080\067\115")
    if _IllIlIllIl then
        for _, model in pairs(_IllIlIllIl:GetChildren()) do
            if model:IsA("\077\111\100\101\108") and _IIlllIllII(model) then
                _lIlIIIIlll[model] = true
                _lIlIllIlII(model)
            end
        end
    end
    
    for model in pairs(_lIIlIIllll) do
        if not _lIlIIIIlll[model] or not model.Parent then
            pcall(function() if _lIIlIIllll[model] then _lIIlIIllll[model]:Destroy() end end)
            _lIIlIIllll[model] = nil
        end
    end
end

-- ================================
-- الحلقة الرئيسية
-- ================================
local function _IlIllIIIII()
    if _lIIlIllIIl then return end
    
    _lIIlIllIIl = RunService.Heartbeat:Connect(function()
        if _IIlIllIllI then
            _lIlIIlIlll()
        end
        if _IlIlllIlII then
            _IIllllIlIl()
        end
    end)
end

local function _llIIllIIlI()
    if _lIIlIllIIl then
        _lIIlIllIIl:Disconnect()
        _lIIlIllIIl = nil
    end
    _IIIlIlllII()
    _llllIIIlII()
end

-- ================================
-- عناصر التحكم (بنفسجي)
-- ================================

_lIlIIllIIl:Toggle({
    Title = "\078\101\120\116\098\111\116\032\069\083\080",
    Flag = "\078\101\120\116\098\111\116\069\083\080",  -- 👈 أضف ده
    Desc = "\068\105\115\112\108\097\121\032\078\101\120\116\098\111\116\032\110\097\109\101\115\032\119\105\116\104\032\100\105\115\116\097\110\099\101\032\040\080\117\114\112\108\101\032\084\104\101\109\101\041",
    Value = false,
    Callback = function(state)
        _IIlIllIllI = state
        if _IIlIllIllI or _IlIlllIlII then
            _IlIllIIIII()
        else
            _llIIllIIlI()
        end
        WindUI:Notify({ Title = "\078\101\120\116\098\111\116\032\069\083\080", Content = state and "\069\110\097\098\108\101\100\032\9989" or "\068\105\115\097\098\108\101\100\032\10060", Duration = 0x2 })
    end,
})

-- Toggle Nextbot Highlight
_lIlIIllIIl:Toggle({
    Title = "\078\101\120\116\098\111\116\032\072\105\103\104\108\105\103\104\116",
    Flag = "\078\101\120\116\098\111\116\072\105\103\104\108\105\103\104\116",  -- 👈 أضف ده
    Desc = "\072\105\103\104\108\105\103\104\116\032\078\101\120\116\098\111\116\115\032\119\105\116\104\032\080\117\114\112\108\101\032\099\111\108\111\114",
    Value = false,
    Callback = function(state)
        _IlIlllIlII = state
        if _IIlIllIllI or _IlIlllIlII then
            _IlIllIIIII()
        else
            _llIIllIIlI()
        end
        WindUI:Notify({ Title = "\078\101\120\116\098\111\116\032\072\105\103\104\108\105\103\104\116", Content = state and "\069\110\097\098\108\101\100\032\9989" or "\068\105\115\097\098\108\101\100\032\10060", Duration = 0x2 })
    end,
})

-- لون ESP للـ Nextbots (بنفسجي)
_lIlIIllIIl:Dropdown({
    Title = "\078\101\120\116\098\111\116\032\069\083\080\032\067\111\108\111\114",
    Flag = "\078\101\120\116\098\111\116\069\083\080\067\111\108\111\114\068\114\111\112\100\111\119\110",  -- 👈 أضف ده
    Values = { "\080\117\114\112\108\101\032\078\101\111\110", "\080\117\114\112\108\101", "\082\101\100", "\071\114\101\101\110", "\066\108\117\101", "\089\101\108\108\111\119", "\067\121\097\110", "\087\104\105\116\101" },
    Default = "\080\117\114\112\108\101\032\078\101\111\110",
    Callback = function(value)
        local _IlIlIIlllI = {
            ["\080\117\114\112\108\101\032\078\101\111\110"] = Color3.fromHex("\035\099\099\052\052\102\102"),
            ["\080\117\114\112\108\101"] = Color3.fromRGB(0x80, 0x0, 0xFF),
            Red = Color3.fromRGB(0xFF, 0x0, 0x0),
            Green = Color3.fromRGB(0x0, 0xFF, 0x0),
            Blue = Color3.fromRGB(0x0, 0x0, 0xFF),
            Yellow = Color3.fromRGB(0xFF, 0xFF, 0x0),
            Cyan = Color3.fromRGB(0x0, 0xFF, 0xFF),
            White = Color3.fromRGB(0xFF, 0xFF, 0xFF),
        }
        _IllIllIlll = _IlIlIIlllI[value] or Color3.fromHex("\035\099\099\052\052\102\102")
        if _IIlIllIllI then
            for model, _IllIIllIIl in pairs(_lIlIIIIIlI) do
                local _IlllllllIl = _IllIIllIIl and _IllIIllIIl:FindFirstChildOfClass("\084\101\120\116\076\097\098\101\108")
                if _IlllllllIl then
                    _IlllllllIl.TextColor3 = _IllIllIlll
                end
            end
        end
    end,
})

-- لون Highlight للـ Nextbots (بنفسجي)
_lIlIIllIIl:Dropdown({
    Title = "\078\101\120\116\098\111\116\032\072\105\103\104\108\105\103\104\116\032\067\111\108\111\114",
    Flag = "\078\101\120\116\098\111\116\072\105\103\104\108\105\103\104\116\067\111\108\111\114\068\114\111\112\100\111\119\110",  -- 👈 أضف ده
    Values = { "\080\117\114\112\108\101\032\068\097\114\107", "\080\117\114\112\108\101", "\082\101\100", "\071\114\101\101\110", "\066\108\117\101", "\089\101\108\108\111\119", "\067\121\097\110", "\087\104\105\116\101" },
    Default = "\080\117\114\112\108\101\032\068\097\114\107",
    Callback = function(value)
        local _IlIlIIlllI = {
            ["\080\117\114\112\108\101\032\068\097\114\107"] = Color3.fromHex("\035\056\056\048\048\099\099"),
            ["\080\117\114\112\108\101"] = Color3.fromRGB(0x80, 0x0, 0xFF),
            Red = Color3.fromRGB(0xFF, 0x0, 0x0),
            Green = Color3.fromRGB(0x0, 0xFF, 0x0),
            Blue = Color3.fromRGB(0x0, 0x0, 0xFF),
            Yellow = Color3.fromRGB(0xFF, 0xFF, 0x0),
            Cyan = Color3.fromRGB(0x0, 0xFF, 0xFF),
            White = Color3.fromRGB(0xFF, 0xFF, 0xFF),
        }
        _IIIIllIIlI = _IlIlIIlllI[value] or Color3.fromHex("\035\056\056\048\048\099\099")
        if _IlIlllIlII then
            for model, _IlIIlllIlI in pairs(_lIIlIIllll) do
                if _IlIIlllIlI then
                    _IlIIlllIlI.FillColor = _IIIIllIIlI
                    _IlIIlllIlI.OutlineColor = _IIIIllIIlI
                end
            end
        end
    end,
})

-- ================================
-- تنظيف عند إعادة الظهور
-- ================================
_lIIlllIlIl.CharacterAdded:Connect(function()
    task.wait(0x1)
    if _IIlIllIllI or _IlIlllIlII then
        _llIIllIIlI()
        _IlIllIIIII()
    end
end)

print("\091\069\083\080\093\032\078\101\120\116\098\111\116\032\102\101\097\116\117\114\101\115\032\108\111\097\100\101\100\033")     


-- ============================================
-- الأسماء للـ elementsToRegister
-- ============================================

-- 
-- ================================
-- Performance & Visuals (في تبويب ESP)
-- ================================

local _IIlIIIIIlI = _IllIIlIllI:Section({
    Title = "\080\101\114\102\111\114\109\097\110\099\101\032\038\032\086\105\115\117\097\108\115",
    Side = "\076\101\102\116",
    Collapsed = true,
})

-- ================================
-- متغيرات الحالة
-- ================================
local _IllIlIlIII = false
local _llIIlllIlI = nil
local _IlIlIlllll = false
local _lIlIIIIlll = nil
local _IIIIlIlIll = nil

-- ================================
-- 0x1. Anti Lag Buttons
-- ================================

-- Anti Lag 0x1 (أساسي)
_IIlIIIIIlI:Button({
    Title = "\065\110\116\105\032\076\097\103\032\049\032\045\032\066\097\115\105\099\032\067\108\101\097\110",
    Desc = "\082\101\109\111\118\101\115\032\104\101\097\118\121\032\115\104\097\100\111\119\115\032\097\110\100\032\101\102\102\101\099\116\115",
    Callback = function()
        local Lighting = game:GetService("\076\105\103\104\116\105\110\103")
        local _lIIlllIlIl = workspace:FindFirstChildOfClass("\084\101\114\114\097\105\110")
        
        Lighting.GlobalShadows = false
        Lighting.FogEnd = 0xF4240
        Lighting.Brightness = 0x1
        
        if _lIIlllIlIl then
            _lIIlllIlIl.WaterWaveSize = 0x0
            _lIIlllIlIl.WaterWaveSpeed = 0x0
            _lIIlllIlIl.WaterReflectance = 0x0
            _lIIlllIlIl.WaterTransparency = 0x1
        end
        
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj:IsA("\066\097\115\101\080\097\114\116") then
                obj.Material = Enum.Material.Plastic
                obj.Reflectance = 0x0
            elseif obj:IsA("\068\101\099\097\108") or obj:IsA("\084\101\120\116\117\114\101") then
                obj:Destroy()
            elseif obj:IsA("\080\097\114\116\105\099\108\101\069\109\105\116\116\101\114") or obj:IsA("\084\114\097\105\108") then
                obj:Destroy()
            elseif obj:IsA("\080\111\105\110\116\076\105\103\104\116") or obj:IsA("\083\112\111\116\076\105\103\104\116") or obj:IsA("\083\117\114\102\097\099\101\076\105\103\104\116") then
                obj:Destroy()
            end
        end
        
        WindUI:Notify({ Title = "\065\110\116\105\032\076\097\103", Content = "\080\101\114\102\111\114\109\097\110\099\101\032\105\109\112\114\111\118\101\100\032\040\076\101\118\101\108\032\049\041", Duration = 0x2 })
    end,
})

-- Anti Lag 0x2 (متوسط)
_IIlIIIIIlI:Button({
    Title = "\065\110\116\105\032\076\097\103\032\050\032\045\032\077\101\100\105\117\109\032\067\108\101\097\110",
    Desc = "\073\116\032\114\101\109\111\118\101\115\032\118\105\115\117\097\108\032\101\102\102\101\099\116\115\032\097\110\100\032\112\097\114\116\105\099\108\101\115\046",
    Callback = function()
        for _, v in next, game:GetDescendants() do
            if v:IsA("\080\097\114\116") or v:IsA("\085\110\105\111\110\079\112\101\114\097\116\105\111\110") or v:IsA("\066\097\115\101\080\097\114\116") then
                v.Material = Enum.Material.SmoothPlastic
            end
            if v:IsA("\080\097\114\116\105\099\108\101\069\109\105\116\116\101\114") or v:IsA("\083\109\111\107\101") or v:IsA("\069\120\112\108\111\115\105\111\110") or v:IsA("\083\112\097\114\107\108\101\115") or v:IsA("\070\105\114\101") then
                v.Enabled = false
            end
            if v:IsA("\066\108\111\111\109\069\102\102\101\099\116") or v:IsA("\066\108\117\114\069\102\102\101\099\116") or v:IsA("\068\101\112\116\104\079\102\070\105\101\108\100\069\102\102\101\099\116") or v:IsA("\083\117\110\082\097\121\115\069\102\102\101\099\116") then
                v.Enabled = false
            end
            if v:IsA("\068\101\099\097\108") or v:IsA("\084\101\120\116\117\114\101") then
                v.Texture = ""
            end
            if v:IsA("\083\107\121") then
                v.Parent = nil
            end
        end
        
        WindUI:Notify({ Title = "\065\110\116\105\032\076\097\103", Content = "\080\101\114\102\111\114\109\097\110\099\101\032\105\109\112\114\111\118\101\100\032\040\076\101\118\101\108\032\050\041", Duration = 0x2 })
    end,
})

-- Anti Lag 0x3 (إزالة التكستشرز)
_IIlIIIIIlI:Button({
    Title = "\065\110\116\105\032\076\097\103\032\051\032\045\032\082\101\109\111\118\101\032\084\101\120\116\117\114\101\115",
    Desc = "\082\101\109\111\118\101\115\032\097\108\108\032\116\101\120\116\117\114\101\115\032\102\114\111\109\032\116\104\101\032\103\097\109\101",
    Callback = function()
        for _, part in ipairs(workspace:GetDescendants()) do
            if part:IsA("\080\097\114\116") or part:IsA("\077\101\115\104\080\097\114\116") or part:IsA("\085\110\105\111\110\079\112\101\114\097\116\105\111\110") then
                if part:IsA("\080\097\114\116") then
                    part.Material = Enum.Material.SmoothPlastic
                end
                for _, texture in ipairs(part:GetChildren()) do
                    if texture:IsA("\084\101\120\116\117\114\101") or texture:IsA("\068\101\099\097\108") then
                        texture.Texture = "\114\098\120\097\115\115\101\116\105\100\058\047\047\048"
                    end
                end
            end
        end
        
        WindUI:Notify({ Title = "\065\110\116\105\032\076\097\103", Content = "\084\101\120\116\117\114\101\115\032\114\101\109\111\118\101\100", Duration = 0x2 })
    end,
})

-- ================================
-- 0x2. No Fog (إزالة الضباب)
-- ================================
_IIlIIIIIlI:Toggle({
    Title = "\078\111\032\070\111\103",
    Desc = "\082\101\109\111\118\101\115\032\102\111\103\032\102\114\111\109\032\116\104\101\032\103\097\109\101",
    Icon = "\099\108\111\117\100",
    Value = false,
    Type = "\084\111\103\103\108\101",
    Callback = function(state)
        local Lighting = game:GetService("\076\105\103\104\116\105\110\103")
        if state then
            _llIIlllIlI = Lighting.FogEnd
            Lighting.FogEnd = 0xF4240
            WindUI:Notify({ Title = "\078\111\032\070\111\103", Content = "\070\111\103\032\114\101\109\111\118\101\100", Duration = 0x2 })
        else
            Lighting.FogEnd = _llIIlllIlI or 0x186A0
            WindUI:Notify({ Title = "\078\111\032\070\111\103", Content = "\070\111\103\032\114\101\115\116\111\114\101\100", Duration = 0x2 })
        end
        _IllIlIlIII = state
    end,
})

-- ================================
-- 0x3. Full Bright (إضاءة كاملة)
-- ================================
_IIlIIIIIlI:Toggle({
    Title = "\070\117\108\108\032\066\114\105\103\104\116",
    Desc = "\084\104\101\032\101\110\116\105\114\101\032\103\097\109\101\032\108\105\103\104\116\115\032\117\112",
    Icon = "\115\117\110",
    Value = false,
    Type = "\084\111\103\103\108\101",
    Callback = function(state)
        local Lighting = game:GetService("\076\105\103\104\116\105\110\103")
        if state then
            _lIlIIIIlll = Lighting.Brightness
            _IIIIlIlIll = Lighting.Ambient
            Lighting.Brightness = 0x2
            Lighting.Ambient = Color3.fromRGB(0xFF, 0xFF, 0xFF)
            Lighting.OutdoorAmbient = Color3.fromRGB(0xFF, 0xFF, 0xFF)
            WindUI:Notify({ Title = "\070\117\108\108\032\066\114\105\103\104\116", Content = "\070\117\108\108\032\098\114\105\103\104\116\032\101\110\097\098\108\101\100", Duration = 0x2 })
        else
            Lighting.Brightness = _lIlIIIIlll or 0.5
            Lighting.Ambient = _IIIIlIlIll or Color3.fromRGB(0x7F, 0x7F, 0x7F)
            Lighting.OutdoorAmbient = Color3.fromRGB(0x7F, 0x7F, 0x7F)
            WindUI:Notify({ Title = "\070\117\108\108\032\066\114\105\103\104\116", Content = "\070\117\108\108\032\098\114\105\103\104\116\032\100\105\115\097\098\108\101\100", Duration = 0x2 })
        end
        _IlIlIlllll = state
    end,
})

-- ================================
-- 0x4. Reset All Settings
-- ================================
_IIlIIIIIlI:Button({
    Title = "\082\101\115\101\116\032\065\108\108\032\080\101\114\102\111\114\109\097\110\099\101\032\083\101\116\116\105\110\103\115",
    Desc = "\065\108\108\032\112\101\114\102\111\114\109\097\110\099\101\032\115\101\116\116\105\110\103\115\032\097\114\101\032\114\101\115\116\111\114\101\100\032\116\111\032\110\111\114\109\097\108\046",
    Callback = function()
        local Lighting = game:GetService("\076\105\103\104\116\105\110\103")
        
        Lighting.GlobalShadows = true
        Lighting.Brightness = 0.5
        Lighting.Ambient = Color3.fromRGB(0x7F, 0x7F, 0x7F)
        Lighting.OutdoorAmbient = Color3.fromRGB(0x7F, 0x7F, 0x7F)
        Lighting.FogEnd = 0x186A0
        
        if _IllIlIlIII then
            _IllIlIlIII = false
        end
        
        if _IlIlIlllll then
            _IlIlIlllll = false
        end
        
        WindUI:Notify({ Title = "\082\101\115\101\116", Content = "\065\108\108\032\115\101\116\116\105\110\103\115\032\114\101\115\101\116\032\116\111\032\100\101\102\097\117\108\116", Duration = 0x3 })
    end,
})
-- ================================
-- Barriers Section (في تبويب ESP)
-- ================================

local _IllllllIll = _IllIIlIllI:Section({
    Title = "\066\097\114\114\105\101\114\115",
    Side = "\076\101\102\116",
    Collapsed = true,
})

-- متغيرات الحواجز
local _IIlllIIlII = false
local _IllIIIllll = false

-- وظيفة البحث عن InvisParts
local function _lIllIIIlII()
    local _llIIlIllll = workspace:FindFirstChild("\071\097\109\101")
    if not _llIIlIllll then return nil end
    
    local _lllIlIIIIl = _llIIlIllll:FindFirstChild("\077\097\112")
    if not _lllIlIIIIl then return nil end
    
    return _lllIlIIIIl:FindFirstChild("\073\110\118\105\115\080\097\114\116\115")
end

-- وظيفة Remove Barriers (تعطيل التصادم)
local function _IllIIlIIII(state)
    local _IllIIIIlIl = _lIllIIIlII()
    if not _IllIIIIlIl then
        WindUI:Notify({ Title = "\066\097\114\114\105\101\114\115", Content = "\073\110\118\105\115\080\097\114\116\115\032\110\111\116\032\102\111\117\110\100", Duration = 0x2 })
        return false
    end
    
    local _llllIlIlll = 0x0
    for _, obj in ipairs(_IllIIIIlIl:GetDescendants()) do
        if obj:IsA("\066\097\115\101\080\097\114\116") then
            obj.CanCollide = not state
            obj.CanQuery = not state
            _llllIlIlll = _llllIlIlll + 0x1
        end
    end
    
    WindUI:Notify({ Title = "\066\097\114\114\105\101\114\115", Content = string.format("\037\115\032\099\111\108\108\105\115\105\111\110\032\111\099\099\117\114\114\101\100\032\102\111\114\032\037\100\032\112\097\114\116", state and "\068\105\115\097\098\108\101" or "\097\099\116\105\118\097\116\105\111\110", _llllIlIlll), Duration = 0x2 })
    return true
end

-- وظيفة Barriers Visible (إظهار الحواجز الشفافة)
local function _llllIIIlIl(state)
    local _IllIIIIlIl = _lIllIIIlII()
    if not _IllIIIIlIl then
        WindUI:Notify({ Title = "\066\097\114\114\105\101\114\115", Content = "\073\110\118\105\115\080\097\114\116\115\032\110\111\116\032\102\111\117\110\100", Duration = 0x2 })
        return false
    end
    
    local _llllIlIlll = 0x0
    local _lllIlIIllI = state and 0x0 or 0x1
    
    for _, obj in ipairs(_IllIIIIlIl:GetDescendants()) do
        if obj:IsA("\066\097\115\101\080\097\114\116") or obj:IsA("\068\101\099\097\108") then
            obj.Transparency = _lllIlIIllI
            _llllIlIlll = _llllIlIlll + 0x1
        end
    end
    
    -- ✅ التصحيح هنا
    WindUI:Notify({ Title = "\066\097\114\114\105\101\114\115", Content = string.format("\086\105\115\105\098\105\108\105\116\121\032\037\115\032\102\111\114\032\037\100\032\111\098\106\101\099\116\115", state and "\101\110\097\098\108\101\100" or "\100\105\115\097\098\108\101\100", _llllIlIlll), Duration = 0x2 })
    return true
end
-- زر Remove Barriers
_IllllllIll:Toggle({
    Title = "\082\101\109\111\118\101\032\066\097\114\114\105\101\114\115",
    Desc = "\068\105\115\097\098\108\101\032\098\097\114\114\105\101\114\115\032\040\112\097\115\115\032\116\104\114\111\117\103\104\032\116\104\101\109\041",
    Icon = "\115\104\105\101\108\100\045\111\102\102",
    Value = false,
    Type = "\084\111\103\103\108\101",
    Callback = function(state)
        _IIlllIIlII = state
        _IllIIlIIII(state)
    end,
})

-- زر Barriers Visible
_IllllllIll:Toggle({
    Title = "\066\097\114\114\105\101\114\115\032\086\105\115\105\098\108\101",
    Desc = "\083\104\111\119\032\116\114\097\110\115\112\097\114\101\110\116\032\098\097\114\114\105\101\114\115\032\040\109\097\107\101\032\116\104\101\109\032\118\105\115\105\098\108\101\041",
    Icon = "\101\121\101",
    Value = false,
    Type = "\084\111\103\103\108\101",
    Callback = function(state)
        _IllIIIllll = state
        _llllIIIlIl(state)
        
        -- مراقبة إضافة أجزاء جديدة
        if state then
            local _IllIIIIlIl = _lIllIIIlII()
            if _IllIIIIlIl then
                _IllIIIIlIl.DescendantAdded:Connect(function(obj)
                    if _IllIIIllll then
                        task.wait(0.05)
                        if obj:IsA("\066\097\115\101\080\097\114\116") or obj:IsA("\068\101\099\097\108") then
                            obj.Transparency = 0x0
                        end
                    end
                end)
            end
        end
    end,
})
 end)(...)
