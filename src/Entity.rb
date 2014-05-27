class Entity
  attr_accessor :velocity_x, :velocity_y, :image_index, :x, :y, :width, :height

  def initialize(images, x, y)
    @images = images
    @image_index = 0
    @x, @y = x, y
    @alive = true
    
    if images.is_a? Array
      @width, @height = images[0].height, images[0].width
    else
      @width, @height = images.height, images.width
    end
  end

  def draw
    @images[@image_index].draw(@x, @y, ZOrder::Entity_Default) if @images.is_a? Array
    @images.draw(@x, @y, ZOrder::Entity_Default) if @images.is_a? Gosu::Image
  end

  def update
  end
  
  def alive?
    @alive
  end

  def die
    @alive = false
  end

  def on_collide
  end
end