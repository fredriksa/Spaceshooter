module GUI
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
      @items.each do |item|
        item.update
      end
    end

    def set_font(font)
      @font = font
    end

    def add_text(text, x, y)
      raise ArgumentError, 'Font has not been set!' if @font == nil
      @items << Text.new(text, @font, x, y)
    end

    def add_icon(image, x, y)
      @items << Icon.new(image, x, y)
    end
  end
end