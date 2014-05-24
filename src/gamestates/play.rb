class Play < GameState
  def initialize(window)
    super
    @player = Player.new()
  end

  def draw
  end

  def update
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