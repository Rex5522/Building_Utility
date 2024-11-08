--- gets the inventory of the user
-- @param self
-- @return objectID or nil
function userCommands:getInventory(self)
    local objectID = self:getObjectID()
    local inventory = {}
    local emptySlots = {}

    if not objectID then
        BU_Debug("failed to get users inventory")
        return inventory, emptySlots
    end

    for i = 1, 10 do
        local equipmentID, success = server.getCharacterItem(objectID, i)
        if success then
            inventory[i] = equipmentID
        end

        if equipmentID == 0 then
            emptySlots[i] = true
        end
    end

    return inventory, emptySlots
end