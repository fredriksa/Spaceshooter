class FloatingEntity < Entity
  def update
    super
  end

  def move_x
    @x += @velocity_x
    @x %= GameWindow::WIDTH
    @velocity_x *= 0.95
  end

  def move_y
    @y += @velocity_y
    @y %= GameWindow::HEIGHT
    @velocity_y *= 0.95
  end

  def accelerate_left
    @velocity_x -= Gosu::offset_x(90, @speed)
  end

  def accelerate_right
    @velocity_x += Gosu::offset_x(90, @speed)
  end
end