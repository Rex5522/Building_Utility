if command=="?permit" then
    if one==nil then
        count=0
        txt=""
        for index, inner in pairs(g_savedata["bantime"]) do
            steam_id=tostring(index)
            btime=g_savedata["bantime"][steam_id]/60
            txt=txt.."user: "..who(steam_id,1,"s").."{\ntime banned: "..string.format("%.1f",(tostring(btime)), 1,4).." min,  \nuser_id: "..who(steam_id,2,"s").."\n}\n"
            count=count+1
        end
        if count==0 then
            txt="there are no banned players"
        end
        server.notify(user_id, sname, txt, 7)
    else
        steam_id=who(one,0,"p",true)
        if steam_id~=nil and steam_id~=-1 then
            if g_savedata["playerdata"][steam_id]["banned"] then
                g_savedata["bantime"][steam_id]=nil
                g_savedata["playerdata"][steam_id]["banned"]=false
                server.notify(user_id, "server-admin", "unbanned user: "..who(steam_id,1,"s"), 7)
            else
                server.notify(user_id,"server-admin", "error: unable to unban user due to user not being banned", 6)
            end
        else
            server.notify(user_id,"server-admin", "error: unable to unban user do to user not exsisting", 6)
        end
    end
end