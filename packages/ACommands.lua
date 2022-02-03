local Module = {}
Module.Name = "AdminCommands"
Module.ClassName = "AdminCommands"
--
local subnames = {}
subnames["all"] = function(b)
	local lower = b:lower()
	return  game:GetService("Players"):GetPlayers()
end
subnames["others"] = function(b)
	local lower = b:lower()
	local tbl = game:GetService("Players"):GetPlayers()
	table.remove(tbl,table.find(tbl,owner))
	return tbl
end
--
function findplayer(name)
	if not name then
		return owner
	end
	if subnames[name] then
		return subnames[name](name)
	end
	local players = {}
	local lower = name:lower()
	for i,v in pairs(game:GetService("Players"):GetPlayers()) do
		if v.UserId == tonumber(name) or lower == v.Name:lower():sub(1,#lower) then
			table.insert(players,v)
		end
	end
	return players
end
--
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
