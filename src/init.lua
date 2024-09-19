local RunService = game:GetService("RunService")
local Signal = require(script.Signal)

local Lifetime = { }
Lifetime.__index = Lifetime

function Lifetime.new()
	local self = { }
	self.__destroyed = false
	self.Dead = true
	self.Lifespan = 1
	self.Age = 1
	
	self.Revived = Signal.new()
	self.Died = Signal.new()
	
	return setmetatable(self, Lifetime)
end

function Lifetime:Revive()
	self.Age = 0
	self.Dead = false
	
	if self.__RunServiceConnection then
		self.__RunServiceConnection:Disconnect()
	end
	
	self.__RunServiceConnection = RunService.Heartbeat:Connect(function(deltaTime: number)
		self.Age += deltaTime
		if self.Age >= self.Lifespan then
			self.Age = self.Lifespan
			self.Dead = true
			self.Died:Fire()
			self.__RunServiceConnection:Disconnect()
		end
	end)

	self.Revived:Fire()
end

function Lifetime:Kill()
	self.Age = self.Lifespan
	self.Dead = true
	self.Died:Fire()
	if self.__RunServiceConnection then
		self.__RunServiceConnection:Disconnect()
	end
end

function Lifetime:Destroy()
	if self.__destroyed then
		error("Cannot destroy a destroyed Lifetime!")
		return
	end
	
	self.Revived:Destroy()
	self.Died:Destroy()
	if self.__RunServiceConnection then
		self.__RunServiceConnection:Disconnect()
	end
	
	self.__destroyed = true
end

return Lifetime
