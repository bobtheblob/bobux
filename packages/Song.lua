local Module = {}
Module.Name = "Song"
Module.ClassName = "Song"
getfenv().SongVars = getfenv().SongVars or {
	msid = 0,
	pit = 1,
	vol = 1,
	snd = nil,
	sndc = nil,
	timepos = 0
}
Module.vars = getfenv().SongVars
Module.respawnfuncs = {function(self)
	wait(1/60)
	if self.vars.parent == 'player' then
		self.vars.snd.Parent = owner.Character.PrimaryPart
	else
		self.vars.snd.Parent = main.handle
	end
end}
Module.removingfuncs = {function(self)
	pcall(function()
		getfenv().SongVars.snd:Destroy()
	end)
	getfenv().SongVars.snd = nil
	pcall(function()
		getfenv().SongVars.sndc:Destroy()
	end)
	getfenv().SongVars.sndc = nil
end}
Module.initfuncs = {function(self)
	getfenv().SongVars.snd = getfenv().SongVars.snd or Instance.new("Sound")
	getfenv().SongVars.snd.Parent = main.handle
	getfenv().SongVars.snd.TimePosition = getfenv().SongVars.timepos
	local c = getfenv().SongVars.snd:Clone()
	getfenv().SongVars.sndc = c
	getfenv().SongVars.sndc.TimePosition = getfenv().SongVars.timepos
	c.Parent = startermain.handle
	self.vars = getfenv().SongVars
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
		self.vars.snd.SoundId = self.vars.msid
		self.vars.snd.Pitch = self.vars.pit
		self.vars.snd.Volume = self.vars.vol
		self.vars.snd.Playing = self.vars.snd:IsDescendantOf(workspace)
		if self.vars.parent == 'player' then
			self.vars.snd.Parent = owner.Character.PrimaryPart
		else
			self.vars.snd.Parent = main.handle
		end
		self.vars.snd.Looped = true
		self.vars.sndc = self.vars.snd.TimePosition
		self.vars.timepos = self.vars.snd.TimePosition
	end
end}
Module.parent2char = function(self,args)
	getfenv().SongVars.parent = 'player'
	self.vars.snd.Parent = getfenv().whoplayer.Character.PrimaryPart
end
Module.parent2tool = function(self,args)
	getfenv().SongVars.parent = 'tool'
	self.vars.snd.Parent = getfenv().whoplayer.Character.PrimaryPart
end
Module.reinit = function(self,args)
	for i,v in pairs(self.removingfuncs) do
		v(self)
	end
	for i,v in pairs(self.initfuncs) do
		v(self)
	end
end
Module.play = function(self,args)
	getfenv().SongVars.msid = args[1]
	spawn(function()
		local s,f = pcall(function()
			local market = game:GetService("MarketplaceService"):GetProductInfo(self.vars.msid)
			if market then
				print('Now playing '..market.Name)
			else
				print('Now playing '..self.vars.msid)
			end
		end)
		if f then
			print('Now playing '..self.vars.msid)
		end
	end)
end
Module.vol = function(self,args)
	getfenv().SongVars.vol = tonumber(args[1])
end
Module.pit = function(self,args)
	getfenv().SongVars.pit = tonumber(args[1])
end
return Module
