function CMD_Flip(data)

    local formatCommandData = {
        command = "?flip",
        argData = {
            [1] = {
                argName = "target_vehicleID_or_groupID",
                Description = "the id of the vehicle or group you wish to flip",
                exampleValue = "27",
                required = true
            }
        }
    }

    local user = data.user
    local targetID = data.arg1

    if not targetID or targetID == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    local canEdit, statusCode = user:canModifyVehicle(targetID)
    if statusCode == 1 then
        user:display("cannot find vehicle", false)
        return
    elseif not canEdit then
        user:display("you do not have permission to flip this vehicle", false)
        return
    end

    local groupVehicles, success = server.getVehicleGroup(targetID)
    if not success then
        groupVehicles = {[1] = targetID}
    end

    local status = teleportVehicles(resetMatrixRotation(server.getVehiclePos(groupVehicles[1])), groupVehicles)
    if status == 0 then
        user:display("fliped vehicle "..tostring(targetID), true)
    else
        user:display("failed to flip vehicle "..tostring(targetID), false)
    end
end