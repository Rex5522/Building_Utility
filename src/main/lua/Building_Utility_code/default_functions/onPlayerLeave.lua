function onPlayerLeave(steamID, name, userID, admin, auth)
    local user = getUserFromUserID(userID)
    if not user then
        BU_Debug("ERROR: a unkown player left, steamID: "..steamID)
    else
        BU_Debug("user "..steamID.." left")
    end
end