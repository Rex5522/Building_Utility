---calculates a matrixs position reletive to a perent matrix and sets it to a targetlocation
---@param targetMatrix table
---@param parentMatrix table
---@param relativeTOPerentMatrix table
---@return table
function calculateRelativeMatrix(targetMatrix, parentMatrix, relativeTOPerentMatrix)
    if not targetMatrix or not parentMatrix or not relativeTOPerentMatrix then
        BU_Debug("NOT ENOUGH ARGS: a table was nil")
        return targetMatrix
    end

    local px, py, pz = matrix.position(parentMatrix)
    local rx, ry, rz = matrix.position(relativeTOPerentMatrix)
    local tx, ty, tz = matrix.position(targetMatrix)

    local x3, y3, z3 = rx - px, ry - py, rz - pz
    local fx, fy, fz = x3 + tx, y3 + ty, z3 + tz
    
    return editMatrixXYZ(relativeTOPerentMatrix, fx, fy, fz)
end