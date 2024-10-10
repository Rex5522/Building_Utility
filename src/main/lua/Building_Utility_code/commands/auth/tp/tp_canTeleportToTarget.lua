function tp_canTeleportToTarget(user, admin, targetUser)
    if not targetUser or user.ID == targetUser.ID or not targetUser.teleportBlocking or admin then
        return true
    else
        return false
    end
end