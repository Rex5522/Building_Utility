--- moves a matrix's xyz
---@param matrix table
---@param x integer
---@param vertical integer
---@param y integer
---@return any
function moveMatrix(matrix, x, vertical, y)
    matrix[13] = matrix[13] + x
    matrix[14] = matrix[14] + vertical
    matrix[15] = matrix[15] + y

    return matrix
end