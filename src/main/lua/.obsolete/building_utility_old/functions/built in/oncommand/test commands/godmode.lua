if command=="?godmode" or command=="?god" then
    pd["godmode"] = not pd["godmode"]
    if pd["godmode"] then
        display(user_id, "god mode enabled", 3)
    else
        display(user_id, "god mode disabled", 2)
    end
end