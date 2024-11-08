--- despawns vehicles
-- @param data
-- @return nil
function CMD_Despawn(data)
    local user = data.user
    local vehicleOrGroupToDespawn = data.arg1
    local success
    
    local vehicleData = vehicleExist(vehicleOrGroupToDespawn)
    local groupData = vehicleGroupExist(vehicleOrGroupToDespawn)
    if vehicleData then
        success = despawnSubCommand(
            user,
            vehicleOrGroupToDespawn,
            "vehicle",
            data.admin,
            vehicleData.ownerID,
            server.despawnVehicle,
            "vehicle despawned: ",
            "failed to despawn vehicle: "
        )
    elseif groupData then
        success = despawnSubCommand(
            user,
            vehicleOrGroupToDespawn,
            "vehicle group",
            data.admin,
            groupData.ownerID,
            server.despawnVehicleGroup,
            "despawned vehicle group: ",
            "failed to despawn vehicle group: "
        )
    else
        user:display("unable to find vehicle or vehicle group: "..tostring(vehicleOrGroupToDespawn))
    end
end