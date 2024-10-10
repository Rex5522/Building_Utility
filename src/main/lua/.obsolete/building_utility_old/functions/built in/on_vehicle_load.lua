function onVehicleLoad(vehicle_id)
	local group_id = -1
	if past then
		if vehicle_id~=-1 then
				group_id=nil
				gvd=server.getVehicleData(vehicle_id)
			if gvd~=-1 and tonumber(gvd)==nil and gvd~=nil then
				group_id=server.getVehicleData(vehicle_id)["group_id"]
			else
				debug("error: unable to find vehicle group... exiting on load function")
				return
			end
			
			if g_savedata["iswait"][group_id]~=nil and g_savedata["vehicles"][group_id]~=nil then
				
				debug("loading a vehicle")
				steam_id=g_savedata["vehicles"][group_id]["steam_id"]
				object_id=who(steam_id,5,"s")
				user_id=who(steam_id,2,"s")
				
				if g_savedata["iswait"][group_id]["info"]["spawnlc"]~=nil then
					local x,y,z = matrix.position((server.getVehiclePos(vehicle_id)))
					nearist=vnear(x,y,z,group_id,7500)
					if tpvsub(g_savedata["iswait"][group_id]["info"]["spawnlc"],nearist,vehicle_id,true,nil,false) then
						display(user_id,"teleporting your vehicle to your spawnlc location",3)
						debug(g_savedata["iswait"]~=nil)
						debug("group_id: "..group_id)
						debug(g_savedata["iswait"][group_id]) -- nilled for some reason and it also seems to be incorrect if its sopposed to be group id
						if g_savedata["iswait"][group_id]["info"]["autoseat"]~=nil then
							
							server.setObjectPos(g_savedata["iswait"][group_id]["info"]["autoseat"],g_savedata["iswait"][group_id]["info"]["spawnlc"])
							
						end
						
					else
						display(user_id,"error:\nunable to teleport your vehicle to your spawnlc location",2)
					end
					g_savedata["iswait"][group_id]["info"]["spawnlc"]=nil
				else
					if g_savedata["iswait"][group_id]["info"]["autoseat"]~=nil then
						for index,inner in pairs(server.getVehicleGroup(group_id)) do
							if server.getVehicleComponents(inner)["components"]["seats"]~=nil then
								for index2,inner2 in pairs(server.getVehicleComponents(inner)["components"]["seats"]) do
									if inner2["name"] == "MAIN" then
										if server.setSeated(g_savedata["iswait"][group_id]["info"]["autoseat"], inner, "MAIN") then
											break
										end
									end
								end
							end
						end
					end
					if g_savedata["iswait"][group_id]["pos"]~=nil then
						for index,inner in pairs(g_savedata["iswait"][group_id]["pos"]) do
							server.setSeated(tonumber(index), inner.vehicle_id, inner.x, inner.y, inner.z)
							debug("vehicle_id: "..inner.vehicle_id.."\nobject_id: "..index.."\nx: "..inner.x.."\ny: "..inner.y.."\nz: "..inner.z)
						end
						g_savedata["iswait"][group_id]["pos"]=nil
					end
					g_savedata["iswait"][group_id]=nil
				end



				--Auto-Seat for Single-Seaters
				--VehicleData = server.getVehicleData(group_id)
				--if #VehicleData.components.seats == 1 and VehicleData.components.seats[1].name ~= "MAIN" then
			--		server.setCharacterSeated(object_id,group_id,VehicleData.components.seats[1].name)
			--	end



			end
		end		
	end
end