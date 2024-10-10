if command == "?anticlip" then
    if true then
        steam_id=who(user_id)
        g_savedata["AntiNoClipSettings"][user_id]=not g_savedata["AntiNoClipSettings"][user_id]
        if g_savedata["AntiNoClipSettings"][user_id] then

            server.notify(user_id,"Anti No-Clip Enabled","Players can no longer no-clip into your vehicles.",4)
        else
            server.notify(user_id,"Anti No-Clip Disabled","Players can now no-clip into your vehicles.",2)
        end
    else
        server.notify(user_id, sname, "sorry but the devs broke this command. this command will be re-enabled when its fixed", 6)
    end
end