function versionCompatibility()
    if g_savedata.serverSettings.vehicleLog then
        compareTables(g_savedata.serverSettings.vehicleLog, G_Misc.vehicleLog, true)
        g_savedata.serverSettings.vehicleLog = nil
    end
end