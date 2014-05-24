class Projectile < FloatingEntity
  def update
    super
    die if self.out_of_screen?
    move_y
  end
end