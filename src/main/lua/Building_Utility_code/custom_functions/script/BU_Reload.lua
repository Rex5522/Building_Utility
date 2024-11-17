--- reload building utility and fixes / updates user data
-- @return nil
function BU_Reload(override)
    if not override and G_ReloadedThisReload then
        return
    end
    BU_Debug("---------------------------RELOADING-------------------------------")
    local startTile = server.getStartTile()
    g_savedata.misc = g_savedata.misc or {
        hudID = 762,
        defaultAutoSeatNames = {
            ["main"] = "main",
            ["autoseat"] = "autoseat"
        },
        startLocation = matrix.translation(startTile.x,startTile.y,startTile.z)
    }

    g_savedata.users = g_savedata.users or {

    }

    g_savedata.steamIDs = g_savedata.steamIDs or {

    }

    g_savedata.vehicles = g_savedata.vehicles or {

    }

    g_savedata.serverSettings = g_savedata.serverSettings or deepCopy(getFakeServerSettings())

    -- prefixes
    G_Misc = g_savedata.misc
    G_Users = g_savedata.users-- G_players / steamID / user table
    G_SteamIDs = g_savedata.steamIDs -- steamIDS / peerID / steamID -- used for getting steamids of players using userids
    G_Vehicles = g_savedata.vehicles -- all player owned vehicles
    G_ServerSettings = g_savedata.serverSettings
    G_VehicleLog = g_savedata.serverSettings.vehicleLog


    -- update files
    BU_UpdateFiles()

    -- handle updates
    if G_VersionNumber ~= G_ServerSettings.version then
        BU_Debug("current version: "..tostring(G_VersionNumber)..". previous version: "..tostring(G_ServerSettings.version))
        G_ServerSettings.version = G_VersionNumber
        display(G_Updated, -1, 1, true)
    end

    G_ReloadedThisReload = true

    BU_Debug("----------------------------RELOADED--------------------------------")
end