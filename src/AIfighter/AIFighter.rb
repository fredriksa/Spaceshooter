module AIFighter
  class AIFighter < SpaceshipFighter
    def update(objects)
      @objects = objects.dup
      clean_from_class(@objects, Projectile)
      if (closest_projectile.x - player.x).abs < self.width
        accelerate_left if closest_projectile.x > self.x
        accelerate_right if closest_projectile.x < self.x
      end
      # Check if must dodge closest missile
      # Line -nearly- up with target
      # Fire at target
    end

    def target(target)
      @target = target
    end

    def clean_from_class(objects, class_type, opposit = false)
      objects.drop_while {|object| object.class == class_type}
    end

    def closest_object
      @objects.min {|a, b| (a.x - player.x).abs <=> (b.x - player.x).abs}
    end
  end
end