if command=="?autoseat" then
    if pd["autoseat"] then
        pd["autoseat"] = false
        display(user_id, "autoseat disabled", 1)
    else
        pd["autoseat"] = true
        display(user_id, "autoseat enabled", 1)
    end

end