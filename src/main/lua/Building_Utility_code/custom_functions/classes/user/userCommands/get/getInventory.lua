--- gets the inventory of the user
-- @param self
-- @return objectID or nil
function userCommands:getInventory(self)
    local objectID = self:getObjectID()
    local inventory = {}

    for i = 1, 10 do
        equipmentID, success = server.getCharacterItem(objectID, i)
        if success then
            inventory[i] = equipmentID
            BU_Debug(G_EquipmentIDs[equipmentID].name)
        end
    end

    return inventory
end