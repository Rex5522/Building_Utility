function delay(action,v1,v2,v3,delay)

	debug("action: "..tostring(action).."\nv1: "..tostring(v1).."\nv2: "..tostring(v2).."\nv3: "..tostring(v3).."\ndelay: "..tostring(delay))

	if delayed==nil then delayed={} end
	if delay==nil or delay<3 then delay=3 end
	
	for i=delay,100000 do
		if delayed[game_ticks2+i]==nil then
			
			if game_ticks2>g_limit then
				settick = game_ticks2+i-g_limit
			else
				settick = game_ticks2+i
			end

			delayed[settick]={["action"]=action,[1]=v1,[2]=v2,[3]=v3,["time"]=delay} break

		end
	end
end