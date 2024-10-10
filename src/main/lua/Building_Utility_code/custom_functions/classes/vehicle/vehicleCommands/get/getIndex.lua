--- gets the index of the vehicle in the owners files
-- @param self
-- @return nil or index
function vehicleCommands:getIndex(self)
    local owner = getUserFromUserID(self.ownerID)

    if not owner then
        return nil
    end

    for index, groupID in pairs(owner.vehicles) do
        if self.groupID == groupID then
            return index
        end
    end
end