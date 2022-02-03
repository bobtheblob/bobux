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
function Module.explode(self,args)
	for i,v in pairs(args) do
		local split = v:split(',')
		for i_,v_ in pairs(split) do
			local plr = (findplayer(v_) == game:GetService("Players"):GetPlayers() and {} or findplayer(v_))
			for i,plry in pairs(plr) do
				if plry and plry.Character then
					explosion.Position = plry.Character:GetPivot().Position
					explosion.Parent = workspace
					plry.Character:BreakJoints()
					task.wait(.05)
				end
			end
		end
	end
end
function Module.respawn(self,args)
	for i,v in pairs(args) do
		local split = v:split(',')
		for i_,v_ in pairs(split) do
			local plr = (findplayer(v_) == game:GetService("Players"):GetPlayers() and {} or findplayer(v_))
			for i,plry in pairs(plr) do
				if plry then
					plry:LoadCharacter()
				end
			end
		end
	end
end
function Module.kill(self,args)
	for i,v in pairs(args) do
		local split = v:split(',')
		for i_,v_ in pairs(split) do
			local plr = (findplayer(v_) == game:GetService("Players"):GetPlayers() and {} or findplayer(v_))
			for i,plry in pairs(plr) do
				if plry then
					plry.Character:BreakJoints()
				end
			end
		end
	end
end
return Module
