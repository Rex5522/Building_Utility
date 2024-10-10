function scanpl(find,user)
	find=tostring(find)
	user=tonumber(user)
	PLAYER_LIST = server.getPlayers()
	for index, inner in pairs(PLAYER_LIST) do
		num=tonumber(index)
		
			if PLAYER_LIST[num]["steam_id"]==user then
				return PLAYER_LIST[num][find] 
			end
	end	
end