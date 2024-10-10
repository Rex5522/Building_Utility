function gettime()

    local time = server.getTimeMillisec()
    local h = math.floor(time / 3600000)
    local m = math.floor((time % 3600000) / 60000)
    local s = math.floor((time % 60000) / 1000)
    local ms = time % 1000
    local timeString = string.format("[%02d:%02d:%02d.%03d]", h, m, s, ms)

    return timeString
    
end