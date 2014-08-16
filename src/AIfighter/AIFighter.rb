module AIFighter
  class AIFighter < SpaceshipFighter
    include RectangularCollision
    def initialize(images, projectile_image, x, y, speed, type, dodge_projectiles = true, speed_damper = 0.95)
      super images, projectile_image, x, y, speed, type, speed_damper
      @property = {"dodge_projectiles" => dodge_projectiles}
      @static_timer = {"dodge_projectiles" => 5, "shoot" => 30}
      @timer = @static_timer.dup
    end

    def update(objects)
      super()
      @objects = objects
      
      accelerate_left if @accelerate_left == true
      accelerate_right if @accelerate_right == true
      move_x if @x + @velocity_x > 0 && @x + @velocity_x + width < GameWindow::WIDTH
      
      #fire if @static_timer["shoot"] >= 30
      dodge_projectile if @property["dodge_projectiles"]
      @timer.each {|key, value| @timer[key] += 1}
    end
    
    def target(entity)
      @target = entity
    end

    def dodge_projectile
      if @timer["dodge_projectiles"] > @static_timer["dodge_projectiles"]
        @accelerate_left = false
        @accelerate_right = false

        projectiles = clean_from_class(@objects, Projectile, true)
        threatening_projectiles = threatening(projectiles)
        closest_projectile = closest_entity(threatening_projectiles)
        if closest_projectile != nil
          dodge(closest_projectile)
          @timer["dodge_projectiles"] = 0
        end
      end     
    end

    def dodge(entity)
      @accelerate_left = true if entity.x + entity.width/2 > self.x + self.width/2
      @accelerate_right = true if entity.x + entity.width/2 < self.x + self.width/2
    end

    def might_collide?(entity)
      entity = entity.dup
      entity.y = self.y
      rectangular_collision?(self, entity)
    end

    def threatening(objects)
      entities = []
      objects.each {|object| entities << object if might_collide?(object) }
      entities
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