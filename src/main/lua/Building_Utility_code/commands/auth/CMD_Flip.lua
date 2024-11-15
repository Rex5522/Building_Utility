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

    local canEdit, statusCode = user:canModifyVehicle(targetID)
    if statusCode == 1 then
        user:display("cannot find vehicle", false)
        return
    elseif not canEdit then
        user:display("you do not have permission to flip this vehicle", false)
        return
    end

    if not targetID or targetID == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    local groupVehicles, success = server.getVehicleGroup(targetID)
    if not success then
        groupVehicles = {[1] = targetID}
    end

    local matrices, success = getVehicleLocationsFromGroup(groupVehicles)
    if not success or #matrices == 0 then
        user:display("an error occured while getting vehicle locations", false)
        return
    end

    local calculatedMatrices = calculateVehicleRelativeMove(resetMatrixRotation(matrices[1]), matrices)
    for index, vehicleData in ipairs(calculatedMatrices) do
        local success = server.setVehiclePos(groupVehicles[index], vehicleData.matrix)
        if not success then
            BU_Debug("failed to set vehicle pos", vehicleData)
        end
    end
end