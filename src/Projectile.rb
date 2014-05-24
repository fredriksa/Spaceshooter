class Projectile < FloatingEntity
  def initialize(image, x, y, hp, speed, velocity_y, speed_damper = 1)
    super image, x, y, hp, speed, speed_damper
    @velocity_y = velocity_y
  end

  def update
    super
    die if self.out_of_screen?
    move_y
  end
end