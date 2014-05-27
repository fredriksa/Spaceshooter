class Explosion < Entity
  def initialize(images, x, y)
    super images, x, y
    @counter = 0
  end

  def update
    @counter += 1
    if @counter >= 1 and @image_index < 10
      @image_index += 1
      @counter = 0
    else
      die
    end
  end
end