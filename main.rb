require 'gosu'

class GameWindow < Gosu::Window
  HEIGHT, WIDTH, FULLSCREEN, NAME = 640, 480, false, "Spaceshooter"
  
  def initialize
    super HEIGHT, WIDTH, FULLSCREEN
  end
  
end