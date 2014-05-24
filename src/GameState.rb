class GameState
  def initialize(window)
    @objects = []
    @rm = ResourceManager.new(window)
    @cm = ContentManager.new
    on_load
  end

  def draw
    @objects.each do |object|
      object.draw
    end
  end

  def update
    @objects.each do |object|
      object.update
    end
  end

  def on_load
  end

  def on_exit
  end

  def handle_input(key, type)
  end
end