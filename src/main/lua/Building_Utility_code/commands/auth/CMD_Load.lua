function CMD_Load(data)

    local formatCommandData = {
        command = "?load",
        argData = {
            [1] = {
                argName = "type",
                Description = "the type of data you wish to save. inventory/inv",
                exampleValue = "inv",
                required = true
            },

            [2] = {
                argName = "name",
                Description = "the name you wish to save the data as",
                exampleValue = "your_name_here",
                required = true
            }
        }
    }

    local user = data.user
    local dataType = data.arg1
    local targetName = data.arg2

    if not dataType or dataType == "help" or not targetName then
        createCommandFormat(formatCommandData, user)
        return
    end

    if compareStrings(dataType, "inventory", "inv", "i") then

        local targetInventory = user.inventorys[targetName]

        if targetInventory then
            user:setInventory(targetInventory)
            user:display("inventory '" .. targetName .. "' loaded", true)
        else
            user:display("inventory '" .. targetName .. "' not found", false)
        end

    else
        user:display("type not found. type ?load help for more info", false)
    end


end