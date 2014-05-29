module AIFighter
  class AIFighter < SpaceshipFighter
    include RectangularCollision
    def initialize(images, projectile_image, x, y, speed, type, dodge_projectiles = true, speed_damper = 1)
      super images, projectile_image, x, y, speed, type, speed_damper
      @property = {"dodge_projectiles" => dodge_projectiles}
      @static_timer = {"dodge_projectiles" => 30}
      @timer = @static_timer.dup
    end

    def update(objects)
      @objects = objects
      dodge_projectile if @property["dodge_projectiles"]
    end
    
    def target(entity)
      @target = entity
    end

    def dodge_projectile
      if @timer["dodge_projectiles"] > @static_timer["dodge_projectiles"]
        projectiles = clean_from_class(@objects, Projectile, true)
        threatening_projectiles = threatening(projectiles)
        closest_projectile = closest_entity(threatening_projectiles)
        
        if closest_projectile != nil
          dodge(closest_projectile)
          @timer["dodge_projectiles"] = 0
        end
      else
        @timer["dodge_projectiles"] += 1
      end     
    end

    def dodge(entity)
      puts "dodged"
      accelerate_left if entity.x > self.x
      accelerate_right if entity.x < self.x
    end

    def might_collide?(entity)
      entity = entity.dup
      entity.y = self.y
      puts entity.class
      print "X: #{self.x} Y: #{self.y}, EX: #{entity.x} EY: #{entity.y}"
      print "WIDTH: #{self.width} HEIGHT: #{self.height}, EWIDTH: #{entity.width} EHEIGHT: #{entity.height}"
      rectangular_collision?(self, entity)
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
      return objects.drop_while {|object| object.class == class_type} if opposite == false
      return objects.drop_while {|object| object.class != class_type} if opposite == true
    end

    def closest_entity(objects)
      objects.min {|a, b| (a.x - self.x).abs + (a.y - self.y).abs <=> (b.x - self.x).abs + (b.y - self.y)}
    end
  end
end