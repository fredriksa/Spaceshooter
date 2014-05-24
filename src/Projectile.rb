class Projectile < FloatingEntity
  def update
    super

    move_y
  end
end