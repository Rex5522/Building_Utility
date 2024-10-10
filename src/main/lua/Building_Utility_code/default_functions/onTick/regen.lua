--- handles regen
-- @return nil
function regen(user)
    local tickDelayBetweenRegens = 15
    if G_Tick % tickDelayBetweenRegens ~= 0 and G_ServerSettings.regenTimeTillFull ~= 0 then
        return
    end

    objectID, success = user:getObjectID()
    if not success then
        return
    end

    local objectData = server.getObjectData(objectID)
    if objectData then
        if not objectData.incapacitated and objectData.hp < 100 then
            local regenAmount = (100 / ((G_ServerSettings.regenTimeTillFull * 60--[[seconds]])*60 --[[ticks]])) * tickDelayBetweenRegens
            server.setCharacterData(objectID, objectData.hp + regenAmount, false, false)
        end
    end

    
end