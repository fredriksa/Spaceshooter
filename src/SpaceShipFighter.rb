class SpaceshipFighter < FloatingEntity
  attr_accessor :projectiles, :ammo
  
  def initialize(images, projectile_image, x, y, speed, type, speed_damper = 1)
    super images, x, y, speed, speed_damper
    @max_velocity_x, @min_velocity_x = 5, -5
    @projectile_image = projectile_image
    @type = type
    @projectiles = []
    @damage = 25
    @ammo = 0
    @solid = true
    
    case type
    when "Player"
      @projectile_y = -6
    when "Hostile"
      @projectile_y = 6
    end
  end

  def draw
    super
    @projectiles.each {|projectile| projectile.draw if projectile.alive?}
  end

  def update
    super
    @projectiles.select!(&:alive?)

    if @velocity_x < -2
      @image_index = 1
    elsif @velocity_x > 2
      @image_index = 2
    else
      @image_index = 0
    end
  end

  def fire
    @projectiles << Projectile.new(@projectile_image, @x + @width/2, @y, 1.5, @projectile_y, @type)
  end
end