--[[
    AIMBOT BY Kyss
    i stole original code from another guy(idk his name) and revamped it

    Changes:
        -removed FPS factor, maybe ill return it later
        +added new ui
        +added head hitbox display
        +added passive prediction multiplyer setting
        +added colors
        +added config save system
        +added UseOriginalHead option that will improve aiming but can be laggy on some machines
        ~replaced ignorelist display to new ui

    Keys:
        F2 - toggle aimbot
        RMB: Start aiming
        Right CTRL: Add/Remove player to/from IgnoreList
]]

getgenv().global = getgenv()

-- Configuration
-- if you want to disable specific setting that has distance as value set it to -1
global.ignoreListText = nil

print("aim started")



local Players = cloneref(game:GetService("Players"))
local RunService = cloneref(game:GetService("RunService"))
local Workspace = cloneref(game:GetService("Workspace"))
local Camera = Workspace.CurrentCamera
local Replicated = cloneref(game:GetService("ReplicatedStorage"))
local UserInputService = cloneref(game:GetService("UserInputService"))

local LocalPlayer = Players.LocalPlayer
local CoreGui = cloneref(game:FindService("CoreGui"))

global.aimEnabled = true

-- Таблица для хранения исключений
global.ExcludedPlayers = {}

-- Функция для добавления/удаления игрока из исключений
local function toggleExcludedPlayer(player)
    if global.ExcludedPlayers[player] then
        global.ExcludedPlayers[player] = nil
        print("Player " .. player.Name .. " removed from Ignore List")
    else
        global.ExcludedPlayers[player] = true
        print("Player " .. player.Name .. " added to Ignore List")
    end
end

-- Функция для поиска ближайшего игрока под курсором
local function findPlayerUnderCursor()
    local mouse = UserInputService:GetMouseLocation()
    local nearestPlayer, minDistance = nil, math.huge

    for _, player in Players:GetPlayers() do
        if player ~= LocalPlayer and player.Character then
            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                local screenPos = Camera:WorldToViewportPoint(rootPart.Position)
                local distance = (Vector2.new(screenPos.X, screenPos.Y) - mouse).Magnitude

                if distance < minDistance then
                    nearestPlayer = player
                    minDistance = distance
                end
            end
        end
    end

    return nearestPlayer
end

local function getFullCharacterModel(character)

    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    local nearest

    minDist = 999999999
    for _, fullCharacter in ipairs(Workspace.Characters:GetChildren()) do
        local upperTorso = fullCharacter:FindFirstChild("UpperTorso")
        if upperTorso then
            local distance = (humanoidRootPart.Position - upperTorso.Position).Magnitude
            if distance <= minDist then
                nearest = fullCharacter
                minDist = distance
            end
        end
    end

    return nearest
end

local function getHead(character)
    if config.UseOriginalHead then
        if game.GameId == 41210807 then -- for the gun testing
            local fullModel = getFullCharacterModel(character)
            if fullModel then
                local head = fullModel:FindFirstChild("Head")
                if head then
                    return head
                end
            end
            warn("Failed to find original head in GunTesting mode")
            return character:FindFirstChild("ServerColliderHead")
            
        else
            local worldCharacter = character:FindFirstChild("WorldCharacter")
            if worldCharacter then
                local head = worldCharacter:FindFirstChild("Head")
                if head then
                    return head
                end
            end
            warn("Failed to find original head in Aftermath mode")
            return character:FindFirstChild("ServerColliderHead")
        end
    else
        return character:FindFirstChild("ServerColliderHead")
    end
end

-- Global declaration system
function global.declare(self, index, value, check)
    if self[index] == nil then
        self[index] = value
    elseif check then
        pcall(function() value:Disconnect() end)
    end
    return self[index]
end

declare(global, "services", {})

-- Service management
function global.get(service)
    return services[service]
end

-- Main modules
declare(declare(services, "loop", {}), "cache", {})
declare(declare(services, "player", {}), "cache", {})
declare(global, "features", {})



-- Drawing setup
declare(services, "drawing", {
    Circle = Drawing.new("Circle"),
    DebugLine = Drawing.new("Line"),
    DebugBStext = Drawing.new("Text"),
    DebugServerHeadVizualization = Drawing.new("Square"),
    CloseRangeText = Drawing.new("Text"),
    TargetModeText = Drawing.new("Text"), -- Новый текстовый элемент
    IgnoreListText = Drawing.new("Text")
})

--uis
get("drawing").Circle.Visible = true
get("drawing").Circle.Color = Color3.fromRGB(0,0,0)
get("drawing").Circle.Thickness = 2
get("drawing").Circle.NumSides = 50
get("drawing").Circle.Radius = config.CircleRadius
get("drawing").Circle.Filled = false

get("drawing").DebugLine.Color = Color3.fromRGB(0, 255, 0)
get("drawing").DebugLine.Thickness = 2
get("drawing").DebugLine.Transparency = 0.8
get("drawing").DebugLine.Visible = false

get("drawing").DebugBStext.Visible = true
get("drawing").DebugBStext.Color = Color3.fromRGB(0,0,0)
get("drawing").DebugBStext.Size = 15
get("drawing").DebugBStext.Center = true
get("drawing").DebugBStext.Text = "Bullet speed: ???"

get("drawing").DebugServerHeadVizualization.Size = Vector2.new(8,8)
get("drawing").DebugServerHeadVizualization.Thickness = 1
get("drawing").DebugServerHeadVizualization.Color = Color3.fromRGB(255, 255, 255)
get("drawing").DebugServerHeadVizualization.Filled = false

-- Настройка текстовых уведомлений
get("drawing").CloseRangeText.Visible = false
get("drawing").CloseRangeText.Color = Color3.fromRGB(255, 50, 50)
get("drawing").CloseRangeText.Size = 20
get("drawing").CloseRangeText.Font = 2
get("drawing").CloseRangeText.Outline = true
get("drawing").CloseRangeText.Text = "CLOSE RANGE MODE"

get("drawing").TargetModeText.Visible = false
get("drawing").TargetModeText.Color = Color3.fromRGB(255, 100, 100)
get("drawing").TargetModeText.Size = 20
get("drawing").TargetModeText.Font = 2
get("drawing").TargetModeText.Outline = true
get("drawing").TargetModeText.Text = "AIM TO NEAREST TARGET MODE"

-- get("drawing").IgnoreListText.Text = "Player Ignore List: \n"
-- get("drawing").IgnoreListText.Color = Color3.fromRGB(0, 255, 0)
-- get("drawing").IgnoreListText.Size = 20
-- get("drawing").IgnoreListText.Font = 2
-- get("drawing").IgnoreListText.Outline = true
-- get("drawing").IgnoreListText.Visible = config.IgnoreListTextEnabled
--

-- FPS tracking system
declare(services, "fps", {
    currentFPS = 60,
    lastUpdate = tick(),
    frameCount = 0,
    
    update = function(self)
        self.frameCount = self.frameCount + 1
        local now = tick()
        local elapsed = now - self.lastUpdate
        if elapsed >= 1 then
            self.currentFPS = self.frameCount / elapsed
            self.frameCount = 0
            self.lastUpdate = now
        end
    end
})

-- Weapon system
declare(services, "weapon", {
    getHeldItem = function(self, player)
        local target = player:FindFirstChild("CurrentSelectedObject")
        return target and target.Value and target.Value.Value
    end,

    getBulletSpeed = function(self, player)
        local heldItem = self:getHeldItem(player)
        if not heldItem then return config.BaseBulletSpeed end
        
        local gunData = Replicated:WaitForChild("GunData")
        local weapon = gunData:FindFirstChild(heldItem.Name)
        
        if weapon 
        and weapon:FindFirstChild("Stats") 
        and weapon.Stats:FindFirstChild("BulletSettings")
        and weapon.Stats.BulletSettings:FindFirstChild("BulletSpeed")
        and weapon.Stats.BulletSettings.BulletSpeed.Value then
            get("drawing").DebugBStext.Text = `Bullet speed: {weapon.Stats.BulletSettings.BulletSpeed.Value}`
            return weapon.Stats.BulletSettings.BulletSpeed.Value 
        else
            get("drawing").DebugBStext.Text = `Bullet speed: {config.BaseBulletSpeed}(default, bcs unknown)`
            return config.BaseBulletSpeed
        end
    end
})

-- Prediction system с FPS-коррекцией и усилением на близкой дистанции
declare(services, "prediction", {
    calculate = function(self, targetPos, targetVel, bulletSpeed)
        local localPlayerVel = Vector3.new(0, 0, 0)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            localPlayerVel = LocalPlayer.Character.HumanoidRootPart.Velocity
        end
        
        local relativeVelocity = targetVel - localPlayerVel
        local distance = (targetPos - Camera.CFrame.Position).Magnitude
        local travelTime = distance / bulletSpeed

        -- Коррекция на основе FPS
        local fpsData = get("fps")
        local currentFPS = fpsData.currentFPS
        local referenceFPS = 60
        local fpsFactor = referenceFPS / math.max(currentFPS, 1)
        fpsFactor = math.clamp(fpsFactor, 0.5, 2)

        -- Дополнительный множитель для близкой дистанции
        local closeRangeBoost = 1.0
        if distance < config.CloseRangeThreshold then
            local boostFactor = 1 + (config.CloseRangeBoost - 1) * (1 - distance/config.CloseRangeThreshold)
            closeRangeBoost = math.clamp(boostFactor, 1, config.CloseRangeBoost)
        end

        local velocityMultiplier = 1.054  * closeRangeBoost * config.PredictionBoost
        local gravityMultiplier = 1.052 * closeRangeBoost * config.PredictionBoost
        
        return targetPos + relativeVelocity * travelTime * velocityMultiplier + 
               Vector3.new(0, config.Gravity * travelTime^2 * gravityMultiplier, 0)
    end
})

-- Targeting system
declare(services, "target", {
    currentTarget = nil,
    mouseHeld = false,

    findNearestToCursor = function(self)
        local nearest, minDist = nil, config.CircleRadius
        local mousePos = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)

        for _, player in Players:GetPlayers() do
            if player ~= LocalPlayer and player.Character and not global.ExcludedPlayers[player] then
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if rootPart and player.Character:FindFirstChild("ServerColliderHead") then
                    local screenPos = Camera:WorldToViewportPoint(rootPart.Position)
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude
                    if dist < minDist then
                        nearest = player
                        minDist = dist
                    end
                end
            end
        end
        return nearest
    end,

    findNearestByDistance = function(self)
        local nearest, minDist = nil, config.MaxDistance

        for _, player in Players:GetPlayers() do
            if player ~= LocalPlayer and player.Character and not global.ExcludedPlayers[player] then
                local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                if rootPart and player.Character:FindFirstChild("ServerColliderHead") then
                    local distance = (rootPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                    if distance <= minDist then
                        nearest = player
                        minDist = distance
                    end
                end
            end
        end
        return nearest
    end,

    aim = function(self)
        if not self.currentTarget or not self.currentTarget.Character then return end
        
        local head = getHead(self.currentTarget.Character)
        local serverHead = self.currentTarget.Character:FindFirstChild("ServerColliderHead")
        if head then
            local predictedPos = get("prediction"):calculate(
                head.Position,
                serverHead.Velocity,
                get("weapon"):getBulletSpeed(LocalPlayer)
            )
            local screenPos = Camera:WorldToViewportPoint(predictedPos)
            mousemoverel(screenPos.X - Camera.ViewportSize.X/2 + math.random(-config.RandomJigger, config.RandomJigger), 
                         screenPos.Y - Camera.ViewportSize.Y/2 + math.random(-config.RandomJigger, config.RandomJigger))
        end
    end
})

-- UI system
declare(services, "ui", {
    updateCircle = function(self)
        local screenSize = Camera.ViewportSize
        get("drawing").Circle.Position = Vector2.new(screenSize.X/2, screenSize.Y/2)
        get("drawing").Circle.Radius = config.CircleRadius
        get("drawing").Circle.Color = config.CircleColor
        
    end,
    updateBSText = function(self)
        if config.ShowBulletSpeed then
            local screenSize = Camera.ViewportSize
            get("drawing").DebugBStext.Visible = true
            get("drawing").DebugBStext.Position = Vector2.new(screenSize.X/2, (screenSize.Y/2 + config.CircleRadius) + 5)
        else
            get("drawing").DebugBStext.Visible = false
        end
    end,
    updateModesVisualization = function(aimToNearestMode, closeRangeMode)
        if config.ShowActiveModes then
            get("drawing").TargetModeText.Visible = aimToNearestMode
            get("drawing").CloseRangeText.Visible = closeRangeMode
        else
            get("drawing").TargetModeText.Visible = false
            get("drawing").CloseRangeText.Visible = false
        end
    end,
    updateDebugLine = function(self)
        if not config.DebugLineEnabled then
            get("drawing").DebugLine.Visible = false
            return
        end

        local target = get("target"):findNearestToCursor()
        if target and target.Character then
            local serverHead = target.Character:FindFirstChild("ServerColliderHead")
            if serverHead then
                local predictedPos = get("prediction"):calculate(
                    serverHead.Position,
                    serverHead.Velocity,
                    get("weapon"):getBulletSpeed(LocalPlayer)
                )
                
                local screenPos = Camera:WorldToViewportPoint(predictedPos)
                get("drawing").Color = config.DebugLineColor
                get("drawing").DebugLine.From = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
                get("drawing").DebugLine.To = Vector2.new(screenPos.X, screenPos.Y)
                get("drawing").DebugLine.Visible = true
                return
            end
        end
        get("drawing").DebugLine.Visible = false
    end,
    updateServerHeadVisualization = function(self)
        if not config.ShowDebugServerHeadVizualization then
            get("drawing").DebugServerHeadVizualization.Visible = false
            return
        end

        local target = get("target"):findNearestByDistance()
        if not target then
            get("drawing").DebugServerHeadVizualization.Visible = false
            return
        end
            
        local head = getHead(target.Character)
        local screenPos, visible = Camera:WorldToViewportPoint(head.Position)
        if not visible then
            get("drawing").DebugServerHeadVizualization.Visible = false
            return
        end
        get("drawing").DebugServerHeadVizualization.Visible = true
        get("drawing").DebugServerHeadVizualization.Position = Vector2.new(screenPos.X - get("drawing").DebugServerHeadVizualization.Size.X/2, screenPos.Y - get("drawing").DebugServerHeadVizualization.Size.Y/2)

        -- do
        --     local rayOrigin = Camera.CFrame.Position
        --     local rayDestination = head.Position
        --     local rayDirection = rayDestination - rayOrigin

        --     local raycastParams = RaycastParams.new()
        --     raycastParams.FilterDescendantsInstances = {LocalPlayer.Character, target.Character.ServerCollider, Camera}
        --     raycastParams.FilterType = Enum.RaycastFilterType.Exclude
        --     raycastParams.IgnoreWater = true

        --     local raycastResult = Workspace:Raycast(rayOrigin, rayDirection, raycastParams)
        --     warn(raycastResult, Camera.CFrame.Position)
        --     if raycastResult and raycastResult.Instance then
        --         print(raycastResult.Instance:GetFullName())
        --     end
        --     if raycastResult and raycastResult.Instance:IsAncestorOf(target.Character) then
        --         get("drawing").DebugServerHeadVizualization.Color = Color3.new(1,0,0)
        --     else
        --         get("drawing").DebugServerHeadVizualization.Color = Color3.new(0,0,0)
        --     end
        -- end
    end
})

-- Input system
declare(services, "input", {
    connections = {},

    init = function(self)
        declare(self.connections, "mouseHold", 
            UserInputService.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton2 then
                    get("target").mouseHeld = true
                end
            end), true)

        declare(self.connections, "mouseRelease", 
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton2 then
                    get("target").mouseHeld = false
                    get("target").currentTarget = nil
                end
            end), true)

        -- declare(self.connections, "toggleAim", 
        --     UserInputService.InputBegan:Connect(function(input)
        --         if input.KeyCode == Enum.KeyCode.F2 then
        --             global.aimEnabled = not global.aimEnabled
        --             get("drawing").Circle.Visible = global.aimEnabled
        --         end
        --     end), true)

        -- declare(self.connections, "toggleExclude", 
        --     UserInputService.InputBegan:Connect(function(input)
        --         if input.KeyCode == Enum.KeyCode.RightControl then
        --             local target = findPlayerUnderCursor()
        --             if target then
        --                 toggleExcludedPlayer(target)
        --             end
        --         end
        --     end), 
        -- true)
    end
})

-- Feature system
declare(features, "aimbot", {
    enabled = true,
    toggle = function(self)
        self.enabled = not self.enabled
        print("Aimbot " .. (self.enabled and "enabled" or "disabled"))
    end
})

-- Main loop
declare(get("loop"), "main", 
    RunService.RenderStepped:Connect(function()
        get("fps"):update()
        get("ui"):updateCircle()
        get("ui"):updateDebugLine()
        get("ui"):updateBSText()
        get("ui"):updateDebugLine()
        get("ui"):updateServerHeadVisualization()
        
        
        local nearestByDistance = get("target"):findNearestByDistance()
        local closeRangeActive = false
        local targetModeActive = false

        if nearestByDistance then
            local distance = (nearestByDistance.Character.HumanoidRootPart.Position - 
                            LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                            
            -- Проверка дистанций
            targetModeActive = distance <= config.MaxDistance
            closeRangeActive = distance < config.CloseRangeThreshold
        end

        get("ui"):updateModesVisualization(targetModeActive, closeRangeActive)
        
        -- Позиционирование текста
        local yPos = Camera.ViewportSize.Y - 60
        get("drawing").TargetModeText.Position = Vector2.new(20, yPos)
        get("drawing").CloseRangeText.Position = Vector2.new(20, yPos - 30)
        
        
        if global.ignoreListText then
            local playerNames = {}
            for k,v in pairs(global.ExcludedPlayers) do
                if k and k.Name then
                    playerNames[#playerNames+1] = k.Name
                end
            end
            
            global.ignoreListText:SetText("Player Ignore List: \n\n"..table.concat(playerNames, ",\n"))
        end

        if get("target").mouseHeld and features.aimbot.enabled and global.aimEnabled then
            if nearestByDistance then
                get("target").currentTarget = nearestByDistance
            else
                get("target").currentTarget = get("target"):findNearestToCursor()
            end

            if get("target").currentTarget then
                get("target"):aim()
            end
        end
    end),
true)

-- Initialization
get("input"):init()

print("Aimbot initialized")


print("Initiliazing gui...")
do
    local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
    local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
    local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
    local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

    local Options = Library.Options
    local Toggles = Library.Toggles

    Library.ForceCheckbox = false
    Library.ShowToggleFrameInKeybinds = true

    local Window = Library:CreateWindow({
        Title = "Aimbot by Aftergeometry",
        Footer = "Aftermath died from hackers, and it's your fault.",
        NotifySide = "Right",
        ShowCustomCursor = true,
    })

    local Tabs = {
        Main = Window:AddTab("Main", "sword"),
        ["UI Settings"] = Window:AddTab("Misc", "settings"),
    }

    local Elements = {
        GroupBoxes = {
            Keybinds = Tabs.Main:AddLeftGroupbox("Aimbot"),
            Modes = Tabs.Main:AddRightGroupbox("Aimbot Modes"),
            Prediction = Tabs.Main:AddRightGroupbox("Prediction Settings"),
            Visuals = Tabs.Main:AddLeftGroupbox("Visual Settings"),
            IgnoreList = Tabs.Main:AddLeftGroupbox("Ignore/Friend List")
        },
        
        Toggles = {},
        Sliders = {},
        Pickers = {},
        Labels = {},
        Dropdowns = {}
    }

    -- Aimbot Controls
    Elements.Toggles.Aimbot = Elements.GroupBoxes.Keybinds:AddToggle("AimbotToggle", {
        Text = "Aimbot",
        Default = true,
        Tooltip = "Toggle aimbot functionality",
        Callback = function(value)
            global.aimEnabled = value
            get("drawing").Circle.Visible = value
        end
    })
    Elements.Toggles.DebugBulletSpeedInfo = Elements.GroupBoxes.Visuals:AddToggle("BulletSpeedInfoToggle", {
        Text = "Show Debug BulletSpeed info",
        Default = false,
        Tooltip = "Shows bullet speed info.",
        Callback = function(value)
            config.ShowBulletSpeed = value

        end
    })

    Elements.Pickers.AimbotKey = Elements.Toggles.Aimbot:AddKeyPicker("AimbotKeybind", {
        Default = "F2",
        Text = "Aimbot Toggle Key",
        Mode = "Toggle",
        SyncToggleState = false,
        Callback = function(Value)
            Elements.Toggles.Aimbot:SetValue(not Elements.Toggles.Aimbot.Value)
        end
    })

    Elements.Sliders.AimCircle = Elements.GroupBoxes.Keybinds:AddSlider("AimCircleRadius", {
        Text = "Aim Circle Radius",
        Default = 250,
        Min = 50,
        Max = 800,
        Rounding = 1,
        Compact = false,
        Tooltip = "Detection radius for automatic aiming",
        Callback = function(value)
            config.CircleRadius = value
        end
    })

    -- Aimbot Modes
    Elements.Sliders.NearestMode = Elements.GroupBoxes.Modes:AddSlider("AimToNearestMode", {
        Text = "AimToNearestMode Distance",
        Default = 80,
        Min = -1,
        Max = 2500,
        Rounding = 1,
        Compact = false,
        Tooltip = "Maximum distance for melee targeting (-1 to disable)",
        Callback = function(value)
            config.MaxDistance = value
        end
    })

    Elements.Sliders.CloseRange = Elements.GroupBoxes.Modes:AddSlider("CloseRangeMode", {
        Text = "CloseRangeMode Distance",
        Default = 50,
        Min = -1,
        Max = 2500,
        Rounding = 1,
        Compact = false,
        Tooltip = "Distance threshold for close range mode (-1 to disable)",
        Callback = function(value)
            config.CloseRangeThreshold = value
        end
    })

    -- Prediction Settings
    Elements.Sliders.PredictBoost = Elements.GroupBoxes.Prediction:AddSlider("PredictBoost", {
        Text = "Prediction Multiplier",
        Default = 1,
        Min = 0.1,
        Max = 3,
        Rounding = 1,
        Compact = false,
        Tooltip = "Global prediction multiplier",
        Callback = function(value)
            config.PredictionBoost = value
        end
    })

    Elements.Sliders.CloseRangeBoost = Elements.GroupBoxes.Prediction:AddSlider("CloseRangeBoost", {
        Text = "Close Range Multiplier",
        Default = 1.6,
        Min = 0.1,
        Max = 8,
        Rounding = 1,
        Compact = false,
        Tooltip = "Prediction multiplier for close range mode",
        Callback = function(value)
            config.CloseRangeBoost = value
        end
    })

    Elements.Sliders.BulletSpeed = Elements.GroupBoxes.Prediction:AddSlider("DefaultBulletSpeed", {
        Text = "Default Bullet Speed",
        Default = 2200,
        Min = 1000,
        Max = 4000,
        Rounding = 1,
        Compact = false,
        Tooltip = "Fallback bullet speed when unknown",
        Callback = function(value)
            config.BaseBulletSpeed = value
        end
    })
    Elements.Sliders.BulletSpeed = Elements.GroupBoxes.Prediction:AddSlider("Jigger", {
        Text = "Random jiggering",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 0,
        Compact = false,
        Tooltip = "Adds shake when aiming, makes harder to detect you by anticheat.",
        Callback = function(value)
            config.RandomJigger = value
        end
    })

    Elements.Sliders.Gravity = Elements.GroupBoxes.Prediction:AddSlider("BulletGravity", {
        Text = "Bullet Gravity",
        Default = 50,
        Min = 0,
        Max = 150,
        Rounding = 1,
        Compact = false,
        Tooltip = "Gravity affecting bullet trajectory",
        Callback = function(value)
            config.Gravity = value
        end
    })

    -- Visual Settings
    Elements.Toggles.DebugLine = Elements.GroupBoxes.Visuals:AddToggle("DebugLineToggle", {
        Text = "Show Debug Lines",
        Default = false,
        Tooltip = "Display aim point debug lines",
        Callback = function(value)
            config.DebugLineEnabled = value
        end
    })
    Elements.Toggles.ShowServerHead = Elements.GroupBoxes.Visuals:AddToggle("ShowServerHead", {
        Text = "Show head position",
        Default = true,
        Tooltip = "Shows current target hitbox position.",
        Callback = function(value)
            config.ShowDebugServerHeadVizualization = value
        end
    })

    Elements.Pickers.LineColor = Elements.Toggles.DebugLine:AddColorPicker("LineColor", {
        Default = Color3.fromRGB(0, 255, 0),
        Title = "Debug Line Color",
        Transparency = 0,
        Callback = function(value)
            warn("set color!")
            config.DebugLineColor = value
        end
    })

    Elements.Labels.CircleColor = Elements.GroupBoxes.Visuals:AddLabel("Aim Circle Color")
    Elements.Pickers.CircleColor = Elements.Labels.CircleColor:AddColorPicker("CircleColor", {
        Default = Color3.fromRGB(0, 0, 0),
        Title = "Circle Color",
        Transparency = 0,
        Callback = function(value)
            config.CircleColor = value
        end
    })

    Elements.Toggles.ModeVisuals = Elements.GroupBoxes.Visuals:AddToggle("ModeVisualsToggle", {
        Text = "Show Active Modes",
        Default = true,
        Tooltip = "Display current mode status",
        Callback = function(value)
            config.ShowActiveModes = value
        end
    })

    -- Ignore List
    Elements.Labels.IgnoreListHeader = Elements.GroupBoxes.IgnoreList:AddLabel("Add player to Ignore/Friend List")
    Elements.Pickers.IgnoreKey = Elements.Labels.IgnoreListHeader:AddKeyPicker("IgnoreKeybind", {
        Default = "RightControl",
        Text = "Add Player to list",
        Mode = "Toggle",
        SyncToggleState = false,
        Callback = function(value)
            warn('KEEEEEK')
            local target = findPlayerUnderCursor()
            if target then
                toggleExcludedPlayer(target)
            end
        end
    })

    global.ignoreListText = Elements.GroupBoxes.IgnoreList:AddLabel("Ignored Players:None", true)
    Elements.Labels.IgnoreList = global.ignoreListText

    Elements.Dropdowns = Elements.GroupBoxes.Prediction:AddDropdown("MyDropdown", {
        Values = {"ServerColliderHead", "OriginalHead"},
        Default = 1, -- Index of the default option
        Multi = false, -- Whether to allow multiple selections
        Text = "Aim to",
        Tooltip = "ServerColliderHead - more optimized, less accurate;\nOriginalHead - less optimized, more accurate",
        Callback = function(value)
            print(value)
            config.UseOriginalHead = value == "OriginalHead"
        end
    })

    local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("Menu")

    MenuGroup:AddToggle("KeybindMenuOpen", {
        Default = Library.KeybindFrame.Visible,
        Text = "Open Keybind Menu",
        Callback = function(value)
            Library.KeybindFrame.Visible = value
        end,
    })
    MenuGroup:AddToggle("ShowCustomCursor", {
        Text = "Custom Cursor",
        Default = true,
        Callback = function(Value)
            Library.ShowCustomCursor = Value
        end,
    })
    MenuGroup:AddDropdown("NotificationSide", {
        Values = { "Left", "Right" },
        Default = "Right",

        Text = "Notification Side",

        Callback = function(Value)
            Library:SetNotifySide(Value)
        end,
    })
    MenuGroup:AddDropdown("DPIDropdown", {
        Values = { "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
        Default = "100%",

        Text = "DPI Scale",

        Callback = function(Value)
            Value = Value:gsub("%%", "")
            local DPI = tonumber(Value)

            Library:SetDPIScale(DPI)
        end,
    })
    MenuGroup:AddDivider()
    MenuGroup:AddLabel("Menu bind")
        :AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

    MenuGroup:AddButton("Unload", function()
        Library:Unload()
    end)

    Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

    -- Addons:
    -- SaveManager (Allows you to have a configuration system)
    -- ThemeManager (Allows you to have a menu theme system)

    -- Hand the library over to our managers
    ThemeManager:SetLibrary(Library)
    SaveManager:SetLibrary(Library)

    -- Ignore keys that are used by ThemeManager.
    -- (we dont want configs to save themes, do we?)
    SaveManager:IgnoreThemeSettings()

    -- Adds our MenuKeybind to the ignore list
    -- (do you want each config to have a different menu key? probably not.)
    SaveManager:SetIgnoreIndexes({ "MenuKeybind" })

    -- use case for doing it this way:
    -- a script hub could have themes in a global folder
    -- and game configs in a separate folder per game
    ThemeManager:SetFolder("MyScriptHub")
    SaveManager:SetFolder("MyScriptHub/specific-game")
    SaveManager:SetSubFolder("specific-place") -- if the game has multiple places inside of it (for example: DOORS)
    -- you can use this to save configs for those places separately
    -- The path in this script would be: MyScriptHub/specific-game/settings/specific-place
    -- [ This is optional ]

    -- Builds our config menu on the right side of our tab
    SaveManager:BuildConfigSection(Tabs["UI Settings"])

    -- Builds our theme menu (with plenty of built in themes) on the left side
    -- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
    ThemeManager:ApplyToTab(Tabs["UI Settings"])

    -- You can use the SaveManager:LoadAutoloadConfig() to load a config
    -- which has been marked to be one that auto loads!
    SaveManager:LoadAutoloadConfig()

    print("Aimbot ui initilized")
end
