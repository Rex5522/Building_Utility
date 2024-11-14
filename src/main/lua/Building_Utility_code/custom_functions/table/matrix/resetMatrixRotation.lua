function resetMatrixRotation(matrix)
    local defaultRotationMatrix = {
        [1] = -0.707107,
        [2] = 0.0,
        [3] = -0.707107,
        [4] = 0.0,
        [5] = 0.0,
        [6] = 1.0,
        [7] = 0.0,
        [8] = 0.0,
        [9] = 0.707107,
        [10] = 0.0,
        [11] = -0.707107,
        [12] = 0.0,
        [13] = matrix[13], -- x
        [14] = matrix[14] + 5, -- alt 
        [15] = matrix[15],-- y
        [16] = 1.0
    }

    return defaultRotationMatrix
end