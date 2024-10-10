--- calls hte display function from a user command
-- @param text string, the text to display
-- @param notificationType int/bool, the type of the notification
-- @return nil
function userCommands:display(self, text, notificationType, announce)
    display(text, self.ID, notificationType, announce)
end