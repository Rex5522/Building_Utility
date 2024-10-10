function onPlayerLeave(steam_id, name, user_id, admin, auth)
	svlog("user "..name.." left the server")
	steam_id=tostring(steam_id)
	pd=g_savedata["playerdata"][steam_id]
	g_savedata["active"][steam_id]=nil
	if pd~=nil then
		pd["active"]=false
	end
	if pd~=nil then
		pd=nil
	end
end