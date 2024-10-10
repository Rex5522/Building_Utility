---comment
---@param targetLocation table
---@param maxDistance integer
---@param sizeOfAreaNeeded integer
---@return integer|table
function findSafeLocation(targetLocation, maxDistance, sizeOfAreaNeeded) -- use this instead of the normal find safe location as the default one is shit
    if not targetLocation then
        BU_Debug("INVALID ARGS: no location provided")
        return -1
    end

    if not maxDistance then
        maxDistance = 1000
    end

    if not sizeOfAreaNeeded then
        sizeOfAreaNeeded = 10
    end

    local isClear
    local newMatrix = targetLocation
    local count = 1


    for i = math.ceil(maxDistance / sizeOfAreaNeeded), maxDistance do
        isClear = server.isLocationClear(newMatrix, sizeOfAreaNeeded, sizeOfAreaNeeded, sizeOfAreaNeeded)

        if isClear then
            return newMatrix
        end

        newMatrix = moveMatrix(targetLocation, sizeOfAreaNeeded * count, 0, sizeOfAreaNeeded * count)
        count = count + 1
    end
    return 1
end