class GUI
  def initialize(visible = true)
    @visible = visible
    @items = []
  end

  def draw
    if @visible and @items.size > 0

    end
  end

  def update
  end

  def add_item(image, x, y)
    @items << GUIItem.new(image, x, y)
  end
end