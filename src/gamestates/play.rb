class Play < GameState
  def initialize(window)
    super
    @player = Player.new(@rm.get("player", "player_left", "player_right", "player_projectile"), GameWindow::WIDTH/2 - Player::WIDTH/2, GameWindow::HEIGHT - 50, 100, 1.5, 0.95)
    @background = Background.new(@rm.get("background_solid"), @rm.get("background_stars"), true)

    @drawables << @player
    @updateables << @player

    @drawables << @background
    @updateables << @background
  end

  def draw
    super
  end

  def update
    super
  end

  def on_load
    @rm.load_image("player", "./assets/player.png")
    @rm.load_image("player_left", "./assets/player_left.png")
    @rm.load_image("player_right", "./assets/player_right.png")
    @rm.load_image("player_projectile", "./assets/player_projectile.png")

    @rm.load_image("background_solid", "./assets/background_solid.png")
    @rm.load_image("background_stars", "./assets/background_stars.png")
  end

  def handle_input(key, type)
    if type == "down"
      case key
      when Gosu::KbLeft
        @player.KbLeft = true
      when Gosu::KbRight  
        @player.KbRight = true
      end    
    else
      case key
      when Gosu::KbLeft
        @player.KbLeft = false
      when Gosu::KbRight
        @player.KbRight = false
      end
    end
  end
end