-- function createTimeStamp()
--     local ms = server.getTimeMillisec()


--     local seconds = ms / 1000
--     ms = math.floor(ms % 1000)
    
--     local min = seconds / 60
--     seconds = math.floor(seconds % 60)

--     local hours = min / 60
--     min = math.floor(min % 60)

--     local formated = string.format(
--         "[%d][%d][%d}:%d :",
--         hours, min, seconds, ms
--     )

--     return formated
    
-- end