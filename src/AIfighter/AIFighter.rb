module AIFighter
  class AIFighter < SpaceshipFighter
    include RectangularCollision
    def initialize(images, projectile_image, x, y, speed, type, dodge_projectiles = true, speed_damper = 0.95)
      super images, projectile_image, x, y, speed, type, speed_damper
      @property = {"dodge_projectiles" => dodge_projectiles}
      @static_frame_timer = {"dodge_projectiles" => 5, "shoot" => 30}
      @frame_timer = @static_frame_timer.dup
    end

    def draw
      @images[@image_index].draw(@x, @y, ZOrder::Entity_Default + 1) if @images.is_a? Array
      @images.draw(@x, @y, ZOrder::Entity_Default + 1) if @images.is_a? Gosu::Image
    end

    def update(objects)
      super()
      @objects = objects
      
      # Movement
      accelerate_left if @accelerate_left == true
      accelerate_right if @accelerate_right == true
      move_x if @x + @velocity_x > 0 && @x + @velocity_x + width < GameWindow::WIDTH
      
      # Shoot
      if @frame_timer["shoot"] >= @static_frame_timer["shoot"]
        fire
        @frame_timer["shoot"] = 0
      end


      # Dodge
      dodge_projectile if @property["dodge_projectiles"]
      
      @frame_timer.each {|key, value| @frame_timer[key] += 1}
    end
    
    def target(entity)
      @target = entity
    end

    def dodge_projectile
      if @frame_timer["dodge_projectiles"] > @static_frame_timer["dodge_projectiles"]
        @accelerate_left = false
        @accelerate_right = false

        projectiles = clean_from_class(Projectile)
        threatening_projectiles = threatening
        closest_projectile = closest_entity(threatening_projectiles)
        if closest_projectile
          dodge(closest_projectile)
          @frame_timer["dodge_projectiles"] = 0
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

    def threatening
      entities = @objects.dup
      entities.select! {|entity| entity if might_collide? entity and entity.is_a? Projectile and entity.type == "Player"}
      entities
    end

    def clean_from_class(class_type)
      objects = @objects.dup
      objects.drop_while {|object| object.class == class_type}
    end

    def closest_entity(entities)
      entities.min {|a, b| (a.x - self.x).abs + (a.y - self.y).abs <=> (b.x - self.x).abs + (b.y - self.y)}
    end
  end
end