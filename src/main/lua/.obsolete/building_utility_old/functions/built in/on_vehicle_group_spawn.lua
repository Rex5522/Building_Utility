function onGroupSpawn(group_id, user_id, x, y, z, cost)

	if g_savedata["server"]~=nil then
		bypas = (g_savedata["server"]["v-bypass"][group_id] ~= nil) -- error fixed? error: game started and maybe this func happened before owc happened?
	end

	if past or user_id~=-1 or bypas then
		group_info = server.getVehicleGroup(group_id)
		if user_id ~= -1 or bypas then
			vehicle_amount = 0
			if bypas then
				user_id = g_savedata["server"]["v-bypass"][group_id]["id"]
				g_savedata["server"]["v-bypass"][group_id] = nil
				steam_id = who(user_id, 0, "p")
				object_id = who(user_id, 5, "p")
				usr = g_savedata["playerdata"][steam_id]
				debug("v-bypassed")
				debug(user_id)
				debug(steam_id)
				debug(object_id)
			else
				steam_id=who(user_id, 0, "p")
				object_id=who(user_id, 5, "p")
				usr=g_savedata["playerdata"][steam_id]
			end
			for index,inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do
				vehicle_amount=vehicle_amount+1	
			end
			
			
			if usr["vlim"] == -1 then -- handels vehicle limt
				vlim=g_savedata["server"]["vehicle limit"]
			elseif usr["vlim"] >= 0 then 
				vlim=usr["vlim"] 
			else 
				vlim=0 
			end
			
			
			
			if vehicle_amount<vlim then
				freeslot=nil
				for i=1,vlim do
					if g_savedata["playerdata"][steam_id]["vehicles"][i]==nil then freeslot=i end
				end
				g_savedata["playerdata"][steam_id]["vehicles"][freeslot]={["id"]=group_id}
				g_savedata["vehicles"][group_id] = {
					["steam_id"] = steam_id, 
					["index"] = freeslot,
					["live"] = {},
					["cost"] = cost
				}
				g_savedata["iswait"][group_id] = {
					["info"] = {}
				}

				for index,inner in pairs(server.getVehicleGroup(group_id)) do
					is_success = server.setVehicleTooltip(inner, "owner: "..who(user_id, 1).."\ngroup id: "..group_id.."\ni-id: "..inner)
					is_success = server.setVehicleEditable(inner, not g_savedata["playerdata"][steam_id]["antisteal"])
					g_savedata["vehicles"][group_id]["live"][inner] = true
				end

				if g_savedata["playerdata"][steam_id]["autoseat"] then
					g_savedata["iswait"][group_id]["info"]["autoseat"]=object_id
					debug("autoseat: "..g_savedata["iswait"][group_id]["info"]["autoseat"])
				end

				if g_savedata["playerdata"][steam_id]["spawnlc"] then
					--group_id=server.getVehicleData(server.getVehicleGroup(group_id)[1])["group_id"]
					if g_savedata["playerdata"][steam_id]["lc"]["spawnlc"]~=nil then
						g_savedata["iswait"][group_id]["info"]["spawnlc"]=g_savedata["playerdata"][steam_id]["lc"]["spawnlc"]
					else
						server.notify(user_id,sname,"you have spawnlc enabled but you have no location set. you can set a location by typing [?save spawnlc]",6)
					end
					
				end	
	
				server.notify(user_id, "server: message", "spawning vehicle id: "..group_id, 7)
		
			else
				server.notify(user_id, "server: message", 
				"sorry but you have reached your vehicle limit."..
				"your current vehicle limit is set to: "..string.format("%.0f", vlim)..
				"\n\nuse ?? or ?dsa to despawn your newist or all vehicles.", 6)
				server.despawnVehicleGroup(group_id, true)
			end
			if g_savedata["perma"]["cmv"] then
				server.addMapObject(-1, 50, 1, 1, 0, 0, 0, 0, group_info[1], nil, who(user_id, 1).."'s vehicle", 0,
				"\nid: "..group_id.."\nmain i-id: "..group_info[1], 100, 100, 100, 255)
			end
		else
			if g_savedata["perma"]["cmva"] then
				is_success = server.setVehicleTooltip(group_info[1], "\nid: "..group_id)
				server.addMapObject(-1, 50, 1, 1, 0, 0, 0, 0, group_info[1], nil, "addon vehicle", 0, 
				"id: "..group_id, 100, 100, 100, 255)
			end
		end
	end
end