class Player < SpaceshipFighter
  WIDTH, HEIGHT = 27, 22
  attr_accessor :KbLeft, :KbRight, :width, :height

  def initialize(images, projectile_image, x, y, hp, speed, speed_damper = 1)
    super images, projectile_image, x, y, hp, speed, "Player", speed_damper
    @KbLeft = false
    @KbRight = false
    @width, @height = WIDTH, HEIGHT
  end

  def update
    super
    
    if @x + @velocity_x + WIDTH < GameWindow::WIDTH and @x + @velocity_x > 0
      move_x
    else
      @velocity_x = 0 
    end
    
    accelerate_left if @KbLeft
    accelerate_right if @KbRight
  end
end