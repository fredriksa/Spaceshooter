class Entity
  attr_accessor :image_index, :x, :y, :width, :height, :solid

  def initialize(images, x, y)
    @images = images
    @image_index = 0
    @x, @y = x, y
    @alive = true
    @solid = false
    
    images = images.first if images.is_a? Array
    @width, @height = images.height, images.width
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