class Loot < FloatingEntity
  attr_accessor :type, :width, :height
  def initialize(type, image, x, y, hp, velocity_y, speed)
    super image, x, y, hp, speed
    @type = type
    @velocity_y = velocity_y
    
    if @type == "health"
      @width, @height = 10, 10
      @health = 50
    elsif @type == "Ammo"
      @width, @height = 16, 16
      @ammo = 25
    end
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
    die if @y > GameWindow::HEIGHT
    move_y
  end

  def on_collide
    die
  end
end