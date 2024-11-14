---sets a matrixs xyz
---@param matrix table
---@param x integer
---@param vertical integer
---@param y integer
---@return table
function editMatrixXYZ(matrix, x, vertical, y)
    local newMatrix = deepCopy(matrix)
    newMatrix[13] = x
    newMatrix[14] = vertical
    newMatrix[15] = y

    return newMatrix
end