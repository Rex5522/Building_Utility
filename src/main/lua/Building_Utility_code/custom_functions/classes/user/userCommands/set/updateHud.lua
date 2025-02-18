--- updates the users hud. this should run even if the users hud is off
-- @param self
-- @return nil
function userCommands:updateHud(self)

    local vehicleText = ""
    local listCount = #self.vehicles
    local count = 0

    for index, groupID in ipairs(self.vehicles) do
        count = count + 1
        vehicleText = string.format("%.0f", groupID)..vehicleText
        if count == listCount then
            vehicleText = "(new) "..vehicleText
        else
            vehicleText = "           "..vehicleText
        end
        vehicleText = "\n"..vehicleText
    end

    local hudText =
    G_ScriptName.."\n".."V: "..G_VersionNumber..

    "\n\n-----[Server]-----"..
    "\nTPS: "..string.format("%.0f", G_TPS).."/62"..
    "\nworkshop: "..booleanTranslator(g_savedata.serverSettings.workshopAllowed, 2)..

    "\n\n----[Settings]----"..
    "\nAntiSteal: "..booleanTranslator(self.antiSteal, 2)..
    "\nAutoSeat: "..booleanTranslator(self.autoSeat, 2)..
    "\nTPBlock: "..booleanTranslator(self.teleportBlocking, 2)..
    "\nSpawnlc: "..booleanTranslator(self.spawnlc, 2)..

    "\n\n----[Vehicles]----"..
    vehicleText


    -- hudemode:
    -- combat -- alt and speed is near the center of your screen
    -- normal -- everything is off to the side
    -- utility -- lots of debug info of their vehicle / other things
    -- minimal -- everything other then building utility hud enabled
    local mode = G_Misc.hudModes[self.hudMode]
    if not mode then
        mode = G_Misc.hudModes["normal"]
    end

    local speed = "SPD: "..string.format("%.1f", msConverter((self.pos.absoluteMeanSpeed or 404), self.preferedSpeedunit))..self.preferedSpeedunit
    local alt = "ALT: "..string.format("%.1f", (self.pos.lastY or 404)).."M"
    local alt_SpeedToggle = (self.hud and self.hudMode ~= "minimal" and self.hudMode ~= "settings")
    local mainUiToggle = self.hud and self.hudMode ~= "minimal" and self.hudMode ~= "combat"

    server.setPopupScreen(self.ID, g_savedata.misc.hudID, G_ScriptName, mainUiToggle, hudText, -0.915, (0.93 - (countLines(hudText) / 40)))
    server.setPopupScreen(self.ID, g_savedata.misc.hudID + 1, "alt", self.hud, alt, mode.alt.x, mode.alt.y)
    server.setPopupScreen(self.ID, g_savedata.misc.hudID + 2, "speed", self.hud, speed, mode.speed.x, mode.speed.y)

    ---- vehicle debugger
    local debugCount = 0
    local UI_X = 1.115
    for vehicleID, _ in pairs(self.vehicleDebugTargets) do
        local targetedVehicle = g_savedata.vehicleDebugData.vehicles[vehicleID]
        if not targetedVehicle then
            break
        end

        local text = string.format(
            "ID: %.0f\n"..
            "==========\n"..
            "SPD: %.1f\n"..
            "ALT: %.1f\n\n"..

            "TSP %.1f\n"..
            "HAT: %.1f\n\n"..

            "X: %.0f\n"..
            "Y: %.0f\n"..
            "Z: %.0f\n",

            vehicleID,

            targetedVehicle.pos.absoluteMeanSpeed,
            targetedVehicle.pos.lastY,

            targetedVehicle.pos.topSpeed,
            targetedVehicle.pos.topAlt,

            targetedVehicle.pos.lastX,
            targetedVehicle.pos.lastY,
            targetedVehicle.pos.lastZ
        )

        if debugCount % 3 == 0 then
            UI_X = UI_X - 0.2
        end

        local debugHudID = g_savedata.misc.hudID + 20 + debugCount

        server.setPopupScreen(self.ID, debugHudID, "debug", true, text, UI_X, 0.55 - (debugCount % 3) / 2)
        debugCount = debugCount + 1
    end
end