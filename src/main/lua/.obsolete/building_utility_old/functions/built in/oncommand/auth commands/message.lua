if command=="?message" or command=="?msg" then
    if one~=nil and two~=nil then
        
        num=string.len(one..command)+2
        one=tonumber(one)
        if one==user_id then
            txt="you sent a message to yourself. are you lonely?"
            from="building_utility"
        else
            txt=string.sub(full, num)
            server.notify(user_id, "message sent to", who(one, 1), 7)
            from=who(user_id, 1)
        end
        server.notify(one, "message from "..from, txt, 7)
    else
        server.notify(user_id, "command-format", "?message user_id message", 7)
    end
end