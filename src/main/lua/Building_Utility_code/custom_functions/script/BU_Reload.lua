--- reload building utility and fixes / updates user data
-- @return nil
function BU_Reload()
    BU_Debug("---------------------------RELOADING-------------------------------")

    G_Misc = g_savedata.misc
    G_Users = g_savedata.users-- G_players / steamID / user table
    G_SteamIDs = g_savedata.steamIDs -- steamIDS / peerID / steamID -- used for getting steamids of players using userids
    G_Vehicles = g_savedata.vehicles -- all player owned vehicles
    G_ServerSettings = g_savedata.serverSettings
    G_VehicleLog = G_ServerSettings.vehicleLog
    BU_UpdateFiles()
    if G_VersionNumber ~= G_ServerSettings.version then
        BU_Debug("current version: "..tostring(G_VersionNumber)..". previous version: "..tostring(G_ServerSettings.version))
        G_ServerSettings.version = G_VersionNumber
        display(G_Updated, -1, 1, true)
    end

    BU_Debug("----------------------------RELOADED--------------------------------")
end