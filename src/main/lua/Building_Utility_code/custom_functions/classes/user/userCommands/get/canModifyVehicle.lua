--- Checks if the user has permission to modify a specific vehicle or vehicle group.
--- @param vehicleID integer -- The ID of the vehicle or vehicle group to check.
--- @return boolean, integer -- Returns true and 0 if the user can modify, false and 1 if the vehicle data is missing, or false and 0 if not authorized.
function userCommands:canModifyVehicle(self, vehicleID)
    local userStatus = self:getStatus()

    local vehicleData = G_VehicleLog.vehicles[tonumber(vehicleID)] or G_VehicleLog.vehicleGroups[tonumber(vehicleID)]
    if not vehicleData then
        return false, 1
    end

    local ownerID = vehicleData.ownerID
    if userStatus == 2 or ownerID == self.ID then
        return true, 0
    else
        return false, 0
    end
end