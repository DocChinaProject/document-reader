local Players = cloneref(game:GetService("Players"))

local function updateGunInventoryInfo()
    for _, player in ipairs(Players:GetPlayers()) do
        local inventory = player:FindFirstChild("GunInventory")
        if inventory then

            local slotsFound = 0

            print("\n-------------\n".."   "..player.Name.."   ")
            for _, slotInfo in ipairs(inventory:GetChildren()) do
                if slotInfo.Value then
                    slotsFound += 1
                    print(`Slot{slotsFound}: {slotInfo.Value.Name}[{slotInfo.BulletsInMagazine.Value}/{slotInfo.BulletsInReserve.Value}]`)

                end
            end
            print("\n-------------\n\n")
        end
    end
end
updateGunInventoryInfo()
