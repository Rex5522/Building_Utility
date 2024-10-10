--- updates all of the user vehicles antisteal
-- @param self
-- @return nil
function userCommands:updateVehiclesAntiSteal(self)
    for index, groupID in ipairs(self.vehicles) do
        local vehicle = getVehicleFromGroupID(groupID)
        if not vehicle:updateAntiSteal() then
            BU_Debug("failed to update antisteal on vehicle group "..tostring(groupID))
        end
    end
end