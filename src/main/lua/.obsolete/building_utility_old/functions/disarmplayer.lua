function DisarmPlayer(PlayerID)
	Armed = false
	--Disable handheld weapons
	ObjectID = who(PlayerID,5)
	for Index = 1, 9 do
		EquipmentID = server.getCharacterItem(ObjectID,Index)
		if EquipmentID >= 31 and EquipmentID <= 71 then
			server.setCharacterItem(ObjectID,Index,0,false,0,0)
			Armed = true
		end
	end
	--Disable vehicle weapons
	VehicleID = server.getCharacterVehicle(ObjectID)
	VehicleData, Success = server.getVehicleData(VehicleID)
	LOADED_VEHICLE_DATA, is_success = server.getVehicleComponents(VehicleID)
	if Success then
		if #LOADED_VEHICLE_DATA.components.guns > 0 then
			for Index, Gun in pairs(LOADED_VEHICLE_DATA.components.guns) do
				server.setVehicleWeapon(VehicleID,Gun.pos.x,Gun.pos.y,Gun.pos.z,0)
			end
			server.despawnVehicle(VehicleID,true)
			Armed = true
		end
	end
	--Punish if armed
	if Armed and g_savedata["DisarmPunishment"] then
		Position = server.getPlayerPos(PlayerID)
		X,Y,Z = matrix.position(Position)
		Y = Y + 500
		Position = matrix.translation(X,Y,Z)
		server.setPlayerPos(PlayerID,Position)
		Y = Y - 1
		Position = matrix.translation(X,Y,Z)
		server.spawnExplosion(Position,10)
		server.setCharacterData(ObjectID,0,true,false)
	end
end