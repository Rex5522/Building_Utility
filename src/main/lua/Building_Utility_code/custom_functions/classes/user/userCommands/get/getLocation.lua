--- gets the players position directional or not, direction works just not with movevehicle function, only works with setvehiclepos
-- @param forwardOffset int, the forward offset of the return matrix
-- @param verticalOffset itn, the vertical offset
-- @param directional bool, whether the return will be a normal matrix or a rotational matrix
-- @return directional matrix, normal matrix or nil
function userCommands:getLocation(self, forwardOffset, verticalOffset)

	forwardOffset = forwardOffset or 0
	verticalOffset = verticalOffset or 0

	local playerPos, success = server.getPlayerPos(self.ID)


	if not success then
		return nil
	end

	local lookX, lookY, lookZ, success = server.getPlayerLookDirection(self.ID)
	if not success then
		return nil
	end

	local playerPosX, playerPosY, playerPosZ = matrix.position(playerPos)
	local playerRotation = matrix.rotationToFaceXZ(lookX, lookZ)

	playerPosX = playerPosX + (lookX * forwardOffset)
	playerPosY = playerPosY + (lookY * forwardOffset) + verticalOffset
	playerPosZ = playerPosZ + (lookZ * forwardOffset)

	local modifedPlayerPos = matrix.translation(playerPosX,playerPosY,playerPosZ)
	local directionalPosFinal = matrix.multiply(modifedPlayerPos, playerRotation) -- used to set direction


	return directionalPosFinal
end