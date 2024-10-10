function onToggleMap(user_id, is_open)
	--if math.random(1,1) == 1 and is_open and #DementiaPositions > 0 then
		--server.setPlayerPos(user_id,DementiaPositions[math.random(0,#DementiaPositions)])
		--Dementia = false
	--end
end
function onButtonPress(vehicle_id, user_id, button_name, is_pressed)
	
end
function onCharacterSit(object_id, vehicle_id, seat_name)
	
end
function onCharacterUnsit(object_id, vehicle_id, seat_name)
	
end
function onEquipmentPickup(object_id_actor, object_id_target, EQUIPMENT_ID)
	
end
function onEquipmentDrop(object_id_actor, object_id_target, EQUIPMENT_ID)
	
end
function onObjectLoad(object_id)
	
end
function onPlayerDie(steam_id, name, user_id, admin, auth)

end
function onPlayerRespawn(user_id)
	loadinv(user_id,"default")
end
function onTsunami(transform, magnitude)
	if g_savedata["server"]["autoprotect"] then server.cancelGerstner() end
end
function onWhirlpool(transform, magnitude)
	if g_savedata["server"]["autoprotect"] then server.cancelGerstner() end
end
function onMeteor(transform, magnitude)
	if g_savedata["server"]["autoprotect"] then server.cancelGerstner() end
end
function onVolcano(transform)
	if g_savedata["server"]["autoprotect"] then server.cancelGerstner() end
end
function onTornado(transform)
	if g_savedata["server"]["autoprotect"] then server.cancelGerstner() end
end

