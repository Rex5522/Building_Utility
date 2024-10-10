if command == "?disarm" then
    if one == nil then
        server.notify(user_id, sname..cmf,"?disarm user_id", 7)
    else
        if one == "punish" then
            g_savedata["DisarmPunishment"] = not g_savedata["DisarmPunishment"]
            server.notify(user_id,"Disarm punishment enabled","Disarmed players will now be punished for weapon posession.",2)
        else
            one = tonumber(one)
            name1=who(one,1)
            name2=who(user_id,1)
            g_savedata["DisarmSettings"][one] = not g_savedata["DisarmSettings"][one]
            if g_savedata["DisarmSettings"][one] then
                server.notify(user_id,name1.." Disarmed","Player can no longer use weapons.",2)
                server.notify(one,name2.." has disarmed you","You can no longer use weapons.",2)
            else
                server.notify(user_id,name1.." Rearmed","Player can now use weapons.",4)
                server.notify(one,name2.." has rearmed you","You can now use weapons.",4)
            end
        end
    end
end