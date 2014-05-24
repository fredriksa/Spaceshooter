class Projectile < FloatingEntity
  attr_accessor :type
  def initialize(image, x, y, hp, speed, velocity_y, type, speed_damper = 1)
    super image, x, y, hp, speed, speed_damper
    @velocity_y = velocity_y
    @type = type
  end

  def update
    super
    die if self.out_of_screen?
    move_y
  end
end