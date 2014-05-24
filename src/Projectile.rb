class Projectile < FloatingEntity
  def initialize
  end

  def update
    super
    die if self.out_of_screen?
    move_y
  end
end