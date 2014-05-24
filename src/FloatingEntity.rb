class FloatingEntity
  def move
    if @x + @velocity_x < GameWindow::WIDTH && @x + @velocity_x > 0
      @x += @velocity_x
      @x %= GameWindow::WIDTH
      @velocity_x * 0.95
    end
  end
end