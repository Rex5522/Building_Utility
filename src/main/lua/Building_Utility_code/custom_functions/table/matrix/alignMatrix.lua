function alignMatrix(orginalMatrix, targetMatrix)
    local newMatrix = deepCopy(targetMatrix)
    newMatrix[13] = orginalMatrix[13]
    newMatrix[14] = orginalMatrix[14]
    newMatrix[15] = orginalMatrix[15]

    return newMatrix
end