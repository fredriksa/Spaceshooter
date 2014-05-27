class Background < FloatingEntity
  attr_accessor :x, :y
  def initialize(bg, cover, speed, double_cover = false)
    @bg = bg
    @cover = cover
    @double_cover = double_cover
    
    @y, @x = 0, 0
    @y2 = -500

    @velocity_y = 1
    @speed, @speed_damper = speed, 1
    @alive = true
  end

  def draw
    @bg.draw(0, 0, ZOrder::Background_Solid)
    @cover.draw(0, @y, ZOrder::Background_Cover)
    @cover.draw(200, @y, ZOrder::Background_Cover)if @double_cover

    @cover.draw(0, @y2, ZOrder::Background_Cover)
    @cover.draw(200, @y2, ZOrder::Background_Cover)
  end

  def update
    move_y
    @y = -500 if @y >= GameWindow::HEIGHT
    @y2 = -500 if @y2 >= GameWindow::HEIGHT
  end

  def move_y
    super
    @y2 += @velocity_y
  end
end