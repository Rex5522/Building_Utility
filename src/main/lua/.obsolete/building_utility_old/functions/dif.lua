function dif(a,b,c)

	local x,y,z = matrix.position(a)
	local x1,y1,z1 = matrix.position(b)
	return matrix.multiply(matrix.invert(matrix.translation(x-x1,y-y1,z-z1)),c)
	
end