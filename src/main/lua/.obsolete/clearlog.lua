if command == "?clearlog" then
    if sd1["logs"][one] ~= nil then
        display(user_id, "log file found. deleting")
        sd1["logs"][one] = nil
    else
        display(user_id, "that log path does not exist", 2)
    end
end