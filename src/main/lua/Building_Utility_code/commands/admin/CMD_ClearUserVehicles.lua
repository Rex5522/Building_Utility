--- clears all a users vehicles
-- @param data
-- @return nil
function CMD_ClearUserVehicles(data)
    local formatCommandData = {
        command = "?clearUserVehicles",
        argData = {
            [1] = {
                argName = "userID",
                Description = "the userID of the user to remove vehicles from",
                exampleValue = "3",
                required = true
            },

            [2] = {
                argName = "override",
                Description = "whether to remove the vehicle entrys from the user even if vehicle was unable to be despawned",
                exampleValue = "true",
                required = false
            }
        }
    }

    local user = data.user
    local targetID = data.arg1

    if not targetID or targetID == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    local targetUser = getUserFromUserID(targetID)
    if not targetUser then
        user:display("user not found", false)
        return
    end

    
    local override = toBool(data.arg2) or false
    local successes, vehicleCount = targetUser:clearVehicles(override)
    if override then
        user:display("all user vehicles removed from user. vehicles despawned: "..tostring(successes).."/"..tostring(vehicleCount), true)
    else
        user:display("user vehicles despawned "..tostring(successes).."/"..tostring(vehicleCount), true)
    end
end