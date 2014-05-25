class GUIItem
  def initialize(image, x, y, width, height)
    @image = image
    @x, @y = x, y
    @width, @height = image.height, image.width
  end

  def draw
    @image.draw(@x, @y, ZOrder::GUI_Item)
  end

  def update

  end
end