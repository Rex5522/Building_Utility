G_Commands = { -- i shouldnt need to explain this. just dont forget the comma(s)
    admin = {
        --["?yourCommand"] = CMDyourCommandNameFunctionName,
        ["?reload"] = CMDreload,
        ["?debug"] = CMDenableDebug,
        ["?clearuservehicles"] = CMDclearUserVehicles,
        ["?distexplo"] = CMDdistexplo,
        ["?autoauth"] = CMDautoAuth,
        ["?clearobjects"] = CMDclearObjects,
        ["?clearobj"] = CMDclearObjects,
        ["?god"] = CMDgodMode,
        ["?godmdoe"] = CMDgodMode,
        ["?spawnobject"] = CMDspawnObject,
        ["?spawnanimal"] = CMDspawnAnimal,
        ["?spawncharacter"] = CMDspawnCharacter,
        ["?spawncreature"] = CMDspawnCreature,
        ["?kill"] = CMDkill
    },

    auth = {
        ["?tp"] = CMDtp,
        ["?tpp"] = CMDtp,
        ["?die"] = CMDdie
    },

    any = {
        ["?remove"] = CMDremove,
        ["?spawnlc"] = CMDspawnlc,
        ["?tpblock"] = CMDTPBlock,
        ["?set"] = CMDset,
        ["?d"] = CMDdespawn,
        ["?despawn"] = CMDdespawn,
        ["?hud"] = CMDhud,
        ["?antisteal"] = CMDantiSteal,
        ["??"] = CMDqmqm,
        ["?autoseat"] = CMDautoSeat
    }
}