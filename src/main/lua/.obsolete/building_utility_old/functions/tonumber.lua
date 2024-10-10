function ton(value) -- returns only numbers, discards all letters and only returns numbers in int format
	if type(value)=="string" then
		txt=""
		for i=1,string.len(value) do
			if tonumber(string.sub(value,i,i))~=nil then
				txt=txt..string.sub(value,i,i)
			end
		end

		--logs = 	logs..""
		return tonumber(txt)
	elseif type(value)=="number" then
		return value
	elseif type{value}=="nil" then
		debug("error: HJYGN278H")
		return 0
	else
		debug("error: MHYKNH2")
	end
end