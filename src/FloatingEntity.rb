class FloatingEntity < Entity
  attr_accessor :velocity_x, :velocity_y, :max_velocity_x, :max_velocity_y, :min_velocity_x, :min_velocity_x
  
  def initialize(images, x, y, speed, speed_damper = 1)
    super images, x, y

    @velocity_x, @velocity_y = 0, 0
    @max_velocity_x, @min_velocity_x = 0, 0
    @speed = speed
    @speed_damper = speed_damper
  end

  def update
    super
  end

  def move_x
    @x += @velocity_x
    @velocity_x *= @speed_damper
  end

  def move_y
    @y += @velocity_y
    @velocity_y *= @speed_damper
  end

  def accelerate_left
    acc_vel = Gosu::offset_x(90, @speed)
    if @velocity_x - acc_vel > @min_velocity_x
      @velocity_x -= acc_vel
    else 
      @velocity_x = @min_velocity_x
    end
  end

  def accelerate_right
    acc_vel = Gosu::offset_x(90, @speed)
    if @velocity_x + acc_vel < @max_velocity_x
      @velocity_x += acc_vel
    else 
      @velocity_x = @max_velocity_x
    end
  end

  def out_of_screen?
    if @x > GameWindow::WIDTH || @x < 0 || @y > GameWindow::HEIGHT || @y < 0
      return true
    end

    return false
  end
end