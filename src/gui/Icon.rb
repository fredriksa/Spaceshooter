module GUI
  class Icon
    def initialize(image, x, y)
      @image = image
      @x, @y = x, y
    end

    def draw
      @image.draw(@x, @y, ZOrder::GUI_Icon)
    end

    def update 
    end
  end
end