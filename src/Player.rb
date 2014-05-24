class Player < FloatingEntity
  WIDTH, HEIGHT = 27, 22
  attr_accessor :KbLeft, :KbRight

  def initialize(images, x, y, hp, speed)
    super images, x, y, hp, speed
    @KbLeft = false
    @KbRight = false
  end

  def update
    super
  end
end