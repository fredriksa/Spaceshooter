module GUI
  class Icon < Entity
    def draw
      @image.draw(@x, @y, ZOrder::GUI_Icon)
    end
  end
end