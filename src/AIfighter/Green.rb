module AIFighter
  class Green < AIFighter
    def initialize(images, projectile_image, x, y, speed, type, speed_damper = 0.95)
      super images, projectile_image, x, y, speed, type, true, speed_damper
    end
  end
end