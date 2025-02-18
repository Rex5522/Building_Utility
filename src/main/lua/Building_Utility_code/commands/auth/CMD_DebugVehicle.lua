function CMD_VehicleDebugger(data)
    local formatCommandData = {
        command = "?vehicledebugger",
        argData = {
            [1] = {
                argName = "targetGroupID_or_individualVehicleID",
                Description = "the id of the vehicle or vehicle sub body (e.g. a missile) you wish to track",
                exampleValue = "27",
                required = true
            },
            [2] = {
                argName = "finderMode",
                Description = "the mode the script will use to find a sub body (e.g. a missile), use 2 to debug the fastest body. \n[1/2/3 | useOnlyTargetID/findTargetViaSpeed/findTargetViaAlt]",
                exampleValue = "2",
                required = false
            }
        }
    }

    local user = data.user
    local targetID = data.arg1
    local finderMode = data.arg2 or 1

    if not targetID or targetID == "help" then
        createCommandFormat(formatCommandData, user)
        return
    end

    local targetVehicle = getVehicleFromGroupID(targetID) or getVehicleFromVehicleID(targetID)
    if not targetVehicle then
        user:display("group or vehicle ID not found. id: " .. targetID, false)
        return
    end

    local vehicleOwner = getUserFromUserID(targetVehicle.ownerID)
    if vehicleOwner.ID ~= user.ID and vehicleOwner.vehicleDebugBlock and not user:getStatus()>=2 then
        user:display("the vehicles owner has debug block on.", false)
        return
    end

    if targetVehicle.totalBodys > 100 then
        user:display("the target vehicle has too many bodys. debugging the targeted vehicle will lag the game", false)
        return
    end

    if tableLength(user.vehicleDebugTargets) > 9 then
        user:display("you have too many debug open. please close them before opening more")
        return
    end

    if user.vehicleDebugTargets[tonumber(targetID)] then
        g_savedata.vehicleDebugData.commands.removeUser(user, targetID)
        user:display("removed debug for "..targetID, true)
        return
    end

    g_savedata.vehicleDebugData.commands.addUser(user, tonumber(targetID), finderMode)
    user:display("vehicle "..targetID.." is now being tracked", true)
end