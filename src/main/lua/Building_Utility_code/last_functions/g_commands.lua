G_Commands = { -- i shouldnt need to explain this. just dont forget the comma(s)
    admin = {
        --["?yourCommand"] = yourCommandNameFunctionName,
        ["?reload"] = reload,
        ["?debug"] = enableDebug,
        ["?clearuservehicles"] = clearUserVehicles,
        ["?distexplo"] = distexplo,
        ["?autoauth"] = autoAuth,
        ["?clearobjects"] = clearObjects,
        ["?clearobj"] = clearObjects,
        ["?god"] = godMode,
        ["?godmdoe"] = godMode
    },

    auth = {
        ["?tp"] = tp,
        ["?tpp"] = tp
    },

    any = {
        ["?remove"] = remove,
        ["?spawnlc"] = spawnlc,
        ["?tpblock"] = TPBlock,
        ["?set"] = set,
        ["?d"] = despawn,
        ["?despawn"] = despawn,
        ["?hud"] = hud,
        ["?antisteal"] = antiSteal,
        ["??"] = qmqm,
        ["?autoseat"] = autoSeat
    }
}