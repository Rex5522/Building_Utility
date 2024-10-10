function debug(message,where)
	if pd1~=nil then
		for index,inner in pairs(pd1) do
			if pd1[index]["debug"] and pd1[index]["active"] then
				if where~=nil then
					txt=tostring(where)..": "..tostring(message)
				else
					txt=tostring(message)
				end
				server.announce("Building_Utility-Debug", txt, pd1[index]["id"])
			end
		end
	else
		if where~=nil then
			txt=tostring(where)..": "..tostring(message)
		else
			txt=tostring(message)
		end
		server.announce("backup_log_mode-Building_Utility-Debug: ", txt, -1)
	end
	svlog(txt or message,where)
end