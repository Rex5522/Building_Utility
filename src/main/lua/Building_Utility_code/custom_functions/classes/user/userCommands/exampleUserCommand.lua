-- example command. this is not a user command like ?? or ?autoauth. this is a user command which is used to modify or preform actions on, or about the user
-- if you want to make a chat command look at commands.admin.exampleChatCommand.lua

-- self is the user so its the same as user.banned or user:exampleUserCommand(). var2 would be used like this user:exampleUserCommand(var2). self is already passed to due the :
-- when making a user command dont forget "userCommands:yourCommandName()" else user:yourCommandName() will not work

--- example userObject command
-- @param var2 any,
-- @return 
function userCommands:exampleUserCommand(self, var2) -- always name this in camel case and same as the file its in

    -- can change values by using . instead of :
    self.ID = self.ID

    -- call user commands using : which would be the same as if you did user:exampleUserCommand(user, var2) but dont do it like that
    self:display("look at the command in the userCommands to figure out how it works", true)

    -- bad
    self.display(self, "it works yes but dont do this. theres :'s for a reason", false)

    local commandSuccess = false -- always use local. remember if you create a local value in a if statement it will be tied to that if statement. meaning it will not exist outside of it
    if commandSuccess then
        BU_Debug("logging this to the logger") -- BU_Debug returns its output if you want to use it for something
        return "command failed cause it wanted to >:( (index 2 is not a log index its for any data you want which well can include logs but just use BU_Debug )" -- command failed
    end

    -- any other data
    local anyOtherData = ""

    -- remember non-nil tables when put into an if statement return true
    -- command success. 
    return anyOtherData
end