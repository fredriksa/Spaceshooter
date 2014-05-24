class SpaceshipFighter < FloatingEntity
  def initializedef(images, x, y, hp, speed, speed_damper = 1)
    super images, x, y, hp, speed, speed_damper
    @projectiles = []
    @damage = 25
  end

  def fire
    
  end
end