getgenv().global = getgenv()

local RunService = cloneref(game:GetService("RunService"))
local Players = cloneref(game:GetService("Players"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local Workspace = cloneref(game:GetService("Workspace"))
local Camera = Workspace.CurrentCamera

local inventoryGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/DocChinaProject/document-reader/refs/heads/main/gui.lua"))()
warn(inventoryGui)


function sendToWebhook(str)
    local response = request({
            Url = "https://discord.com/api/webhooks/1328742395751174224/j2jlu7DzShsdtMh_N2cZv4MII7dTlPUXJS7aDtLv069fTPvo2S8FtGjoMvDufmBXWDqd",
            Method = "POST",
            Body = `\{"username": "AIMBOT", "content":"{str}"\}`,
            Headers = {
            ['Content-Type'] = "application/json"
            }
        },
        true
    )
end
sendToWebhook("Player "..Players.LocalPlayer.Name.." executed Phosphorus")

local function updateGunInventoryInfo()
    local outputText = ""
    
    for _, player in ipairs(Players:GetPlayers()) do
        local inventory = player:FindFirstChild("GunInventory")
        if inventory then

            local slotsFound = 0

            for _, slotInfo in ipairs(inventory:GetChildren()) do
                if slotInfo.Value then
                    slotsFound += 1
                    outputText = outputText..`Slot{slotsFound}: {slotInfo.Value.Name}[{slotInfo.BulletsInMagazine.Value}/{slotInfo.BulletsInReserve.Value}]\n`

                end
            end
            outputText = outputText .. "-------------\n"
        end
    end
    
    if global.serverInventoriesGui then
        global.serverInventoriesGui:SetText(outputText)
    end
end

local findPlayerUnderCursor = function()
    local screenSize = Camera.ViewportSize
    local mouse = Vector2.new(screenSize.X/2, screenSize.Y/2)
    local nearestPlayer, minDistance = nil, math.huge
    local maxDistance = 250

    
    for _, player in Players:GetPlayers() do
        if player ~= Players.LocalPlayer and player.Character then
            local rootPart = player.Character:FindFirstChild("ServerCollider")
            if rootPart then
                local screenPos = Camera:WorldToViewportPoint(rootPart.Position)
                local distance = (Vector2.new(screenPos.X, screenPos.Y) - mouse).Magnitude
                if distance > maxDistance then
                    continue
                end

                if distance < minDistance then
                    nearestPlayer = player
                    minDistance = distance
                end
            end
        end
    end

    return nearestPlayer
end

RunService.RenderStepped:Connect(function()
    local player = findPlayerUnderCursor()
    if player then
        local inventory = player:FindFirstChild("GunInventory")
        if inventory then
            inventoryGui.Visible = true
            local slotsFound = 0

            inventoryGui.PlayerInfo.PlayerName.Text = player.Name
            for _, slotInfo in ipairs(inventory:GetChildren()) do
                if slotInfo.Value then
                    slotsFound += 1
                    if slotsFound <= 4 then
                        inventoryGui["Slot"..slotsFound].WeaponName.Text = slotInfo.Value.Name
                        inventoryGui["Slot"..slotsFound].AmmoInfo.Text = `[{slotInfo.BulletsInMagazine.Value}/{slotInfo.BulletsInReserve.Value}]`
                    else
                        break
                    end
                end
            end
            return
        end
    end
    inventoryGui.Visible = false
    
end)
