function CMD_Set(data)
    local formatCommandData = {
        command = "?set",
        argData = {
            [1] = {
                argName = "type",
                Description = "the type of data you wish to save. seat/s/location/l/inventory/i",
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
    local locations = user.savedLocations
    local typeToSave = data.arg1
    local nameOfItem = data.arg2
    local objectID = user:getObjectID()

    if not typeToSave or typeToSave == "help" or not nameOfItem then
        createCommandFormat(formatCommandData, user)
        return
    end

    if compareStrings(typeToSave, "seat", "s") then
        if tableLength(locations.seats) >= 10 and not locations.seats[nameOfItem] then
            user:display("your at your limit of saved seats. please remove some seats", false)
            return
        end

        local vehicleID, success = server.getCharacterVehicle(objectID)
        if success then
            seats = getSeatedCreatures({[1] = vehicleID})
            for index, seatData in pairs(seats.seated) do
                if tonumber(seatData.seated_id) == objectID then
                    user:display("saved seat as: "..nameOfItem, true)
                    locations.seats[nameOfItem] = seatData
                    return
                end
            end

            user:display("ERROR: this is a bug: H9SJHLL", false)
            BU_Debug("user somehow not in seat that script said user was in?!?!?!")
        else
            user:display("unable to get your seat data", false)
        end

    elseif compareStrings(typeToSave, "location", "lc", "l") then
        if tableLength(locations.locations) >= 10 and not locations.locations[nameOfItem] then
            user:display("your at your limit of saved locations. please remove some locations", false)
        end

        local matrix = user:getLocation()
        locations.locations[nameOfItem] = {
            type = "location",
            matrix = matrix
        }

        user:display("saved your location as: "..nameOfItem, true)

    elseif compareStrings(typeToSave, "inventory", "inv", "i") then

        if tableLength(user.inventorys) >= 10 and not user.inventorys[nameOfItem] then
            user:display("your at your limit of saved inventorys. please remove some inventorys", false)
        end
        
        local inventory = user:getInventory()
        user.inventorys[nameOfItem] = inventory

        user:display("saved your inventory as: "..nameOfItem, true)

    else
        user:display("type not found. type ?set help for more info", false)
    end
end