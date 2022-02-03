local Module = {}
Module.Name = "Song"
Module.ClassName = "Song"
getfenv().SongVars = getfenv().SongVars or {
	msid = 0,
	pit = 1,
	vol = 1,
	snd = Instance.new("Sound"),
	sndc = nil,
	timepos = 0
}
Module.vars = getfenv().SongVars
Module.respawnfuncs = {function(self)
	getfenv().SongVars.snd = main.handle:FindFirstChild("Sound")
end}
Module.removingfuncs = {function(self)
	getfenv().SongVars.snd:Destroy()
	pcall(function()
		startermain.handle:FindFirstChild("Sound"):Destroy()
	end)
end}
Module.initfuncs = {function(self)
	getfenv().SongVars.snd.Parent = main.handle
	getfenv().SongVars.snd.TimePosition = getfenv().SongVars.timepos
	local c = getfenv().SongVars.snd:Clone()
	getfenv().SongVars.sndc = c
	getfenv().SongVars.sndc.TimePosition = getfenv().SongVars.timepos
	c.Parent = startermain.handle
end}
Module.loopfuncs = {function(self)
	getfenv().SongVars = getfenv().SongVars or {
		msid = 0,
		pit = 1,
		vol = 1,
		snd = Instance.new("Sound"),
		sndc = nil,
		timepos = 0
	}
	self.vars = getfenv().SongVars
	if self.vars.snd then
		self.vars.snd.SoundId = "rbxassetid://"..self.vars.msid
		self.vars.snd.Pitch = self.vars.pit
		self.vars.snd.Volume = self.vars.vol
		self.vars.snd.Playing = main.handle:IsDescendantOf(workspace)
		self.vars.snd.Looped = true
		self.vars.sndc = self.vars.snd.TimePosition
		self.vars.timepos = self.vars.snd.TimePosition
	end
end}
Module.reinit = function(self,args)
	for i,v in pairs(self.initfuncs) do
		v(self)
	end
end
Module.play = function(self,args)
	getfenv().SongVars.msid = tonumber(args[1])
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
	getfenv().SongVars.vol = tonumber(args[1])
end
Module.pit = function(self,args)
	getfenv().SongVars.pit = tonumber(args[1])
end
return Module
