function seated(id,seated) -- gets all seated players in the vehicle    (vehicle id, weather to return seats that are ocupied or not ocupied)
	VEHICLE_DATA, is_success = server.getVehicleData(id)
	splayers={}
	
	if not is_success then
		if ton(id)~=nil then
			temp = server.getVehicleGroup(id)
			if temp~=nil then
				VEHICLE_DATA, is_success = server.getVehicleData(server.getVehicleGroup(id)[1])
				group_id=id
				d=server.getVehicleGroup(id)
			else
				debug("error:JSHD7S7JDH")
				return splayers
			end
		end
	else
		group_id=VEHICLE_DATA["group_id"]
		vehicle_id=id
		d={[1]=tonumber(id)}
	end
	if is_success then
		is_success=nil
		i=1
		for index2,inner2 in pairs(d) do
			LOADED_VEHICLE_DATA, is_success = server.getVehicleComponents(inner2)
			if is_success then
				if LOADED_VEHICLE_DATA.components~=nil then
					for index,inner in pairs(LOADED_VEHICLE_DATA.components.seats) do
						if seated then
							if inner["seated_id"]~=4294967295 then
								debug(inner["seated_id"])
								splayers[inner["seated_id"]]={
									["vehicle_id"]=inner2,
									["x"]=inner["pos"]["x"],
									["y"]=inner["pos"]["y"],
									["z"]=inner["pos"]["z"],
									["name"]=inner["name"]
								}
							end
						else
							if inner["seated_id"]==4294967295 then
								splayers[i]={
									["vehicle_id"]=inner2,
									["x"]=inner["pos"]["x"],
									["y"]=inner["pos"]["y"],
									["z"]=inner["pos"]["z"],
									["name"]=inner["name"]
								}
								i=i+1
							end
						end
					end
				else
					debug("seated players error 3")
				end
			else
				debug("seated players error 2")
			end
		end
		return splayers
	end
	debug("seated players error 1")
	return splayers
end
