--- puts the user in a seat when the vehicle is spawned
-- @param self
-- @return true or nil
function vehicleCommands:autoSeat(self)
    local owner = getUserFromUserID(self.ownerID)
    if not owner then
        BU_Debug("what the actual fuck happened?: ownerID nil")
        return nil
    end

    if not owner.autoSeat or self.ownerAutoSeated then
        BU_Debug("owner already auto seated or has autoseat disabled. aborting")
        return nil
    end

    local groupVehicles, success = server.getVehicleGroup(self.groupID)
    if not success then
        BU_Debug("unable to get group vehicles")
        owner:display("unable to teleport to your vehicle seat", false)
        return nil
    end

    seats = getSeatedCreatures(groupVehicles)
    for index, seatData in ipairs(seats.notSeated) do
        local seatName = seatData.name:lower()
        if g_savedata.misc.defaultAutoSeatNames[seatName] then
            local objectID, success = owner:getObjectID()
            if success then
                server.setSeated(objectID, seatData.vehicleID, seatData.pos.x, seatData.pos.y, seatData.pos.z) -- has no return value to my knowledge so lets just hope the player gets teleported ig
                owner:display("teleporting to your vehicle seat: "..seatName, true)
                self.ownerAutoSeated = true
                return true
            end
        end
    end

    return false
end