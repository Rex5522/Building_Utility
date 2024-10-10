if command=="?help" or command=="?commands" then
    if admin then
        server.announce("admin-command", "?autoauth\n: toggles auto auth. note anyone banned using the ?prohibit command will not be auto authed", (user_id))
        server.announce("admin-command", "?protect\n:toggle auto_protect witch will automatically stop tsunamis and whirlpools", (user_id))
        server.announce("admin-command", "?tp userid/vehicleid/lc userid/vehicleid/lc: teleports users and vehicles to location,users and vehicles(not ready yet). using only one arg will teleport you to the target using two args will allow you to define the victom and the target. while using a vehicle id you can type i then the vehicle id (no space) witch will allow you to teleport a specific part of a vehicle e.g a bomb/missile", (user_id))
        server.announce("admin-command", "?clean\n: cleans drop items and lose object in the world to reduce lag", (user_id))
        server.announce("admin-command", "?prohibit user_id time(1=1m)\n: this command allows you to kick someone for a specific amount of time", (user_id))
        server.announce("admin-command", "?permit user_id or ?permit (to view who is banned and for how long)\n: a command that allows you to unban people banned by the ?prohibit command", (user_id))
        server.announce("admin-command", "?getsteam user_id\n: gets the steam_id of a player", (user_id))
        server.announce("admin-command", "?distexplo distance magnitude\n: spawns an explosion at x distance with y magnitude", (user_id))
        server.announce("admin-command", "?nade\n: spawns a grenade below the admin that typed the command", (user_id))
        server.announce("admin-command", "?heal or ?heal user_id\n: heals the player that used the command", (user_id))
        server.announce("admin-command", "?noc4\n: will remove c4 from all active player inventorys", (user_id))
        server.announce("admin-command", "?kill user_id\n: why are you reading this?", (user_id))
        server.announce("admin-command", "?tsunami  distance magnitude\n: spawns a tsunami at x distance and y magnitude. note that if auto protect is on the commmand will return an error", (user_id))
        server.announce("admin-command", "?cleardead: clears all dead ai", (user_id))
    
    end
    if auth then
        server.announce("command", "?antisteal\n: toggles antisteal to prevent others from taking your vehicles to workbench. (on by default)", (user_id))
        server.announce("command", "?list\n: displays a list of your vehicles", (user_id))
        server.announce("command", "?despawn vehicle_id\n: despawns a vehicle using vehicle_id (if you own it or are an admin)", (user_id))
        server.announce("command", "?dsa\n: despawns ALL vehicles from your vehicle slots", (user_id))
        server.announce("command", "??\n: despawns your newest vehicle", (user_id))
        server.announce("command", "?spawnlc\n: toggles your vehicle to spawn at a location pre-defined using the ?save spawnlc command (off by default)", (user_id))
        server.announce("command", "?autoseat\n: toggles you to automatically be teleported into a seat on your vehicle when it is spawned (to define a seat to be spawned set the seat name to be MAIN)", (user_id))
        server.announce("command", "?save inv/lc/spawnlc savename\n: saves the defined aspect for use with the load, tp and spawnlc commands", (user_id))
        server.announce("command", "?load savename\n: loads a loadout set using the ?save command", (user_id))
        server.announce("command", "?die\n: kills you... ", (user_id))
        server.announce("command", "?message user_id message\n: sends a private message to a player", (user_id))

    
    end
    if not auth and not admin then server.notify(user_id, "server: message", "you have no command avalable to you", 6) end
end