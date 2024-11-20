---gets all vehicles in the lists position and returns it
---@param vehicles table
---@return table
function getVehiclesPos(vehicles)
    local vehicleMatrixs = {}

    for index, vehicleID in ipairs(vehicles) do
        local vehicleMatrix, success = server.getVehiclePos(vehicleID)
        if success then
            vehicleMatrixs[vehicleID] = {
                matrix = vehicleMatrix
            }
        else
            BU_Debug("failed to get vehicle pos")
        end
    end

    return vehicleMatrixs
end