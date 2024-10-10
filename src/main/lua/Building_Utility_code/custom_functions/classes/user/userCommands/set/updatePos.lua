--- updates the users pos data
-- @param self
-- @return true or nil
function userCommands:updatePos(self)
    local x, y, z = matrix.position(self:getLocation())
    if not x or not y or not z then
        BU_Debug("xyz was nil")
        return nil
    end

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

    self.pos.previousSpeed = self.pos.speed
    self.pos.speed = speed

    self.pos.lastUpdated = G_Tick
    self.pos.lastX = x
    self.pos.lastY = y
    self.pos.lastZ = z

    return true
end