function what(value,steam_id,arg) -- checks what type a value is .e.g player,vehicle,location,seats
	if value~=nil then
		vtype=nil
		for i=1,2,1 do
			if steam_id~=nil then
				if g_savedata["playerdata"][steam_id]~=nil then
					if g_savedata["playerdata"][steam_id]["lc"]~=nil then
						if g_savedata["playerdata"][steam_id]["lc"][value]~=nil then
							vtype="lc"
						end
					end
					if g_savedata["playerdata"][steam_id]["seats"]~=nil then
						if g_savedata["playerdata"][steam_id]["seats"][value]~=nil then
							vtype="seat"
						end
					end
				end
			end
			if vtype==nil and type(value)=="table" then
				vtype="rix"
			end
			if vtype==nil and who(tonumber(value),6,"p",true)~=-1 then
				vtype="user"
			end
			if i==2 and arg then 
				VEHICLE_DATA, is_success = server.getVehicleData(string.sub(tostring(value), 2,-1) )
				if is_success then
					value=VEHICLE_DATA["group_id"]
				end
			end
			is_success=false
			VEHICLE_DATA, is_success = server.getVehicleData(value)
			if vtype==nil and g_savedata["vehicles"][tonumber(value)]~=nil or vtype==nil and is_success then
				vtype="vehicle"
			
			end
			if vtype==nil then
				debug("unable to find what the value was")
			else
				debug("[what] value was "..tostring(vtype))	
			end

			if vtype~=nil then return vtype end
			i=i+1
		end
	end
	return nil
end