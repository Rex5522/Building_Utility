---sets a matrixs xyz
---@param matrix table
---@param x integer
---@param vertical integer
---@param y integer
---@return table
function editMatrixXYZ(matrix, x, vertical, y)
    matrix[13] = x
    matrix[14] = vertical
    matrix[15] = y

    return matrix
end