function tlen(table)
	local count=0
	for a,b in pairs(table) do count=count+1 end
	return count
end