module AIFighter
  class AIFighter < SpaceshipFighter
    include RectangularCollision
    def update(objects)
      @objects = objects.dup
      dodge_projectile
      # Check if must dodge closest missile
      # Line -nearly- up with target
      # Fire at target
    end
    
    def target(target)
      @target = target
    end

    def dodge_projectile
      clean_from_class(@objects, Projectile, true)
      cloest_projectile = closest_object(@objects)     
    end

    def will_collide?(object)

    end

    def clean_from_class(objects, class_type, opposite = false)
      objects = objects.dup
      objects.drop_while {|object| object.class == class_type} if opposite == false
      objects.drop_while {|object| object.class != class_type} if opposite == true
      return objects
    end

    def closest_object(objects)
      objects.min {|a, b| (a.x - self.x).abs <=> (b.x - self.x).abs}
    end
  end
end