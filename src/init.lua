local RaineParticle = { }
RaineParticle.__index = RaineParticle

function RaineParticle.new()
  local self = { }
  self.__dead = false

  return setmetatable(self, RaineParticle)
end

function RaineParticle:Destroy()
  if not self.__dead then
    error("Particle is already dead!")
    return
  end
  
  self.__dead = true
end

return RaineParticle
