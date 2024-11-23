--- despawns vehicles
-- @param data
-- @return nil
function CMD_Despawn(data)
    local formatCommandData = {
        command = "?despawn",
        argData = {
            [1] = {
                argName = "vehicleID_Or_GroupID_To_Despawn",
                Description = "the id of the target you wish to despawn",
                exampleValue = "82",
                required = true
            }
        }
    }

    local user = data.user
    local vehicleOrGroupToDespawn = data.arg1

    if not vehicleOrGroupToDespawn or vehicleOrGroupToDespawn == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    local ownerID = -1
    local vehicleData = vehicleGroupExist(vehicleOrGroupToDespawn) or vehicleExist(vehicleOrGroupToDespawn)
    if not vehicleData then
        user:display("failed to find vehicle or group id '" .. vehicleOrGroupToDespawn .. "'", false)
        return
    end

    ownerID = vehicleData.ownerID

    if ownerID ~= user.ID and not data.admin then
        user:display("you do not own the targeted vehicleID: "..tostring(vehicleOrGroupToDespawn), false)
        return false
    end

    local success = server.despawnVehicleGroup(vehicleOrGroupToDespawn, true) or server.despawnVehicle(vehicleOrGroupToDespawn, true)
    if success then
        user:display("despawned targetID: "..vehicleOrGroupToDespawn, true)
    else
        user:display("failed to despawned targetID: "..vehicleOrGroupToDespawn, false)
    end
end