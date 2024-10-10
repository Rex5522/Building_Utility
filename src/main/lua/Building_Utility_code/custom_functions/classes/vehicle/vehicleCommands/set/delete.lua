--- deletes the vehicle from the save files
-- @param self
-- @return true or nil
function vehicleCommands:delete(self)
    if not g_savedata.vehicles[self.groupID] then
        BU_Debug("vehicle was nil")
        return false
    end
    
    local owner = getUserFromUserID(self.ownerID)
    if not owner then
        BU_Debug("owner was nil")
        return false
    end

    local index = self:getIndex()
    g_savedata.vehicles[self.groupID] = nil
    table.remove(owner.vehicles, index)
    return true
end