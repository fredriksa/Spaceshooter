module GUI
  class Text
    def initialize(text, font, x, y)
      @text = text
      @font = font
      @x, @y = x, y
    end
    def draw
      @font.draw(@text, @x, @y, ZOrder::GUI_Text)
    end

    def width

    end
  end
end