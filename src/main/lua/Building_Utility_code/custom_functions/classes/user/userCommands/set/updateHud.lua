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
    "\nStatus: ???"..

    "\n\n-----[Server]-----"..
    "\nTPS: "..string.format("%.0f", G_TPS).."/62"..

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
    -- settings -- shows settings
    local mode = G_HudModes[self.hudMode]
    if not mode then
        mode = G_HudModes["normal"]
    end

    
    local speed = "SPD: "..string.format("%.1f", msConverter((self.pos.speed or 404), self.preferedSpeedunit))..self.preferedSpeedunit
    local alt = "ALT: "..string.format("%.1f", (self.pos.lastY or 404)).."M"
    local alt_SpeedToggle = (self.hud and self.hudMode ~= "minimal" and self.hudMode ~= "settings")
    -- local settingsToggle = (self.hudMode == "settings")
    
    
    server.setPopupScreen(self.ID, g_savedata.misc.hudID, G_ScriptName, self.hud, hudText, -0.915, (0.93 - (countLines(hudText) / 40)))
    server.setPopupScreen(self.ID, g_savedata.misc.hudID + 1, "alt", alt_SpeedToggle, alt, mode.alt.x, mode.alt.y)
    server.setPopupScreen(self.ID, g_savedata.misc.hudID + 2, "speed", alt_SpeedToggle, speed, mode.speed.x, mode.speed.y)
end