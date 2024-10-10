function AntiNoClip(PlayerID)
	ObjectID = server.getPlayerCharacterID(PlayerID)
	VehicleID, Success = server.getCharacterVehicle(ObjectID)
	if Success then
		for Index, Delta in pairs(Deltas) do
			ObjectID = server.getPlayerCharacterID(Index)
			Vehicle, Success = server.getCharacterVehicle(ObjectID)
			Delta = Delta - Deltas[PlayerID]
			if Delta >= 25 and not (Index == PlayerID or Success) then
				PlayerPosition = server.getPlayerPos(Index)
				VehiclePosition = server.getVehiclePos(VehicleID)
				VehicleData, is_success = server.getVehicleComponents(VehicleID)
				--VehicleData, is_success = server.getVehicleData(VehicleID)
				if VehicleData["voxels"]~=nil then
					VehicleRadius = ((3 * (VehicleData.voxels / (math.pi * 4)))^(1 / 3))
					Distance = matrix.distance(PlayerPosition,VehiclePosition)
					if Distance <= VehicleRadius then
						PlayerX,PlayerY,PlayerZ = matrix.position(PlayerPosition)
						VehicleX,VehicleY,VehicleZ = matrix.position(VehiclePosition)
						Direction = math.atan(PlayerX - VehicleX,PlayerZ - VehicleZ)
						X = VehicleRadius * math.sin(Direction)
						Z = VehicleRadius * math.cos(Direction)
						Position = matrix.translation(VehicleX + X,PlayerY,VehicleZ + Z)
						server.setPlayerPos(Index,Position)
					end
				else
					debug("----ERROR-----log: \nVehicleData.voxels is "..tostring(VehicleData.voxels).."\nvehicle_data is "..tostring(VehicleID).."\nis_success = "..tostring(is_success))
				end
			end
		end
	end
end