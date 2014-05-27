class ContentManager
  def initialize
    # [Y, X]
    @grid_width, @grid_height = 32, 32
    @content_grid = Array.new(GameWindow::HEIGHT/@grid_height + 1) { Array.new(GameWindow::WIDTH/@grid_width + 1) { nil }}
  end

  def update(objects)
    clean_array
    objects.each do |object|
      @content_grid[(object.y/@grid_height).round][(object.x/@grid_width).round] = object
    end  
  end

  def surrounding_objects(object)
    surrounding_objects = []
    ((object.x/@grid_width-1).round..(object.x/@grid_width+1).round).each do |x|
      ((object.y/@grid_height-1).round..(object.y/@grid_height+1).round).each do |y|
        if @content_grid[y][x] != nil and object != @content_grid[y][x]
          surrounding_objects << @content_grid[y][x]
        end
      end
    end

    return surrounding_objects
  end

  def clean_array
    @content_grid = Array.new(GameWindow::HEIGHT/@grid_height + 1) { Array.new(GameWindow::WIDTH/@grid_width + 1) { nil }}
  end
end