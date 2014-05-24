class ContentManager
  def initialize
    # [Y, X]
    @grid_width, @grid_height = 32, 32
    @content_grid = Array.new(GameWindow::HEIGHT/@grid_height) { Array.new(GameWindow::WIDTH/grid_width) { nil }}
  end

  def update(objects)
    @content_grid = Array.new(GameWindow::HEIGHT/@grid_height) { Array.new(GameWindow::WIDTH/grid_width) { nil }}
    objects.each do |object|
      @content_grid[object.y/@grid_height][object.x/grid_width] = object
    end  
  end

  def get_surrounding_objects(object)
  end
end