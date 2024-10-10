function onChatMessage(user_id, sender_name, message)
	command=nil
	one=nil
	two=nil
	three=nil
	four=nil
	five=nil
	lasti=0
	has=false
	last=false
	if string.sub(message,1,1)=="/" then
	message="?"..string.sub(message,2,-1).." "
	for i=1,string.len(message) do
	
		if string.sub(message,i,i)~=" " then has=true debug(1) end
		
		if string.sub(message,i,i)==" " then
			
			if has then
				if command==nil then
					command=string.sub(message,1,i-1)
				elseif one==nil then
					one=string.sub(message,lasti+1,i-1)
				elseif two==nil then
					two=string.sub(message,lasti+1,i-1)
				elseif three==nil then
					three=string.sub(message,lasti+1,i-1)
				elseif four==nil then
					four=string.sub(message,lasti+1,i-1)
				elseif five==nil then
					five=string.sub(message,lasti+1,i-1)
				else
					
				end
				has=false
			end
			lasti=i
		end
	end
		if command~=nil then
			debug("command: "..tostring(command).."\none: "..tostring(one).."\nfive: "..tostring(five))
			onCustomCommand(message, user_id, who(user_id,3), who(user_id,4), command, one, two, three, four, five)
		else
			
		end
	end
end