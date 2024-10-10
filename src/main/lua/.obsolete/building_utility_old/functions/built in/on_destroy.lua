function onDestroy()
	for index, inner in pairs(g_savedata["playerdata"]) do
		steam_id=tostring(index)
		g_savedata["playerdata"][steam_id]["ff"]=true
	end
end	