module GUI
  class Text
    def draw
      @image.draw(@x, @y, ZOrder::GUI_Text)
    end
  end
end