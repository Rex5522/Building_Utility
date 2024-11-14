--- creates a user
-- @param steamID string, 
-- @param name string,
-- @param userID any,
-- @param fake bool, whether to create a fake user or a normal user
-- @return the new, possibly fake user or nil
function userClass:createUser(steamID, name, userID, fake)
    if not steamID or not name or not userID then
        BU_Debug("USER CREATION FAILED: a value was nil")
        return nil
    end
    steamID = tostring(steamID)
    userID = tonumber(userID)

    BU_Debug("attempting to create user",steamID,name,userID,fake)

    if g_savedata.users[steamID] then
        if not g_savedata.steamIDs[userID] then
            BU_Debug("ERROR: a users data exists but not in g_SteamIDs? tf,", g_savedata.steamIDs )
            g_savedata.steamIDs[userID] = steamID
        else
            BU_Debug("user already exists")
        end
        return g_savedata.users[steamID]
    end



    local user = {
        type = "user",
        hudMode = "normal",
        preferedSpeedunit = "m/s",
        steamID = steamID, -- always string
        name = name,
        ID = userID, -- always an int
        debug = false,
        antiSteal = true,
        hud = true,
        godMode = false,
        autoVehicleLocationSpawn = false,
        autoSeat = true,
        banned = false,
        bans = 0,
        banDuration = 0,
        spawnlc = false,
        spawnlcTargetLocation = "spawnlc",
        teleportBlocking = false,
        vehicles = {},
        inventorys = {
            default = {
                [1] = "27",
                [2] = "35",
                [3] = "36",
                [4] = "0",
                [5] = "0",
                [6] = "0",
                [7] = "11",
                [8] = "15",
                [9] = "6",
                [10] = "76"
             }
        },
        pos = {
            lastX = 0,
            lastY = 0,
            lastZ = 0,
            speed = 0,
            lastUpdated = 0,
            previousSpeeds = {}
        },
        savedLocations = {
            seats = {
                -- seatName = {
                --     type = "seat",
                --     vehicleID = 0,
                --     SeatPos = {
                --         x = x,
                --         y = y,
                --         z = z
                --     }
                -- }
            },

            locations = {
                home = {
                    type = "location",
                    matrix = G_Misc.startLocation
                }
                -- locationName = {
                --     type = "location",
                --     matrix = matrix
                -- }
            }

        }
    }


    for funcName, func in pairs(userCommands) do
        user[funcName] = function(...) return func(user, ...) end
    end

    if not fake then
        g_savedata.users[steamID] = deepCopy(user)
        g_savedata.steamIDs[userID] = steamID
        BU_Debug("user created")
        BU_Debug(user)
        user:setInventory(user.inventorys.default)
        return g_savedata.users[steamID]
    else
        BU_Debug("created a fake user")
        return user
    end

end