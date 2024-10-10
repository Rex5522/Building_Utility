function tpvehicle(group_id,lc,user_id,bringplayers,ui_toggle)

	if string.sub(tostring(group_id), 1,1)=="i" then 
		multi=string.sub(tostring(group_id), 2,-1)
		debug("not multi")
		VEHICLE_DATA, is_success = server.getVehicleData(string.sub(tostring(group_id), 2,-1))
		if is_success then
			group_id=VEHICLE_DATA["group_id"]
		else
			return false
		end
	else 
		multi=nil
	end
	if server.getVehicleGroup(group_id)~=nil then
		vehicle_id=server.getVehicleGroup(group_id)[1]
		user_id=tonumber(user_id)
		VEHICLE_DATA, is_success = server.getVehicleData(vehicle_id)
		if is_success then
			if user_id==-1 or who(user_id,3) then admin=true else admin=false end
			if g_savedata["vehicles"][tonumber(group_id)]~=nil then
				if user_id==who(group_id,2,"v") then owner=true else owner=false end
				vtype=what(lc,who(user_id),true)
				local x,y,z = matrix.position((server.getVehiclePos(vehicle_id)))
				nearist=vnear(x,y,z,group_id,7500)
				err=false
				if vtype=="user" then
					lc=tonumber(lc)
					if tonumber(user_id)==lc then uaps=true else uaps=false end -- uaps (user and player same)
					if uaps and owner or admin then
						lc2=gps(0,5,true,lc)
						if tpvsub(lc2,nearist,group_id,bringplayers,multi,ui_toggle) then
							if ui_toggle then
								if uaps then
									display(lc,"teleporting a vehicle to your location",7)
								else
									display(user_id,"teleporting the vehicle to "..who(lc,1),7)
									display(lc,"a vehicle is being teleported to your location by "..who(user_id,1),7)
								end
							end
						else
							if ui_toggle then
								display(user_id,"unable to teleport vehicle",7)
							end
							return false
						end
					elseif uaps then
						request(user_id,lc,group_id,"vehicle-to-victom",ui_toggle)
						return false
					end
				elseif vtype=="vehicle" then
					if ui_toggle then
						display(user_id,
						"a vehicle cannot be teleported to a vehicle yet. try teleporting it to an lc or a player for now",7)
					end
					return false
				elseif vtype=="lc" then
					if owner or admin then
						lc2=g_savedata["playerdata"][who(user_id)]["lc"][lc]
						if tpvsub(lc2,nearist,group_id,bringplayers,multi,ui_toggle) then
							display(user_id,"teleporting vehicle to "..lc,7)
						else
							display(user_id,"unable to teleport vehicle",7)
						end
					else
						
					end
				elseif vtype~=nil then
					if ui_toggle then
						display(user_id,"this error was most likely caused by the script being modified",7)
					end
				else
					if ui_toggle then
						display(user_id,"unable to detect determine destination of victom",7)
					end
				end
				return true
			else
				if ui_toggle then
					display(user_id,"vehicle is not any known vehicle",7)
				end
			end
		else
			if ui_toggle then
				display(user_id,"game was unable to find the vehicle",7)
			end
			return false
		end
	else
		if ui_toggle then
			display(user_id,"that vehicle was detected but seems to not exist",7)
		end
		return false
	end
end