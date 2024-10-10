--- enables debug for the user. allowing them to see all debug messages
-- @param data
-- @return nil
function enableDebug(data)
    local user = data.user
    user.debug = not user.debug
    user:display("debugMode "..booleanTranslator(user.debug, 1), 1)
end