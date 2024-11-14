--- updates the users pos data
-- @param self
-- @return true or nil
function userCommands:updatePos(self)
    local playerLocation = self:getLocation()
    if not playerLocation then
        return nil
    end

    local x, y, z = matrix.position(playerLocation)
    local deltaX = x - self.pos.lastX
    local deltaY = y - self.pos.lastY
    local deltaZ = z - self.pos.lastZ

    local timeDiff = math.abs(G_Tick - (self.pos.lastUpdated or 1))
    if timeDiff < 1 then
        BU_Debug("already updated this tick. timeDiff: "..tostring(timeDiff))
        return true -- its already updated sooooo
    end

    local distance = math.sqrt(deltaX^2 + deltaY^2 + deltaZ^2)
    local distanceOverTime = (distance / timeDiff)
    local speed = distanceOverTime * 60 -- tick speed

    table.insert(self.pos.previousSpeeds, speed)

    while #self.pos.previousSpeeds > 12 do
        table.remove(self.pos.previousSpeeds, 1)
    end

    local total = 0
    for _, speedValue in pairs(self.pos.previousSpeeds) do
        total = total + speedValue
    end

    self.pos.speed = total / #self.pos.previousSpeeds

    self.pos.lastUpdated = G_Tick
    self.pos.lastX = x
    self.pos.lastY = y
    self.pos.lastZ = z

    return true
end