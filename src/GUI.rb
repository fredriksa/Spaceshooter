class GUI
  def initialize(visible = true)
    @visible = visible
    @items = []
  end

  def draw
  end

  def update
  end

  def add_item(image, x, y)
    @items << GUIItem.new(image, x, y)
  end
end