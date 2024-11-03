--- toggle autoauth for the server
-- @param data
-- @return nil
function CMDautoAuth(data)
    toggleAutoAuth()
    local autoauth = G_ServerSettings.autoAuth
    data.user:display("autoAuth "..booleanTranslator(autoauth), autoauth)
end