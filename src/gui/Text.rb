module GUI
  class Text
    attr_accessor :x, :y, :text, :height, :width
    def initialize(text, font, x, y)
      @text = text
      @font = font
      @x, @y = x, y

    end

    def draw
      @font.draw(@text, @x, @y, ZOrder::GUI_Text)
    end

    def update
    end

    def width
      @font.text_width(@text)
    end
  end
end