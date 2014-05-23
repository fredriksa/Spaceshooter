require 'gosu'

require_relative 'src/GameStateManager.rb'

class GameWindow < Gosu::Window
  HEIGHT, WIDTH, FULLSCREEN, NAME = 640, 480, false, "Spaceshooter"
  
  def initialize
    super HEIGHT, WIDTH, FULLSCREEN
    self.caption = NAME
  end
  
  def draw
  end

  def update
  end
end

game = GameWindow.new
game.show