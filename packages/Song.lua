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
Module.initfuncs = {function(self)
	self.vars.snd.Parent = main.handle
	print(self.vars.snd.Parent)
end}
Module.loopfuncs = {function(self)
	if self.vars.snd then
		self.vars.snd.SoundId = "rbxassetid://"..self.vars.msid
		self.vars.snd.Pitch = self.vars.pit
		self.vars.snd.Volume = self.vars.vol
		self.vars.snd.Playing = main.handle:IsDescendantOf(workspace)
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
