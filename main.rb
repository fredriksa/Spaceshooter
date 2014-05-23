require 'gosu'

class GameWindow < Gosu::Window
  HEIGHT, WIDTH, FULLSCREEN = 640, 480, false
  
  def initialize
    super HEIGHT, WIDTH, FULLSCREEN
  end

end