function tpvsub(lc,nearist,id,bringplayers,multi,ui_toggle) -- really needs to be updated
	err=false
	VEHICLE_DATA, is_success = server.getVehicleData(id)
	if not is_success then
		VEHICLE_DATA, is_success = server.getVehicleData(server.getVehicleGroup(id)[1])
		group_id=id
	else
		group_id=VEHICLE_DATA["group_id"]
		vehicle_id=id
	end
	if bringplayers then
		-- debug("bringing players with vehicle teleport")
		victom=nil
		if g_savedata["iswait"][tonumber(group_id)]==nil then
			g_savedata["iswait"][tonumber(group_id)]={
				["pos"]={},
				["info"]={}
			}
			-- debug("creating iswait file")
		end
		seater=seated(group_id,true)
		for index2,inner2 in pairs(seater) do
			-- debug(inner2.vehicle_id)
			if nearist[inner2.vehicle_id]~=nil or inner2.vehicle_id==vehicle_id and multi==nil then
			
				-- debug(who(tostring(index2),6,"o",true))
				if who(tostring(index2),6,"o",true)~=-1 then
					g_savedata["iswait"][tonumber(group_id)]["pos"][tonumber(index2)]={
						["vehicle_id"]=inner2.vehicle_id,["x"]=inner2.x,["y"]=inner2.y,["z"]=inner2.z
					}
					if victom==nil then victom=tonumber(index2) end
					if ui_toggle then
						server.notify(who(tostring(index2),2,"o",true),sname,
						"you are being teleported with the vehicle",7)
					end
				end
			end
		end
		if victom~=nil then
			-- debug("yes: "..victom)
			server.setObjectPos(victom, lc)
			victom=nil
		end
	end
		temp={}
		if multi==nil then
			for index,inner in pairs(nearist) do
				-- debug("inner: "..index)
				temp[index]=dif(server.getVehiclePos(server.getVehicleGroup((server.getVehicleData(index)["group_id"]))[1]),
				server.getVehiclePos(index),lc)
			end
		else
			rix=lc
		end
	for index,inner in pairs(nearist) do
		if multi==nil or tonumber(index)==tonumber(multi) then
			--debug("ran teleport loop")
			if temp[index]~=nil then rix=temp[index] temp[index]=nil elseif tlen(temp)~=0 then debug("error: vehicle "..index.." had no saved location") end
			--if server.moveVehicle(index, rix) then
			if server.setVehiclePos(index, rix) then
				debug("teleport success")
				err=false
			else
				debug("teleport fail")
				err=true
			end
			--server.resetVehicleState(index)
			
			--debug("teleporting vehicle_id: "..inner)
							
			if multi~=nil then debug("breaking") break end
		end
	end
	return not err
end