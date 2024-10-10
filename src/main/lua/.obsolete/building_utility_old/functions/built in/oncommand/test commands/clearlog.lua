if command == "?clearlog" then
    sd1["logs"]["main"] = nil
    display(user_id, "cleaned main log file", 3)
    svlog(who(user_id,1).."cleared the main log file")
end