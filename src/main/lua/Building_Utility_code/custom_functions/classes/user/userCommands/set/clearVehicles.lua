--- clears all a users vehicles
-- @param self
-- @param override bool, whether to consider the vehicle despawed even if despawn failed
-- @return nil
function userCommands:clearVehicles(self, override)
    local fails = 0
    local successes = 0
    local override = override or false
    local vehicleCount = 0

    for index, groupID in pairs(self.vehicles) do
        local success = server.despawnVehicleGroup(groupID, true)
        if success then
            successes = successes + 1
        else
            fails = fails + 1
        end

        if success or override then
            self.vehicles[index] = nil
        end

        vehicleCount = vehicleCount + 1
    end

    return successes, vehicleCount
end