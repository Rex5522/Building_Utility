function gps(range, hight, direction, user_id)

	-- legacy?

	range=tonumber(range)
	hight=tonumber(hight)
	user_id=tonumber(user_id)
	--server.notify(user_id, "SSS", "range = "..range.." hight = "..hight, 7)
	peer_pos, is_success = server.getPlayerPos(user_id)



	if is_success then
		local x, y, z = matrix.position(peer_pos)
		if direction then -- works just not with movevehicle function, only works with setvehiclepos
			x2, y2, z2, is_success = server.getPlayerLookDirection(user_id)
			
			rot = matrix.rotationToFaceXZ(x2, z2)
			
			x2=x2*range
			--y2=y2*hight*range --for jump command
			y2=y2*range
			z2=z2*range
			
			x=x+x2
			y=y+y2
			y=y+hight
			z=z+z2
				
			rix = matrix.translation(x,y,z)
			rix1 = matrix.multiply(rix, rot)
		else
			--server.notify(user_id, "SSS", "non-directional", 7)
			--server.notify(user_id, "before", "x="..x.." y="..y.." z="..z, 7)
			--x=x+range
			y=y+hight	
			--z=z+range
			rix1=matrix.translation(x,y,z)
			--server.notify(user_id, "after", "x="..x.." y="..y.." z="..z, 7)
		end
		rix2=rix1
		return rix2
	else
		return "error"
	end
end