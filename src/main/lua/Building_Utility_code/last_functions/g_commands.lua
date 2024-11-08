G_Commands = { -- i shouldnt need to explain this. just dont forget the comma(s)
    admin = {
        --["?yourCommand"] = CMDyourCommandNameFunctionName,
        ["?reload"] = CMD_Reload,
        ["?debug"] = CMD_Debug,
        ["?clearuservehicles"] = CMD_ClearUserVehicles,
        ["?distexplo"] = CMD_Distexplo,
        ["?autoauth"] = CMD_AutoAuth,
        ["?clearobjects"] = CMD_ClearObjects,
        ["?clean"] = CMD_ClearObjects,
        ["?clearobj"] = CMD_ClearObjects,
        ["?god"] = CMD_GodMode,
        ["?godmdoe"] = CMD_GodMode,
        ["?spawnobject"] = CMD_SpawnObject,
        ["?spawnanimal"] = CMD_SpawnAnimal,
        ["?spawncharacter"] = CMD_SpawnCharacter,
        ["?spawncreature"] = CMD_SpawnCreature,
        ["?kill"] = CMD_Kill,
        ["?test1"] = CMD_Test1,
        ["?test2"] = CMD_Test2,
        ["?test3"] = CMD_Test3
    },

    auth = {
        ["?tp"] = CMD_TP,
        ["?tpp"] = CMD_TP,
        ["?die"] = CMD_Die,
        ["?equip"] = CMD_Equip
    },

    any = {
        ["?remove"] = CMD_Remove,
        ["?spawnlc"] = CMD_Spawnlc,
        ["?tpblock"] = CMD_TPBlock,
        ["?set"] = CMD_Set,
        ["?d"] = CMD_Despawn,
        ["?despawn"] = CMD_Despawn,
        ["?hud"] = CMD_Hud,
        ["?antisteal"] = CMD_AntiSteal,
        ["??"] = CMD_Qmqm,
        ["?autoseat"] = CMD_AutoSeat
    }
}