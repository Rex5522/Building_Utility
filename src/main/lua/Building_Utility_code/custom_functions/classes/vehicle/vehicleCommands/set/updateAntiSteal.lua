--- updates antisteal on all vehicle sub bodys
-- @param self
-- @return self or nil
function vehicleCommands:updateAntiSteal(self)
    local owner = getUserFromUserID(self.ownerID)
    if not owner then
        BU_Debug("HOW ARE WE TRYING TO UPDATE A VEHICLES ANTISTEAL THAT HAS NO OWNER?: owner nil")
        return nil
    end

    BU_Debug("updating vehicle group "..tostring(self.groupID).."'s antisteal")
    self.antiSteal = owner.antiSteal

    local groupVehicles, success = server.getVehicleGroup(self.groupID)
    if not success then
        BU_Debug("unable to get vehicle group")
        return nil
    end
    
    for index, vehicleID in ipairs(groupVehicles) do
        BU_Debug("attempting to set "..tostring(vehicleID).."'s antiSteal to "..tostring(owner.antiSteal))
        server.setVehicleEditable(vehicleID, not owner.antiSteal)
    end

    return true
end