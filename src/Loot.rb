class Loot < FloatingEntity
  def initialize(type, rm, x, y, hp, velocity_y, speed)
    image = rm.get("loot.png")
    super image, x, y, hp, speed
    @velocity_y = velocity_y
  end
end