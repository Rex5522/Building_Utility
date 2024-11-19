--- despawns vehicles
-- @param data
-- @return nil
function CMD_Despawn(data)
    local user = data.user
    local vehicleOrGroupToDespawn = data.arg1


    local ownerID = -1
    local vehicleData = vehicleGroupExist(vehicleOrGroupToDespawn) or vehicleExist(vehicleOrGroupToDespawn)
    if vehicleData then
        ownerID = vehicleData.ownerID
    end

    if ownerID ~= user.ID and not data.admin then
        user:display("you do not own the targeted vehicleID: "..vehicleOrGroupToDespawn, false)
        return false
    end

    local success = server.despawnVehicleGroup(vehicleOrGroupToDespawn, true) or server.despawnVehicle(vehicleOrGroupToDespawn, true)
    if success then
        user:display("despawned targetID: "..vehicleOrGroupToDespawn, true)
    else
        user:display("failed to despawned targetID: "..vehicleOrGroupToDespawn, false)
    end
end