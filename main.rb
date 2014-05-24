require 'gosu'

require_relative 'src/GameStateManager.rb'
require_relative 'src/GameState.rb'
require_relative 'src/ResourceManager.rb'

require_relative 'src/Entity.rb'
require_relative 'src/FloatingEntity.rb'
require_relative 'src/Player.rb'

require_relative 'src/gamestates/play.rb'

module ZOrder
  Entity_Default = 1000
end

class GameWindow < Gosu::Window
  WIDTH, HEIGHT, FULLSCREEN, NAME = 480, 640, false, "Spaceshooter"
  
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