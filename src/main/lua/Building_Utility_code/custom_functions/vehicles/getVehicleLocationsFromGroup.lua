--- Retrieves the location matrices for a group of vehicles.
--- @param groupVehicles table -- A ORDERED table containing the IDs of vehicles in the group.
--- @return table -- A table containing the location matrices for each vehicle in the group.
--- @return boolean -- Indicates if all vehicle locations were successfully retrieved.
function getVehicleLocationsFromGroup(groupVehicles)
    local returnMatrixes = {}
    local functionSuccess = true
    for index, vehicleID in ipairs(groupVehicles) do
        local vehicleMatrix, success = server.getVehiclePos(vehicleID)
        if success then
            table.insert(returnMatrixes, vehicleMatrix)
        else
            functionSuccess = false
            table.insert(returnMatrixes, matrix.identity())
            BU_Debug("WARNING: failed to get vehicle")
        end
    end

    return returnMatrixes, functionSuccess
end