-- putting a command in here does not make it a admin command. that is defined in last_functions.G_Commands.lua. this is just for organizing.
-- if you dont define this command in last_functions.G_Commands.lua it will not work

-- heres a empty formatCommandData
-- formatCommandData = {
--     command = "",
--     argData = {
--         [1] = {
--             argName = "",
--             Description = "",
--             exampleValue = "",
--             required = 
--         }
--     }
-- }

--- example chat command
-- @param data
-- @return nil
function exampleChatCommand(data) -- always name this in camel case and same as the file its in

    
    -- dont forget to create your commandFormat and return it is a user does something wrong like forget a arg that needed. 
    -- you do not need to fill out all these args if you dont have them. these are just examples

    local formatCommandData = {
        command = "?tp",
        argData = { -- if an arg is not listed it considers it to not exist
            [1] = { -- arg 1
                argName = "toBeTeleportedID",
                Description = "the user, vehicle, location or seat to be teleported to",
                exampleValue = "2",
                required = true
            },
    
            [2] = {
                argName = "toBeTeleportedToID",
                Description = "where the user orvehicle will be teleported to",
                exampleValue = "3",
                required = false
            },
    
            [3] = {
                argName = "override",
                Description = "forces the teleport even if the user has tp blocking enabled (admin only)",
                exampleValue = "force",
                required = true-- this will cause an error as arg3 cannot be required if arg2 is not
            }
        }
    }

    local arg1 = data.arg1 -- arg can go above 5 (idk how high it can go but you shouldnt ever have issues) if your doing something like reading a message then use data.fullMessage - your command data
    local user = data.user -- the user object. look at userCommands.exampleUserCommand for more detail of how the user works

    if not arg1 or arg1 == "help" then
        -- display what the user should see. read the userCommands.display.lua for more info
        -- you can create the command format before hand but i prefer this as its more efficient most the time
        createCommandFormat(formatCommandData, user) -- create command format. createCommandFormat has a otpional second param for a user to display the message to

        return -- return early to stop executing
    end


    -- there is no need to return any value as it is not stored or used
end