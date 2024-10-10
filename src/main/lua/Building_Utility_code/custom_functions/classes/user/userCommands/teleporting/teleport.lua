--- a fast way of checking a help or nil arg and displaying a help message based on commandData
-- @param self
-- @param vehicleID any, the id of the vehicle
-- @param seatPos table, containing x, y and z of the seat on the targetVehicleID
-- @return true
function userCommands:teleport(self, target)
    if type(target) ~= "table" then
        BU_Debug("target was not a table")
        return false
    elseif target.type == "seat" then
        BU_Debug("seat detected. transfering user to teleport to seat command")
        return self:teleportToSeat(target)
    end
    success = server.setPlayerPos(self.ID, target)
    if not success then
        BU_Debug("failed to teleport user")
    end
    return success
end