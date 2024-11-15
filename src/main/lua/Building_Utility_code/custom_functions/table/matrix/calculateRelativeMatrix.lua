--- Calculates a matrix's position relative to a parent matrix and sets it to a target location.
---@param groupVehicles table -- A ORDERED table containing the matrices of each vehicle in the group.
---@param targetLocation table -- The target location matrix to which we want to align.
---@return table -- A table containing the resulting matrices.
function calculateVehicleRelativeMove(targetLocation, groupVehicles)
    local mainVehicleMatrix = groupVehicles[1]
    local invertedMainVehicleMatrix = matrix.invert(mainVehicleMatrix)

    local returnMatrices = {}
    for index, vehicleMatrix in ipairs(groupVehicles) do
        local relativeMatrix = matrix.multiply(invertedMainVehicleMatrix, vehicleMatrix)
        local calculatedMatrix = matrix.multiply(targetLocation, relativeMatrix)
        table.insert(returnMatrices, {
            matrix = calculatedMatrix
        })
    end

    return returnMatrices
end