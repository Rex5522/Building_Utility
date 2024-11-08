function userCommands:setInventory(self, inventory)
    local objectID = self:getObjectID()

    if not objectID then
        BU_Debug("failed to get object id while setting inventory")
        return nil
    end

    
    for slotNumber, itemID in pairs(inventory) do
        local targetItem = G_EquipmentIDs[tonumber(itemID)] or G_FishEquipmentIDs[tonumber(itemID)]
        if not targetItem then
            BU_Debug("ERROR: TRIED TO EQUIP A UNKOWN ITEM")
            return
        end
        server.setCharacterItem(objectID, slotNumber, itemID, false, tonumber(targetItem.default.int), tonumber(targetItem.default.float))
    end
end