function findeqv(value,float,arg)
	value = tonumber(value)
	if float then
		if g_savedata["eqm"]["float"][value]~=nil then
			return g_savedata["eqm"]["float"][value][arg]
		else
			debug("that value does not exist in current list (1)")
			return 0
		end
	else
		if g_savedata["eqm"]["int"][value]~=nil then
			return g_savedata["eqm"]["int"][value][arg]
		else
			debug("that value does not exist in current list (2)")
			return 0
		end
	end
end