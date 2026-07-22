-- ============================================
-- NEO HYPER - SHADERS MODULE (WindUI Edition)
-- ============================================
return function(Window)
    local Lighting = game:GetService("Lighting")
    local RunService = game:GetService("RunService")
    local Terrain = workspace:FindFirstChildOfClass("Terrain")

    -- إيجاد أو إنشاء مؤثرات الإضاءة
    local function getEffect(className)
        return Lighting:FindFirstChildOfClass(className) or Instance.new(className, Lighting)
    end

    local bloom = getEffect("BloomEffect")
    local cc = getEffect("ColorCorrectionEffect")
    local atmo = getEffect("Atmosphere")
    local sky = getEffect("Sky")
    local cloud = Terrain and Terrain:FindFirstChildOfClass("Clouds") or Instance.new("Clouds", Terrain or Lighting)

    local Camera = workspace.CurrentCamera
    local mblur = Camera and (Camera:FindFirstChildOfClass("BlurEffect") or Instance.new("BlurEffect", Camera))
    if mblur then mblur.Size = 0 end

    -- حفظ القيم الافتراضية للعبة لاسترجاعها (Reset)
    local defaults = {
        Ambient = Lighting.Ambient,
        ClockTime = Lighting.ClockTime,
        Latitude = Lighting.GeographicLatitude,
        Brightness = Lighting.Brightness,
        Exposure = Lighting.ExposureCompensation,
        EnvDiff = Lighting.EnvironmentDiffuseScale,
        EnvSpec = Lighting.EnvironmentSpecularScale,
        BloomI = bloom.Intensity,
        BloomS = bloom.Size,
        BloomT = bloom.Threshold,
        BloomEnabled = bloom.Enabled,
        CCBright = cc.Brightness,
        CCCont = cc.Contrast,
        CCSat = cc.Saturation,
        CCTint = cc.TintColor,
        CCEnabled = cc.Enabled,
        CloudCover = cloud.Cover,
        CloudDensity = cloud.Density,
        CloudColor = cloud.Color,
        AtmoDensity = atmo.Density,
        AtmoOffset = atmo.Offset,
        AtmoColor = atmo.Color,
        AtmoGlare = atmo.Glare,
        AtmoHaze = atmo.Haze,
        SkyBk = sky.SkyboxBk, SkyDn = sky.SkyboxDn, SkyFt = sky.SkyboxFt,
        SkyLf = sky.SkyboxLf, SkyRt = sky.SkyboxRt, SkyUp = sky.SkyboxUp,
        FogEnd = Lighting.FogEnd, FogStart = Lighting.FogStart
    }

    -- متغيرات التحكم والـ Overrides
    local motionEnabled = false
    local motionIntensity = 0
    local lastLookVec = Camera and Camera.CFrame.LookVector or Vector3.new()

    local forceSky, forceCloud, forceAtmo, forceCC, forceBloom, forceFog = false, false, false, false, false, false
    local savedSky = {}
    local savedCloudCover, savedCloudDensity, savedCloudColor = 0, 0, Color3.fromRGB(255, 255, 255)
    local savedAtmoDensity, savedAtmoOffset, savedAtmoColor, savedAtmoGlare, savedAtmoHaze = 0, 0, Color3.fromRGB(255, 255, 255), 0, 0
    local savedCCBright, savedCCCont, savedCCSat, savedCCTint = 0, 0, 0, Color3.fromRGB(255, 255, 255)
    local savedBloomI, savedBloomS, savedBloomT = 0, 0, 0
    local savedFogEnd, savedFogStart = 9e9, 9e9

    -- حلقة RenderStepped للثبات وتطبيق القيم بدون ما اللعبة تفرسها
    RunService.RenderStepped:Connect(function()
        if Camera then
            if motionEnabled then
                local cur = Camera.CFrame.LookVector
                local delta = (cur - lastLookVec).Magnitude
                mblur.Size = delta * motionIntensity * 0.8
                lastLookVec = cur
            else
                mblur.Size = 0
            end
        end

        if forceSky and savedSky.bk then
            pcall(function()
                sky.SkyboxBk, sky.SkyboxDn, sky.SkyboxFt = savedSky.bk, savedSky.dn, savedSky.ft
                sky.SkyboxLf, sky.SkyboxRt, sky.SkyboxUp = savedSky.lf, savedSky.rt, savedSky.up
            end)
        end
        if forceCloud then pcall(function() cloud.Cover, cloud.Density, cloud.Color = savedCloudCover, savedCloudDensity, savedCloudColor end) end
        if forceAtmo then pcall(function() atmo.Density, atmo.Offset, atmo.Color, atmo.Glare, atmo.Haze = savedAtmoDensity, savedAtmoOffset, savedAtmoColor, savedAtmoGlare, savedAtmoHaze end) end
        if forceCC then pcall(function() cc.Brightness, cc.Contrast, cc.Saturation, cc.TintColor, cc.Enabled = savedCCBright, savedCCCont, savedCCSat, savedCCTint, true end) end
        if forceBloom then pcall(function() bloom.Intensity, bloom.Size, bloom.Threshold, bloom.Enabled = savedBloomI, savedBloomS, savedBloomT, true end) end
        if forceFog then pcall(function() Lighting.FogEnd, Lighting.FogStart = savedFogEnd, savedFogStart end) end
    end)

    -- ============================================
    -- إنشاء تابة Shaders داخل WindUI
    -- ============================================
    local ShadersTab = Window:Tab({
        Title = "Shaders",
        Icon = "solar:sun-bold-duotone",
        Locked = false
    })

    -- 1️⃣ Presets Section
    local PresetsSection = ShadersTab:Section({ Title = "Presets", Side = "Left", Collapsed = false })

    local presetData = {
        Blossom = {
            ambient = Color3.fromHSV(0.78, 0.20, 0.69), clockTime = 10, latitude = 43, brightness = 2.52, exposure = 0.38,
            envDiff = 0.33, envSpec = 0.46, bloomI = 0.71, bloomS = 33, bloomT = 0.95, ccBright = 0.02, ccCont = -0.01, ccSat = -0.19,
            tint = Color3.fromHSV(0, 0, 1), motion = 20, cloudCover = 0.77, cloudDensity = 0.52, cloudColor = Color3.fromHSV(0.79, 0.50, 1),
            atmoDensity = 0.56, atmoOffset = 0.56, atmoColor = Color3.fromHSV(0.80, 0.37, 0.89), atmoGlare = 0, atmoHaze = 5.11,
            skyBk = "rbxassetid://9544505500", skyDn = "rbxassetid://9544547905", skyFt = "rbxassetid://9544504852",
            skyLf = "rbxassetid://9544547694", skyRt = "rbxassetid://9544547542", skyUp = "rbxassetid://9544547398"
        },
        Rain = {
            ambient = Color3.fromHSV(0.08, 0.02, 0.43), clockTime = 15, latitude = -45, brightness = 0.25, exposure = 0.5,
            envDiff = 0.20, envSpec = 0.25, bloomI = 0.3, bloomS = 10, bloomT = 0.8, ccBright = 0.1, ccCont = 0.5, ccSat = -0.3,
            tint = Color3.fromHSV(0, 0, 0.78), motion = 0, cloudCover = 0.75, cloudDensity = 0.93, cloudColor = Color3.fromHSV(0.08, 0.02, 0.65),
            atmoDensity = 0.56, atmoOffset = 0.55, atmoColor = Color3.fromHSV(0.08, 0.02, 0.65), atmoGlare = 0.36, atmoHaze = 1.72,
            skyBk = "rbxassetid://9544505500", skyDn = "rbxassetid://9544547905", skyFt = "rbxassetid://9544504852",
            skyLf = "rbxassetid://9544547694", skyRt = "rbxassetid://9544547542", skyUp = "rbxassetid://9544547398"
        },
        Snow = {
            ambient = Color3.fromHSV(0, 0, 0.95), clockTime = 10, latitude = -45, brightness = -0.1, exposure = 0.2,
            envDiff = 0.40, envSpec = 0.25, bloomI = 0.3, bloomS = 10, bloomT = 0.8, ccBright = -0.1, ccCont = 0.2, ccSat = -0.3,
            tint = Color3.fromHSV(0.67, 0.05, 1), motion = 0, cloudCover = 0.55, cloudDensity = 0.93, cloudColor = Color3.fromHSV(0, 0, 0.95),
            atmoDensity = 0.56, atmoOffset = 0.55, atmoColor = Color3.fromHSV(0.08, 0.02, 0.65), atmoGlare = 0.36, atmoHaze = 1.72,
            skyBk = "rbxassetid://9544505500", skyDn = "rbxassetid://9544547905", skyFt = "rbxassetid://9544504852",
            skyLf = "rbxassetid://9544547694", skyRt = "rbxassetid://9544547542", skyUp = "rbxassetid://9544547398"
        }
    }

    local function applyPreset(d)
        if d.ambient then Lighting.Ambient = d.ambient end
        if d.clockTime then Lighting.ClockTime = d.clockTime end
        if d.latitude then Lighting.GeographicLatitude = d.latitude end
        if d.brightness then Lighting.Brightness = d.brightness end
        if d.exposure then Lighting.ExposureCompensation = d.exposure end
        if d.envDiff then Lighting.EnvironmentDiffuseScale = d.envDiff end
        if d.envSpec then Lighting.EnvironmentSpecularScale = d.envSpec end

        if d.bloomI then
            bloom.Intensity = d.bloomI; bloom.Size = d.bloomS or 0; bloom.Threshold = d.bloomT or 0
            savedBloomI, savedBloomS, savedBloomT = d.bloomI, d.bloomS or 0, d.bloomT or 0
            bloom.Enabled = true; forceBloom = true
        end

        if d.ccBright then
            cc.Brightness = d.ccBright; cc.Contrast = d.ccCont or 0; cc.Saturation = d.ccSat or 0
            if d.tint then cc.TintColor = d.tint; savedCCTint = d.tint end
            savedCCBright, savedCCCont, savedCCSat = d.ccBright, d.ccCont or 0, d.ccSat or 0
            cc.Enabled = true; forceCC = true
        end

        if d.motion then motionIntensity = d.motion; motionEnabled = (d.motion > 0) end

        if d.cloudCover then
            cloud.Cover = d.cloudCover; cloud.Density = d.cloudDensity or 0
            if d.cloudColor then cloud.Color = d.cloudColor; savedCloudColor = d.cloudColor end
            savedCloudCover, savedCloudDensity = d.cloudCover, d.cloudDensity or 0
            forceCloud = true
        end

        if d.atmoDensity then
            atmo.Density = d.atmoDensity; atmo.Offset = d.atmoOffset or 0
            if d.atmoColor then atmo.Color = d.atmoColor; savedAtmoColor = d.atmoColor end
            atmo.Glare = d.atmoGlare or 0; atmo.Haze = d.atmoHaze or 0
            savedAtmoDensity, savedAtmoOffset, savedAtmoGlare, savedAtmoHaze = d.atmoDensity, d.atmoOffset or 0, d.atmoGlare or 0, d.atmoHaze or 0
            forceAtmo = true
        end

        if d.skyBk then
            sky.SkyboxBk, sky.SkyboxDn, sky.SkyboxFt = d.skyBk, d.skyDn, d.skyFt
            sky.SkyboxLf, sky.SkyboxRt, sky.SkyboxUp = d.skyLf, d.skyRt, d.skyUp
            savedSky = { bk = d.skyBk, dn = d.skyDn, ft = d.skyFt, lf = d.skyLf, rt = d.skyRt, up = d.skyUp }
            forceSky = true
        end

        Lighting.FogEnd, Lighting.FogStart = 9e9, 9e9
        savedFogEnd, savedFogStart = 9e9, 9e9
        forceFog = true
    end

    PresetsSection:Dropdown({
        Title = "Select Preset",
        Values = { "None", "Blossom", "Rain", "Snow" },
        Default = "None",
        Callback = function(value)
            if presetData[value] then
                applyPreset(presetData[value])
                if WindUI and WindUI.Notify then
                    WindUI:Notify({ Title = "Shaders", Content = "Applied Preset: " .. value, Duration = 2 })
                end
            end
        end
    })

    PresetsSection:Button({
        Title = "Reset All Shaders",
        Callback = function()
            forceSky, forceCloud, forceAtmo, forceCC, forceBloom, forceFog = false, false, false, false, false, false
            Lighting.Ambient = defaults.Ambient
            Lighting.ClockTime = defaults.ClockTime
            Lighting.GeographicLatitude = defaults.Latitude
            Lighting.Brightness = defaults.Brightness
            Lighting.ExposureCompensation = defaults.Exposure
            Lighting.EnvironmentDiffuseScale = defaults.EnvDiff
            Lighting.EnvironmentSpecularScale = defaults.EnvSpec
            Lighting.FogEnd = defaults.FogEnd
            Lighting.FogStart = defaults.FogStart

            bloom.Enabled, bloom.Intensity, bloom.Size, bloom.Threshold = defaults.BloomEnabled, defaults.BloomI, defaults.BloomS, defaults.BloomT
            cc.Enabled, cc.Brightness, cc.Contrast, cc.Saturation, cc.TintColor = defaults.CCEnabled, defaults.CCBright, defaults.CCCont, defaults.CCSat, defaults.CCTint
            cloud.Cover, cloud.Density, cloud.Color = defaults.CloudCover, defaults.CloudDensity, defaults.CloudColor
            atmo.Density, atmo.Offset, atmo.Color, atmo.Glare, atmo.Haze = defaults.AtmoDensity, defaults.AtmoOffset, defaults.AtmoColor, defaults.AtmoGlare, defaults.AtmoHaze
            sky.SkyboxBk, sky.SkyboxDn, sky.SkyboxFt = defaults.SkyBk, defaults.SkyDn, defaults.SkyFt
            sky.SkyboxLf, sky.SkyboxRt, sky.SkyboxUp = defaults.SkyLf, defaults.SkyRt, defaults.SkyUp

            motionIntensity = 0; motionEnabled = false
            if mblur then mblur.Size = 0 end

            if WindUI and WindUI.Notify then
                WindUI:Notify({ Title = "Shaders", Content = "Reset all shaders to default!", Duration = 2 })
            end
        end
    })

    -- 2️⃣ Time & Position Section
    local TimeSection = ShadersTab:Section({ Title = "Time & Position", Side = "Right", Collapsed = false })

    TimeSection:Slider({
        Title = "Clock Time",
        Value = { Min = 0, Max = 24, Default = math.floor(Lighting.ClockTime) },
        Step = 0.5,
        Callback = function(v) Lighting.ClockTime = v end
    })

    TimeSection:Slider({
        Title = "Latitude",
        Value = { Min = 0, Max = 360, Default = math.floor(Lighting.GeographicLatitude) },
        Callback = function(v) Lighting.GeographicLatitude = v end
    })

    TimeSection:Slider({
        Title = "Brightness",
        Value = { Min = -5, Max = 10, Default = Lighting.Brightness },
        Step = 0.1,
        Callback = function(v) Lighting.Brightness = v end
    })

    TimeSection:Slider({
        Title = "Exposure",
        Value = { Min = -5, Max = 5, Default = Lighting.ExposureCompensation },
        Step = 0.1,
        Callback = function(v) Lighting.ExposureCompensation = v end
    })

    TimeSection:Colorpicker({
        Title = "Ambient Color",
        Default = Lighting.Ambient,
        Callback = function(col) Lighting.Ambient = col end
    })

    -- 3️⃣ Environment Section
    local EnvSection = ShadersTab:Section({ Title = "Environment", Side = "Left", Collapsed = false })

    EnvSection:Slider({
        Title = "Diffuse Scale",
        Value = { Min = 0, Max = 1, Default = Lighting.EnvironmentDiffuseScale },
        Step = 0.05,
        Callback = function(v) Lighting.EnvironmentDiffuseScale = v end
    })

    EnvSection:Slider({
        Title = "Specular Scale",
        Value = { Min = 0, Max = 1, Default = Lighting.EnvironmentSpecularScale },
        Step = 0.05,
        Callback = function(v) Lighting.EnvironmentSpecularScale = v end
    })

    -- 4️⃣ Color Correction Section
    local CCSection = ShadersTab:Section({ Title = "Color Correction", Side = "Right", Collapsed = false })

    CCSection:Slider({
        Title = "Brightness",
        Value = { Min = -1, Max = 1, Default = cc.Brightness },
        Step = 0.05,
        Callback = function(v)
            cc.Brightness = v; savedCCBright = v
            forceCC = true; cc.Enabled = true
        end
    })

    CCSection:Slider({
        Title = "Contrast",
        Value = { Min = -1, Max = 1, Default = cc.Contrast },
        Step = 0.05,
        Callback = function(v)
            cc.Contrast = v; savedCCCont = v
            forceCC = true; cc.Enabled = true
        end
    })

    CCSection:Slider({
        Title = "Saturation",
        Value = { Min = -1, Max = 1, Default = cc.Saturation },
        Step = 0.05,
        Callback = function(v)
            cc.Saturation = v; savedCCSat = v
            forceCC = true; cc.Enabled = true
        end
    })

    CCSection:Colorpicker({
        Title = "Tint Color",
        Default = cc.TintColor,
        Callback = function(col)
            cc.TintColor = col; savedCCTint = col
            forceCC = true; cc.Enabled = true
        end
    })

    -- 5️⃣ Bloom Section
    local BloomSection = ShadersTab:Section({ Title = "Bloom", Side = "Left", Collapsed = false })

    BloomSection:Slider({
        Title = "Intensity",
        Value = { Min = 0, Max = 1, Default = bloom.Intensity },
        Step = 0.05,
        Callback = function(v)
            bloom.Intensity = v; savedBloomI = v
            forceBloom = (v > 0); bloom.Enabled = (v > 0)
        end
    })

    BloomSection:Slider({
        Title = "Size",
        Value = { Min = 0, Max = 56, Default = bloom.Size },
        Step = 1,
        Callback = function(v) bloom.Size = v; savedBloomS = v end
    })

    BloomSection:Slider({
        Title = "Threshold",
        Value = { Min = 0, Max = 4, Default = bloom.Threshold },
        Step = 0.1,
        Callback = function(v) bloom.Threshold = v; savedBloomT = v end
    })

    -- 6️⃣ Motion Blur Section
    local MotionSection = ShadersTab:Section({ Title = "Motion Blur", Side = "Right", Collapsed = false })

    MotionSection:Slider({
        Title = "Motion Intensity",
        Value = { Min = 0, Max = 100, Default = 0 },
        Step = 1,
        Callback = function(v)
            motionIntensity = v
            motionEnabled = (v > 0)
            if not motionEnabled and mblur then mblur.Size = 0 end
        end
    })

    -- 7️⃣ Sky & Atmosphere Section
    local SkySection = ShadersTab:Section({ Title = "Clouds & Atmosphere", Side = "Left", Collapsed = false })

    SkySection:Slider({
        Title = "Cloud Cover",
        Value = { Min = 0, Max = 1, Default = cloud.Cover },
        Step = 0.05,
        Callback = function(v)
            cloud.Cover = v; savedCloudCover = v
            forceCloud = true
        end
    })

    SkySection:Slider({
        Title = "Cloud Density",
        Value = { Min = 0, Max = 1, Default = cloud.Density },
        Step = 0.05,
        Callback = function(v) cloud.Density = v; savedCloudDensity = v end
    })

    SkySection:Colorpicker({
        Title = "Cloud Color",
        Default = cloud.Color,
        Callback = function(col)
            cloud.Color = col; savedCloudColor = col
            forceCloud = true
        end
    })

    SkySection:Slider({
        Title = "Atmosphere Density",
        Value = { Min = 0, Max = 1, Default = atmo.Density },
        Step = 0.05,
        Callback = function(v)
            atmo.Density = v; savedAtmoDensity = v
            forceAtmo = true
        end
    })

    SkySection:Slider({
        Title = "Atmosphere Offset",
        Value = { Min = 0, Max = 1, Default = atmo.Offset },
        Step = 0.05,
        Callback = function(v) atmo.Offset = v; savedAtmoOffset = v end
    })

    SkySection:Slider({
        Title = "Atmosphere Glare",
        Value = { Min = 0, Max = 10, Default = atmo.Glare },
        Step = 0.1,
        Callback = function(v) atmo.Glare = v; savedAtmoGlare = v end
    })

    SkySection:Slider({
        Title = "Atmosphere Haze",
        Value = { Min = 0, Max = 10, Default = atmo.Haze },
        Step = 0.1,
        Callback = function(v) atmo.Haze = v; savedAtmoHaze = v end
    })

    SkySection:Colorpicker({
        Title = "Atmosphere Color",
        Default = atmo.Color,
        Callback = function(col)
            atmo.Color = col; savedAtmoColor = col
            forceAtmo = true
        end
    })

    -- 8️⃣ Skybox Selector Section
    local SkyboxSection = ShadersTab:Section({ Title = "Skybox Customization", Side = "Right", Collapsed = false })

    local skyNames = { "Default", "Morning", "Midday", "Afternoon", "Evening", "Rain", "Cloudy" }
    local skyData = {
        Default = {},
        Morning = { bk = "rbxassetid://9544505500", dn = "rbxassetid://9544547905", ft = "rbxassetid://9544504852", lf = "rbxassetid://9544547694", rt = "rbxassetid://9544547542", up = "rbxassetid://9544547398" },
        Midday = { bk = "rbxassetid://9544505500", dn = "rbxassetid://9544547905", ft = "rbxassetid://9544504852", lf = "rbxassetid://9544547694", rt = "rbxassetid://9544547542", up = "rbxassetid://9544547398" },
        Afternoon = { bk = "rbxassetid://9544505500", dn = "rbxassetid://9544547905", ft = "rbxassetid://9544504852", lf = "rbxassetid://9544547694", rt = "rbxassetid://9544547542", up = "rbxassetid://9544547398" },
        Evening = { bk = "rbxassetid://9544505500", dn = "rbxassetid://9544547905", ft = "rbxassetid://9544504852", lf = "rbxassetid://9544547694", rt = "rbxassetid://9544547542", up = "rbxassetid://9544547398" },
        Rain = { bk = "rbxassetid://9544505500", dn = "rbxassetid://9544547905", ft = "rbxassetid://9544504852", lf = "rbxassetid://9544547694", rt = "rbxassetid://9544547542", up = "rbxassetid://9544547398" },
        Cloudy = { bk = "rbxassetid://9544505500", dn = "rbxassetid://9544547905", ft = "rbxassetid://9544504852", lf = "rbxassetid://9544547694", rt = "rbxassetid://9544547542", up = "rbxassetid://9544547398" }
    }

    SkyboxSection:Dropdown({
        Title = "Preset Skybox",
        Values = skyNames,
        Default = "Default",
        Callback = function(curSky)
            if skyData[curSky] and skyData[curSky].bk then
                sky.SkyboxBk, sky.SkyboxDn, sky.SkyboxFt = skyData[curSky].bk, skyData[curSky].dn, skyData[curSky].ft
                sky.SkyboxLf, sky.SkyboxRt, sky.SkyboxUp = skyData[curSky].lf, skyData[curSky].rt, skyData[curSky].up
                savedSky = { bk = skyData[curSky].bk, dn = skyData[curSky].dn, ft = skyData[curSky].ft, lf = skyData[curSky].lf, rt = skyData[curSky].rt, up = skyData[curSky].up }
                forceSky = true
            elseif curSky == "Default" then
                sky.SkyboxBk, sky.SkyboxDn, sky.SkyboxFt = defaults.SkyBk, defaults.SkyDn, defaults.SkyFt
                sky.SkyboxLf, sky.SkyboxRt, sky.SkyboxUp = defaults.SkyLf, defaults.SkyRt, defaults.SkyUp
                forceSky = false
            end
        end
    })

    SkyboxSection:Input({
        Title = "Custom Skybox ID",
        Placeholder = "Enter Asset ID",
        Callback = function(id)
            if id and id ~= "" then
                local asset = "rbxassetid://" .. id
                sky.SkyboxBk, sky.SkyboxDn, sky.SkyboxFt = asset, asset, asset
                sky.SkyboxLf, sky.SkyboxRt, sky.SkyboxUp = asset, asset, asset
                savedSky = { bk = asset, dn = asset, ft = asset, lf = asset, rt = asset, up = asset }
                forceSky = true
                if WindUI and WindUI.Notify then
                    WindUI:Notify({ Title = "Skybox", Content = "Loaded Custom Skybox ID: " .. id, Duration = 2 })
                end
            end
        end
    })

    print("✅ Shaders Module (Full Conversion) Loaded Successfully!")
end
