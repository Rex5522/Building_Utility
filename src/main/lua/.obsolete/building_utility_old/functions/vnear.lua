function vnear(x,y,z,group_id,distance)
	--debug(tostring(posx).."\n"..tostring(posy).."\n"..tostring(posz).."\n"..tostring(group_id))
	temp={}
	count=1
	
	for index,inner in pairs(server.getVehicleGroup(group_id)) do
		local x1,y1,z1 = matrix.position((server.getVehiclePos(inner)))
		dist=(math.sqrt((x - x1) ^ 2) + ((y - y1) ^ 2) + ((z - z1) ^ 2))
		-- debug(dist)
		-- debug(distance)
		if dist<distance then
			temp[inner]=count
			count=count+1
		end
	end
	return temp
end