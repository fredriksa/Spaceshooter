class Entity
  attr_accessor :velocity_x, :velocity_y

  def initialize(image, x, y, hp)
    @image = image
    @x, @y = x, y
    @hp = hp
    @velocity_x, velocity_y = 0, 0
    @alive = true
  end
  
  def alive?
    @alive
  end

  def die
    @alive = false
  end

  def draw
    @image.draw(@x, @y, ZOrder::Entity_Default)
  end
end