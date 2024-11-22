--- updates the users pos data
-- @param self
-- @return true or nil
function updatePositions()
    for steamID, user in pairs(G_Users) do
        updateObjectPos(user, server.getPlayerPos, user.ID)
    end

    for groupID, vehicle in pairs(G_Vehicles) do
        if vehicle.trackVehicleMovment then -- add catch
            updateObjectPos(vehicle, server.getVehiclePos, vehicle.mainBodyID)
            BU_Debug(vehicle.pos.absoluteMeanSpeed)
        end
    end
end