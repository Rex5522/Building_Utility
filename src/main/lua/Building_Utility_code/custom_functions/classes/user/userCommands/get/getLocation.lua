--- gets the players position directional or not, direction works just not with movevehicle function, only works with setvehiclepos
-- @param forwardOffset int, the forward offset of the return matrix
-- @param verticalOffset itn, the vertical offset
-- @param directional bool, whether the return will be a normal matrix or a rotational matrix
-- @return directional matrix, normal matrix or nil
function userCommands:getLocation(self, forwardOffset, verticalOffset, directional)

	forwardOffset = forwardOffset or 0
	verticalOffset = verticalOffset or 0

	playerPos, success = server.getPlayerPos(self.ID)

	
	if not success then
		BU_Debug("failed to get player pos: "..self.ID)
		return nil
	end

	local modifedPlayerPos = nil
	local directionalPosFinal = nil

	local playerPosX, playerPosY, playerPosZ = matrix.position(playerPos)
	local lookX, lookY, lookZ, is_success = server.getPlayerLookDirection(self.ID)
	
	local playerRotation = matrix.rotationToFaceXZ(lookX, lookZ)
	
	lookX=lookX*forwardOffset
	lookY=lookY*forwardOffset
	lookZ=lookZ*forwardOffset

	-- this is needed
	playerPosX=playerPosX+lookX
	playerPosY=playerPosY+lookY
	playerPosZ=playerPosZ+lookZ
	
	playerPosY=playerPosY+verticalOffset

	modifedPlayerPos = matrix.translation(playerPosX,playerPosY,playerPosZ)
	directionalPosFinal = matrix.multiply(modifedPlayerPos, playerRotation) -- used to set direction


	return directionalPosFinal
end