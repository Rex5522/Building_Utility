function updateObjectPos(objectToUpdate, positionFunction, ...)
    local timeDiff = math.abs(G_Tick - (objectToUpdate.pos.lastUpdated or 1))
    if timeDiff < 1 then
        BU_Debug("already updated this tick. timeDiff: "..tostring(timeDiff))
        return true
    end

    local posArgs = {...}
    local objectLocation, success = positionFunction(posArgs[1])
    if not success then
        return false
    end

    local x, y, z = matrix.position(objectLocation)
    objectToUpdate.pos.deltaX = x - objectToUpdate.pos.lastX
    objectToUpdate.pos.deltaY = y - objectToUpdate.pos.lastY
    objectToUpdate.pos.deltaZ = z - objectToUpdate.pos.lastZ

    local distance = math.sqrt(objectToUpdate.pos.deltaX^2 + objectToUpdate.pos.deltaY^2 + objectToUpdate.pos.deltaZ^2)
    local distanceOverTime = (distance / timeDiff) * 60
    objectToUpdate.pos.absoluteMeanSpeed = manageMeanTable(objectToUpdate.pos.previousSpeeds, distanceOverTime, 12)

    -- update stats
    if objectToUpdate.pos.topAlt then
        if y > objectToUpdate.pos.topAlt then
            objectToUpdate.pos.topAlt = y
        end

        if objectToUpdate.pos.absoluteMeanSpeed > objectToUpdate.pos.topSpeed then
            objectToUpdate.pos.topSpeed = objectToUpdate.pos.absoluteMeanSpeed
        end
    end

    -- update 'last' data
    objectToUpdate.pos.lastUpdated = G_Tick
    objectToUpdate.pos.lastX = x
    objectToUpdate.pos.lastY = y
    objectToUpdate.pos.lastZ = z

    return true
end