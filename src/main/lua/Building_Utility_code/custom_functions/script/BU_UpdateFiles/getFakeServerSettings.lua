function getFakeServerSettings()
    return {
        autoAuth = (property.checkbox("autoAuth", false) or false),
        creativeModeSettings = (nilOrValue(property.checkbox("creative mode settings", true))),
        vehicleLimit = (property.slider("vehicle limit", 0, 50, 1, 3) or 3),
        regenTimeTillFull = (property.slider("regen time(min)", 0, 60, 1, 5) or 5),
        dedicatedServer = false,
        workshopAllowed = (nilOrValue(property.checkbox("workshop allowed", true), true)),
        autoRemoveVehicleAfterLeaveDelay = (property.slider("auto Remove Vehicle After Leave Delay (min or 0 for off)", 0, 60, 1, 5) or 5)
    }
end