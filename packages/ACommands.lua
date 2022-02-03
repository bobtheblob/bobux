local Module = {}
Module.Name = "AdminCommands"
Module.ClassName = "AdminCommands"
Module.initfuncs = {function(self)
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
Module.explode = function(self,args)
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
Module.respawn = function(self,args)
	for i,v in pairs(args) do
		local split = v:split(',')
		for i_,v_ in pairs(split) do
			local plr = findplayer(v_)
			if plr then
				plr:LoadCharacter()
			end
		end
	end
end
Module.kill = function(self,args)
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
