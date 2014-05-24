class Background
  def initialize(solid, cover)
    @solid = solid
    @cover = cover
  end

  def draw
    @solid.draw(0, 0, ZOrder::Background_Solid)
  end

  def update
  end
end