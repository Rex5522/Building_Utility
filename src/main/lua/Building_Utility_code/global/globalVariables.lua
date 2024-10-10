-- global values that will instantly get updated when the script is updated or reloaded


-- vars
G_DebugMode = false
G_TPS = 0
G_Tick = 0
G_HudModes = { }
G_HudModes.normal = {
    alt = {
        x = 0.1,
        y = 0.9
    },
    speed = {
        x = -0.1,
        y = 0.9
    }
}
G_HudModes.combat = {
    alt = {
        x = 0.4,
        y = 0
    },
    speed = {
        x = -0.4,
        y = 0
    }
}
G_HudModes.minimal = G_HudModes.normal -- TODO move some vars to settings

G_UnitConversions = {
    ["km/h"] = 3.6,
    ["mph"] = 2.236,
    ["ft/s"] = 3.280,
    ["knots"] = 1.943
}


-- tppp = {
--     user = {
--         teleportUserToUser,
--         teleportUserToGroup,
--         teleportuserToVehicle,
--         teleportuserToSeat,
--         teleportUserToLocation
--     },

    
--     group = {

--     }

--     vehicle = {

--     },
-- }