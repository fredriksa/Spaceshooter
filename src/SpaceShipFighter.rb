class SpaceshipFighter < FloatingEntity
  def initialize(images, projectile_image, x, y, hp, speed, speed_damper = 1)
    super images, x, y, hp, speed, speed_damper
    @projectile_image = projectile_image
    @projectiles = []
    @damage = 25
  end

  def draw
    super
    @projectiles.each do |projectile|
      projectile.draw
    end
  end

  def update
    super
    @projectiles.each_with_index do |projectile, index|
      @projectiles.delete_at(index) if !projectile.alive?
      projectile.update if projectile.alive?
    end
  end

  def fire
    @projectiles << Projectile.new(@projectile_image, @x, @y, 10, 2.5, -10)
  end
end