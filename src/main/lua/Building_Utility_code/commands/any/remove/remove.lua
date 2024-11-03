function CMDremove(data)
    local formatCommandData = {
        command = "?remove",
        argData = {
            [1] = {
                argName = "type",
                Description = "the type of data you wish to remove. seat/s/location/l/inventory/i",
                exampleValue = "inv",
                required = true
            },

            [2] = {
                argName = "name",
                Description = "the name you wish to remove",
                exampleValue = "your_name_here",
                required = true
            }
        }
    }

    local user = data.user
    local locations = user.savedLocations
    local typeToRemove = data.arg1
    local nameOfItem = data.arg2

    if not typeToRemove or typeToRemove == "help" or not nameOfItem then
        createCommandFormat(formatCommandData, user)
        return
    end

    if compareStrings(typeToRemove, "seat", "s") then
        remove_sub(locations.seats, "seat", nameOfItem, user)
    elseif compareStrings(typeToRemove, "location", "lc", "l") then
        remove_sub(locations.locations, "location", nameOfItem, user)
    elseif compareStrings(typeToRemove, "inventory", "inv", "i") then
        remove_sub(user.inventorys, "inventorys", nameOfItem, user)
    else
        user:display("type not found. type ?set help for more info")
    end
end