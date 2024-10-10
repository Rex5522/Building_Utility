--- removes a sub body from vehicle file
-- @param self
-- @param targetVehicleID
-- @return nil
function vehicleCommands:removeSubBody(self, targetVehicleID)
    local index = tableContains(self.groupVehicles, targetVehicleID)
    if not index then
        BU_Debug("index was null self:")
        BU_Debug(self)
        return nil
    end
    
    table.remove(self.groupVehicles, index)
end