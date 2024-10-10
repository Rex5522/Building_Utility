time = server.getTimeMillisec()
ticktime = ((time - (last or 0))/1000)*62 -- time it takes to get to 62 ticks
--debug(ticktime)
last = time