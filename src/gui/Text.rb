module GUI
  class Text
    attr_accessor :x, :y, :text
    attr_reader :width, :height
    
    def initialize(text, font, x, y)
      @text = text
      @font = font
      @x, @y = x, y
      @height, @width = @font.height, @font.text_width(text)
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