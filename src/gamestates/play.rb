class Play < GameState
  def initialize(window)
    super
    @speed = 1
    @player = Player.new(@rm.get("player", "player_left", "player_right"), @rm.get("player_projectile"), GameWindow::WIDTH/2 - Player::WIDTH/2, GameWindow::HEIGHT - 50, 100, 1.5, 0.95)
    @background = Background.new(@rm.get("background_solid"), @rm.get("background_stars"), @speed, true)
  end

  def draw
    super
  end

  def update
    super
    @objects = []
    @objects << @player
    @objects << @background
    @objects += @player.projectiles
    @objects << generate_loot
    @cm.update(@objects)
    @cm.get_surrounding_objects(@player)
  end

  def on_load
    @rm.load_image("player", "./assets/player.png")
    @rm.load_image("player_left", "./assets/player_left.png")
    @rm.load_image("player_right", "./assets/player_right.png")
    @rm.load_image("player_projectile", "./assets/player_projectile.png")

    @rm.load_image("background_solid", "./assets/background_solid.png")
    @rm.load_image("background_stars", "./assets/background_stars.png")

    @rm.load_image("health", "./assets/health.png")
    @rm.load_image("ammo", "./assets/ammo.png")
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
      when Gosu::KbSpace
        @player.fire
      end
    end
  end

  def generate_loot
    random_number = rand(1)
    Loot.new("Health", @rm.get("health"), rand(30..GameWindow::WIDTH-30), -50, 20, @speed, @speed) if random_number == 0
    Loot.new("Ammo", @rm.get("ammo"), rand(30..GameWindow::WIDTH-30), -50, 20, @speed, @speed) if random_number == 1
  end
end