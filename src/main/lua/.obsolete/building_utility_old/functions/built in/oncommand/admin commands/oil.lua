if command=="?oil" then
    if one=="clear" or one=="clean" or one=="remove" or one=="-" or one=="drain" then 
        server.setOilSpill(gps(0,0,false,user_id), -90000) 
        display(user_id,"oil in your vicinity is being cleaned. please wait",3)
    elseif one=="fill" or one=="add" or one=="+" then 
        server.setOilSpill(gps(0,0,false,user_id), 9000) 
        display(user_id,"oil is being poured in your vicinity. please wait",3)
    elseif one=="reset" then
        server.clearOilSpill()
        display(user_id,"removing all oil spils",3)
    else
        display(user_id,"command-format:\n?oil clear/fill\n?oil reset",1)
    end
end