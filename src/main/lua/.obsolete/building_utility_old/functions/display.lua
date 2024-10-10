function display(user_id, message, NOTIFICATION_TYPE, chat)

	-- 1=normal   2=error   3=good thing

	-- change values to desired
	if NOTIFICATION_TYPE == nil then NOTIFICATION_TYPE = 7 end
	if NOTIFICATION_TYPE == 3 then NOTIFICATION_TYPE = 5 end
	if NOTIFICATION_TYPE == 2 then NOTIFICATION_TYPE = 6 end
	if NOTIFICATION_TYPE == 1 then NOTIFICATION_TYPE = 7 end

	if chat == nil then chat = false end


	if chat then
		server.announce(sname, message, user_id)
	else
		server.notify(user_id, sname, message, NOTIFICATION_TYPE)
	end
	
end