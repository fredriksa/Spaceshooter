class ContentManager
  def initialize
    # [Y, X]
    @content_grid = Array.new(GameWindow::HEIGHT/32) { Array.new(GameWindow::WIDTH/32) { nil }}
  end

  def update(objects)
    @content_grid = Array.new(GameWindow::HEIGHT/32) { Array.new(GameWindow::WIDTH/32) { nil }}
    objects.each do |object|
      @content_grid[object.y/32][object.x/32] = object
    end  
  end

  def get_surrounding_objects(object)
  end
end