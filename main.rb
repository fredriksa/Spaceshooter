require 'gosu'

require_relative 'src/GameStateManager.rb'
require_relative 'src/gamestates/play.rb'

class GameWindow < Gosu::Window
  HEIGHT, WIDTH, FULLSCREEN, NAME = 640, 480, false, "Spaceshooter"
  
  def initialize
    super HEIGHT, WIDTH, FULLSCREEN
    self.caption = NAME

    @state_manager = GameStateManager.new(self)
  end
  
  def draw
    @state_manager.draw
  end

  def update
    @state_manager.update
  end
end

game = GameWindow.new
game.show