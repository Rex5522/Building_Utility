function tpplayer(player_id,lc,user_id,ui_toggle)
	player_id=tonumber(player_id)
	user_id=tonumber(user_id)
	object_id=who(player_id,5)
	name=who(player_id,1)
	vtype=what(lc,who(user_id),true)
	if vtype == nil then
		debug("error: vtype returned nil")
		return
	end
	debug("vtype "..vtype)
	debug("playerid "..player_id)
	
	
	

	if who(player_id,6) then
		if user_id==-1 or who(user_id,3) then admin=true else admin=false end
		if tostring(user_id)==tostring(player_id) then uaps=true else uaps=false end -- uaps (user and player same)
		if vtype=="user" then
			if tostring(user_id)==tostring(lc) then uaps2=true else uaps2=false end
			lc=tonumber(lc)
			object_id2=who(lc,5)
			name2=who(lc,1)
			if player_id~=lc then
				if admin then
					if server.setObjectPos(object_id, gps(0,1,false,lc)) then
						if ui_toggle then
							if uaps then
								server.notify(lc,sname,"admin: "..name.." is teleporting to you",7)
								server.notify(user_id,sname,"teleporting to "..name2,7)
							else
								if not uaps2 then
									server.notify(lc,sname,name.." is being teleported to you by "..who(user_id,1),7)
									server.notify(player_id,sname,who(user_id,1).." is teleporting you to "..name2,7)
								else
									server.notify(lc,sname,"teleporting "..who(player_id,1).." to you",7)
									server.notify(player_id,sname,who(user_id,1).." is teleporting you to them",7)
								end
							end
							
						end
						return true
					else
						if ui_toggle then 
							server.notify(user_id,sname.."\n"..error,"unable to teleport",6) 
						end
						return false
					end
				elseif uaps then
					request(user_id,lc,user_id,"user-to-victom",ui_toggle,20)
				elseif uaps2 then
					request(player_id,lc,user_id,"victom-to-user",ui_toggle,20)
				end
			else
				if ui_toggle then 
					server.notify(user_id,sname.."\n"..error,"cannot teleport a player to themself",6) 
				end
				return false
			end
		elseif vtype=="vehicle" then
			if string.sub(tostring(lc), 1,1)=="i" then 
				multi=tonumber(string.sub(tostring(lc), 2,-1))
				debug("not multi")
				VEHICLE_DATA, is_success = server.getVehicleData(string.sub(tostring(lc), 2,-1))
				if is_success then
					group_id=VEHICLE_DATA["group_id"]
					seater=seated(multi,false)
				else
					debug("error:OSKIIIIUJ002878")
					return false
				end
			else 
				multi=-1
				group_id=lc
				seater=seated(group_id,false)
			end
			owner = who(group_id,2,"v")==player_id
			owner2 = who(group_id,2,"v")==user_id
			lc=tonumber(lc)
			if admin or owner and uaps then
				debug("requested2")
				if seater[1]~=nil then
					for index,inner in pairs(seater) do
						if tonumber(inner.vehicle_id)==multi or multi==-1 then
							debug("trying to set as seated")
							server.setSeated(who(player_id,5), inner.vehicle_id, inner.x, inner.y, inner.z)
							if ui_toggle then 
								if uaps then
									server.notify(player_id,sname,"teleporting you into the vehicle",7)
								else
									debug("2")
									server.notify(user_id,sname,"teleporting "..who(player_id,1).." into the vehicle",7)
									server.notify(player_id,sname,who(user_id,1).." is teleporting you into a vehicle",7)
									debug("3")
								end
							end
						else
							debug("error:JYHD802MSD")
						end
					end
					return true
				else
					if multi==-1 then
						rix, is_success = server.getVehiclePos(server.getVehicleGroup(lc)[1])
					else
						rix, is_success = server.getVehiclePos(multi)
					end
					if is_success then
						if server.setObjectPos(object_id, rix) then
							if ui_toggle then
								if uaps then
									server.notify(player_id,sname,
									"teleporting you near the vehicle as there are no seats avalable",7)
								else
									server.notify(player_id,sname,
									who(user_id,1).." is teleporting you near a vehicle as there are no seats avalable",7)
									server.notify(user_id,sname,
									"teleporting "..who(player_id,1).." near the vehicle as there are no seats avalable",7)
								end
							end
							return true
						else
							if ui_toggle then 
								if uaps then
									server.notify(user_id,sname,"error: unable to teleport in/near the vehicle",6)
								else
									server.notify(user_id,sname,"error: unable to teleport player in/near the vehicle",6)
								end
							end
							return false
						end
					else
						if ui_toggle then
							server.notify(user_id,sname,"error: unable to find target vehicle",6)
						end
						return false
					end
				end
			elseif uaps and not owner then
				debug("requested")
				request(player_id,lc,who(lc,2,"v"),"user-to-victom-vehicle",ui_toggle)
			elseif not uaps and owner then
				request(player_id,lc,user_id,"victom-to-victom-vehicle",ui_toggle)
			elseif not uaps and owner2 then
				request(player_id,lc,user_id,"victom-to-user-vehicle",ui_toggle)
			end
		elseif vtype=="lc" then
			if uaps or admin then
				if server.setObjectPos(object_id, g_savedata["playerdata"][steam_id]["lc"][lc]) then
					if ui_toggle then
						if uaps then
							server.notify(player_id,sname,"teleporting to location",7)
						else
							server.notify(player_id,sname,who(user_id,1).."is teleporting you to a location",7)
							server.notify(user_id,sname,"teleporting "..who(player_id,1).." to the location",7)
						end
					end
					return true
				else
					if ui_toggle then
						if uaps then
							server.notify(user_id,sname,"unable to teleport to location",7)
						else
							server.notify(user_id,sname,"unable to teleport player to location",7)
						end
					end
					return false
				end
			elseif not uaps then
				request(user_id,player_id,"victom-to-lc",ui_toggle)
			end
		elseif vtype=="seat" then
			pdata=g_savedata["playerdata"][steam_id]["seats"][lc]
			VEHICLE_DATA, is_success = server.getVehicleData(pdata.vehicle_id)
			if is_success then
				if who(server.getVehicleData(pdata["vehicle_id"])["group_id"], 7, "v")~=-1 then
					owner=who(server.getVehicleData(pdata["vehicle_id"])["group_id"], 7, "v")
				else
					owner=false
				end
				if uaps and owner or admin then
					server.setSeated(object_id, pdata.vehicle_id, pdata.x, pdata.y, pdata.z)
				elseif not uaps and owner then
					request(user_id, player_id, "victom-to-seat", ui_toggle) 
				elseif uaps then
					request(user_id, player_id, "user-to-seat", ui_toggle)
				end
			else
				if ui_toggle then 
					server.notify(user_id,sname..error,"the vehicle that the seat was for has been despawned",6) 
				end
			end
		else
			debug("error unable to find target within tpplayers function")
		end
	else
		if ui_toggle then 
			server.notify(user_id,sname..error,"user is not active or does not exist",6) 
		end
	end
end