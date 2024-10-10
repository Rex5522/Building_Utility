--- a fast way of checking a help or nil arg and displaying a help message based on commandData
-- @param self
-- @param vehicleID any, the id of the vehicle
-- @param seatPos table, containing x, y and z of the seat on the targetVehicleID
-- @return true
function userCommands:teleportToSeat(self, seat)
    if not seat or seat.type ~= "seat" then
        BU_Debug("no seat provided", seat)
        return false
    end
    local userObjectID = self:getObjectID()
    server.setSeated(userObjectID, seat.vehicleID, seat.pos.x, seat.pos.y, seat.pos.z)
    BU_Debug("teleported "..tostring(self.ID).." with the objectID of "..tostring(userObjectID).." to a seat on vehicleID "..tostring(seat.vehicleID))
    return true
end