--- handles regen
-- @return nil
function regen(user)


    local objectID, success = user:getObjectID()
    if not success then
        return
    end
    

    if user.godMode then
        server.reviveCharacter(objectID)
        server.setCharacterData(objectID, 9999999999999, false, false)
    else
        local tickDelayBetweenRegens = 300 -- keep above 60 to prevent werid lag like things in multi
        if G_Tick % tickDelayBetweenRegens ~= 0 and G_ServerSettings.regenTimeTillFull ~= 0 then
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


    
end