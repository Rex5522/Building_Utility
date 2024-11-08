--- toggles tp block
-- @param data
-- @return nil
function CMD_TPBlock(data)
    local user = data.user
    user.teleportBlocking = not user.teleportBlocking
    user:display("TPBlock "..booleanTranslator(user.teleportBlocking, 1))
end