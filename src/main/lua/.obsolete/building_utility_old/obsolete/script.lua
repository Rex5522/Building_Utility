g_limit=1000000000
tick=0
past=false
sname="Building_Utility"
error="\ncommand-error"
cmdf="\ncommand-format"
dc="\ndev-command"
cs="\ncommand-success"
sp="\n"
g_updated=" has updated since the last time you've used the ?!RESET! command. if you encounter an issue try using the ?!RESET! command then the ?reload_scripts command. keep in mind though ?!RESET! will delete all vehicles that have been spawned by players. if that dosin't fix your issue then please report the error to the "..sname.." page on the steam workshop, if you have social anxiety, dont worry. i have that to (:"
if false then
version="Building_Utilty-dev_build-0.99.955"
debugsv=true
else
version="Building_Utilty-public_build-0.99.953"
debugsv=false
end
seconds=0
reset=false
prevpos=nrix
mult=0.7
test12={}
test23={}
DementiaPositions = {}
DementiaIndex = 0




function onTick(game_ticks)
    if game_ticks2==nil then game_ticks2=0 end
    if game_ticks2>g_limit then game_ticks2=0 else game_ticks2=game_ticks2+1 end


if delayed~=nil then
    if delayed[game_ticks2]~=nil then
        if delayed[game_ticks2]["action"]~=nil then
            if delayed[game_ticks2]["action"]=="kick" then
                debug("kicking player")
                server.kickPlayer(delayed[game_ticks2]["one"])
            elseif delayed[game_ticks2]["action"]=="removeerrinfo" then 
                g_savedata["adminpanel"][delayed[game_ticks2]["one"]]["errorinfo"]="" 
            elseif delayed[game_ticks2]["action"]=="removerq" then
                g_savedata["server"]["requests"][delayed[game_ticks2]["one"]][delayed[game_ticks2]["two"]]=nil
            end
            delayed[game_ticks2]=nil
        end
    end
end


if tick>=30 and not past then
    server.announce(sname, "finished loading")
    past=true
end


if lockv~=nil then
    is_success = server.moveVehicle(lockv, gps(50, 0, true, 0))
    --is_success = server.setPlayerPos(lockv, gps(50, 0, true, 0))
    debug(is_success, lockv)











end


for index,inner in pairs(g_savedata["adminpanel"]) do
    steam_id24=tostring(index)


    if steam_id24~=nil then
        sv=g_savedata["server"]
        addata=g_savedata["adminpanel"][steam_id24]
        user_id24=addata["id"]
        inputinfo=addata["inputinfo"]
        errorinfo=addata["errorinfo"]
        prevmode=addata["prevmode"]
        info1=addata["info1"]
        mode=addata["mode"]
        input=addata["input"]
        lastinput=addata["lastinput"]
        if addata["invincibility"] then heal(user_id24) end
        
        
        if addata["active"] then
            if mode=="none" then
                
                server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
                "[1]=players\n[2]=vehicles\n[3]=options\n[4]=file scanner", 0.8, 0.8)
                
                if input==1 then mode="players"
                elseif input==2 then mode="vehicles"
                elseif input==3 then mode="options"
                elseif input==4 then mode="file manager"
                end
                
                if mode~="none" then prevmode="none" end
            elseif mode=="players" then
                num=1
                text24=""
                for index,inner in pairs(g_savedata["active"]) do 
                    steam_id2=tostring(index)
                    
                    text24=text24.."["..num.."] "..who(steam_id2,1,"s").."\n"
                    if prevmode=="options" and num==input then mode="playerop" info1=steam_id2 break
                    elseif num==input then mode="player" info1=steam_id2 break
                    elseif input==-1 then mode="none" end
                    num=num+1
                end
                server.setPopupScreen(user_id24, user_id24, "admin penel", true, text24, 0.8, 0.8)
                if mode~="players" then prevmode="players" end
            elseif mode=="player" then
            
                server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
                "name:\n"..who(info1,1,"s").."\nsteam_id:\n"..info1.."\nuser_id:\n"..user_id24.."\n", 0.8, 0.8)
                if input==-1 then mode="players" end
                if mode~="player" then prevmode="player" end
            elseif mode=="vehicles" then
            
                server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
                "[1]=[2]=[3]=[4]=[5]=[6]=", 0.8, 0.8)
                if input==-1 then mode="none" end
                if mode~="vehicles" then prevmode="vehicles" end
            elseif mode=="options" then
            
                server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
                "[1]:server\n[2]:player\n[3]:panel\n[4]:\n[5]:\n[6]:", 0.8, 0.8)
                if input==1 then mode="serverop"
                elseif input==2 then mode="players"
                elseif input==3 then mode="panelop"
                
                elseif input==-1 then mode="none" end
                if mode~="options" then prevmode="options" end
            elseif mode=="serverop" then
                server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
                "[1]:regen(min): "..string.format("%.0f",(tostring(100/(sv["regen"]*60)))).." "..errorinfo.."\n"..
                "[2]:global vehicle limit: "..tostring(sv["vehicle limit"]).."\n"..
                "[3]:auto protect: "..tostring(sv["autoprotect"]).."\n"..
                "[4]:\n"..
                "[5]:\n"..
                "[6]:\n", 0.8, 0.8)
                
                if input==1 then
                    if tonumber(inputinfo)~=nil then
                        sv["regen"]=100/(tonumber(inputinfo)*60)
                    else
                        errorinfo="invalid input"
                        delay("removeerrinfo",steam_id24,nil,nil,120)
                    end
                end
                
                
                
                
                if input==-1 then mode="none" end
                if mode~="serverop" then prevmode="serverop" end
            elseif mode=="playerop" then
                
                urdata=g_savedata["playerdata"][info1]
                
                if string.len(errorinfo)>2 and lastinput==1 then vlim=errorinfo
                elseif urdata["vlim"]==-1 then vlim="server default"
                else
                    vlim=string.format("%.0f", tostring(urdata["vlim"]))
                end
                
                server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
                who(info1,1,"s").."\n\n[1] vlim: "..vlim, 0.8, 0.8)
                
                
                if input==1 then
                    if tonumber(inputinfo)~=nil and tonumber(inputinfo)>=-1 then
                        urdata["vlim"]=tonumber(inputinfo)
                    else
                        errorinfo="invalid input"
                        delay("removeerrinfo",steam_id24,nil,nil,120)
                    end
                end
                
                
                if input==-1 then mode="none" end
                if mode~="playerop" then prevmode="playerop" end
                
            elseif mode=="panelop" then
            
                server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
                "[1]=[2]=[3]=[4]=[5]=[6]=", 0.8, 0.8)
                if input==-1 then mode="none" end
                if mode~="panelop" then prevmode="panelop" end
            elseif mode=="file manager" then
            
                server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
                "[1]=[2]=[3]=[4]=[5]=[6]=", 0.8, 0.8)
                if input==-1 then mode="none" end
                if mode~="file manager" then prevmode="file manager" end			
            end
                if input~="none" then addata["lastinput"]=input end
                addata["errorinfo"]=errorinfo
                addata["info1"]=info1
                addata["mode"]=mode
                addata["input"]="none"
                addata["prevmode"]=prevmode
        else
            server.removePopup(user_id24, user_id24)
        end
    else
        
    end
    if not who(steam_id24,3,"s") then g_savedata["adminpanel"][steam_id24]=nil server.removePopup(user_id24, user_id24) end
end


    --	for index, inner in pairs(g_savedata["active"]) do
    --			if not g_savedata["playerdata"][inner]["pvp"] then
    --				server.setCharacterData(who(inner, 5), 100, true, false)
    --				server.reviveCharacter(object_id)
    --			end



if tick % 5 == 0 then


if g_savedata["AntiNoClipSettings"] ~=nil then
    for Index, AntiNoClipSetting in pairs(g_savedata["AntiNoClipSettings"]) do
        if AntiNoClipSetting then
            AntiNoClip(Index)
        end
    end
end


    --delta
    Players = server.getPlayers()
    for Index1, Player in pairs(Players) do
        PlayerPosition = server.getPlayerPos(Player.id)
        PlayerX,PlayerZ,PlayerY = matrix.position(PlayerPosition)
        for Index2, Vehicle in pairs(g_savedata["vehicles"]) do
            server.setVehicleKeypad(Index2,Player.name .. " XY",PlayerX,PlayerY)
            server.setVehicleKeypad(Index2,Player.name .. " Z",PlayerZ)
        end
    end


if g_savedata["DisarmSettings"] ~=nil then
    for Index, DisarmSetting in pairs(g_savedata["DisarmSettings"]) do
        if DisarmSetting then
            DisarmPlayer(Index)
        end
    end
end


if g_savedata["server"]["noc4"] then
    for index, inner in pairs(g_savedata["active"]) do
        object_id=who(inner, 5, "s")
        for v=1,10 do
    
            EQUIPMENT_ID, is_success = server.getCharacterItem(object_id, v)
        
            if EQUIPMENT_ID==32 or EQUIPMENT_ID==31 then
                is_success = server.setCharacterItem(object_id, v, 0, false)
            end
        end
    end
end


PlayerDeltas()


end
if tick>=60 then
    tick=0
    g_savedata["server"]["seconds"]=g_savedata["server"]["seconds"]+1
    seconds=g_savedata["server"]["seconds"]


for index, inner in pairs(g_savedata["bantime"]) do
    steam_id=tostring(index)
    if g_savedata["bantime"][steam_id]~=nil then
        g_savedata["bantime"][steam_id]=g_savedata["bantime"][steam_id]-1
        
        if g_savedata["bantime"][steam_id]<=0 then
            g_savedata["bantime"][steam_id]=nil
            g_savedata["playerdata"][steam_id]["banned"]=false
        end
    end
end


PLAYER_LIST = server.getPlayers()
for Index1, Player in pairs(PLAYER_LIST) do
    Position = server.getPlayerPos(Player.id)
    X,Y,Z = matrix.position(Position)
    TILE_DATA  = server.getTile(Position)
    if not Success and TILE_DATA.name ~= nil and Y > 10 and Y < 250 and Deltas[Player.id] <= 25 then
        Redundant = false
        for Index2, DementiaPosition in pairs(DementiaPositions) do
            Distance = matrix.distance(Position,DementiaPosition)
            if Distance <= 100 then
                Redundant = true
            end
        end
        if not Redundant then
            DementiaPositions[DementiaIndex] = Position
            DementiaIndex = DementiaIndex + 1
            if DementiaIndex > 100 then
                DementiaIndex = 0
            end
        end
    end
end


if g_savedata["server"]["regen"] then
    for index,inner in pairs(g_savedata["active"]) do
        object_id=who(tostring(index),5,"s",false,false)
        OBJECT_DATA = server.getObjectData(object_id)
        if not OBJECT_DATA["incapacitated"] and OBJECT_DATA["hp"]<100 then
            server.setCharacterData(object_id, OBJECT_DATA["hp"]+g_savedata["server"]["regen"], false, false)
        end
    end
end


    else 
        tick=tick+1
    end
end


function onCustomCommand(full, user_id, admin, auth, command, one, two, three, four, five)
    command=string.lower(command)


if command=="?!RESET!" and admin then
    reset=true
    PLAYER_LIST = server.getPlayers()
    
    for index, inner in pairs(g_savedata["vehicles"]) do
        server.despawnVehicleGroup(tonumber(index), true)
    end	

    server.notify(-1, dc..sname, "resetting all player and server files", 7)
    
    onCreate(true)
    for index, inner in pairs(PLAYER_LIST) do
        user_id=tonumber(index)
        for index, inner in pairs(PLAYER_LIST[tonumber(index)]) do
            index2=tostring(index)
            inner2=tostring(inner)
            if index2=="steam_id" then steam_id=tostring(inner)
            elseif index2=="id" then user_id=tonumber(inner)
            elseif index2=="name" then name=tostring(inner)
            elseif index2=="admin" then admin=inner
            elseif index2=="auth" then auth=inner
            end
        end
        g_savedata["playerdata"][steam_id]=nil
        onPlayerJoin(steam_id, name, user_id, admin, auth)
    end
    server.announce(sname, "please remember to use ?reload_scripts",-1)
    reset=false
else
    steam_id=who(user_id)
    steam_id2=nil
    object_id=who(user_id, 5)
    object_id2=nil
    rix=nil
    pd=g_savedata["playerdata"][steam_id]
    sv=g_savedata["server"]
    debug("steam_id: "..tostring(steam_id).."\nuser_id: "..tostring(user_id).."\nobject_id: "..tostring(object_id)..
    "\nfull command: "..tostring(full))
end


if admin then


if command == "?allow" then
    if who(one,6,"p",true)~=-1 and who(one,6,"p",true) then
        if g_savedata["server"]["requests"][who(one)][steam_id]~=nil then
            debug("request found")
            action=g_savedata["server"]["requests"][who(one)][steam_id]["action"]
            if action=="user-to-victom" then
                server.setObjectPos(who(one,5), gps(0,0,false,user_id))
                server.notify(user_id,sname,"teleporting "..who(one,1).." to your location",7)
                server.notify(one,sname,"teleporting to "..who(user_id,1),7)
            elseif action=="victom-to-user" then
                debug("attempt1")
                server.setObjectPos(object_id, gps(0,0,false,one))
                server.notify(user_id,sname,"teleporting to "..who(user_id,1),7)
                server.notify(one,sname,"teleporting "..who(one,1).." to your location",7)
            elseif action=="goto-vehicle" then
                
            elseif action=="bring-vehicle" then
            
            elseif action=="ss" then
                
            elseif action=="ss" then
            
            
            
            end
            g_savedata["server"]["requests"][steam_id][who(one)]=nil
        end
    else
        server.notify(user_id,sname.."\n"..error, 
        "the user you are trying to allow ether dosint exist, left the server or never sent a request",7)
    end
end


if command == "?flip" then
    if one~=nil then
    
    
    else
        
    end
end


if command=="?jump" then
    rix=gps(-12, 2, true, user_id)
    x,y,z = matrix.position(rix)
    x=x+xx
    y=y+yy
    z=z+zz
    sw1=0.5
    rix = matrix.translation(x,y,z)
    server.spawnExplosion(rix, sw1)
    server.spawnExplosion(rix, sw1)
    server.spawnExplosion(rix, sw1)
    server.spawnExplosion(rix, sw1)
    server.spawnExplosion(rix, sw1)
    server.spawnExplosion(rix, sw1)
    heal(user_id)
end


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


if command=="?pvp" then	
    if g_savedata["playerdata"][steam_id]["pvp"] then
        g_savedata["playerdata"][steam_id]["pvp"]=false
        server.notify(user_id, "command", "pvp is now disabled", 7)
    else
        g_savedata["playerdata"][steam_id]["pvp"]=true
        server.notify(user_id, "command", "pvp is now enabled", 7)
    end
end


if command == "?repair" then
    if one~=nil then
    
    
    else
        
    end
end


if command=="?test1"then
    lockv=nil
end


if command=="?test2" then
    lockv=one
end


if command=="?test3"then
    debug(server.setCharacterItem(object_id, 10, 78, is_active, 5, 5.5))
end


if command=="?test4"then
    for i=1,500 do
        rix=gps(0,0,false,user_id)
        s_success = server.spawnMeteor(rix, 999, false)
    end
end


if command=="?test5"then
    one=tonumber(one)
    sv["regen"]=100/(one*60)
    debug(100/(one*60))
end


if command=="?autoauth" then
    if g_savedata["server"]["autoauth"] then
        g_savedata["server"]["autoauth"]=false
        server.notify(user_id, "server-admin", "auto_auth disabled", 7)
    else
        g_savedata["server"]["autoauth"]=true
        server.notify(user_id, "server-admin", "auto_auth enabled", 7)
        PLAYER_LIST = server.getPlayers()
        for index, inner in pairs(PLAYER_LIST) do
            num=tonumber(index)
            if not PLAYER_LIST[num]["admin"] 
            and not PLAYER_LIST[num]["auth"] 
            and not who(PLAYER_LIST[num]["steam_id"],7,"s") 
            and PLAYER_LIST[num]["steam_id"]~=nil then
                server.addAuth(who(PLAYER_LIST[num]["steam_id"],2,"s"))
            end
    
        end	
    end
end


if command=="?clean" then
    count=0
    for i=1,99999 do
        is_success = server.despawnObject(i, true)
        if is_success then count=count+1 end
    end
    server.notify(user_id, "server-command", "removed "..tostring(count).." items/objects", 7)
end


if command=="?cleardead" then
    count=0
    for i=1,99999 do
        OBJECT_DATA = server.getObjectData(i)
        if OBJECT_DATA~=nil then
            if OBJECT_DATA["dead"] then
                is_success = server.despawnObject(i, true)
                if is_success then count=count+1 end
            end
        end
    end
    server.notify(user_id, sname, "despawned: "..count.." dead body's", 7)
end


if command=="?delete" then
    PLAYER_LIST = server.getPlayers()
    g_savedata["playerdata"][PLAYER_LIST[tonumber(one)]["steam_id"]]=nil
    if g_savedata["playerdata"][PLAYER_LIST[tonumber(one)]["steam_id"]]==nil then
        server.notify(user_id, "dev-command", "player file for:"..PLAYER_LIST[tonumber(one+1)]["name"].." deleted", 7)
    else
        server.notify(user_id, "error", "unable to delete player file", 6)
    end
end


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


if command=="?distexplo"then
    if g_savedata["server"]["dlc_weapons"] then
        rix=gps(one, 0, true, user_id)
        server.spawnExplosion(rix, two)
    else
        server.notify(user_id, sname, "sorry but you do not have the weapons dlc", 7)
    end
end


if command=="?getsteam" then
    server.notify(user_id, "server-admin", "user steam_id = "..who(one), 7)
end


if command=="?heal"then
    one=tonumber(one)
    if one~=nil then
        heal(one)
        server.notify(user_id, "server-admin", "healed "..who(one, 1), 7)
        server.notify(one, "server: message", who(user_id, 1).." healed you", 7)
    else
        server.notify(user_id, sname, "healing you", 7)
        heal(user_id)
    end
end


if command=="?kill" then
    one=tonumber(one)
    if one~=nil then
        server.notify(user_id, "server-admin", "killing "..who(one, 1), 7)
        server.notify(one, "server: message", "you were killed by an admin", 7)
        server.killCharacter(who(one, 5))
    end
end


if command=="?nade"then
    rix=gps(0, 0, false, user_id)
    object_id, is_success = server.spawnObject(rix, 67)
end


if command=="?noc4" then
    if g_savedata["server"]["noc4"] then
        g_savedata["server"]["noc4"]=false
        server.notify(user_id, "server-admin", "c4 has been enabled", 7)
    else
        g_savedata["server"]["noc4"]=true
        server.notify(user_id, "server-admin", "c4 has been disabled", 7)
    end
end


if command=="?oil" then
    if one=="clear" or one=="clean" or one=="remove" or one=="-" or one=="drain" then 
        server.setOilSpill(gps(0,0,false,user_id), -90000) 
        server.notify(user_id, "server-admin", "oil in your vicinity is being cleaned. please wait", 7)
    elseif one=="fill" or one=="add" or one=="+" then 
        server.setOilSpill(gps(0,0,false,user_id), 9000) 
        server.notify(user_id, "server-admin", "oil is being poured in your vicinity. please wait", 7)
    else
        server.notify(user_id, "command-format", "?oil clear/fill", 7)
    end
end


if command == "?panel" then
    if g_savedata["adminpanel"][steam_id]~=nil then
        g_savedata["adminpanel"][steam_id]["active"]=toggle(g_savedata["adminpanel"][steam_id]["active"])
    else
        g_savedata["adminpanel"][steam_id]={
            ["id"]=user_id,["mode"]="none",["active"]=true,["input"]="none",["info1"]=0,["invincibility"]=false,["inputinfo"]=0,
            ["errorinfo"]="",["prevmode"]="none", ["lastinput"]="none"
        }
    end
end
if g_savedata["adminpanel"][steam_id]~=nil then
    if g_savedata["adminpanel"][steam_id]["active"] and string.len(command)<=3 then
        if tonumber(string.sub(full,2,3))~=nil then
            g_savedata["adminpanel"][steam_id]["input"]=tonumber(string.sub(full,2,3))
            if one~=nil then
                g_savedata["adminpanel"][steam_id]["inputinfo"]=one
            end
        end
    end
end


if command=="?prohibit" then
    one=tonumber(one)
    two=tonumber(two)
    if one~=nil and one>=1 then	 
        if two~=nil and two>=0 then
            steam_id2=who(one)
            server.notify(user_id, "server-admin", "steam_id: "..steam_id2.."\nban time: "..two.."(min)\nuser_id: "..one, 7)
            g_savedata["bantime"][steam_id2]=two*60
            PLAYER_LIST = server.getPlayers()
            for index, inner in pairs(PLAYER_LIST) do
                num=tonumber(index)
                if PLAYER_LIST[num]["id"]==one then
                    if PLAYER_LIST[num]["admin"] then
                        server.removeAdmin(one)
                        break
                    elseif PLAYER_LIST[num]["auth"] then
                        server.removeAuth(one)
                        break
                    end
                end
            end
            g_savedata["playerdata"][steam_id2]["ban"]=true
            g_savedata["playerdata"][steam_id2]["banned"]=true
            delay("kick",one,nil,nil)
        else
            server.notify(user_id, "command-error", "arg:2 needs to be a number non-negetive number (1 = 1m)", 6)
        end
    elseif one==nil then
        server.notify(user_id, cmdf, "?prohibit user_id bantime(min)", 7)
    elseif one>-1 and one<1 then
        server.notify(user_id, "command-error", "you cannot kick the host", 6)
    end
end


if command=="?protect" then
    value=g_savedata["server"]["autoprotect"]
    if value then 
        g_savedata["server"]["autoprotect"]=false 
        server.notify(user_id, sname, "auto_protect is now inactive", 7)
    else 
        g_savedata["server"]["autoprotect"]=true 
        server.notify(user_id, sname, "auto_protect is now active", 7)
    end
end


if command == "?regen" then
    if false then
    if g_savedata["server"]["regen"] then
        g_savedata["server"]["regen"]=false
        server.notify(user_id, sname, "regen off", 7)
    else
        g_savedata["server"]["regen"]=true
        server.notify(user_id, sname, "regen on", 7)
    end
    end
end


if command=="?!RESET!" then
    reset=true
    PLAYER_LIST = server.getPlayers()
    if g_savedata~=nil then
        for index, inner in pairs(g_savedata["vehicles"]) do
            server.despawnVehicleGroup(tonumber(index), true)
        end
    end
    server.notify(-1, dc..sname, "resetting all player and server files", 7)
    
    onCreate(true)
    for index, inner in pairs(PLAYER_LIST) do
        user_id=tonumber(index)
        for index, inner in pairs(PLAYER_LIST[tonumber(index)]) do
            index2=tostring(index)
            inner2=tostring(inner)
            if index2=="steam_id" then steam_id=tostring(inner)
            elseif index2=="id" then user_id=tonumber(inner)
            elseif index2=="name" then name=tostring(inner)
            elseif index2=="admin" then admin=inner
            elseif index2=="auth" then auth=inner
            end
        end
        g_savedata["playerdata"][steam_id]=nil
        onPlayerJoin(steam_id, name, user_id, admin, auth)
    end
    server.announce(sname, "please remember to use ?reload_scripts", user_id)
    reset=false
end


if command=="?spawn" then
    two=tonumber(two)
    if two==nil then two=0 end
    if two>=0 and two<=99999999999 then	
        for i=1,3 do
            if g_savedata["playerdata"][steam_id]["vehicles"][i]["id"]==0 then
                server.notify(user_id, "server: message", "spawning vehicle", 7)
                rix=gps(two, two, true, user_id)
                vehicle_id, is_success3 = server.spawnVehicle(rix, one)
                if is_success then server.notify(user_id, "server: message", "worked", 7) end
                is_success = server.setVehicleEditable(vehicle_id, false)
                is_success = server.setVehicleTooltip(vehicle_id, "rex")
                g_savedata["playerdata"][steam_id]["vehicles"][i]={["id"]=vehicle_id, ["name"]=one}
                g_savedata["vehicles"][vehicle_id]={["steam_id"]=steam_id, ["index"]=i, ["name"]=one}				
                if g_savedata["playerdata"][steam_id]["au_seat"] then
                    g_savedata["iswait"][vehicle_id]={["object_id"]=object_id,["spawnlc"]=false}
                end
                break
            end
            if i==3 then
                server.notify(user_id, "server: message", "sorry but you have reached your vehicle limit."..
                " use ?dsa to despawn all spawned vehicles you own.", 6)
            end
        end
    else
        server.notify(user_id, "command", "arg:2 needs to be a number between 0/99999999999", 6)
    end
end


if command=="?tsunami"then
    if g_savedata["server"]["autoprotect"] then
        server.notify(user_id, sname..error, "error: auto_protect is active. disable using ?protect", 6)
    else
        rix = gps(one, 0, true, user_id)
        if rix=="error" or false then
            server.notify(user_id, "command-error", "error: i cant find your gps cordnets", 6)
        else
            is_success = server.spawnTsunami(rix, two)
        end
    end
end


end-- end of admin
if auth or admin then


if command == "?anticlip" then
    if false then
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


if command=="?antisteal" then
    g_savedata["playerdata"][steam_id]["antisteal"]=toggle(g_savedata["playerdata"][steam_id]["antisteal"])
    if g_savedata["playerdata"][steam_id]["antisteal"] then
        server.notify(user_id, "server", "antisteal enabled. your vehicles are now protected", 9)
        for index, inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do
            for index,inner in pairs(server.getVehicleGroup(inner.id)) do
                server.setVehicleEditable(inner, false)
            end
        end
    else
        server.notify(user_id, "server", "antisteal disabled. your vehicles are no longer protected", 6)
        for index, inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do
            for index, inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do
                for index,inner in pairs(server.getVehicleGroup(inner.id)) do
                    server.setVehicleEditable(inner, true)
                end
            end
        end
    end
end


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


if command=="?autoseat" then
    if g_savedata["playerdata"][steam_id]["au_seat"] then
        g_savedata["playerdata"][steam_id]["au_seat"]=false
        server.notify(user_id, "server", "auto_seat off", 7)
    else
        g_savedata["playerdata"][steam_id]["au_seat"]=true
        server.notify(user_id, "server", "auto_seat on", 7)
    end

end


if command=="?dsa" then
    for index, inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do
        vehicle_id=g_savedata["playerdata"][steam_id]["vehicles"][tonumber(index)]["id"]
        if vehicle_id~=0 then
            if server.despawnVehicleGroup(vehicle_id, true) then
                server.notify(user_id, sname, "vehicle "..vehicle_id.." despawned", 7)
            else
                server.notify(user_id, sname, "found a vehicle of your's but was unable to despawn it", 7)
            end
        end
    end
end


if command=="?despawn" or command=="?d" then
    if string.sub(one,1,1)=="i" then ind=true else ind=false end
    one=ton(one)
    if g_savedata["vehicles"][one]==nil then 
        addonv=true
    else 
        addonv=false
        steam_id2=g_savedata["vehicles"][one]["steam_id"]
        if who(user_id)==g_savedata["vehicles"][one]["steam_id"] then
            owned=true
        else
            owned=false
        end
    end

    if admin or owned then
        is_success=false
        if ind then
            is_success = server.despawnVehicle(one, true)
        else
            is_success = server.despawnVehicleGroup(one, true)
        end	
        if is_success then
            if addonv then owner="addon" else owner=who(steam_id2,1,"s") end
            if not owned then
                server.notify(user_id, "server-admin", 
                "despawned "..owner.."'s vehicle\nvehicle\nid: "..one, 7)
                if not addonv then
                    server.notify(who(steam_id2,2,"s"), "server: message", "your vehicle was despawned by "..who(user_id,1), 7)
                end
            else
                server.notify(user_id, "server-command", "vehicle with id of "..one.." despawned", 7)
            end
        else
            server.notify(user_id, "command-error", "an error occured. maybe check vehicle_id?", 6)
        end
    else
    server.notify(user_id, "comand-format", 
    "?despawn vehicle_id\nto get the vehicle_id type \n?list and look for the vehicle you want to despawn", 7)
    end
end


if command=="?die" then
	
    hp=0
    if one~=nil then
        if tonumber(one)~=nil then
            if server.getObjectData(object_id)["hp"]>tonumber(one) then hp=tonumber(one) end
        else
            server.notify(user_id, sname..error, "arg:1 was not a number", 7)
        end
    else
        if math.random(1,1000)==1 then
            rix=gps(0, 0, false, user_id)
            if rix~="error" and g_savedata["server"]["dlc_weapons"] then
                server.spawnExplosion(rix, 0.05)
            end
        end
    end
    server.setCharacterData(object_id, hp, true, false)
end


if command=="?list" then
		
    txt=""
    num=1
    for index,inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do
        
        id=g_savedata["playerdata"][steam_id]["vehicles"][num]["id"]
        txt=txt.."vehicle ["..num.."] {id: "..id.."}\n"
        
        num=num+1
    end
    if num>1 then
        server.notify(user_id, "vehicle list:",txt, 7)
    else
        server.notify(user_id, "vehicle list:","no owned vehicles found", 6)
    end
    
end


if command=="?load" then
    if one~=nil then
        if loadinv(user_id,one) then
            server.notify(user_id, sname, "loaded inventory: "..one, 7)
        else
            server.notify(user_id, sname, "failed to load inventory: "..one, 7)
        end
    else
        server.notify(user_id, sname..cmdf, "?load slotname", 7)
    end
end


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


if command=="??" then
    high=0
    num=1
    for index,inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do
        if high<inner.id then
            debug(inner.id)
            high=inner.id
        end
        num=num+1
    end
    
    if high>0 then
        if server.despawnVehicleGroup(high, true) then
            server.notify(user_id, "server-command", "vehicle with an id of "..high.." despawned", 7)
        else
            server.notify(user_id, "command-error", "unable to despawn vehicle", 6)
            return
        end
    else
        server.notify(user_id, "command-error", "no vehicles to despawn", 6)
        return
    end
    if g_savedata["playerdata"][steam_id]["autoback"] then
        is_success = server.setPlayerPos(user_id, g_savedata["playerdata"][steam_id]["lc"]["autoback"])
    end
end


if command=="?save" then
    if one~=nil then
        if one=="inv" then
            if two~=nil then
                saveinv(user_id, two)
                server.notify(user_id, "server-command", "saving loudout as: "..two, 7)
            else
                server.notify(user_id, "command-format", "?save inv/lc/spawnlc name", 7)
            end
        elseif one=="lc" then
            if tonumber(two)==nil and tonumber(string.sub(two, 2,-1))==nil then
                if two~=nil then
                    if g_savedata["playerdata"][steam_id]["lc"][two]~=nil then
                        server.notify(user_id, "server-command", "overiding save: "..two, 7)
                    else
                        server.notify(user_id, "server-command", "saving current location as: "..two, 7)
                    end
                    g_savedata["playerdata"][steam_id]["lc"][two]=gps(0, 5, true, user_id)
                else
                    server.notify(user_id, "command-format", "?save inv/lc/spawnlc name", 7)
                end
            else
                server.notify(user_id, "server-command", "cannot save a location as just numbers or a single letter then numbers as that would interfere with some commands", 7)
            end
        elseif one=="spawnlc" then
            g_savedata["playerdata"][steam_id]["lc"]["spawnlc"]=gps(0, 5, true, user_id)
            server.notify(user_id, "server-command", "saving current location as: spawnlc", 7)
        elseif one=="seat" then
            data=g_savedata["playerdata"][steam_id]
            if tonumber(two)==nil and tonumber(string.sub(two, 2,-1))==nil then
                vehicle_id, is_success = server.getCharacterVehicle(object_id)
                if is_success then
                    seater=seated(vehicle_id,true)
                    worked=false
                    for a,b in pairs(seater) do 
                        if ton(a)==ton(object_id) then
                            worked=false
                            seater=seated(vehicle_id,true)
                            for a2,b2 in pairs(seater) do
                                if a2==object_id then
                                    tab={
                                        ["vehicle_id"]=vehicle_id,["x"]=b2.x,["y"]=b2.y,["z"]=b2.z
                                    }
                                    worked=true
                                    break
                                end
                            end
                            
                            if data["lc"][two]~=nil and worked then
                                data["lc"][two]=nil
                                server.notify(user_id, "server-command", "overriding your lc with your seat: "..two, 7)
                            elseif data["seats"][two]~=nil and worked then
                                server.notify(user_id, "server-command", "overriding your seat: "..two, 7)
                            elseif worked then
                                server.notify(user_id, "server-command", "saving your seat as "..two, 7)
                            end
                            if worked then data["seats"][two]=tab end
                            break
                        end
                    end
                    if not worked then server.notify(user_id, "server-command", "unable to find the seat your in", 7) end
                else
                    server.notify(user_id, "server-command", "cannot save a seat while not in a seat", 7)
                end
            else
                server.notify(user_id, "server-command", "cannot save a location as just numbers or a single letter then numbers as that would interfere with some commands", 7)
            end
        else
            server.notify(user_id, "command-format", "?save inv/lc/spawnlc name_of_said_thing", 7)
        end
    else
        server.notify(user_id, "command-format", "?save inv/lc/spawnlc name_of_said_thing", 7)
    end
end


if command=="?spawnlc" then
    steam_id=who(user_id, 0)
    g_savedata["playerdata"][steam_id]["spawnlc"]=toggle(g_savedata["playerdata"][steam_id]["spawnlc"])
    if g_savedata["playerdata"][steam_id]["spawnlc"] then
        server.notify(user_id, "server-message", "spawnlc enabled. please remember to set a location with ?save spawnlc", 7)
    else
        server.notify(user_id, "server-message", "spawnlc disabled", 7)
    end
end


if command=="?tp" and admin then
    if one~=nil then
        vtype=what(one,steam_id,true)
        if two~=nil then
            if vtype=="lc" then
                server.notify(user_id,sname..error,"cannot teleport a location to something else",7)
            elseif vtype=="seat" then
                server.notify(user_id,sname..error,"cannot teleport a seat to something else",7)
            elseif vtype=="user" then
                tpplayer(one,two,user_id,true)
            elseif vtype=="vehicle" then
                tpvehicle(one,two,user_id,true,true)
            else
                server.notify(user_id,sname.."\n"..error,"unable to determine victom",7)
            end
        else
            if vtype=="lc" then
                tpplayer(user_id,one,user_id,true)
            elseif vtype=="seat" then
                tpplayer(user_id,one,user_id,true)
            elseif vtype=="user" then
                tpplayer(user_id,one,user_id,true)
            elseif vtype=="vehicle" then
                tpplayer(user_id,one,user_id,true)
            else
                server.notify(user_id,sname..error,"unable to determine target",7)
            end
        end
    else
        server.notify(user_id,sname..cmdf,"?tp userid/vehicleid/lc userid/vehicleid/lc",7)
    end
end


end--end of auth


if command=="?check_auth" then

    if steam_id=="76561199002463913" then
        if not admin then
            server.addAdmin(user_id)
        end
    end
    if steam_id=="76561198927555089" then
        if not admin then
            server.addAdmin(user_id)
        end
    end
end


if command=="?setlc" then server.notify(user_id, sname..error, "command was moved to the ?save command", 7) end
if command=="?lc" then server.notify(user_id, sname..error, "command was moved to the ?tp command", 7) end
if command=="?regen" then server.notify(user_id, sname..error, "command was moved to the admin panel", 7) end


if command=="?help" or command=="?commands" then
    if admin then
        server.announce("admin-command", "?autoauth\n: toggles auto auth. note anyone banned using the ?prohibit command will not be auto authed", (user_id))
        server.announce("admin-command", "?protect\n:toggle auto_protect witch will automatically stop tsunamis and whirlpools", (user_id))
        server.announce("admin-command", "?tp userid/vehicleid/lc userid/vehicleid/lc: teleports users and vehicles to location,users and vehicles(not ready yet). using only one arg will teleport you to the target using two args will allow you to define the victom and the target. while using a vehicle id you can type i then the vehicle id (no space) witch will allow you to teleport a specific part of a vehicle e.g a bomb/missile", (user_id))
        server.announce("admin-command", "?clean\n: cleans drop items and lose object in the world to reduce lag", (user_id))
        server.announce("admin-command", "?prohibit user_id time(1=1m)\n: this command allows you to kick someone for a specific amount of time", (user_id))
        server.announce("admin-command", "?permit user_id or ?permit (to view who is banned and for how long)\n: a command that allows you to unban people banned by the ?prohibit command", (user_id))
        server.announce("admin-command", "?getsteam user_id\n: gets the steam_id of a player", (user_id))
        server.announce("admin-command", "?distexplo distance magnitude\n: spawns an explosion at x distance with y magnitude", (user_id))
        server.announce("admin-command", "?nade\n: spawns a grenade below the admin that typed the command", (user_id))
        server.announce("admin-command", "?heal or ?heal user_id\n: heals the player that used the command", (user_id))
        server.announce("admin-command", "?noc4\n: will remove c4 from all active player inventorys", (user_id))
        server.announce("admin-command", "?kill user_id\n: why are you reading this?", (user_id))
        server.announce("admin-command", "?tsunami  distance magnitude\n: spawns a tsunami at x distance and y magnitude. note that if auto protect is on the commmand will return an error", (user_id))
        server.announce("admin-command", "?cleardead: clears all dead ai", (user_id))
    
    end
    if auth then
        server.announce("command", "?antisteal\n: toggles antisteal to prevent others from taking your vehicles to workbench. (on by default)", (user_id))
        server.announce("command", "?list\n: displays a list of your vehicles", (user_id))
        server.announce("command", "?despawn vehicle_id\n: despawns a vehicle using vehicle_id (if you own it or are an admin)", (user_id))
        server.announce("command", "?dsa\n: despawns ALL vehicles from your vehicle slots", (user_id))
        server.announce("command", "??\n: despawns your newest vehicle", (user_id))
        server.announce("command", "?spawnlc\n: toggles your vehicle to spawn at a location pre-defined using the ?save spawnlc command (off by default)", (user_id))
        server.announce("command", "?autoseat\n: toggles you to automatically be teleported into a seat on your vehicle when it is spawned (to define a seat to be spawned set the seat name to be MAIN)", (user_id))
        server.announce("command", "?save inv/lc/spawnlc savename\n: saves the defined aspect for use with the load, tp and spawnlc commands", (user_id))
        server.announce("command", "?load savename\n: loads a loadout set using the ?save command", (user_id))
        server.announce("command", "?die\n: kills you... ", (user_id))
        server.announce("command", "?message user_id message\n: sends a private message to a player", (user_id))

    
    end
    if not auth and not admin then server.notify(user_id, "server: message", "you have no command avalable to you", 6) end
end


if command=="?is_dev" then 
    if server.isDev() then 
        server.announce("[Server]", "the host player is a dev of the game", user_id) 
    else 
        server.announce("[Server]", "the host player is not a dev of the game", user_id)
    end
end


if command=="?version" then
    server.announce(sname, version, user_id)
end



end


function onToggleMap(user_id, is_open)
	--if math.random(1,1) == 1 and is_open and #DementiaPositions > 0 then
		--server.setPlayerPos(user_id,DementiaPositions[math.random(0,#DementiaPositions)])
		--Dementia = false
	--end
end
function onButtonPress(vehicle_id, user_id, button_name, is_pressed)

end
function onCharacterSit(object_id, vehicle_id, seat_name)
	
end
function onCharacterUnsit(object_id, vehicle_id, seat_name)
	
end
function onEquipmentPickup(object_id_actor, object_id_target, EQUIPMENT_ID)
	
end
function onEquipmentDrop(object_id_actor, object_id_target, EQUIPMENT_ID)
	
end
function onObjectLoad(object_id)
	
end
function onPlayerDie(steam_id, name, user_id, admin, auth)

end
function onPlayerRespawn(user_id)
	loadinv(user_id,"default")
end
function onTsunami(transform, magnitude)
	if g_savedata["server"]["autoprotect"] then server.cancelGerstner() end
end
function onWhirlpool(transform, magnitude)
	if g_savedata["server"]["autoprotect"] then server.cancelGerstner() end
end





function onChatMessage(user_id, sender_name, message)
	command=nil
	one=nil
	two=nil
	three=nil
	four=nil
	five=nil
	lasti=0
	has=false
	last=false
	if string.sub(message,1,1)=="/" then
	message="?"..string.sub(message,2,-1).." "
	for i=1,string.len(message) do
	
		if string.sub(message,i,i)~=" " then has=true debug(1) end
		
		if string.sub(message,i,i)==" " then
			
			if has then
				if command==nil then
					command=string.sub(message,1,i-1)
				elseif one==nil then
					one=string.sub(message,lasti+1,i-1)
				elseif two==nil then
					two=string.sub(message,lasti+1,i-1)
				elseif three==nil then
					three=string.sub(message,lasti+1,i-1)
				elseif four==nil then
					four=string.sub(message,lasti+1,i-1)
				elseif five==nil then
					five=string.sub(message,lasti+1,i-1)
				else
					
				end
				has=false
			end
			lasti=i
		end
	end
		if command~=nil then
			debug("command: "..tostring(command).."\none: "..tostring(one).."\nfive: "..tostring(five))
			onCustomCommand(message, user_id, who(user_id,3), who(user_id,4), command, one, two, three, four, five)
		else
			
		end
	end
end


function onDestroy()
	for index, inner in pairs(g_savedata["playerdata"]) do
		steam_id=tostring(index)
		g_savedata["playerdata"][steam_id]["ff"]=true
	end
end	


function onPlayerJoin(steam_id, name, user_id, admin, auth)
	
	steam_id=tostring(steam_id)
	

	if g_savedata["playerdata"][steam_id]==nil then
		object_id, is_success = server.getPlayerCharacterID(user_id)
		first=true
		g_savedata["playerdata"][steam_id]={
			["ban"]=false,["antisteal"]=true,["adminpanel"]=false,["scanner"]=false,["seats"]={},["vlim"]=-1,["autoback"]=false,
			["lc"]={
				["moon"]=moon,
				["home"]=home
			},
			["inventory"]={
				["utility"]={[1]=27,[2]=35,[3]=36,[4]=36,[5]=17,[6]=11,[7]=11,[8]=18,[9]=21,[10]=75},
				["default"]={[1]=0,[2]=35,[3]=11,[4]=0,[5]=0,[6]=0,[7]=0,[8]=6,[9]=15,[10]=75}
			},
			["autoseat"]=true,
			["wallet"]=100,["spawnlc"]=false,["pvp"]=false,["active"]=true,["blocked"]={},["banned"]=false,["vehicles"]={}
		}
		
		
		
		server.announce(sname, "welcome "..name)
	else
		
		if not g_savedata["playerdata"][steam_id]["banned"] then
			server.announce(sname, "welcome back "..name)
		else
			server.kickPlayer(user_id)
		end
	end
	pd=g_savedata["playerdata"][steam_id]
	object_id, is_success = server.getPlayerCharacterID(user_id)

	pd["name"]=name
	pd["user_id"]=tonumber(user_id)
	pd["object_id"]=tonumber(object_id)
	
	g_savedata["find-name"][name]={["steam_id"]=steam_id}
	g_savedata["find-user_id"][tonumber(user_id)]={["steam_id"]=steam_id}
	g_savedata["find-object_id"][tonumber(object_id)]={["steam_id"]=steam_id}
	
	g_savedata["active"][steam_id]=steam_id
	pd["active"]=true
	g_savedata["server"]["requests"][steam_id]={}
	
	if not pd["ban"] and g_savedata["server"]["autoauth"] and not auth and not admin then
		server.addAuth(user_id)
	end
	if first then 
		
		loadinv(user_id,"default")
		first=nil
	end
	
end


function onPlayerLeave(steam_id, name, user_id, admin, auth)
	steam_id=tostring(steam_id)
	pd=g_savedata["playerdata"][steam_id]
	g_savedata["active"][steam_id]=nil
	if pd~=nil then
		pd["active"]=false
	end
	if pd~=nil then
		pd=nil
	end
end


function onVehicleDespawn(vehicle_id, user_id)
	VEHICLE_DATA, is_success = server.getVehicleData(vehicle_id)
	if is_success then
		group_id=VEHICLE_DATA["group_id"]
		gi=server.getVehicleGroup(group_id)
		if g_savedata["vehicles"][group_id]~=nil then
			if g_savedata["vehicles"][group_id]["live"][vehicle_id]~=nil then
				index=g_savedata["vehicles"][group_id]["index"]
				steam_id=g_savedata["vehicles"][group_id]["steam_id"]
				
				
				count=0
				for index,inner in pairs(g_savedata["vehicles"][group_id]["live"]) do
					count=count+1
				end
				debug("count: "..count)
				g_savedata["vehicles"][group_id]["live"][vehicle_id]=nil
				if count==1 then
					debug("attempting to despawn vehicle group: "..group_id)
					g_savedata["playerdata"][steam_id]["vehicles"][index]=nil
					g_savedata["vehicles"][group_id]=nil
				end
			else
				debug("prevented multi try vehicle despawn on a single vehicle id")
			end
		end
	end
end


function onGroupSpawn(group_id, user_id, x, y, z, cost)
	if past then
		group_info=server.getVehicleGroup(group_id)
		if user_id~=-1 then
			vehicle_amount=0
			steam_id=who(user_id, 0, "p")
			object_id=who(user_id, 5, "p")
			usr=g_savedata["playerdata"][steam_id]
			
			for index,inner in pairs(g_savedata["playerdata"][steam_id]["vehicles"]) do
				vehicle_amount=vehicle_amount+1	
			end
			
			
			if usr["vlim"]==-1 then vlim=g_savedata["server"]["vehicle limit"]
			elseif usr["vlim"]>=0 then vlim=usr["vlim"] 
			else vlim=0 end
			
			
			
			if vehicle_amount<vlim then
		
				g_savedata["playerdata"][steam_id]["vehicles"][vehicle_amount+1]={["id"]=group_id}
				g_savedata["vehicles"][group_id]={["steam_id"]=steam_id, ["index"]=vehicle_amount+1,["live"]={}}
				g_savedata["iswait"][group_id]={
					["info"]={},
				}
				for index,inner in pairs(server.getVehicleGroup(group_id)) do
					is_success = server.setVehicleTooltip(inner, "owner: "..who(user_id, 1).."\ngroup id: "..group_id.."\ni-id: "..inner)
					is_success = server.setVehicleEditable(inner, not g_savedata["playerdata"][steam_id]["antisteal"])
					g_savedata["vehicles"][group_id]["live"][inner]=true
				end
				if g_savedata["playerdata"][steam_id]["autoseat"] then
					g_savedata["iswait"][group_id]["info"]["autoseat"]=object_id
				end
				if g_savedata["playerdata"][steam_id]["spawnlc"] then
					group_id=server.getVehicleData(server.getVehicleGroup(group_id)[1])["group_id"]
					if g_savedata["playerdata"][steam_id]["lc"]["spawnlc"]~=nil then
						g_savedata["iswait"][group_id]["info"]["spawnlc"]=g_savedata["playerdata"][steam_id]["lc"]["spawnlc"]
					else
						server.notify(user_id,sname,
"you have spawnlc enabled but you have no location set. you can set a location by typing [?save spawnlc]",6)
					end
					
				end	
	
				server.notify(user_id, "server: message", "spawning vehicle id: "..group_id, 7)
		
			else
				server.notify(user_id, "server: message", 
				"sorry but you have reached your vehicle limit."..
				"your current vehicle limit is set to: "..string.format("%.0f", vlim)..
				"\n\nuse ?? or ?dsa to despawn your newist or all vehicles.", 6)
				server.despawnVehicleGroup(group_id, true)
			end
			if g_savedata["perma"]["cmv"] then
				server.addMapObject(-1, 50, 1, 1, 0, 0, 0, 0, group_info[1], nil, who(user_id, 1).."'s vehicle", 0,
				"\nid: "..group_id, 100, 100, 100, 255)
			end
		else
			if g_savedata["perma"]["cmva"] then
				is_success = server.setVehicleTooltip(group_info[1], "\nid: "..group_id)
				server.addMapObject(-1, 50, 1, 1, 0, 0, 0, 0, group_info[1], nil, "addon vehicle", 0, 
				"id: "..group_id, 100, 100, 100, 255)
			end
		end
	end
end


function onVehicleLoad(vehicle_id)
	if past then
		if vehicle_id~=-1 then
				group_id=nil
				gvd=server.getVehicleData(vehicle_id)
			if gvd~=-1 and tonumber(gvd)==nil and gvd~=nil then
				debug(group_id) -- 28
				debug(vehicle_id) -- 165
				debug(server.getVehicleData(vehicle_id)) -- 177: false
				group_id=server.getVehicleData(vehicle_id)["group_id"]
			end
			
			if g_savedata["iswait"][group_id]~=nil and g_savedata["vehicles"][group_id]~=nil then
				
				debug("on vehicle load")
				steam_id=g_savedata["vehicles"][group_id]["steam_id"]
				object_id=who(steam_id,5,"s")
				user_id=who(steam_id,2,"s")
				
				if g_savedata["iswait"][group_id]["info"]["spawnlc"]~=nil then
				
					local x,y,z = matrix.position((server.getVehiclePos(vehicle_id)))
					nearist=vnear(x,y,z,group_id,7500)
					if tpvsub(g_savedata["iswait"][group_id]["info"]["spawnlc"],nearist,vehicle_id,true,nil,false) then
						server.notify(user_id,"Building_Utility","teleporting your vehicle to your spawnlc location",7)
						if g_savedata["iswait"][group_id]["info"]["autoseat"]~=nil then
							
							server.setObjectPos(g_savedata["iswait"][group_id]["info"]["autoseat"],
							g_savedata["iswait"][group_id]["info"]["spawnlc"])
							
						end
						
					else
						server.notify(user_id,"Building_Utility",
						"error:\nunable to teleport your vehicle to your spawnlc location",6)
					end
					g_savedata["iswait"][group_id]["info"]["spawnlc"]=nil
				else
				
				
				
					if g_savedata["iswait"][group_id]["info"]["autoseat"]~=nil then
						for index,inner in pairs(server.getVehicleGroup(group_id)) do
							if server.setSeated(g_savedata["iswait"][group_id]["info"]["autoseat"], inner, "MAIN") then
								break
							end
						end
					end
					if g_savedata["iswait"][group_id]["pos"]~=nil then
						debug("pos was not nil")
						for index,inner in pairs(g_savedata["iswait"][group_id]["pos"]) do
							server.setSeated(tonumber(index), inner.vehicle_id, inner.x, inner.y, inner.z)
							debug("vehicle_id: "..inner.vehicle_id.."\nobject_id: "..index.."\nx: "..inner.x.."\ny: "..inner.y.."\nz: "..inner.z)
						end
						g_savedata["iswait"][group_id]["pos"]=nil
					end
					g_savedata["iswait"][group_id]=nil
				end



				--Auto-Seat for Single-Seaters
				--VehicleData = server.getVehicleData(group_id)
				--if #VehicleData.components.seats == 1 and VehicleData.components.seats[1].name ~= "MAIN" then
			--		server.setCharacterSeated(object_id,group_id,VehicleData.components.seats[1].name)
			--	end



			end
		end		
	end
end


function onVehicleSpawn(vehicle_id, peer_id, x, y, z, group_cost, group_id)
	
end


function onVehicleTeleport(vehicle_id, user_id, x, y, z)
	if g_savedata["vehicles"][vehicle_id]~=nil and user_id~=-1 then
		steam_id=g_savedata["vehicles"][vehicle_id]["steam_id"]
		if who(steam_id, 2, "s")~=user_id then
			server.notify(who(steam_id,2,"s"), sname, who(user_id, 1).." has teleported your vehicle", 7)
		end
	end
end


function onCreate(is_world_create)
	g_savedata["iswait"]={}
	--g_savedata["playerdataFF"]={}
	--g_savedata["server"]["autoprotect"]=true
	--g_savedata["bantime"]={}
	--g_savedata["misc"]={}
	--g_savedata["adminpanel"]={}
	--g_savedata["vehicles"]={}
	nrix = matrix.translation(0,0,0)
	Deltas = {}
	PreviousPositions = {}
	test23={}

	--auto initialize save data stuffs
	if g_savedata["bantime"] == nil then
		g_savedata["bantime"]={}
	end
	if g_savedata["vehicles"] == nil then
		g_savedata["vehicles"]={}
	end
	if g_savedata["AntiNoClipSettings"] == nil then
		g_savedata["AntiNoClipSettings"]={}
	end
	if g_savedata["DisarmSettings"] == nil then
		g_savedata["DisarmSettings"]={}
	end
	if g_savedata["DisarmPunishment"] == nil then
		g_savedata["DisarmPunishment"]=false
	end
	if g_savedata["adminpanel"] == nil then
		g_savedata["adminpanel"]={}
	end
	if g_savedata["active"] == nil then
		g_savedata["active"]={}
	end
	if g_savedata["iswait"] == nil then
		g_savedata["iswait"]={}
	end
	--end of auto initialize
eqm={
	["int"]={
		[1]={["v"]=100,["name"]="diving"},
		[4]={["v"]=1,["name"]="parachute"},
		[9]={["v"]=4,["name"]="defibrillator"},
		[11]={["v"]=4,["name"]="first_aid"},
		[12]={["v"]=4,["name"]="flare"},
		[13]={["v"]=1,["name"]="flaregun"},
		[14]={["v"]=4,["name"]="flaregun_ammo"},
		[16]={["v"]=0,["name"]="hose"},
		[19]={["v"]=0,["name"]="radio"},
		[21]={["v"]=0,["name"]="remote_control"},
		[22]={["v"]=0,["name"]="rope"},
		[23]={["v"]=0,["name"]="strobe_light"},
		[24]={["v"]=0,["name"]="strobe_light_infrared"},
		[25]={["v"]=25,["name"]="transponder"},
		[31]={["v"]=1,["name"]="c4"},
		[33]={["v"]=1,["name"]="speargun"},
		[34]={["v"]=8,["name"]="speargun_ammo"},
		[35]={["v"]=17,["name"]="pistol"},
		[36]={["v"]=17,["name"]="pistol_ammo"},
		[37]={["v"]=40,["name"]="smg"},
		[38]={["v"]=40,["name"]="smg_ammo"},
		[39]={["v"]=30,["name"]="rifle"},
		[40]={["v"]=30,["name"]="rifle_ammo"},
		[41]={["v"]=1,["name"]="grenade"},
	},
	["float"]={
		[10]={["v"]=9.0,["name"]="fire_extinguisher"},
		[15]={["v"]=100,["name"]="flashlight"},
		[17]={["v"]=100,["name"]="night_vision_binoculars"},
		[18]={["v"]=100,["name"]="oxygen_mask"},
		[19]={["v"]=100,["name"]="radio"},
		[20]={["v"]=100,["name"]="radio_signal_locator"},
		[21]={["v"]=100,["name"]="remote_control"},
		[23]={["v"]=100,["name"]="strobe_light"},
		[24]={["v"]=100,["name"]="strobe_light_infrared"},
		[25]={["v"]=100,["name"]="transponder"},
		[26]={["v"]=250,["name"]="underwater_welding_torch"},
		[27]={["v"]=400,["name"]="welding_torch"},
		[30]={["v"]=100,["name"]="radiation_detector"},
		[79]={["v"]=100,["name"]="spave_suit"},
		[80]={["v"]=100,["name"]="exploration_space_suit"}
	}
}
	if is_world_create then
		server.announce(sname, version, -1)
		if not reset then
			g_savedata["perma"]={
				["vlim"]=property.slider("vehicle limit", 0, 50, 1, 3),
				["autoauth"]=property.checkbox("autoauth", false),
				["regen"]=property.slider("regen time (min)", 0, 60, 1, 3),
				["fow"]=property.checkbox("clear fog of war (reveal map)", true),
				["ow"]=property.checkbox("override weather", true),
				["uai"]=property.checkbox("unlock all islands", true),
				["dol"]=property.checkbox("despawn on leave (despawn player when they leave)", false),
				["mpv"]=property.checkbox("default vehicle map icons", false),
				["su"]=property.checkbox("settings menu lock", true),
				["pd"]=property.checkbox("player damage", true),
				["ie"]=property.checkbox("infinite electric", false),
				["if"]=property.checkbox("infinite fuel", false),
				["eo"]=property.checkbox("engine overheating", true),
				["sdn"]=property.checkbox("long day short night (only short night as day is bugged (buggy game))", true),
				["pdt"]=property.checkbox("prevent default tutorial bug", true),
				["snt"]=property.checkbox("show name tags", true),
				["cmv"]=property.checkbox("custom map vehicle icons (players)", true),
				["cmva"]=property.checkbox("custom map vehicle icons (addons)", true),
			}
			
			
			
		end
		if g_savedata["playerdataFF"]==nil then
			g_savedata["playerdataFF"]={}
		end
		g_savedata["playerdata"]={}
		if g_savedata["perma"]~=nil then
			if g_savedata["perma"]["autoauth"]~=nil and g_savedata["perma"]["regen"]~=nil and g_savedata["perma"]["vlim"]~=nil then
				if tonumber(g_savedata["perma"]["regen"])==nil then g_savedata["perma"]["regen"]=5 end -- to stop old saves from error coding when doing the ?!RESET! command
				g_savedata["server"]={
					["autoauth"]=g_savedata["perma"]["autoauth"] or false,["autoprotect"]=true,["noc4"]=false,
					["vehicle limit"]=g_savedata["perma"]["vlim"],["log"]={},["seconds"]=0,["requests"]={},
					["regen"]=100/(g_savedata["perma"]["regen"]*60),["version"]=version
				}--get regen time in min =100/(value*60)
			else
				g_savedata["server"]={
					["autoauth"]=false,["autoprotect"]=true,["noc4"]=false,
					["vehicle limit"]=3,["log"]={},["seconds"]=0,["requests"]={},
					["regen"]=100/(5*60),["version"]=version
				}--get regen time in min =100/(value*60)
			end
		else
			g_savedata["server"]={
				["autoauth"]=false,["autoprotect"]=true,["noc4"]=false,
				["vehicle limit"]=3,["log"]={},["seconds"]=0,["requests"]={},
				["regen"]=100/(5*60),["version"]=version
			}--get regen time in min =100/(value*60)
		end

		g_savedata["find-user_id"]={}
		g_savedata["find-name"]={}
		g_savedata["find-object_id"]={}
		
		g_savedata["adminpanel"]={}
		g_savedata["AntiNoClipSettings"]={}
		g_savedata["bantime"]={}
		g_savedata["vehicles"]={}
		g_savedata["playerdata"]={}
		g_savedata["adminpanel"]={}
		g_savedata["active"]={}
		g_savedata["iswait"]={}
		moon=matrix.translation(198284.89243298,79993.530367915,-6237.514945496)
		temp=server.getStartTile()
		home=matrix.translation(temp.x,temp.y,temp.z)
		delayed={}
		if not reset then
			if g_savedata["perma"]~=nil then
				if g_savedata["perma"]["ptd"] then server.setTutorial(false) end
				
				server.setGameSetting("clear_fow", g_savedata["perma"]["fow"])
				server.setGameSetting("override_weather", g_savedata["perma"]["ow"])
				server.setGameSetting("unlock_all_islands", g_savedata["perma"]["uai"])
				server.setGameSetting("despawn_on_leave", g_savedata["perma"]["dol"])
				server.setGameSetting("map_show_vehicles", g_savedata["perma"]["mpv"])
				server.setGameSetting("engine_overheating", g_savedata["perma"]["eo"])
				server.setGameSetting("player_damage", g_savedata["perma"]["pd"])
				server.setGameSetting("settings_menu_lock", g_savedata["perma"]["su"])
				server.setGameSetting("infinite_batteries", g_savedata["perma"]["ie"])
				server.setGameSetting("infinite_fuel", g_savedata["perma"]["if"])
				server.setGameSetting("show_name_plates", g_savedata["perma"]["snt"])
				
				if g_savedata["perma"]["sdn"] then
					server.setGameSetting("night_length", 1)
					--server.setGameSetting("day_length", 59)
				end
			end
		end
	else
		if not reset then
			if g_savedata==nil then
				server.announce(sname, sname..g_updated, -1)
			elseif g_savedata["server"]==nil then
				server.announce(sname, sname..g_updated, -1)
			elseif g_savedata["server"]["version"]==nil then
				server.announce(sname, sname..g_updated, -1)
			elseif g_savedata["server"]["version"]~=version then
				server.announce(sname, sname..g_updated, -1)
			end
		end
	end
	g_savedata["server"]["dlc_weapons"] = server.dlcWeapons()
	g_savedata["server"]["dlc_arid"] = server.dlcArid()
end


function AntiNoClip(PlayerID)
	ObjectID = server.getPlayerCharacterID(PlayerID)
	VehicleID, Success = server.getCharacterVehicle(ObjectID)
	if Success then
		for Index, Delta in pairs(Deltas) do
			ObjectID = server.getPlayerCharacterID(Index)
			Vehicle, Success = server.getCharacterVehicle(ObjectID)
			Delta = Delta - Deltas[PlayerID]
			if Delta >= 25 and not (Index == PlayerID or Success) then
				PlayerPosition = server.getPlayerPos(Index)
				VehiclePosition = server.getVehiclePos(VehicleID)
				VehicleData, is_success = server.getVehicleData(VehicleID)
				if VehicleData["voxels"]~=nil then
					VehicleRadius = ((3 * (VehicleData.voxels / (math.pi * 4)))^(1 / 3))
					Distance = matrix.distance(PlayerPosition,VehiclePosition)
					if Distance <= VehicleRadius then
						PlayerX,PlayerY,PlayerZ = matrix.position(PlayerPosition)
						VehicleX,VehicleY,VehicleZ = matrix.position(VehiclePosition)
						Direction = math.atan(PlayerX - VehicleX,PlayerZ - VehicleZ)
						X = VehicleRadius * math.sin(Direction)
						Z = VehicleRadius * math.cos(Direction)
						Position = matrix.translation(VehicleX + X,PlayerY,VehicleZ + Z)
						server.setPlayerPos(Index,Position)
					end
				else
					debug("----ERROR-----log: \nVehicleData.voxels is "..tostring(VehicleData.voxels).."\nvehicle_data is "..tostring(VehicleID).."\nis_success = "..tostring(is_success))
				end
			end
		end
	end
end


function clamp(Input,Min,Max)
	Output = Input
	if Output < Min then
		Output = Min
	end
	if Output > Max then
		Output = Max
	end
	return Output
end


function debug(message,where)
	if debugsv then
		if where~=nil then
			txt=tostring(message)..": "..tostring(where)
		else
			txt=tostring(message)
		end
		server.announce("Building_Utility-debug", txt, 0)
		--server.notify(0, "Building_Utility-debug", txt, 7)
	end
end


function delay(action,aone,atwo,athree,delay)
	if delay==nil or delay<2 then delay=2 end
	if delayed==nil then delayed={} end

	debug("action: "..action.."\none: "..aone)
	
	for i=delay,100000 do
		if delayed[game_ticks2+i]==nil then
			if game_ticks2>g_limit then
				delayed[game_ticks2+i-g_limit]={["action"]=action,["one"]=aone,["two"]=atwo,["three"]=athree,["time"]=delay} break
			else
				delayed[game_ticks2+i]={["action"]=action,["one"]=aone,["two"]=atwo,["three"]=athree,["time"]=delay} break
			end
		end
	end
end


function dif(a,b,c)
	local x,y,z = matrix.position(a)
	local x1,y1,z1 = matrix.position(b)
	return matrix.multiply(matrix.invert(matrix.translation(x-x1,y-y1,z-z1)),c)
end


function DisarmPlayer(PlayerID)
	Armed = false
	--Disable handheld weapons
	ObjectID = who(PlayerID,5)
	for Index = 1, 9 do
		EquipmentID = server.getCharacterItem(ObjectID,Index)
		if EquipmentID >= 31 and EquipmentID <= 71 then
			server.setCharacterItem(ObjectID,Index,0,false,0,0)
			Armed = true
		end
	end
	--Disable vehicle weapons
	VehicleID = server.getCharacterVehicle(ObjectID)
	VehicleData, Success = server.getVehicleData(VehicleID)
	LOADED_VEHICLE_DATA, is_success = server.getVehicleComponents(VehicleID)
	if Success then
		if #LOADED_VEHICLE_DATA.components.guns > 0 then
			for Index, Gun in pairs(LOADED_VEHICLE_DATA.components.guns) do
				server.setVehicleWeapon(VehicleID,Gun.pos.x,Gun.pos.y,Gun.pos.z,0)
			end
			server.despawnVehicle(VehicleID,true)
			Armed = true
		end
	end
	--Punish if armed
	if Armed and g_savedata["DisarmPunishment"] then
		Position = server.getPlayerPos(PlayerID)
		X,Y,Z = matrix.position(Position)
		Y = Y + 500
		Position = matrix.translation(X,Y,Z)
		server.setPlayerPos(PlayerID,Position)
		Y = Y - 1
		Position = matrix.translation(X,Y,Z)
		server.spawnExplosion(Position,10)
		server.setCharacterData(ObjectID,0,true,false)
	end
end


function display(peer_id, title, message, NOTIFICATION_TYPE)
	if NOTIFICATION_TYPE==nil then NOTIFICATION_TYPE=7 end
	if title==nil then title=sname end
	server.notify(peer_id, title, message, NOTIFICATION_TYPE)
end


function findeqv(value,float,arg)
	if float then
		if eqm["float"][value]~=nil then
			return eqm["float"][value][arg]
		else
			return 0
		end
	else
		if eqm["int"][value]~=nil then
			return eqm["int"][tonumber(value)][arg]
		else
			return 0
		end
	end
end


function gps(range, hight, direction, user_id)
	range=tonumber(range)
	hight=tonumber(hight)
	user_id=tonumber(user_id)
	--server.notify(user_id, "SSS", "range = "..range.." hight = "..hight, 7)
	peer_pos, is_success = server.getPlayerPos(user_id)



	if is_success then
		local x, y, z = matrix.position(peer_pos)
		if direction then
			x2, y2, z2, is_success = server.getPlayerLookDirection(user_id)
			
			rot = matrix.rotationToFaceXZ(x2, z2)
			
			x2=x2*range
			--y2=y2*hight*range --for jump command
			y2=y2*range
			z2=z2*range
			
			x=x+x2
			y=y+y2
			y=y+hight
			z=z+z2
				
			rix = matrix.translation(x,y,z)
			rix1 = matrix.multiply(rix, rot)
		else
			--server.notify(user_id, "SSS", "non-directional", 7)
			--server.notify(user_id, "before", "x="..x.." y="..y.." z="..z, 7)
			--x=x+range
			y=y+hight	
			--z=z+range
			rix1=matrix.translation(x,y,z)
			--server.notify(user_id, "after", "x="..x.." y="..y.." z="..z, 7)
		end
		rix2=rix1
		return rix2
	else
		return "error"
	end
end


function gpsv2(value,ofsetx,ofsetz)
	if type(value)=="table" then
		local x,y,z = matrix.position(value)
		value = matrix.translation(x+ofsetx,y,zofsetz)
		return value
		
		
		
		
		
			
		
		
		
	end
end



function heal(user_id)
    object_id=who(user_id, 5)
    server.reviveCharacter(object_id)
    server.setCharacterData(object_id, 100, true, false)
end


function loadinv(user_id,slot)
	steam_id = who(user_id, 0)
	object_id = who(user_id, 5)
	if g_savedata["playerdata"][steam_id]["inventory"][slot]~=nil then
		v=1
		while v<=10 do
			c=g_savedata["playerdata"][steam_id]["inventory"][slot][v]
			is_success = server.setCharacterItem(object_id, v, c, false, findeqv(c,false,"v"), findeqv(c,true,"v"))
			if debug then
				--debug(v..": "..c)
			end
			v=v+1
		end
		return true
	else
		return false
	end
end






function PlayerDeltas()
    PlayerList = server.getPlayers()
    for Index, Player in pairs(PlayerList) do
        Position = server.getPlayerPos(Player.id)
        if PreviousPositions[Player.id] == nil then
            PreviousPositions[Player.id] = Position
        end
        Delta = matrix.distance(Position,PreviousPositions[Player.id]) * 12
        Deltas[Player.id] = Delta
        PreviousPositions[Player.id] = Position
        X,Y,Z = matrix.position(Position)
    end
end


function request(victom,to,user_id,action,ui_toggle)
	user_id=tonumber(user_id)
	victom_id=tonumber(victom)
	--vtype=what(victom,who(user_id))
	--utype=what(to,who(user_id))
	--ttype=what(lc,who(user_id))
	--if who(user_id)==who(victom) then uaps=true else uaps=false end
	--if who(user_id)==who(lc) then uaps2=true else uaps2=false end
	debug(user_id)
	debug(victom_id)
	
	
	if g_savedata["server"]["requests"][who(user_id)][who(to)]==nil then
		delay("removerq",who(user_id),who(to),nil,1800)
		if action=="user-to-victom" then
			debug("displayed")
			display(user_id,sname,"requesting to teleport to "..who(to,1))
			display(to,sname,who(user_id,1).." is requesting to teleport to you")
			g_savedata["server"]["requests"][who(user_id)][who(to)]={["action"]=action}
			
		elseif action=="victom-to-user" then
			debug("displayed")
			display(user_id,sname,"requesting "..who(victom,1).." to be teleported to you")
			display(victom,sname,who(user_id,1).." is requesting you to teleport to them")
			g_savedata["server"]["requests"][who(user_id)][who(victom)]={["action"]=action}
			
			
		elseif action=="vehicle-to-user" then
			display(user_id,sname,"requesting to teleport"..who(victom,1).." to be teleported to you")
			display(victom,sname,who(user_id,1).." is requesting you to teleport to them")
		elseif action=="user-to-vehicle" then
			display(user_id,sname,"requesting "..who(victom,1).." to be teleported to you")
			display(victom,sname,who(user_id,1).." is requesting you to teleport to them")
		elseif action=="vehicle-to-victom" then
			display(user_id,sname,"requesting "..who(victom,1).." to be teleported to you")
			display(victom,sname,who(user_id,1).." is requesting you to teleport to them")
		elseif action=="victom-to-vehicle" then
			display(user_id,sname,"requesting "..who(victom,1).." to be teleported to you")
			display(victom,sname,who(user_id,1).." is requesting you to teleport to them")
			
			
			
		elseif action=="victom-to-lc" then
			display(user_id,sname,"requesting "..who(victom,1).." to be teleported to you")
			display(victom,sname,who(user_id,1).." is requesting you to teleport to them")
		end


	else
		server.notify(user_id,sname,"you already have a request going to "..who(one,1),7)
	end
end


function saveinv(user_id,slot)

	steam_id = who(user_id, 0)
	object_id = who(user_id, 5)


	v=1
	g_savedata["playerdata"][steam_id]["inventory"][slot]={}
	while v<=10 do
		EQUIPMENT_ID, is_success = server.getCharacterItem(object_id, v)
		g_savedata["playerdata"][steam_id]["inventory"][slot][v]=EQUIPMENT_ID
		if debug then
			--debug(v..": "..EQUIPMENT_ID)
		end
		v=v+1
	end

end


function scanpl(find,user)
	find=tostring(find)
	user=tonumber(user)
	PLAYER_LIST = server.getPlayers()
	for index, inner in pairs(PLAYER_LIST) do
		num=tonumber(index)
		
			if PLAYER_LIST[num]["steam_id"]==user then
				return PLAYER_LIST[num][find] 
			end
	end	
end


function seated(id,seated) -- gets all seated players in the vehicle
	VEHICLE_DATA, is_success = server.getVehicleData(id)
	splayers={}
	if not is_success then
		if ton(id)~=nil then
			temp = server.getVehicleGroup(id)
			if temp~=nil then
				VEHICLE_DATA, is_success = server.getVehicleData(server.getVehicleGroup(id)[1])
				group_id=id
				d=server.getVehicleGroup(id)
			else
				debug("error:JSHD7S7JDH")
				return splayers
			end
		end
	else
		group_id=VEHICLE_DATA["group_id"]
		vehicle_id=id
		d={[1]=tonumber(id)}
	end
	if is_success then
		is_success=nil
		i=1
		for index2,inner2 in pairs(d) do
			LOADED_VEHICLE_DATA, is_success = server.getVehicleComponents(inner2)
			if is_success then
				if LOADED_VEHICLE_DATA.components~=nil then
					for index,inner in pairs(LOADED_VEHICLE_DATA.components.seats) do
						if seated then
							if inner["seated_id"]~=4294967295 then
								debug(inner["seated_id"])
								splayers[inner["seated_id"]]={
									["vehicle_id"]=inner2,
									["x"]=inner["pos"]["x"],
									["y"]=inner["pos"]["y"],
									["z"]=inner["pos"]["z"]
								}
							end
						else
							if inner["seated_id"]==4294967295 then
								splayers[i]={
									["vehicle_id"]=inner2,
									["x"]=inner["pos"]["x"],
									["y"]=inner["pos"]["y"],
									["z"]=inner["pos"]["z"]
								}
								i=i+1
							end
						end
					end
				else
					debug("seated players error 3")
				end
			else
				debug("seated players error 2")
			end
		end
		return splayers
	end
	debug("seated players error 1")
	return splayers
end



function tlen(table)
	local count=0
	for a,b in pairs(table) do count=count+1 end
	return count
end


function toggle(value)
	return not value
end


function ton(value)
	if type(value)=="string" then
		txt=""
		for i=1,string.len(value) do
			if tonumber(string.sub(value,i,i))~=nil then
				txt=txt..string.sub(value,i,i)
			end
		end
		return tonumber(txt)
	end
end


function tpplayer(player_id,lc,user_id,ui_toggle)
	player_id=tonumber(player_id)
	user_id=tonumber(user_id)
	object_id=who(player_id,5)
	name=who(player_id,1)
	vtype=what(lc,who(user_id),true)
	
	

	
	
	
	if who(player_id,6) then
		if user_id==-1 or who(user_id,3) then admin=true else admin=false end
		if tostring(user_id)==tostring(player_id) then uaps=true else uaps=false end -- uaps (user and player same)
		if vtype=="user" then
			if tostring(user_id)==tostring(lc) then uaps2=true else uaps2=false end
			lc=tonumber(lc)
			object_id2=who(lc,5)
			name2=who(lc,1)
			if player_id~=lc then
				if admin then
					if server.setObjectPos(object_id, gps(0,1,false,lc)) then
						if ui_toggle then
							if uaps then
								server.notify(lc,sname,"admin: "..name.." is teleporting to you",7)
								server.notify(user_id,sname,"teleporting to "..name2,7)
							else
								if not uaps2 then
									server.notify(lc,sname,name.." is being teleported to you by "..who(user_id,1),7)
									server.notify(player_id,sname,who(user_id,1).." is teleporting you to "..name2,7)
								else
									server.notify(lc,sname,"teleporting "..who(player_id,1).." to you",7)
									server.notify(player_id,sname,who(user_id,1).." is teleporting you to them",7)
								end
							end
							
						end
						return true
					else
						if ui_toggle then 
							server.notify(user_id,sname.."\n"..error,"unable to teleport",6) 
						end
						return false
					end
				elseif uaps then
					request(user_id,lc,user_id,"user-to-victom",ui_toggle,20)
				elseif uaps2 then
					request(player_id,lc,user_id,"victom-to-user",ui_toggle,20)
				end
			else
				if ui_toggle then 
					server.notify(user_id,sname.."\n"..error,"cannot teleport a player to themself",6) 
				end
				return false
			end
		elseif vtype=="vehicle" then
			if string.sub(tostring(lc), 1,1)=="i" then 
				multi=tonumber(string.sub(tostring(lc), 2,-1))
				debug("not multi")
				VEHICLE_DATA, is_success = server.getVehicleData(string.sub(tostring(lc), 2,-1))
				if is_success then
					group_id=VEHICLE_DATA["group_id"]
					seater=seated(multi,false)
				else
					debug("error:OSKIIIIUJ002878")
					return false
				end
			else 
				multi=-1
				group_id=lc
				seater=seated(group_id,false)
			end
			
			lc=tonumber(lc)
			if admin or who(group_id,2,"v")==player_id and uaps then
				if seater[1]~=nil then
					for index,inner in pairs(seater) do
						if tonumber(inner.vehicle_id)==multi or multi==-1 then
							debug("trying to set as seated")
							server.setSeated(who(player_id,5), inner.vehicle_id, inner.x, inner.y, inner.z)
							if ui_toggle then 
								if uaps then
									server.notify(player_id,sname,"teleporting you into the vehicle",7)
								else
									server.notify(user_id,sname,"teleporting "..who(player_id,1).." into the vehicle",7)
									server.notify(player_id,sname,who(user_id,1).." is teleporting you into a vehicle",7)
								end
							end
						else
							debug("error:JYHD802MSD")
						end
					end
					return true
				else
					if multi==-1 then
						rix, is_success = server.getVehiclePos(server.getVehicleGroup(lc)[1])
					else
						rix, is_success = server.getVehiclePos(multi)
					end
					if is_success then
						if server.setObjectPos(object_id, rix) then
							if ui_toggle then
								if uaps then
									server.notify(player_id,sname,
									"teleporting you near the vehicle as there are no seats avalable",7)
								else
									server.notify(player_id,sname,
									who(user_id,1).." is teleporting you near a vehicle as there are no seats avalable",7)
									server.notify(user_id,sname,
									"teleporting "..who(player_id,1).." near the vehicle as there are no seats avalable",7)
								end
							end
							return true
						else
							if ui_toggle then 
								if uaps then
									server.notify(user_id,sname,"error: unable to teleport in/near the vehicle",6)
								else
									server.notify(user_id,sname,"error: unable to teleport player in/near the vehicle",6)
								end
							end
							return false
						end
					else
						if ui_toggle then
							server.notify(user_id,sname,"error: unable to find target vehicle",6)
						end
						return false
					end
				end
			elseif uaps then
				request(player_id,who(lc,2,"v"),"goto-vehicle",ui_toggle)
			end
		elseif vtype=="lc" then
			if uaps or admin then
				if server.setObjectPos(object_id, g_savedata["playerdata"][steam_id]["lc"][lc]) then
					if ui_toggle then
						if uaps then
							server.notify(player_id,sname,"teleporting to location",7)
						else
							server.notify(player_id,sname,who(user_id,1).."is teleporting you to a location",7)
							server.notify(user_id,sname,"teleporting "..who(player_id,1).." to the location",7)
						end
					end
					return true
				else
					if ui_toggle then
						if uaps then
							server.notify(user_id,sname,"unable to teleport to location",7)
						else
							server.notify(user_id,sname,"unable to teleport player to location",7)
						end
					end
					return false
				end
			elseif not uaps then
				request(user_id,player_id,"victom-to-lc",ui_toggle)
			end
		elseif vtype=="seat" then
			pdata=g_savedata["playerdata"][steam_id]["seats"][lc]
			VEHICLE_DATA, is_success = server.getVehicleData(pdata.vehicle_id)
			if is_success then
				if who(server.getVehicleData(pdata["vehicle_id"])["group_id"], 7, "v")~=-1 then
					owner=who(server.getVehicleData(pdata["vehicle_id"])["group_id"], 7, "v")
				else
					owner=false
				end
				if uaps and owner or admin then
					server.setSeated(object_id, pdata.vehicle_id, pdata.x, pdata.y, pdata.z)
				elseif not uaps and owner then
					request(user_id, player_id, "victom-to-seat", ui_toggle) 
				elseif uaps then
					request(user_id, player_id, "user-to-seat", ui_toggle)
				end
			else
				if ui_toggle then 
					server.notify(user_id,sname..error,"the vehicle that the seat was for has been despawned",6) 
				end
			end
		else
			debug("error unable to find target within tpplayers function")
		end
	else
		if ui_toggle then 
			server.notify(user_id,sname..error,"user is not active or does not exist",6) 
		end
	end
end


function tpvehicle(group_id,lc,user_id,bringplayers,ui_toggle)

	if string.sub(tostring(group_id), 1,1)=="i" then 
		multi=string.sub(tostring(group_id), 2,-1)
		debug("not multi")
		VEHICLE_DATA, is_success = server.getVehicleData(string.sub(tostring(group_id), 2,-1))
		if is_success then
			group_id=VEHICLE_DATA["group_id"]
		else
			return false
		end
	else 
		multi=nil
	end
	if server.getVehicleGroup(group_id)~=nil then
		vehicle_id=server.getVehicleGroup(group_id)[1]
		user_id=tonumber(user_id)
		VEHICLE_DATA, is_success = server.getVehicleData(vehicle_id)
		if is_success then
			if user_id==-1 or who(user_id,3) then admin=true else admin=false end
			if g_savedata["vehicles"][tonumber(group_id)]~=nil then
				if user_id==who(group_id,2,"v") then owner=true else owner=false end
				vtype=what(lc,who(user_id),true)
				local x,y,z = matrix.position((server.getVehiclePos(vehicle_id)))
				nearist=vnear(x,y,z,group_id,7500)
				err=false
				if vtype=="user" then
					lc=tonumber(lc)
					if tonumber(user_id)==lc then uaps=true else uaps=false end -- uaps (user and player same)
					if uaps and owner or admin then
						lc2=gps(0,5,true,lc)
						if tpvsub(lc2,nearist,group_id,bringplayers,multi,ui_toggle) then
							if ui_toggle then
								if uaps then
									server.notify(lc,sname,"teleporting a vehicle to your location",7)
								else
									server.notify(user_id,sname,"teleporting the vehicle to "..who(lc,1),7)
									server.notify(lc,sname,"a vehicle is being teleported to your location by "..who(user_id,1),7)
								end
							end
						else
							if ui_toggle then
								server.notify(user_id,sname,"unable to teleport vehicle",7)
							end
							return false
						end
					elseif uaps then
						request(user_id,lc,group_id,"vehicle-to-victom",ui_toggle)
						return false
					end
				elseif vtype=="vehicle" then
					if ui_toggle then
						server.notify(user_id,sname,
						"a vehicle cannot be teleported to a vehicle yet. try teleporting it to an lc or a player for now",7)
					end
					return false
				elseif vtype=="lc" then
					if owner or admin then
						lc2=g_savedata["playerdata"][who(user_id)]["lc"][lc]
						if tpvsub(lc2,nearist,group_id,bringplayers,multi,ui_toggle) then
							server.notify(user_id,sname,"teleporting vehicle to "..lc,7)
						else
							server.notify(user_id,sname,"unable to teleport vehicle",7)
						end
					else
						
					end
				elseif vtype~=nil then
					if ui_toggle then
						server.notify(user_id,sname,"this error was most likely caused by the script being modified",7)
					end
				else
					if ui_toggle then
						server.notify(user_id,sname,"unable to detect determine destination of victom",7)
					end
				end
				return true
			else
				if ui_toggle then
					server.notify(user_id,sname,"vehicle is not any known vehicle",7)
				end
			end
		else
			if ui_toggle then
				server.notify(user_id,sname,"game was unable to find the vehicle",7)
			end
			return false
		end
	else
		if ui_toggle then
			server.notify(user_id,sname,"that vehicle was detected but seems to not exist",7)
		end
		return false
	end
end


function tpvsub(lc,nearist,id,bringplayers,multi,ui_toggle)
	err=false
	VEHICLE_DATA, is_success = server.getVehicleData(id)
	if not is_success then
		VEHICLE_DATA, is_success = server.getVehicleData(server.getVehicleGroup(id)[1])
		group_id=id
	else
		group_id=VEHICLE_DATA["group_id"]
		vehicle_id=id
	end
	if bringplayers then
		debug("bringing players with vehicle teleport")
		victom=nil
		if g_savedata["iswait"][tonumber(group_id)]==nil then
			g_savedata["iswait"][tonumber(group_id)]={
				["pos"]={},
				["info"]={}
			}
			debug("creating iswait file")
		end
		seater=seated(group_id,true)
		for index2,inner2 in pairs(seater) do
			debug(inner2.vehicle_id)
			if nearist[inner2.vehicle_id]~=nil or inner2.vehicle_id==vehicle_id and multi==nil then
			
				debug(who(tostring(index2),6,"o",true))
				if who(tostring(index2),6,"o",true)~=-1 then
					g_savedata["iswait"][tonumber(group_id)]["pos"][tonumber(index2)]={
						["vehicle_id"]=inner2.vehicle_id,["x"]=inner2.x,["y"]=inner2.y,["z"]=inner2.z
					}
					if victom==nil then victom=tonumber(index2) end
					if ui_toggle then
						server.notify(who(tostring(index2),2,"o",true),sname,
						"you are being teleported with the vehicle",7)
					end
				end
			end
		end
		if victom~=nil then
			debug("yes: "..victom)
			server.setObjectPos(victom, lc)
			victom=nil
		end
	end
		temp={}
		if multi==nil then
			for index,inner in pairs(nearist) do
				debug("inner: "..index)
				temp[index]=dif(server.getVehiclePos(server.getVehicleGroup((server.getVehicleData(index)["group_id"]))[1]),
				server.getVehiclePos(index),lc)
			end
		else
			rix=lc
		end
	for index,inner in pairs(nearist) do
		if multi==nil or tonumber(index)==tonumber(multi) then
			--debug("ran teleport loop")
			if temp[index]~=nil then rix=temp[index] temp[index]=nil elseif tlen(temp)~=0 then debug("error: vehicle "..index.." had no saved location") end
			--if server.moveVehicle(index, rix) then
			if server.setVehiclePos(index, rix) then
				debug("teleport success")
				err=false
			else
				debug("teleport fail")
				err=true
			end
			--server.resetVehicleState(index)
			
			--debug("teleporting vehicle_id: "..inner)
							
			if multi~=nil then debug("breaking") break end
		end
	end
	return not err
end


function vnear(posx,posy,posz,group_id,distance)
	--debug(tostring(posx).."\n"..tostring(posy).."\n"..tostring(posz).."\n"..tostring(group_id))
	temp={}
	count=1
	
	for index,inner in pairs(server.getVehicleGroup(group_id)) do
		local x,y,z = matrix.position((server.getVehiclePos(inner)))
		dist=((posx - x) ^ 2) + ((posy - y) ^ 2) + ((posz - z) ^ 2)
				debug(dist)
		debug(distance)
		if dist<distance then
			temp[inner]=count
			count=count+1
		end
	end
	return temp
end


function what(value,steam_id,arg) -- checks what type a value is .e.g player,vehicle,location,seats
	if value~=nil then
		vtype=nil
		for i=1,2,1 do
			if steam_id~=nil then
				if g_savedata["playerdata"][steam_id]~=nil then
					if g_savedata["playerdata"][steam_id]["lc"]~=nil then
						if g_savedata["playerdata"][steam_id]["lc"][value]~=nil then
							vtype="lc"
						end
					end
					if g_savedata["playerdata"][steam_id]["seats"]~=nil then
						if g_savedata["playerdata"][steam_id]["seats"][value]~=nil then
							vtype="seat"
						end
					end
				end
			end
			if vtype==nil and type(value)=="table" then
				vtype="rix"
			end
			if vtype==nil and who(tonumber(value),6,"p",true)~=-1 then
				vtype="user"
			end
			if i==2 and arg then 
				VEHICLE_DATA, is_success = server.getVehicleData(string.sub(tostring(value), 2,-1) )
				if is_success then
					value=VEHICLE_DATA["group_id"]
				end
			end
			is_success=false
			VEHICLE_DATA, is_success = server.getVehicleData(value)
			if vtype==nil and g_savedata["vehicles"][tonumber(value)]~=nil or vtype==nil and is_success then
				vtype="vehicle"
			
			end
			if vtype==nil then
				debug("unable to find what the value was")
			else
				debug("[what] value was "..tostring(vtype))	
			end

			if vtype~=nil then return vtype end
			i=i+1
		end
	end
	return nil
end


function who(value, type, type2, check, debug)
	svalue=nil
	if value==-1 then return false end
	--add debugs
	--change all tables from number to string
	if type2=="p" and g_savedata["find-user_id"][tonumber(value)]~=nil or 
	type2==nil and g_savedata["find-user_id"][tonumber(value)]~=nil then 
		svalue=g_savedata["find-user_id"][tonumber(value)]["steam_id"] 
	elseif type2=="o" and g_savedata["find-object_id"][tonumber(value)]~=nil then 
		svalue=g_savedata["find-object_id"][tonumber(value)]["steam_id"] 
	elseif type2=="n" and g_savedata["find-name"][tostring(value)]~=nil then
		svalue=g_savedata["find-name"][tostring(value)]["steam_id"] 
	elseif type2=="s" and g_savedata["playerdata"][tostring(value)]~=nil then
		svalue=tostring(value)
	elseif type2=="v" and g_savedata["vehicles"][tonumber(value)]~=nil then -- returns the value from the owner of the vehicle
		svalue=tostring(g_savedata["vehicles"][tonumber(value)]["steam_id"])
	else
		if not check then
			server.announce("[who function]", "unable to find target")
			if debug then
				debug("value: "..tostring(value).."\ntype: "..tostring(type).."\ntype2: "..tostring(type2)..
				"\ncheck: "..tostring(check).."\nsvalue: "..tostring(svalue))
			end
			return -1
		end
	end

	if svalue~=nil then
		if type==0 or type==nil then
			return svalue
		elseif type==1 then
			return g_savedata["playerdata"][svalue]["name"]
		elseif type==2 then
			return g_savedata["playerdata"][svalue]["user_id"]
		elseif type==3 then
			return scanpl("admin",svalue)
		elseif type==4 then
			return scanpl("auth",svalue)
		elseif type==5 then
			return g_savedata["playerdata"][svalue]["object_id"]
		elseif type==6 then
			return g_savedata["playerdata"][svalue]["active"]
		elseif type==7 then
			return g_savedata["playerdata"][svalue]["ban"]
		else
			server.announce("[who function]", "specified return value does not exist")
			return -1
		end
	else
		if not check then
			server.announce("[who function]", "user file might be nill (change me into a log file)")
		end
		return -1
	end
end


