--- toggles spawnlc and sets spawnlc target
-- @param data
-- @return nil
function CMDspawnlc(data)
    local formatCommandData = {
        command = "?spawnlc",
        argData = {
            [1] = {
                argName = "targetLocation",
                Description = "the location from your player file the vehicle will be teleported to when spawned.\nto create a location use the ?set command",
                exampleValue = "your_location_name",
                required = false
            }
        }
    }
    local user = data.user
    local LocationName = data.arg1

    if LocationName == "help" then
        user:display(createCommandFormat(formatCommandData), 1, true)
    end

    if LocationName then
        user.spawnlcTargetLocation = LocationName

        if user.savedLocations.locations[LocationName] then
            user:display("spawnlc target location set to \""..LocationName.."\"", true)
        else
            user:display("spawnlc target location set to \""..LocationName..
            "\".\nthe LocationName you have selected does not exist. please remember to use ?set lc locationName to set the location", false)
        end

    else
        user.spawnlc = not user.spawnlc
        user:display("spawnlc "..booleanTranslator(user.spawnlc, 1)..". remember you can user ?spawnlc savedLocationName to change the location "..
        "spawnlc uses in your player file", true)
    end
end