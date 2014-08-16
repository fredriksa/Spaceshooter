class Projectile < FloatingEntity
  attr_accessor :type
  def initialize(image, x, y, speed, velocity_y, type, speed_damper = 1)
    super image, x, y, speed, speed_damper
    @velocity_y = velocity_y
    @type = type
  end

  def update
    super
    move_y
    die if self.out_of_screen?
  end
end