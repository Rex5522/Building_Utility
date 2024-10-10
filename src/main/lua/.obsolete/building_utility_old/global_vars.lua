-- MIT License
-- 
-- Copyright (c) 2024 Rex
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

g_limit=1000000000
tick=0
past=false
sname="Building_Utility"
error="\ncommand-error"
cmdf="\ncommand-format"
dc="\ndev-command"
cs="\ncommand-success"
sp="\n"
g_updated=sname.." has updated since the last time you've used the ?!RESET! command. if you encounter an issue try using the ?!RESET! command then the ?reload_scripts command. keep in mind though ?!RESET! will delete all vehicles that have been spawned by players. if that dosin't fix your issue then please report the error to the "..sname.." page on the steam workshop, if you have social anxiety, dont worry. i have that to (:"
if true then
    version="Building_Utilty-dev_build-0.99.955"
    debugsv=true
else
    version="Building_Utilty-public_build-0.99.953"
    debugsv=false
end
seconds=0
reset=false
prevpos=nrix
mult=0.7
test12={}
test23={}
DementiaPositions = {}
DementiaIndex = 0
followv=0
temp_values = {}