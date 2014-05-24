class ContentManager
  def initialize
    # [Y, X]
    @grid_width, @grid_height = 32, 32
    @content_grid = Array.new(GameWindow::HEIGHT/@grid_height + 1) { Array.new(GameWindow::WIDTH/@grid_width + 1) { nil }}
  end

  def update(objects)
    @content_grid = Array.new(GameWindow::HEIGHT/@grid_height + 1) { Array.new(GameWindow::WIDTH/@grid_width + 1) { nil }}
    objects.each do |object|
      @content_grid[object.y/@grid_height][object.x/@grid_width] = object
    end  
  end

  def get_surrounding_objects(object)
    for x in object.x/@grid_width-1.round..object.x/@grid_width+1.round
      puts x
      for y in object.y/@grid_height-1.round..object.y/@grid_height+1.round
        puts y
        if @content_grid[y][x] != nil
          puts "Found object"
          p @content_grid[y][x]
        end
      end
    end
  end
end