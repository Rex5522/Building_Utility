--- teleports stuff
-- @param data
-- @return nil
function CMDtp(data)
    local formatCommandData = {
        command = "?tp",
        argData = {
            [1] = {
                argName = "IDOrNameToTeleport",
                Description = "the id or name of the thing you want to teleport. prefix the id with p/v/g/l to teleport a player/vehicle/groupVehicle/location respectivly."..
                " if arg2 is nil then you will be teleported to whatever value you put in here. you can also use the prefix l to teleport to a location if arg2 is nil"..
                ". if you use the name of something you must provide a prefix",
                exampleValue = "p4",
                required = true
            },

            [2] = {
                argName = "IDOrNameToTeleportTo",
                Description = "the id or name of the thing you want to teleport to. prefix the id with p/v/g/l to a player/vehicle/groupVehicle/location respectivly."..
                " if you use the name of something you must provide a prefix",
                exampleValue = "g5",
                required = false
            }
        }
    }
    local user = data.user
    local IDOrNameToTeleport = data.arg1
    local IDOrNameToTeleportTo = data.arg2
    local arg1Data
    local arg2Data
    local admin = data.admin
    local vehicle
    local groupVehicles
    local targetUser
    if not IDOrNameToTeleport or IDOrNameToTeleport == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    
    prefixes = {
        "p",
        "u",
        "g",
        "v",
        "s",
        "l",
    }

    lookupTables = {
        nil,
        nil,
        nil,
        nil,
        user.savedLocations.seats
        -- user.savedLocations.locations
    }

    functions = {
        getUserFromUserID,
        getUserFromUserID,
        vehicleGroupExist,
        vehicleExist,
        nil,
        function(arg)
            if user.savedLocations.locations[arg] then
                return user.savedLocations.locations[arg].matrix
            else
                return nil
            end
        end
    }

    arg1Data = getArgValue(IDOrNameToTeleport, prefixes, lookupTables, functions)
    BU_Debug(arg1Data)
    if not arg1Data[2] or type(arg1Data[1]) ~= "table" then
        user:display((G_Prefixes[arg1Data[2]] or "ERROR").." not found\n"..arg1Data[3], false)
        return
    end

    if IDOrNameToTeleportTo then
        arg2Data = getArgValue(IDOrNameToTeleportTo, prefixes, lookupTables, functions)
        BU_Debug(arg2Data)
        if not arg2Data[2] or type(arg2Data[1]) ~= "table" then
            user:display((G_Prefixes[arg2Data[2]] or "ERROR").." not found\n"..arg2Data[3], false)
            return
        end
    end


    -- deal with setting location target here
    local targetLocation = tp_getLocation(user, admin, arg1Data, arg2Data)
    BU_Debug(targetLocation)

    if targetLocation == 1 then
        user:display("user has tp blocking enabled", false)
        return
    elseif targetLocation == 2 then
        user:display("failed to get target location", false)
        return
    elseif type(targetLocation) == "integer" then
        return
    end


    if not arg2Data then

        success = user:teleport(targetLocation)

        if success then
            user:display("teleporting to "..G_Prefixes[arg1Data[2]], true)
        else
            user:display("failed to teleport to "..G_Prefixes[arg1Data[2]], true)
        end

        return
    end



    if targetLocation.type == "seat" and arg1Data[2] ~= "p" and arg1Data[2] ~= "u" then
        user:display("cannot teleport a "..G_Prefixes[arg1Data[2]].."to a "..G_Prefixes[arg2Data[2]], false)
    elseif arg1Data[2] == "s" or arg1Data[2] == "l" then
        user:display("cannot teleport a "..G_Prefixes[arg1Data[2]], false)
    else
        if arg1Data[2] == "p" or arg1Data[2] == "u" then
            BU_Debug("attempting to teleport user", true)
            targetUser = arg1Data[1]
            if user.ID == targetUser.ID or admin then
                targetUser:teleport(targetLocation)
            else
                user:display("cannot teleport a user while not admin", false)
            end
        elseif arg1Data[2] == "g" then
            vehicle = arg1Data[1]
            targetUser = getUserFromUserID(vehicle.ownerID)
            if not tp_canTeleportToTarget(user, admin, targetUser) then -- none admins connot teleport others vehicles
                user:display("you cannot teleport a users vehicle group while not admin", false)
                return
            end

            groupVehicles, success = server.getVehicleGroup(vehicle.groupID)
            if success then
                status = teleportVehicles(targetLocation, groupVehicles)
                if status == 1 then
                    user:display("unable to find a safe location", false)
                    return
                end
            end

            if success and status == 0 then
                user:display("vehicle group teleported", true)
            else
                user:display("failed to teleport vehicle group", false)
            end
        elseif arg1Data[2] == "v" then
            vehicle = arg1Data[1]
            targetUser = getUserFromUserID(vehicle.ownerID)
            if not tp_canTeleportToTarget(user, admin, targetUser) then -- none admins connot teleport others vehicles
                user:display("you cannot teleport a users vehicle while not admin", false)
                return
            end


            status = teleportVehicles(targetLocation, {[1] = arg1Data[4]})
            if status == 1 then
                user:display("unable to find a safe location", false)
                return
            end


            if status == 0 then
                user:display("vehicle group teleported", true)
            else
                user:display("failed to teleport vehicle group", false)
            end
        end
    end
end