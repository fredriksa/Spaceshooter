class FloatingEntity < Entity
  def move
    if @x + @velocity_x < GameWindow::WIDTH and @x + @velocity_x > 0
      @x += @velocity_x
      @x %= GameWindow::WIDTH
      @velocity_x *= 0.95
    end

    if @y + @velocity_y < GameWindow::HEIGHT and @y + @velocity_y > 0
      @y += @velocity_y
      @y %= GameWindow::HEIGHT
      @velocity_y *= 0.95
    end
  end

  def update
    super
    move
  end
end