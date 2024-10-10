if command == "?autoback" then
    if steam_id==nil or steam_id==-1 then
        debug("error: steam_id is: "..tostring(steam_id).." on the auto back command")
        server.notify(user_id,sname,"error: HSKJO76HJJK",7)
        return
    end
    if who(user_id,6,"p",true)~=-1 and who(user_id,6,"p",true) then
        if g_savedata["playerdata"][steam_id]["autoback"] then
            server.notify(user_id,sname,"autoback disabled",7)
            g_savedata["playerdata"][steam_id]["autoback"]=false
        else
            server.notify(user_id,sname,"autoback enabled",7)
            g_savedata["playerdata"][steam_id]["autoback"]=true
            g_savedata["playerdata"][steam_id]["lc"]["autoback"]=gps(0,0,true,user_id)
        end
    end
end