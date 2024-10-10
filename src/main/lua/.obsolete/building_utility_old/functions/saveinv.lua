function saveinv(user_id,slot)

	steam_id = who(user_id, 0)
	object_id = who(user_id, 5)


	v=1
	g_savedata["playerdata"][steam_id]["inventory"][slot]={}
	while v<=10 do
		EQUIPMENT_ID, is_success = server.getCharacterItem(object_id, v)
		g_savedata["playerdata"][steam_id]["inventory"][slot][v]=EQUIPMENT_ID
		if debug then
			--debug(v..": "..EQUIPMENT_ID)
		end
		v=v+1
	end

end