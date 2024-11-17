function BU_Init()
    BU_Debug("---------------------------INIT----------------------------------")

    if g_savedata.serverSettings.creativeModeSettings then
        BU_Debug("buildify")
        server.setGameSetting("unlock_all_islands", true)
        server.setGameSetting("override_weather", true)
        server.setGameSetting("clear_fow", true)
    end

    server.setGameSetting("map_show_vehicles", false)
end