if command=="?slowmo" then
    if one~=nil then
        if ton(one) > 60 then 
            display(user_id,"max value is 20",2) 
            return 
        elseif ton(one) < 1 then 
            display(user_id,"min value is 1")
            return
        end
        
    end
end