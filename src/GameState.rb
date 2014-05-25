class GameState
  def initialize(window)
    @objects = []
    @rm = ResourceManager.new(window)
    @cm = ContentManager.new
    on_load
  end

  def draw
    @objects.each do |object|
      object.draw
    end
  end

  def update
    @objects.each do |object|
      object.update
    end
  end

  def on_load
    
  end

  def on_exit
  end

  def handle_input(key, type)
  end

  def load_resources
    filepath = "./src/gamestates/" + self.class.to_s + "_resources.txt"
    raise IOError, 'file does not exist #{filepath}' if !File.file?(filepath)

    data = File.readlines(filepath)
    data.delete_at(0)
    
    data.each do |content|
      content = content.strip.split(" ")
      case content[0]
        when "image"
          @rm.load_image(content[1], content[2])
      end
    end
  end
end