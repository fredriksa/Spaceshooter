class Projectile < FloatingEntity
  def initialize(images, x, y, hp, speed, velocity_x, velocity_y, speed_damper = 1)
    super images, x, y, hp, speed, speed_damper
    @veloicty_x, @velocity_y = velocity_x, velocity_y
  end

  def update
    super
    die if self.out_of_screen?
    move_y
  end
end