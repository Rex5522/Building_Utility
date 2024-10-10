-- for index,inner in pairs(g_savedata["adminpanel"]) do
--     steam_id24=tostring(index)


--     if steam_id24~=nil then
--         sv=g_savedata["server"]
--         addata=g_savedata["adminpanel"][steam_id24]
--         user_id24=addata["id"]
--         inputinfo=addata["inputinfo"]
--         errorinfo=addata["errorinfo"]
--         prevmode=addata["prevmode"]
--         info1=addata["info1"]
--         mode=addata["mode"]
--         input=addata["input"]
--         lastinput=addata["lastinput"]
--         if addata["invincibility"] then heal(user_id24) end
        
        
--         if addata["active"] then
--             if mode=="none" then
                
--                 server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
--                 "[1]=players\n[2]=vehicles\n[3]=options\n[4]=file scanner", 0.8, 0.8)
                
--                 if input==1 then mode="players"
--                 elseif input==2 then mode="vehicles"
--                 elseif input==3 then mode="options"
--                 elseif input==4 then mode="file manager"
--                 end
                
--                 if mode~="none" then prevmode="none" end
--             elseif mode=="players" then
--                 num=1
--                 text24=""
--                 for index,inner in pairs(g_savedata["active"]) do 
--                     steam_id2=tostring(index)
                    
--                     text24=text24.."["..num.."] "..who(steam_id2,1,"s").."\n"
--                     if prevmode=="options" and num==input then mode="playerop" info1=steam_id2 break
--                     elseif num==input then mode="player" info1=steam_id2 break
--                     elseif input==-1 then mode="none" end
--                     num=num+1
--                 end
--                 server.setPopupScreen(user_id24, user_id24, "admin penel", true, text24, 0.8, 0.8)
--                 if mode~="players" then prevmode="players" end
--             elseif mode=="player" then
            
--                 server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
--                 "name:\n"..who(info1,1,"s").."\nsteam_id:\n"..info1.."\nuser_id:\n"..user_id24.."\n", 0.8, 0.8)
--                 if input==-1 then mode="players" end
--                 if mode~="player" then prevmode="player" end
--             elseif mode=="vehicles" then
            
--                 server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
--                 "[1]=[2]=[3]=[4]=[5]=[6]=", 0.8, 0.8)
--                 if input==-1 then mode="none" end
--                 if mode~="vehicles" then prevmode="vehicles" end
--             elseif mode=="options" then
            
--                 server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
--                 "[1]:server\n[2]:player\n[3]:panel\n[4]:\n[5]:\n[6]:", 0.8, 0.8)
--                 if input==1 then mode="serverop"
--                 elseif input==2 then mode="players"
--                 elseif input==3 then mode="panelop"
                
--                 elseif input==-1 then mode="none" end
--                 if mode~="options" then prevmode="options" end
--             elseif mode=="serverop" then
--                 server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
--                 "[1]:regen(min): "..string.format("%.0f",(tostring(100/(sv["regen"]*60)))).." "..errorinfo.."\n"..
--                 "[2]:global vehicle limit: "..tostring(sv["vehicle limit"]).."\n"..
--                 "[3]:auto protect: "..tostring(sv["autoprotect"]).."\n"..
--                 "[4]:\n"..
--                 "[5]:\n"..
--                 "[6]:\n", 0.8, 0.8)
                
--                 if input==1 then
--                     if tonumber(inputinfo)~=nil then
--                         sv["regen"]=100/(tonumber(inputinfo)*60)
--                     else
--                         errorinfo="invalid input"
--                         delay("removeerrinfo",steam_id24,nil,nil,120)
--                     end
--                 end
                
                
                
                
--                 if input==-1 then mode="none" end
--                 if mode~="serverop" then prevmode="serverop" end
--             elseif mode=="playerop" then
                
--                 urdata=g_savedata["playerdata"][info1]
                
--                 if string.len(errorinfo)>2 and lastinput==1 then vlim=errorinfo
--                 elseif urdata["vlim"]==-1 then vlim="server default"
--                 else
--                     vlim=string.format("%.0f", tostring(urdata["vlim"]))
--                 end
                
--                 server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
--                 who(info1,1,"s").."\n\n[1] vlim: "..vlim, 0.8, 0.8)
                
                
--                 if input==1 then
--                     if tonumber(inputinfo)~=nil and tonumber(inputinfo)>=-1 then
--                         urdata["vlim"]=tonumber(inputinfo)
--                     else
--                         errorinfo="invalid input"
--                         delay("removeerrinfo",steam_id24,nil,nil,120)
--                     end
--                 end
                
                
--                 if input==-1 then mode="none" end
--                 if mode~="playerop" then prevmode="playerop" end
                
--             elseif mode=="panelop" then
            
--                 server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
--                 "[1]=[2]=[3]=[4]=[5]=[6]=", 0.8, 0.8)
--                 if input==-1 then mode="none" end
--                 if mode~="panelop" then prevmode="panelop" end
--             elseif mode=="file manager" then
            
--                 server.setPopupScreen(user_id24, user_id24, "admin penel", true, 
--                 "[1]=[2]=[3]=[4]=[5]=[6]=", 0.8, 0.8)
--                 if input==-1 then mode="none" end
--                 if mode~="file manager" then prevmode="file manager" end			
--             end
--                 if input~="none" then addata["lastinput"]=input end
--                 addata["errorinfo"]=errorinfo
--                 addata["info1"]=info1
--                 addata["mode"]=mode
--                 addata["input"]="none"
--                 addata["prevmode"]=prevmode
--         else
--             server.removePopup(user_id24, user_id24)
--         end
--     else
        
--     end
--     if not who(steam_id24,3,"s") then g_savedata["adminpanel"][steam_id24]=nil server.removePopup(user_id24, user_id24) end
-- end