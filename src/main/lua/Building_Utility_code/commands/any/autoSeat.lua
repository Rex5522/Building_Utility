--- toggles autoseat for thge user
-- @param data
-- @return nil
function autoSeat(data)
    local user = data.user
    user:modify("autoSeat", "!NOT!")
    user:display("AutoSeat "..booleanTranslator(user.autoSeat, 1), true)
end