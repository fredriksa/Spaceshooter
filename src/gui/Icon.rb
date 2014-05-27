module GUI
  class Icon
    def draw
      @image.draw(@x, @y, ZOrder::GUI_Icon)
    end
  end
end