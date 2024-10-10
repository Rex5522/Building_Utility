function request(victom,to,user_id,action,ui_toggle)
	user_id=tonumber(user_id)
	victom_id=tonumber(victom)
	--vtype=what(victom,who(user_id))
	--utype=what(to,who(user_id))
	--ttype=what(lc,who(user_id))
	--if who(user_id)==who(victom) then uaps=true else uaps=false end
	--if who(user_id)==who(lc) then uaps2=true else uaps2=false end
	debug(user_id)
	debug(victom_id)
	
	
	if g_savedata["server"]["requests"][who(user_id)][who(victom_id)]==nil then
		g_savedata["server"]["requests"][who(user_id)][who(victom_id)]={["action"]=action,["target"]=to,["requester"]=user_id}
		delay("removerq",who(user_id),who(victom_id),nil,1800)

		if action=="user-to-victom" then
			debug("displayed")
			display(user_id,"requesting to teleport to "..who(to,1),1)
			display(to,who(user_id,1).." is requesting to teleport to you",1)
			g_savedata["server"]["requests"][who(user_id)][who(to)]={["action"]=action}
		elseif action=="victom-to-user" then
			debug("displayed")
			display(user_id,"requesting "..who(victom,1).." to be teleported to you",1)
			display(victom,who(user_id,1).." is requesting you to teleport to them",1)
			g_savedata["server"]["requests"][who(user_id)][who(victom)]={["action"]=action}
			
			
		elseif action=="user-to-victom-vehicle" then
			display(user_id,"requesting to teleport to "..who(to,1,"v").."'s vehicle id: "..to,1)
			display(victom,who(user_id,1).." is requesting to teleport to your vehicle id: "..to,1)
		elseif action=="victom-to-victom-vehicle" then
			display(user_id,"requesting "..who(victom,1).." to be teleported to their vehicle id: "..to,1)
			display(victom,who(user_id,1).." is requesting you to teleport your vehicle id: "..to,1)
		elseif action=="victom-to-user-vehicle" then
			display(user_id,"requesting "..who(victom,1).." to be teleported to your vehicle id: "..to,1)
			display(victom,who(user_id,1).." is requesting you to teleport to their vehicle id: "..to,1)



		elseif action=="victom-to-vehicle" then
			display(user_id,"requesting "..who(victom,1).." to be teleported to you")
			display(victom,who(user_id,1).." is requesting you to teleport to them")
			
			
			
		elseif action=="victom-to-lc" then
			display(user_id,"requesting "..who(victom,1).." to be teleported to you")
			display(victom,who(user_id,1).." is requesting you to teleport to them")
		end


	else
		display(user_id,"you already have a request going to "..who(victom,1),2)
	end
end