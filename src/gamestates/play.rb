class Play
  def initialize(window)
    @rm = ResourceManager.new(window)
    @player = Player.new()
  end

  def draw
  end

  def update
  end

  def on_load
  end

  def on_exit
  end

  def handle_input(key, type)
    if type == "down"
      case type
      when Gosu::KbLeft
      when Gosu::KbRight  
      end    
    else
      case type
      when Gosu::KbLeft
      when Gosu::KbRight
      end
    end
  end
end