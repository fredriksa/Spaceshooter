class GameState
  def initialize(window)
    @drawables = []
    @rm = ResourceManager.new(window)
    on_load
  end

  def draw
    @drawables.each do |drawable|
      drawable.draw
    end
  end

  def update
  end

  def on_load
  end

  def on_exit
  end

  def handle_input(key, type)
  end
end