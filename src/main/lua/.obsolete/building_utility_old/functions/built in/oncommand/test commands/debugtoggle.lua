if command=="?debug" then 
    pd["debug"] = not pd["debug"]
    if pd["debug"] then
        display(user_id,"debug function enabled",3)
    else
        display(user_id,"debug function disabled",2)
    end
end