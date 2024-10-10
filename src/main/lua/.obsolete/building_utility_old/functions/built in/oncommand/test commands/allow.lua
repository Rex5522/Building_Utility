if command == "?allow" then
    if who(one,6,"p",true)~=-1 and who(one,6,"p",true) then
        if g_savedata["server"]["requests"][who(one)][steam_id]~=nil then
            debug("request found")

            allowed = -1
            action=g_savedata["server"]["requests"][who(one)][steam_id]["action"]
            to = g_savedata["server"]["requests"][who(one)][steam_id]["target"]
            requester = g_savedata["server"]["requests"][who(one)][steam_id]["requester"]
            debug("victom: "..requester.."\nto: "..to.."\naction: "..action)

            if action=="user-to-victom" then
                server.setObjectPos(who(one,5), gps(0,0,false,user_id))
                display(user_id,"teleporting "..who(one,1).." to your location",1)
                display(one,"teleporting to "..who(user_id,1),1)
            elseif action=="victom-to-user" then
                debug("attempt1")
                server.setObjectPos(object_id, gps(0,0,false,one))
                display(user_id,"teleporting to "..who(user_id,1),1)
                display(one,"teleporting "..who(one,1).." to your location",1)


            elseif action=="user-to-victom-vehicle" then
                tpplayer(user_id,to,allowed,ui_toggle)
                display(user_id,who(requester,1).." is teleporting to your vehicle id: "..to,1)
                display(requester,"teleporting to "..who(user_id,1).."'s vehicle id: "..to,1)



            elseif action=="victom-to-victom-vehicle" then
                tpplayer(user_id,to,allowed,ui_toggle)
                display(requester,"teleporting "..who(user_id,1).." to their vehicle id: "..to,1)
                display(user_id,who(requester,1).." is teleporting you to your vehicle id: "..to,1)




            elseif action=="victom-to-user-vehicle" then
                tpplayer(user_id,to,allowed,ui_toggle)
                display(requester,"teleporting "..who(user_id,1).." to your vehicle id: "..to,1)
                display(user_id,who(requester,1).." is teleporting you to their vehicle id: "..to,1)
                
            else
                debug("malformed action")
            end
            g_savedata["server"]["requests"][who(one)][steam_id]=nil
        end
    else
        display(user_id,"\n"..error, "the user you are trying to allow ether dosint exist, left the server or never sent a request",2)
    end
end