--- reload building utility and fixes / updates user data
-- @return nil
function BU_Reload(override)
    if not override and G_ReloadedThisReload then
        return
    end
    BU_Debug("---------------------------RELOADING-------------------------------")
    g_savedata.misc = g_savedata.misc or deepCopy(getFakeMiscData())

    g_savedata.users = g_savedata.users or {

    }

    g_savedata.steamIDs = g_savedata.steamIDs or {

    }

    g_savedata.vehicles = g_savedata.vehicles or {

    }

    g_savedata.vehicleDebugData = g_savedata.vehicleDebugData or {
        commands = {

        },
        vehicles = {
            -- [targetID] = {
            --     scanAllBodys = isscannermoder > 1,
            --     usedBy = {
            --         [userID] = finderMode
            --     },
            --     pos = {
            --         lastX = 0,
            --         lastY = 0,
            --         lastZ = 0,

            --         deltaX = 0,
            --         deltaY = 0,
            --         deltaZ = 0,

            --         absoluteSpeed = 0,
            --         absoluteMeanSpeed = 0,
            --         previousSpeeds = {},

            --         lastUpdated = 0
            --     },
            -- }
        }
    }
    g_savedata.vehicleDebugData.commands = {
        addUser = function(user, targetID, finderMode)
            if not g_savedata.vehicleDebugData.vehicles[tonumber(targetID)] then
                g_savedata.vehicleDebugData.commands.createVehicle(user, tonumber(targetID), finderMode)
                return
            end

            g_savedata.vehicleDebugData.vehicles[tonumber(targetID)].usedBy[user.ID] = finderMode
            g_savedata.vehicleDebugData.commands.updateFinderMode(tonumber(targetID))

            user.vehicleDebugTargets[tonumber(targetID)] = {
                finderMode = finderMode
            }
        end,

        removeUser = function(user, targetID)
            g_savedata.vehicleDebugData.vehicles[tonumber(targetID)].usedBy[user.ID] = nil
            g_savedata.vehicleDebugData.commands.updateFinderMode(tonumber(targetID))
            server.removePopup(user.ID, g_savedata.misc.hudID + 20 + tableLength(user.vehicleDebugTargets) - 1)
            user.vehicleDebugTargets[tonumber(targetID)] = nil
        end,

       updateFinderMode = function(targetID)
            for _, finderMode in pairs(g_savedata.vehicleDebugData.vehicles[tonumber(targetID)].usedBy) do
                g_savedata.vehicleDebugData.vehicles[tonumber(targetID)].scanAllBodys=false
                if finderMode > 1 then
                    g_savedata.vehicleDebugData.vehicles[tonumber(targetID)].scanAllBodys=true
                    break
                end
            end
        end,
        createVehicle = function(user, targetID, finderMode)
            BU_Debug("attempting to create new debug vehicle data with id ".. tostring(targetID))
            g_savedata.vehicleDebugData.vehicles[tonumber(targetID)] = {
                scanAllBodys = false,
                usedBy = {
                    [user.ID] = finderMode
                },
                pos = {
                    topAlt = 0,
                    topSpeed = 0,

                    lastX = 0,
                    lastY = 0,
                    lastZ = 0,

                    deltaX = 0,
                    deltaY = 0,
                    deltaZ = 0,

                    absoluteSpeed = 0,
                    absoluteMeanSpeed = 0,
                    previousSpeeds = {},

                    lastUpdated = 0
                },
            }

            user.vehicleDebugTargets[tonumber(targetID)] = {
                finderMode = finderMode
            }
        end
    }

    g_savedata.serverSettings = g_savedata.serverSettings or deepCopy(getFakeServerSettings())

    -- prefixes
    G_Misc = g_savedata.misc
    G_Users = g_savedata.users-- G_players / steamID / user table
    G_SteamIDs = g_savedata.steamIDs -- steamIDS / peerID / steamID -- used for getting steamids of players using userids
    G_Vehicles = g_savedata.vehicles -- all player owned vehicles
    G_ServerSettings = g_savedata.serverSettings
    G_VehicleLog = g_savedata.misc.vehicleLog


    -- update files
    BU_UpdateFiles()

    -- handle updates
    if G_VersionNumber ~= G_Misc.version then
        BU_Debug("current version: "..tostring(G_VersionNumber)..". previous version: "..tostring(G_Misc.version))
        G_Misc.version = G_VersionNumber
        display(G_Updated, -1, 1, true)
    end

    G_ReloadedThisReload = true

    BU_Debug("----------------------------RELOADED--------------------------------")
end