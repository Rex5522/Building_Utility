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