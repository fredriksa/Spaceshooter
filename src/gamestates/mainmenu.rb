class MainMenu < GameState
  def initialize(window)
    super window
    @GUI.set_font(@rm["hyperspace"])
    @GUI.add_text("Title", "Spaceshooter", 50, 50)

    @GUI.set_font(@rm["hyperspace_24"])
    @GUI.add_text("Play", "Play", 50, 100)
  end

  def draw
    super
  end

  def update
    super
  end
end