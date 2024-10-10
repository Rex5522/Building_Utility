function onPlayerJoin(steam_id, name, user_id, admin, auth)
	if id == -1 then return end
	debug("steam_id: "..steam_id.."\nname: "..name.."\nuser_id: "..user_id.."\nadmin: "..tostring(admin).."\nauth: "..tostring(auth))
	steam_id=tostring(steam_id)

	if g_savedata["playerdata"][steam_id]==nil then
		object_id, is_success = server.getPlayerCharacterID(user_id)
		first=true
		g_savedata["playerdata"][steam_id]={
			["ban"]=false,["antisteal"]=true,["adminpanel"]=false,["scanner"]=false,["seats"]={},["vlim"]=-1,["autoback"]=false,["debug"]=false,
			["lc"]={
				["moon"]=moon,
				["home"]=home
			},
			["inventory"]={
				["utility"]={[1]=27,[2]=35,[3]=36,[4]=36,[5]=17,[6]=11,[7]=11,[8]=18,[9]=21,[10]=75},
				["default"]={[1]=0,[2]=35,[3]=11,[4]=0,[5]=0,[6]=0,[7]=0,[8]=6,[9]=15,[10]=75}
			},
			["autoseat"]=true,["wallet"]=100,["spawnlc"]=false,["pvp"]=false,["active"]=true,["blocked"]={},["banned"]=false,["vehicles"]={},["hud"]=false,
			["godmode"]=false,["id"]=user_id,["follow"]={["id"]=-1,["dist"]=10}
		}
		
		
		
		server.announce(sname, "welcome "..name)
	else
		
		if not g_savedata["playerdata"][steam_id]["banned"] then
			server.announce(sname, "welcome back "..name)
		else
			debug("kicking steam_id: "..steam_id)
			server.kickPlayer(user_id)
		end
	end
	
	pd=g_savedata["playerdata"][steam_id]
	if debugsv and user_id == 0 then pd["debug"]=true end
	object_id, is_success = server.getPlayerCharacterID(user_id)

	pd["id"]=user_id
	pd["name"]=name
	pd["user_id"]=tonumber(user_id)
	pd["object_id"]=tonumber(object_id)
	
	g_savedata["find-name"][name]={["steam_id"]=steam_id}
	g_savedata["find-user_id"][tonumber(user_id)]={["steam_id"]=steam_id}
	g_savedata["find-object_id"][tonumber(object_id)]={["steam_id"]=steam_id}
	
	g_savedata["active"][steam_id]=steam_id
	pd["active"]=true
	g_savedata["server"]["requests"][steam_id]={}
	
	display(user_id, "you can access commands list by typing ?help", 3, true)
	svlog("user "..name.." joined the server")
	if not pd["ban"] and g_savedata["server"]["autoauth"] and not auth and not admin then
		server.addAuth(user_id)
	end
	if first then 
		
		loadinv(user_id,"default")
		first=nil
	end
	
end