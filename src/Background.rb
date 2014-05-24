class Background < FloatingEntity
  def initialize(solid, cover, double_cover = false)
    @solid = solid
    @cover = cover
    @double_cover = double_cover

    @velocity_x, @velocity_y = 0, 0
    @speed = 1
  end

  def draw
    @solid.draw(0, 0, ZOrder::Background_Solid)
    @cover.draw(0, 0, ZOrder::Background_Cover)
    @cover.draw(200, 0, ZOrder::Background_Cover)if @double_cover
  end

  def update
  end
end