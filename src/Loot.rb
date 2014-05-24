class Loot < FloatingEntity
  def initialize(type, x, y, hp, velocity_y, speed, images = 0)
    super image, x, y, hp, speed
    @@types = {"Ammo" => 0, "Health" => 1}
    @@images = images if @@images.nil?
    @velocity_y = 1
  end
end