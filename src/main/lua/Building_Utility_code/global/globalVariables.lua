-- global values that will instantly get updated when the script is updated or reloaded

----- you can edit the variables below -----
--- 
--- FINDING BUILDING UTILITY IN THE FILES:
--- if you know what drive stormworks is installed on use this and replace the ? with the drive letter ?:\SteamLibrary\steamapps\workshop\content\573090\3354756124
--- this will open building utility assuming you have it downloaded through the steam workshop
--- 
--- a easier way (in terms of understanding) is to save the script WITHOUT editing ANYTHING. even a extra space will break the script
--- then press windowKey + r (assuming your on windows) then past this in %appdata%\Stormworks\data\missions and press enter
--- this will open your missions folder. now find the name you saved the script as and that will be building utility
--- 
---
--- EDITING VALUES:
--- DO NOT EDIT THE SCRIPT IN THE STORMWORKS EDITOR.
--- to find building utility (go to the above section to find building utility)
--- 
--- NOTE: editing building utility will prevent it from being updated. meaning you will have to manually update the script
--- 
--- open BuildingUtility then open the script.lua with nopad or your preferred editor (NOT THE STORMWORKS EDITOR) and make your changes and save it via the editor you picked
--- then next time you load your game instead of going to workshop go to saved when enabling the addon and you should see it listed as usual with the values you edited
--- 
--- 
--- DEDICATED SERVER SETUP WITH BU:
--- read the above sections before reading this if you need to find or edit BU
--- im going to assume you have basic knowledge of setting up the server. open up the the game files and follow this plath ?:\SteamLibrary\steamapps\common\Stormworks\rom\data\missions
--- and put BU there. then open up stormworks save data in appdata and edit then add this like to the paylist section with all the other default addons
--- <path path="rom/data/missions/BuildingUtility"/> and putting building utility in your dedicated server is done.
--- once again this is assuming you have basic understanding of the stormworks server and already have the server working
--- if you need help setting up the server follow this guide https://steamcommunity.com/sharedfiles/filedetails/?id=2433754130

G_Admins = { -- WARNING DO NOT EDIT THE SCRIPT IN THE IN-GAME EDITER. IT WILL BREAK THE SCRIPT! READ ABOVE FOR HOW TO EDIT SAFELY WARNING --
    ---- start of example ----
    -- steamID1,
    -- steamID2,
    -- steamID3 -- note how the last one does not have a comma
    ---- end of example ----

}

----- you can edit the variables above -----


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