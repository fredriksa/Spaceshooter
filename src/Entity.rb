class Entity
  attr_accessor :velocity_x, :velocity_y, :image_index

  def initialize(images, x, y, hp, speed)
    @images = images
    @image_index = 0
    @x, @y = x, y
    @hp = hp
    @speed = speed
    @velocity_x, @velocity_y = 0, 0
    @alive = true
  end

  def draw
    @images[@image_index].draw(@x, @y, ZOrder::Entity_Default)
  end
  
  def alive?
    @alive
  end

  def die
    @alive = false
  end
end