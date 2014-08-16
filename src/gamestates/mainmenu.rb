class MainMenu < GameState
  def initialize(window)
    super window
    @GUI.set_font(@rm["hyperspace"])
    @GUI.add_text("Title", "Spaceshooter", 50, 50)
    @GUI.add_icon("white_rectangle_183px", @rm["white_rectangle_183px"], 50, 85)

    @GUI.set_font(@rm["hyperspace_24"])
    @GUI.add_text("Play", "Play", 50, 175)
    @GUI.add_text("Settings", "Settings", 50, 210)
    @GUI.add_text("Multiplayer", "Multiplayer", 50, 245)

    @background = Background.new(@rm["background_solid"], @rm["background_stars"], @speed, true)
    @objects << @background
  end

  def draw
    super
  end

  def update
    super
  end

  def handle_input(key, type)
    if type == "up"
      case key
      when Gosu::MsLeft

      end
    end
  end

  def gui_collision?
    
  end

  def handle_collision
    
  end
end