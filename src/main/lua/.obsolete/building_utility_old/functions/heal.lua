function heal(user_id)
    object_id=who(user_id, 5)
    server.reviveCharacter(object_id)
    server.setCharacterData(object_id, 100, true, false)
end