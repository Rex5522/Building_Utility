--- creates command data format for chat commands
-- @param data
-- @param user optional user to display message to
-- @return string or nil
function createCommandFormat(data, user)
    if data == nil then
        BU_Debug("DATA NIL: data provided was nil")
        return nil
    end

    local format = string.format("command: %s\narguments:\n\n", data.command)

    local exampleCommand = data.command.." "
    local hasNotRequiredValue = false

    if not data.argData or #data.argData == 0 then
        BU_Debug("COMMAND FORMAT NOT NEEDED: no args detected. command format is not needed")
        return nil
    end

    for argIndex, argValue in ipairs(data.argData) do
        local required = argValue.required and "yes" or "no"

        if hasNotRequiredValue and required then
            BU_Debug("IMPROPER FORMAT: arg"..tostring(argIndex).." is required but an previous value is not required")
            return nil
        end

        if not argValue.required then
            hasNotRequiredValue = true
        end

        local examples = ""


        format = format..string.format(
            "- Arg Name: %s\n  Required: %s\n  Example Value: %s\n  Description: %s\n\n",
            argValue.argName,
            required,
            argValue.exampleValue,
            argValue.Description
        )

        exampleCommand = exampleCommand..argValue.exampleValue.." "
        format = format.."\n\n".."example command: \n  "..exampleCommand
    end

    if user then
        user:display(format, 1, true)
    end

    return format
    
end
-- data = {
--     command = "?tp",
--     argData = { -- if an arg is not listed it considers it to not exist
--         [1] = { -- arg 1
--             argName = "toBeTeleportedID",
--             Description = "the user, vehicle, location or seat to be teleported to",
--             exampleValue = "2",
--             required = true
--         },

--         [2] = {
--             argName = "toBeTeleportedToID",
--             Description = "where the user orvehicle will be teleported to",
--             exampleValue = "3",
--             required = false
--         },

--         [3] = {
--             argName = "override",
--             Description = "forces the teleport even if the user has tp blocking enabled (admin only)",
--             exampleValue = "force",
--             required = true-- this will cause an error as arg3 cannot be required if arg2 is not
--         }
--     }
-- }