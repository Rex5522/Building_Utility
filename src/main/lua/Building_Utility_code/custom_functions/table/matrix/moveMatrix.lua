--- moves a matrix's xyz
---@param matrix table
---@param x integer
---@param vertical integer
---@param y integer
---@return any
function moveMatrix(matrix, x, vertical, y)
    local newMatrix = deepCopy(matrix)
    newMatrix[13] = matrix[13] + x
    newMatrix[14] = matrix[14] + vertical
    newMatrix[15] = matrix[15] + y

    return newMatrix
end