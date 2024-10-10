function clamp(Input,Min,Max)
	Output = Input
	if Output < Min then
		Output = Min
	end
	if Output > Max then
		Output = Max
	end
	return Output
end