class MainMenu < GameState
  def initialize(window)
    super window
    @GUI.set_font(@rm["hyperspace"])
    @GUI.add_text("Title", "Spaceshooter", 50, 50)

    @GUI.set_font(@rm["hyperspace_24"])
    @GUI.add_text("Play", "Play", 50, 125)
    @GUI.add_text("Settings", "Settings", 50, 160)
    @GUI.add_text("Multiplayer", "Multiplayer", 50, 195)
  end

  def draw
    super
  end

  def update
    super
  end
end