class Loot < FloatingEntity
  attr_accessor :type
  def initialize(type, image, x, y, hp, velocity_y, speed)
    super image, x, y, hp, speed
    @type = type
    @velocity_y = velocity_y
  end

  def get_health
  end

  def get_ammo
  end
end