local Module = {}
Module.Name = "ACommands"
Module.ClassName = "ACommands"
Module.initfuncs = {function()
	if not getfenv().explosion then
		owner:Explode()
		getfenv().explosion = owner.Character:FindFirstChild("Explosion",true)
		local explosion :Explosion = getfenv().explosion
		explosion.Parent = nil
		explosion:GetPropertyChangedSignal("Parent"):Connect(function()
			task.wait(.05)
			explosion.Parent = nil
		end)
	end
	
	
	
end,}
function Module.explode(args)
	for i,v in pairs(args) do
		local split = v:split(',')
		for i_,v_ in pairs(split) do
			local plr = findplayer(v_)
			if plr and plr.Character then
				explosion.Position = plr.Character:GetPivot().Position
				explosion.Parent = workspace
				plr.Character:BreakJoints()
				task.wait(.05)
			end
		end
	end
end
function Module.kill(args)
	for i,v in pairs(args) do
		local split = v:split(',')
		for i_,v_ in pairs(split) do
			local plr = findplayer(v_)
			if plr and plr.Character then
				plr.Character:BreakJoints()
			end
		end
	end
end
return Module
