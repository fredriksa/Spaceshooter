module GUI
  class Icon
    attr_reader :width, :height
    def initialize(image, x, y)
      @image = image
      @x, @y = x, y
      @width, @height = image.width, image.height
    end

    def draw
      @image.draw(@x, @y, ZOrder::GUI_Icon)
    end

    def update 
    end
  end
end