class Loot < FloatingEntity
  attr_accessor :type, :loot_health, :loot_ammo
  def initialize(type, image, x, y, velocity_y, speed)
    super image, x, y, speed
    @type = type
    @velocity_y = velocity_y
    @solid = true
    
    if @type == "Health"
      @loot_health = 10
    elsif @type == "Ammo"
      @loot_ammo = 5
    end
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