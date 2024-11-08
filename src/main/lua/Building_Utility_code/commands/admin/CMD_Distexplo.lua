--- creates a explotion at a distance from the player with a size
-- @param data
-- @return nil
function CMD_Distexplo(data)
    local formatCommandData = {
        command = "?distexplo",
        argData = {
            [1] = {
                argName = "distance",
                Description = "the distance at which the explotion will occur from where your looking",
                exampleValue = "100",
                required = true
            },

            [2] = {
                argName = "size",
                Description = "the size of the explotion (0.1 to 10)",
                exampleValue = "2.5",
                required = false
            }
        }
    }


    local user = data.user

    if not server.dlcWeapons() then
        user:display("weapons dlc is not enabled", false)
        return
    end
    
    local distance = tonumber(data.arg1)
    if not distance or distance == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    local size = tonumber(data.arg2)
    if not size then
        size = 0.5
    end

    local location = user:getLocation(distance, 0, true)
    if not location then
        user:display("error. target location was nil. this is a bug")
        return
    end

    server.spawnExplosion(location, size) -- size is 0 - 10
end