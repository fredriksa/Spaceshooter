class Explosion < Entity
  def update
    @counter += 1
    if @counter >= 6
      @image_index += 1
      @counter = 0
    end
  end
end