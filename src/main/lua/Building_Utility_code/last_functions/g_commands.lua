G_Commands = {
    ----------------- admin -----------------
    ["?server"] = {
        func = CMD_Server,
        description = "sets server settings. type ?server list for a list",
        authLevel = 2
    },
    ["?reload"] = {
        func = CMD_Reload,
        description = "Reloads " .. G_ScriptName .. ".",
        authLevel = 2
    },
    ["?debug"] = {
        func = CMD_Debug,
        description = "Enables debug mode for devs (mainly).",
        authLevel = 2
    },
    ["?clearuservehicles"] = {
        func = CMD_ClearUserVehicles,
        description = "Clears all vehicles owned by a specific user.",
        authLevel = 2
    },
    ["?distexplo"] = {
        func = CMD_Distexplo,
        description = "Triggers a explosion at x distance at x size.",
        authLevel = 2
    },
    ["?autoauth"] = {
        func = CMD_AutoAuth,
        description = "Automatically auth's users upon joining.",
        authLevel = 2
    },
    ["?clearobjects"] = {
        func = CMD_ClearObjects,
        description = "Clears all objects.",
        authLevel = 2
    },
    ["?clean"] = {
        func = CMD_ClearObjects,
        description = "Alternative command to clear all objects.",
        authLevel = 2
    },
    ["?god"] = {
        func = CMD_GodMode,
        description = "Enables god mode for the player (alternate spelling).",
        authLevel = 2
    },
    ["?godmode"] = {
        func = CMD_GodMode,
        description = "Enables god mode for the player.",
        authLevel = 2
    },
    ["?spawnobject"] = {
        func = CMD_SpawnObject,
        description = "Spawns an object at the player's location.",
        authLevel = 2
    },
    ["?spawnanimal"] = {
        func = CMD_SpawnAnimal,
        description = "Spawns an animal at the player's location.",
        authLevel = 2
    },
    ["?spawncharacter"] = {
        func = CMD_SpawnCharacter,
        description = "Spawns a character at the player's location.",
        authLevel = 2
    },
    ["?spawncreature"] = {
        func = CMD_SpawnCreature,
        description = "Spawns a creature at the player's location.",
        authLevel = 2
    },
    ["?kill"] = {
        func = CMD_Kill,
        description = "Kills the targeted player.",
        authLevel = 2
    },
    ["?test1"] = {
        func = CMD_Test1,
        description = "Executes test command 1 for debugging purposes.",
        authLevel = 2
    },
    ["?test2"] = {
        func = CMD_Test2,
        description = "Executes test command 2 for debugging purposes.",
        authLevel = 2
    },
    ["?test3"] = {
        func = CMD_Test3,
        description = "Executes test command 3 for debugging purposes.",
        authLevel = 2
    },


    ----------------- auth -----------------
    ["?autobench"] = {
        func = CMD_AutoBench,
        description = "toggle autoBench. autoBench, when on. teleports you back to the location you where at when you spawned the vehicle after using ?? or ?c command to despawn the vehicle.",
        authLevel = 1
    },
    ["?autoback"] = {
        func = CMD_AutoBench,
        description = "a Alternative command for autobench for users used to the old " .. G_ScriptName,
        authLevel = 1
    },
    ["?tp"] = {
        func = CMD_TP,
        description = "Teleports a player/vehicles to a number of targets. type ?tp help for more info",
        authLevel = 1
    },
    ["?tpp"] = {
        func = CMD_TP,
        description = "Alternative command to tp command.",
        authLevel = 1
    },
    ["?die"] = {
        func = CMD_Die,
        description = "Causes the player to die.",
        authLevel = 1
    },
    ["?equip"] = {
        func = CMD_Equip,
        description = "Equips a specified item for the player.",
        authLevel = 1
    },
    ["?load"] = {
        func = CMD_Load,
        description = "loads a inventory (inv) from a selected name",
        authLevel = 1
    },
    ["?flip"] = {
        func = CMD_Flip,
        description = "flips the target vehicle",
        authLevel = 1
    },


    ----------------- any -----------------
    ["?ca"] = {
        func = CMD_ClearAll,
        description = "clears all your vehicles",
        authLevel = 0
    },
    ["?clearall"] = {
        func = CMD_ClearAll,
        description = "clears all your vehicles",
        authLevel = 0
    },
    ["?dsa"] = {
        func = CMD_ClearAll,
        description = "clears all your vehicles",
        authLevel = 0
    },
    ["?remove"] = {
        func = CMD_Remove,
        description = "the opposite of the set command. removes inventory/location/seats (inv/lc/seat) from your save file",
        authLevel = 0
    },
    ["?spawnlc"] = {
        func = CMD_Spawnlc,
        description = "Toggles spawnlc (Automatically teleports your vehicle at a selected location upon spawning thge vehicle).",
        authLevel = 0
    },
    ["?tpblock"] = {
        func = CMD_TPBlock,
        description = "Blocks other players from teleporting to you or your vehicles.",
        authLevel = 0
    },
    ["?set"] = {
        func = CMD_Set,
        description = "saves a inventory/location/seat (inv/lc/seat) as a selected name",
        authLevel = 0
    },
    ["?d"] = {
        func = CMD_Despawn,
        description = "Despawns the selected vehicle ID (groupID or vehicleID). (short spelling).",
        authLevel = 0
    },
    ["?despawn"] = {
        func = CMD_Despawn,
        description = "Despawns the selected vehicle ID (groupID or vehicleID).",
        authLevel = 0
    },
    ["?hud"] = {
        func = CMD_Hud,
        description = "Toggles the HUD display or swiches hudMode by using ?hud hudMode.",
        authLevel = 0
    },
    ["?antisteal"] = {
        func = CMD_AntiSteal,
        description = "Prevents other players from stealing your vehicle (type ?? to despawn).",
        authLevel = 0
    },
    ["??"] = {
        func = CMD_Qmqm,
        description = "Despawns your newest vehicle.",
        authLevel = 0
    },
    ["?c"] = {
        func = CMD_Qmqm,
        description = "Despawns your newest vehicle.",
        authLevel = 0
    },
    ["?autoseat"] = {
        func = CMD_AutoSeat,
        description = "Toggles autoseat for the player (Automatically seats player in seat named autoseat upon spawning a vehicle).",
        authLevel = 0
    },
    ["?help"] = {
        func = CMD_Help,
        description = "Displays help information for available commands.",
        authLevel = 0
    },
    ["?commands"] = {
        func = CMD_Help,
        description = "Alternative command to display help information.",
        authLevel = 0
    }
    
}