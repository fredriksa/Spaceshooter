require 'gosu'

require_relative 'src/GameStateManager.rb'
require_relative 'src/ResourceManager.rb'

require_relative 'src/Entity.rb'

require_relative 'src/gamestates/play.rb'

class GameWindow < Gosu::Window
  HEIGHT, WIDTH, FULLSCREEN, NAME = 640, 480, false, "Spaceshooter"
  
  def initialize
    super HEIGHT, WIDTH, FULLSCREEN
    self.caption = NAME

    @state_manager = GameStateManager.new(self)
    @state_manager.add(Play.new(self))
  end
  
  def draw
    @state_manager.draw
  end

  def update
    @state_manager.update
  end
  
  def button_down(id)
    @state_manager.handle_input(id, "down")
  end

  def button_up(id)
    @state_manager.handle_input(id, "up")
  end
end

game = GameWindow.new
game.show