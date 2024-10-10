function BU_Init()
    BU_Debug("---------------------------INIT----------------------------------")
    local startTile = server.getStartTile()
    g_savedata.misc = {
        hudID = 762,
        defaultAutoSeatNames = {
            ["main"] = "main",
            ["autoseat"] = "autoseat"
        },
        startLocation = matrix.translation(startTile.x,startTile.y,startTile.z)
    }

    g_savedata.users = {

    }

    g_savedata.steamIDs = {
        
    }

    g_savedata.vehicles = {
        
    }

    g_savedata.serverSettings = { -- add a check to add nil values
        autoAuth = (property.checkbox("autoAuth", false) or false),
        creativeModeSettings = (property.checkbox("creative mode settings", true) or true),
        vehicleLimit = (property.slider("vehicle limit", 0, 50, 1, 3) or 3),
        regenTimeTillFull = (property.slider("regen time(min)", 0, 60, 1, 5) or 5),
        dedicatedServer = false,
        tick = 0,
        version = G_VersionNumber,
        delayedCommands = {
            -- [index] = {
            --     delayTicksLeft = ticksToDelayFor,
            --     functionToDelay = commandToDelay,
            --     args = args
            -- }
        },
        vehicleLog = {
            vehicles = {
                -- [vehicleID] = {
                --     ownerID = ownerID,
                --     groupID = groupID
                -- }
            },
            vehicleGroups = {
                -- [groupID] = {
                --     ownerID = ownerID,
                --     vehicles = {
                --         [index] = vehicleID
                --     }
                -- }
            }
        }
    }



    if g_savedata.serverSettings.creativeModeSettings then
        BU_Debug("buildify")
        server.setGameSetting("unlock_all_islands", true)
        server.setGameSetting("override_weather", true)
        server.setGameSetting("clear_fow", true)
    end

    server.setGameSetting("map_show_vehicles", false)
end