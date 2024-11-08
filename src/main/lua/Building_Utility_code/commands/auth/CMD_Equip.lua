function CMD_Equip(data)

    local formatCommandData = {
        command = "?equip",
        argData = {
            [1] = {
                argName = "targetItem_name_or_id",
                Description = "the item id or name you wish to equip. type ?equip to list ids",
                exampleValue = "27",
                required = true
            }
        }
    }

    local user = data.user
    local targetItem = data.arg1

    if not targetItem or targetItem == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    if targetItem == "list" then
        local text = ""
        for index, item in ipairs(G_EquipmentIDs) do
            text = text .. item.name .. " : " .. tostring(index) .. "\n"
        end

        text = text .. "------Aliases------\n"

        for index, ID in pairs(G_EquipmentAliases) do
            text = text .. index .. " : " .. G_EquipmentIDs[ID].name .. "\n"
        end

        user:display(text, nil, true)
        return
    end

    local targetItemID = G_EquipmentAliases[targetItem] or tonumber(targetItem)
    targetItem = G_EquipmentIDs[targetItemID]
    if not targetItem then
        user:display("item \'" .. data.arg1 .. "\' not found", false)
        return
    end

    local inventory, emtpySlots = user:getInventory()
    local slotNumber
    for index, value in pairs(emtpySlots) do
        if targetItem.slotType == "item" and index > 1 and index < 10
        or targetItem.slotType == "largeItem" and index == 1
        or targetItem.slotType == "outfit" and index == 10 then
            slotNumber = index
            break
        end
    end

    if not slotNumber then
        user:display("no compatible empty inventory slots for \'" .. tostring(targetItem.name) .. "\'", false)
        return
    end


    local objectID = user:getObjectID()
    local success = server.setCharacterItem(objectID, slotNumber, targetItemID, false, tonumber(targetItem.default.int), tonumber(targetItem.default.float))

    if success then
        user:display("equipped \'" .. targetItem.name .. " " .. targetItem.type .. "\' to slot "..tostring(slotNumber), true)
    else
        user:display("failed to equip \'" .. targetItem.name .. " " .. targetItem.type .. "\'", false)
    end


end