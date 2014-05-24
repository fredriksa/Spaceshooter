class SpaceshipFighter < FloatingEntity
  def initialize(images, projectile_image, x, y, hp, speed, speed_damper = 1)
    super images, x, y, hp, speed, speed_damper
    @projectile_image = projectile_image
    @projectiles = []
    @damage = 25
  end

  def fire
    @projectiles << Projectile.new(projectile_image, @x, @y, 10, 2.5, 1)
  end
end