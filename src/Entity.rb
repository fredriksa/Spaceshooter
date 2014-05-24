class Entity
  attr_accessor :velocity_x, :velocity_y

  def initialize(image, x, y, hp, speed)
    @image = image
    @x, @y = x, y
    @hp = hp
    @speed = speed
    @velocity_x, @velocity_y = 0, 0
    @alive = true
  end

  def draw
    @image.draw(@x, @y, ZOrder::Entity_Default)
  end
  
  def alive?
    @alive
  end

  def die
    @alive = false
  end
end