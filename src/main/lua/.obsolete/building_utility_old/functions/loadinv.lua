function loadinv(user_id,slot)
	steam_id = who(user_id, 0)
	object_id = who(user_id, 5)
	if g_savedata["playerdata"][steam_id]["inventory"][slot]~=nil then
		v=1
		while v<=10 do
			c=g_savedata["playerdata"][steam_id]["inventory"][slot][v]
			is_success = server.setCharacterItem(object_id, v, c, false, findeqv(c,false,"v"), findeqv(c,true,"v"))
			if debug then
				--debug(v..": "..c)
			end
			v=v+1
		end
		return true
	else
		return false
	end
end