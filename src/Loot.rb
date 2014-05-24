class Loot < FloatingEntity
  attr_accessor :type
  def initialize(type, image, x, y, hp, velocity_y, speed)
    super image, x, y, hp, speed
    @type = type
    @velocity_y = velocity_y

    @health = 50 if @type == "Health"
    @ammo = 25 if @type == "Ammo"
  end

  def get_health
    health, @health = @health, 0
    return health
  end

  def get_ammo
    ammo, @ammo = @ammo, 0
    return ammo
  end

  def update
    super
    die if self.out_of_screen?
    move_y
  end
end