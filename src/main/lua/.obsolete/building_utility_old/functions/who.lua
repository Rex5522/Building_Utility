function who(calledf,value, type, type2, check, debug)
	if check == nil then check = false end
	if debug == nil then debug = false end
	svalue=nil
	if value==-1 then return false end
	--add debugs
	--change all tables from number to string
	if type2=="p" and g_savedata["find-user_id"][tonumber(value)]~=nil or 
	type2==nil and g_savedata["find-user_id"][tonumber(value)]~=nil then 
		svalue=g_savedata["find-user_id"][tonumber(value)]["steam_id"] 
	elseif type2=="o" and g_savedata["find-object_id"][tonumber(value)]~=nil then 
		svalue=g_savedata["find-object_id"][tonumber(value)]["steam_id"] 
	elseif type2=="n" and g_savedata["find-name"][tostring(value)]~=nil then
		svalue=g_savedata["find-name"][tostring(value)]["steam_id"] 
	elseif type2=="s" and g_savedata["playerdata"][tostring(value)]~=nil then
		svalue=tostring(value)
	elseif type2=="v" and g_savedata["vehicles"][tonumber(value)]~=nil then -- returns the value from the owner of the vehicle
		svalue=tostring(g_savedata["vehicles"][tonumber(value)]["steam_id"])
	else
		if not check then
			server.announce("[who function]", "unable to find target: "..calledf)
			if debug then
	debug("value: "..tostring(value).."\ntype: "..tostring(type).."\ntype2: "..tostring(type2).."\ncheck: "..tostring(check).."\nsvalue: "..tostring(svalue))
			end
			return -1
		end
	end

	if svalue~=nil then
		if type==0 or type==nil then
			return svalue
		elseif type==1 then
			return g_savedata["playerdata"][svalue]["name"]
		elseif type==2 then
			return g_savedata["playerdata"][svalue]["user_id"]
		elseif type==3 then
			return scanpl("admin",svalue)
		elseif type==4 then
			return scanpl("auth",svalue)
		elseif type==5 then
			return g_savedata["playerdata"][svalue]["object_id"]
		elseif type==6 then
			return g_savedata["playerdata"][svalue]["active"]
		elseif type==7 then
			return g_savedata["playerdata"][svalue]["ban"]
		else
			server.announce("[who function]", "specified return value does not exist: "..calledf)
			return -1
		end
	else
		if not check then
			server.announce("[who function]", "user file might be nill (change me into a log file): "..calledf)
		end
		return -1
	end
end