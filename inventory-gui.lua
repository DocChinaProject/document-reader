-- Gui to Lua
-- Version: 3.2

-- Instances:

local PlayerInventoryUi = Instance.new("Frame")
local PlayerInfo = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local PlayerName = Instance.new("TextLabel")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UIListLayout = Instance.new("UIListLayout")
local UIPadding = Instance.new("UIPadding")
local UICorner_2 = Instance.new("UICorner")
local Slot1 = Instance.new("Frame")
local UiFlexItem1 = Instance.new("UIFlexItem")
local UICorner_3 = Instance.new("UICorner")
local WeaponName = Instance.new("TextLabel")
local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
local AmmoInfo = Instance.new("TextLabel")
local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")
local UICorner_4 = Instance.new("UICorner")
local Slot2 = Instance.new("Frame")
local UiFlexItem2 = Instance.new("UIFlexItem")
local UICorner_5 = Instance.new("UICorner")
local WeaponName_2 = Instance.new("TextLabel")
local UITextSizeConstraint_4 = Instance.new("UITextSizeConstraint")
local AmmoInfo_2 = Instance.new("TextLabel")
local UITextSizeConstraint_5 = Instance.new("UITextSizeConstraint")
local UICorner_6 = Instance.new("UICorner")
local Slot3 = Instance.new("Frame")
local UiFlexItem3 = Instance.new("UIFlexItem")
local UICorner_7 = Instance.new("UICorner")
local WeaponName_3 = Instance.new("TextLabel")
local UITextSizeConstraint_6 = Instance.new("UITextSizeConstraint")
local AmmoInfo_3 = Instance.new("TextLabel")
local UITextSizeConstraint_7 = Instance.new("UITextSizeConstraint")
local UICorner_8 = Instance.new("UICorner")
local Slot4 = Instance.new("Frame")
local UiFlexItem4 = Instance.new("UIFlexItem")
local UICorner_9 = Instance.new("UICorner")
local WeaponName_4 = Instance.new("TextLabel")
local UITextSizeConstraint_8 = Instance.new("UITextSizeConstraint")
local AmmoInfo_4 = Instance.new("TextLabel")
local UITextSizeConstraint_9 = Instance.new("UITextSizeConstraint")
local UICorner_10 = Instance.new("UICorner")

--Properties:

local screenGui = Instance.new("ScreenGui", gethui())

PlayerInventoryUi.Name = "PlayerInventoryUi"
PlayerInventoryUi.Parent = screenGui
PlayerInventoryUi.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
PlayerInventoryUi.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlayerInventoryUi.BorderSizePixel = 0
PlayerInventoryUi.Position = UDim2.new(0.166352794, 0, 0.383656502, 0)
PlayerInventoryUi.Size = UDim2.new(0.075, 0, 0.075*3, 0)

PlayerInfo.Name = "PlayerInfo"
PlayerInfo.Parent = PlayerInventoryUi
PlayerInfo.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
PlayerInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlayerInfo.BorderSizePixel = 0
PlayerInfo.Position = UDim2.new(1.6724087e-08, 0, 6.57357688e-08, 0)
PlayerInfo.Size = UDim2.new(0.950000048, 0, 0.14846234, 0)

UICorner.CornerRadius = UDim.new(0.200000003, 0)
UICorner.Parent = PlayerInfo

PlayerName.Name = "PlayerName"
PlayerName.Parent = PlayerInfo
PlayerName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlayerName.BackgroundTransparency = 1.000
PlayerName.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlayerName.BorderSizePixel = 0
PlayerName.Size = UDim2.new(0.996810138, 0, 1.00000012, 0)
PlayerName.Font = Enum.Font.RobotoMono
PlayerName.Text = "Triz_ballsucker"
PlayerName.TextColor3 = Color3.fromRGB(0, 0, 0)
PlayerName.TextScaled = true
PlayerName.TextSize = 14.000
PlayerName.TextWrapped = true

UITextSizeConstraint.Parent = PlayerName
UITextSizeConstraint.MaxTextSize = 20

UIListLayout.Parent = PlayerInventoryUi
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.0299999993, 0)

UIPadding.Parent = PlayerInventoryUi
UIPadding.PaddingBottom = UDim.new(0.0399999991, 0)
UIPadding.PaddingLeft = UDim.new(0.0399999991, 0)
UIPadding.PaddingTop = UDim.new(0.0399999991, 0)

UICorner_2.Parent = PlayerInventoryUi

Slot1.Name = "Slot1"
Slot1.Parent = PlayerInventoryUi
Slot1.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
Slot1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slot1.BorderSizePixel = 0
Slot1.Position = UDim2.new(1.6724087e-08, 0, 0.178462192, 0)
Slot1.Size = UDim2.new(0.950000048, 0, 0.503404081, 0)

UiFlexItem1.Name = "UiFlexItem1"
UiFlexItem1.Parent = Slot1
UiFlexItem1.FlexMode = Enum.UIFlexMode.Fill

UICorner_3.CornerRadius = UDim.new(0.100000001, 0)
UICorner_3.Parent = Slot1

WeaponName.Name = "WeaponName"
WeaponName.Parent = Slot1
WeaponName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WeaponName.BackgroundTransparency = 1.000
WeaponName.BorderColor3 = Color3.fromRGB(0, 0, 0)
WeaponName.BorderSizePixel = 0
WeaponName.Position = UDim2.new(0.0369188152, 0, 0, 0)
WeaponName.Size = UDim2.new(0.626064658, 0, 1, 0)
WeaponName.Font = Enum.Font.RobotoMono
WeaponName.Text = "SVD"
WeaponName.TextColor3 = Color3.fromRGB(255, 255, 255)
WeaponName.TextScaled = true
WeaponName.TextSize = 14.000
WeaponName.TextWrapped = true
WeaponName.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint_2.Parent = WeaponName
UITextSizeConstraint_2.MaxTextSize = 20

AmmoInfo.Name = "AmmoInfo"
AmmoInfo.Parent = Slot1
AmmoInfo.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
AmmoInfo.BorderColor3 = Color3.fromRGB(0, 0, 0)
AmmoInfo.BorderSizePixel = 0
AmmoInfo.Position = UDim2.new(0.686691403, 0, 0.173953354, 0)
AmmoInfo.Size = UDim2.new(0.272641033, 0, 0.623101056, 0)
AmmoInfo.Font = Enum.Font.RobotoMono
AmmoInfo.Text = "[10/40]"
AmmoInfo.TextColor3 = Color3.fromRGB(0, 0, 0)
AmmoInfo.TextScaled = true
AmmoInfo.TextSize = 14.000
AmmoInfo.TextWrapped = true

UITextSizeConstraint_3.Parent = AmmoInfo
UITextSizeConstraint_3.MaxTextSize = 25

UICorner_4.CornerRadius = UDim.new(0.100000001, 0)
UICorner_4.Parent = AmmoInfo

Slot2.Name = "Slot2"
Slot2.Parent = PlayerInventoryUi
Slot2.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
Slot2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slot2.BorderSizePixel = 0
Slot2.Position = UDim2.new(1.6724087e-08, 0, 0.178462192, 0)
Slot2.Size = UDim2.new(0.950000048, 0, 0.503404081, 0)

UiFlexItem2.Name = "UiFlexItem2"
UiFlexItem2.Parent = Slot2
UiFlexItem2.FlexMode = Enum.UIFlexMode.Fill

UICorner_5.CornerRadius = UDim.new(0.100000001, 0)
UICorner_5.Parent = Slot2

WeaponName_2.Name = "WeaponName"
WeaponName_2.Parent = Slot2
WeaponName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WeaponName_2.BackgroundTransparency = 1.000
WeaponName_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
WeaponName_2.BorderSizePixel = 0
WeaponName_2.Position = UDim2.new(0.0369188152, 0, 0, 0)
WeaponName_2.Size = UDim2.new(0.626064658, 0, 1, 0)
WeaponName_2.Font = Enum.Font.RobotoMono
WeaponName_2.Text = "Saiga"
WeaponName_2.TextColor3 = Color3.fromRGB(255, 255, 255)
WeaponName_2.TextScaled = true
WeaponName_2.TextSize = 14.000
WeaponName_2.TextWrapped = true
WeaponName_2.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint_4.Parent = WeaponName_2
UITextSizeConstraint_4.MaxTextSize = 20

AmmoInfo_2.Name = "AmmoInfo"
AmmoInfo_2.Parent = Slot2
AmmoInfo_2.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
AmmoInfo_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
AmmoInfo_2.BorderSizePixel = 0
AmmoInfo_2.Position = UDim2.new(0.686691403, 0, 0.173953354, 0)
AmmoInfo_2.Size = UDim2.new(0.272641033, 0, 0.623101056, 0)
AmmoInfo_2.Font = Enum.Font.RobotoMono
AmmoInfo_2.Text = "[5/70]"
AmmoInfo_2.TextColor3 = Color3.fromRGB(0, 0, 0)
AmmoInfo_2.TextScaled = true
AmmoInfo_2.TextSize = 14.000
AmmoInfo_2.TextWrapped = true

UITextSizeConstraint_5.Parent = AmmoInfo_2
UITextSizeConstraint_5.MaxTextSize = 25

UICorner_6.CornerRadius = UDim.new(0.100000001, 0)
UICorner_6.Parent = AmmoInfo_2

Slot3.Name = "Slot3"
Slot3.Parent = PlayerInventoryUi
Slot3.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
Slot3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slot3.BorderSizePixel = 0
Slot3.Position = UDim2.new(1.6724087e-08, 0, 0.178462192, 0)
Slot3.Size = UDim2.new(0.950000048, 0, 0.503404081, 0)

UiFlexItem3.Name = "UiFlexItem3"
UiFlexItem3.Parent = Slot3
UiFlexItem3.FlexMode = Enum.UIFlexMode.Fill

UICorner_7.CornerRadius = UDim.new(0.100000001, 0)
UICorner_7.Parent = Slot3

WeaponName_3.Name = "WeaponName"
WeaponName_3.Parent = Slot3
WeaponName_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WeaponName_3.BackgroundTransparency = 1.000
WeaponName_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
WeaponName_3.BorderSizePixel = 0
WeaponName_3.Position = UDim2.new(0.0369188152, 0, 0, 0)
WeaponName_3.Size = UDim2.new(0.626064658, 0, 1, 0)
WeaponName_3.Font = Enum.Font.RobotoMono
WeaponName_3.Text = "M1911"
WeaponName_3.TextColor3 = Color3.fromRGB(255, 255, 255)
WeaponName_3.TextScaled = true
WeaponName_3.TextSize = 14.000
WeaponName_3.TextWrapped = true
WeaponName_3.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint_6.Parent = WeaponName_3
UITextSizeConstraint_6.MaxTextSize = 20

AmmoInfo_3.Name = "AmmoInfo"
AmmoInfo_3.Parent = Slot3
AmmoInfo_3.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
AmmoInfo_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
AmmoInfo_3.BorderSizePixel = 0
AmmoInfo_3.Position = UDim2.new(0.686691403, 0, 0.173953354, 0)
AmmoInfo_3.Size = UDim2.new(0.272641033, 0, 0.623101056, 0)
AmmoInfo_3.Font = Enum.Font.RobotoMono
AmmoInfo_3.Text = "[3/0]"
AmmoInfo_3.TextColor3 = Color3.fromRGB(0, 0, 0)
AmmoInfo_3.TextScaled = true
AmmoInfo_3.TextSize = 14.000
AmmoInfo_3.TextWrapped = true

UITextSizeConstraint_7.Parent = AmmoInfo_3
UITextSizeConstraint_7.MaxTextSize = 25

UICorner_8.CornerRadius = UDim.new(0.100000001, 0)
UICorner_8.Parent = AmmoInfo_3

Slot4.Name = "Slot4"
Slot4.Parent = PlayerInventoryUi
Slot4.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
Slot4.BorderColor3 = Color3.fromRGB(0, 0, 0)
Slot4.BorderSizePixel = 0
Slot4.Position = UDim2.new(1.6724087e-08, 0, 0.178462192, 0)
Slot4.Size = UDim2.new(0.950000048, 0, 0.503404081, 0)

UiFlexItem4.Name = "UiFlexItem4"
UiFlexItem4.Parent = Slot4
UiFlexItem4.FlexMode = Enum.UIFlexMode.Fill

UICorner_9.CornerRadius = UDim.new(0.100000001, 0)
UICorner_9.Parent = Slot4

WeaponName_4.Name = "WeaponName"
WeaponName_4.Parent = Slot4
WeaponName_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
WeaponName_4.BackgroundTransparency = 1.000
WeaponName_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
WeaponName_4.BorderSizePixel = 0
WeaponName_4.Position = UDim2.new(0.0369188152, 0, 0, 0)
WeaponName_4.Size = UDim2.new(0.626064658, 0, 1, 0)
WeaponName_4.Font = Enum.Font.RobotoMono
WeaponName_4.Text = "Fists"
WeaponName_4.TextColor3 = Color3.fromRGB(255, 255, 255)
WeaponName_4.TextScaled = true
WeaponName_4.TextSize = 14.000
WeaponName_4.TextWrapped = true
WeaponName_4.TextXAlignment = Enum.TextXAlignment.Left

UITextSizeConstraint_8.Parent = WeaponName_4
UITextSizeConstraint_8.MaxTextSize = 20

AmmoInfo_4.Name = "AmmoInfo"
AmmoInfo_4.Parent = Slot4
AmmoInfo_4.BackgroundColor3 = Color3.fromRGB(255, 163, 26)
AmmoInfo_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
AmmoInfo_4.BorderSizePixel = 0
AmmoInfo_4.Position = UDim2.new(0.686691403, 0, 0.173953354, 0)
AmmoInfo_4.Size = UDim2.new(0.272641033, 0, 0.623101056, 0)
AmmoInfo_4.Font = Enum.Font.RobotoMono
AmmoInfo_4.Text = "[0/0]"
AmmoInfo_4.TextColor3 = Color3.fromRGB(0, 0, 0)
AmmoInfo_4.TextScaled = true
AmmoInfo_4.TextSize = 14.000
AmmoInfo_4.TextWrapped = true

UITextSizeConstraint_9.Parent = AmmoInfo_4
UITextSizeConstraint_9.MaxTextSize = 25

UICorner_10.CornerRadius = UDim.new(0.100000001, 0)
UICorner_10.Parent = AmmoInfo_4

warn(PlayerInventoryUi)
return PlayerInventoryUi
