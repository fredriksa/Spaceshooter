class SpaceshipFighter < FloatingEntity
  attr_accessor :projectiles
  
  def initialize(images, projectile_image, x, y, width, height, hp, speed, type, speed_damper = 1)
    super images, x, y, hp, speed, speed_damper
    @width, @height = width, height
    @projectile_image = projectile_image
    @type = type
    @projectiles = []
    @damage = 25
  end

  def draw
    super
    @projectiles.each do |projectile|
      projectile.draw if projectile.alive?
    end
  end

  def update
    super
    @projectiles.each_with_index do |projectile, index|
      @projectiles.delete_at(index) if !projectile.alive?
    end

    if @velocity_x < -2
      @image_index = 1
    elsif @velocity_x > 2
      @image_index = 2
    else
      @image_index = 0
    end
  end

  def fire
    @projectiles << Projectile.new(@projectile_image, @x + @width/2 - 2, @y, 10, 2.5, -5, @type)
  end
end