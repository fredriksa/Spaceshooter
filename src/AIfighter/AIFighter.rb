module AIFighter
  class AIFighter < SpaceshipFighter
    def update(objects)
      objects = objects.dup
      objects.drop_while {|object| object.class != Projectile && object.team != "Player"}
      closest_projectile = objects.min {|a, b| (a.x - player.x).abs <=> (b.x - player.x).abs}
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
  end
end