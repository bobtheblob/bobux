local Module = {}
-- fc
Module.Name = "Song"
Module.ClassName = "Song"
Module.vars = {
	msid = 0,
	pit = 1,
	vol = 1,
	snd = Instance.new("Sound")
}
Module.respawnfuncs = {function(self)
	self.vars.snd = main.handle:FindFirstChild("Sound")
end}
Module.removingfuncs = {function(self)
	self.vars.snd:Destroy()
	pcall(function()
		startermain.handle:FindFirstChild("Sound"):Destroy()
	end)
end}
Module.initfuncs = {function(self)
	self.vars.snd.Parent = main.handle
	self.vars.snd:Clone().Parent = startermain.handle
end}
Module.loopfuncs = {function(self)
	if self.vars.snd then
		self.vars.snd.SoundId = "rbxassetid://"..self.vars.msid
		self.vars.snd.Pitch = self.vars.pit
		self.vars.snd.Volume = self.vars.vol
		self.vars.snd.Playing = main.handle:IsDescendantOf(workspace)
		self.vars.snd.Looped = true
	end
end}
Module.play = function(self,args)
	self.vars.msid = tonumber(args[1])
	
end
Module.vol = function(self,args)
	self.vars.vol = tonumber(args[1])
end
Module.pit = function(self,args)
	self.vars.pit = tonumber(args[1])
end
return Module
local Module = {}
Module.Name = "Song"
Module.ClassName = "Song"
Module.vars = {
	msid = 0,
	pit = 1,
	vol = 1,
	snd = Instance.new("Sound")
}
Module.respawnfuncs = {function(self)
	self.vars.snd = main.handle:FindFirstChild("Sound")
end}
Module.removingfuncs = {function(self)
	self.vars.snd:Destroy()
	pcall(function()
		startermain.handle:FindFirstChild("Sound"):Destroy()
	end)
end}
Module.initfuncs = {function(self)
	self.vars.snd.Parent = main.handle
	self.vars.snd:Clone().Parent = startermain.handle
end}
Module.loopfuncs = {function(self)
	if self.vars.snd then
		self.vars.snd.SoundId = "rbxassetid://"..self.vars.msid
		self.vars.snd.Pitch = self.vars.pit
		self.vars.snd.Volume = self.vars.vol
		self.vars.snd.Playing = main.handle:IsDescendantOf(workspace)
		self.vars.snd.Looped = true
	end
end}
Module.play = function(self,args)
	self.vars.msid = tonumber(args[1])
	spawn(function()
		pcall(function()
			local market = game:GetService("MarketplaceService"):GetProductInfo(self.vars.msid)
			if market then
				print('Now playing '..market.Name)
			end
		end)
	end)
end
Module.vol = function(self,args)
	self.vars.vol = tonumber(args[1])
end
Module.pit = function(self,args)
	self.vars.pit = tonumber(args[1])
end
return Module
