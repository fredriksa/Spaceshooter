class ContentManager
  def initialize
    # [Y, X]
    @grid_width, @grid_height = 32, 32
    @content_grid = Array.new(GameWindow::HEIGHT/@grid_height + 1) { Array.new(GameWindow::WIDTH/@grid_width + 1) { nil }}
  end

  def update(objects)
    clean_array
    objects.each do |object|
      @content_grid[object.y/@grid_height][object.x/@grid_width] = object
    end  
  end

  def get_surrounding_objects(object)
    ((object.x/@grid_width-1).round..(object.x/@grid_width+1).round).each do |x|
      ((object.y/@grid_height-1).round..(object.y/@grid_height+1).round).each do |y|
        if @content_grid[y][x] != nil and object != @content_grid[y][x]
          p @content_grid[y][x]
        end
      end
    end
  end

  def clean_array
    @content_grid = Array.new(GameWindow::HEIGHT/@grid_height + 1) { Array.new(GameWindow::WIDTH/@grid_width + 1) { nil }}
  end
end