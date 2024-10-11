---toggles codemode
---@param data any
function godMode(data)
    local user = data.user
    user.godMode = not user.godMode
    user:display("godMode "..booleanTranslator(user.godMode, 1), true)
end