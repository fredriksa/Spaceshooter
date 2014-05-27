class GUI
  def initialize(visible = true)
    @visible = visible
    @items = []
  end

  def draw
    if @visible and @items.size > 0
      @items.each do |item|
        item.draw
      end
    end
  end

  def update
  end

  def add_item(image, x, y)
  end
end