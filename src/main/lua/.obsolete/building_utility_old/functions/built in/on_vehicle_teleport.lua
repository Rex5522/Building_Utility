function onVehicleTeleport(vehicle_id, user_id, x, y, z)
	if g_savedata["vehicles"][vehicle_id]~=nil and user_id~=-1 then
		steam_id=g_savedata["vehicles"][vehicle_id]["steam_id"]
		if who(steam_id, 2, "s")~=user_id then
			server.notify(who(steam_id,2,"s"), sname, who(user_id, 1).." has teleported your vehicle", 7)
		end
	end
end