function despawnSubCommand(user, entityID, entityType, isAdmin, ownerID, despawnFunction, successMessage, failureMessage)
    if ownerID ~= user.ID and not isAdmin then
        user:display("you do not own "..entityType.." "..tostring(entityID), false)
        return false
    end

    local success = despawnFunction(entityID, true)
    if success then
        user:display(successMessage..tostring(entityID), true)
    else
        user:display(failureMessage..tostring(entityID), false)
    end

    return success
end