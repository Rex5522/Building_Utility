function getFakeMiscData()
    local startTile = server.getStartTile()
    return {
        hudID = 762,
        version = G_VersionNumber,
        defaultAutoSeatNames = {
            ["main"] = "main",
            ["autoseat"] = "autoseat"
        },
        startLocation = matrix.translation(startTile.x,startTile.y,startTile.z),
        unitConversions = {
            ["km/h"] = 3.6,
            ["mph"] = 2.236,
            ["ft/s"] = 3.280,
            ["knots"] = 1.943
        },
        hudModes = {
            normal = {
                alt = {
                    x = 0.1,
                    y = 0.9
                },
                speed = {
                    x = -0.1,
                    y = 0.9
                }
            },
            combat = {
                alt = {
                    x = 0.4,
                    y = 0
                },
                speed = {
                    x = -0.4,
                    y = 0
                }
            },
            minimal = {
                alt = {
                    x = 0.1,
                    y = 0.9
                },
                speed = {
                    x = -0.1,
                    y = 0.9
                }
            },
        },
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
end