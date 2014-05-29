module AIFighter
  class AIFighter < SpaceshipFighter
    include RectangularCollision
    def update(objects)
      @objects = objects.dup
      dodge_projectile
      # Check if must dodge closest missile
      # Line -nearly- up with target
      # Fire at target

      # If AI got property dodge_projectiles => true
      # Dodge projectiles every 0.6 seconds

      # Remove non-projectiles
      # Remove non-threathening projectiles
      # Get closest threathening projectile
      # Dodge it
    end
    
    def target(entity)
      @target = entity
    end

    def dodge_projectile
      projectiles = clean_from_class(@objects, Projectile, true)
      threathening_projectiles = threathening(projectiles)
      closest_projectile = closest_entity(threatening_projectiles)
      dodge(closest_projectile) if closest_projectile != nil     
    end

    def dodge(entity)
      accelerate_left if entity.x > self.x
      accelerate_right if entity.x < self.x
    end

    def might_collide?(entity)
      entity = entity.dup
      entity.y = self.y
      rectangular_collision?(self, object)
    end

    def threatening(objects)
      threathening_projectiles = []
      objects.each do |object|
        threathening_projectiles << object if might_collide?(object)
      end

      threathening_projectiles
    end

    def clean_from_class(objects, class_type, opposite = false)
      objects = objects.dup
      objects.drop_while {|object| object.class == class_type} if opposite == false
      objects.drop_while {|object| object.class != class_type} if opposite == true
      return objects
    end

    def closest_entity(objects)
      objects.min {|a, b| (a.x - self.x).abs + (a.y - self.y).abs <=> (b.x - self.x).abs + (b.y - self.y)}
    end
  end
end