--- toggles autoseat for thge user
-- @param data
-- @return nil
function CMDautoSeat(data)
    local user = data.user
    user.autoSeat = not user.autoSeat
    user:display("AutoSeat "..booleanTranslator(user.autoSeat, 1), true)
end