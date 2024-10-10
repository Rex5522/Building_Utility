function onVehicleDespawn(vehicle_id, user_id)
	VEHICLE_DATA, is_success = server.getVehicleData(vehicle_id)
	if is_success then
		group_id=VEHICLE_DATA["group_id"]
		gi=server.getVehicleGroup(group_id)
		if g_savedata["vehicles"][group_id]~=nil then
			if g_savedata["vehicles"][group_id]["live"][vehicle_id]~=nil then
				index=g_savedata["vehicles"][group_id]["index"]
				steam_id=g_savedata["vehicles"][group_id]["steam_id"]
				
				
				count=0
				for index,inner in pairs(g_savedata["vehicles"][group_id]["live"]) do
					count=count+1
				end
				g_savedata["vehicles"][group_id]["live"][vehicle_id]=nil
				if count==1 then
					debug("attempting to despawn vehicle group: "..group_id)
					if not server.getGameSettings().infinite_money then
						server.setCurrency(server.getCurrency()+g_savedata["vehicles"][group_id]["cost"], server.getResearchPoints())
					end
					g_savedata["playerdata"][steam_id]["vehicles"][index]=nil
					g_savedata["vehicles"][group_id]=nil
				end
			else
				debug("prevented multi try vehicle despawn on a single vehicle id")
			end
		end
	end
end