class Play < GameState
  def initialize(window)
    super
    @player = Player.new(@rm.get("player", "player_left", "player_right"), GameWindow::WIDTH/2 - Player::WIDTH/2, GameWindow::HEIGHT - 50, 100, 0)
    @drawables << @player
  end

  def draw
    super
  end

  def update
  end

  def on_load
    @rm.load_image("player", "./assets/player.png")
    @rm.load_image("player_left", "./assets/player_left.png")
    @rm.load_image("player_right", "./assets/player_left.png")
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