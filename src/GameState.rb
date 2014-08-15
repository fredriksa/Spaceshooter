class GameState
  def initialize(window)
    @objects = []
    @rm = ResourceManager.new(window)
    @cm = ContentManager.new
    @GUI = GUI::GUI.new
    on_load
  end

  def draw
    @objects.each do |object|
      object.draw
    end
    @GUI.draw
  end

  def update
    @objects.each do |object|
      object.update
    end
    @GUI.update
  end

  def on_load
    load_resources
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
        when "font"
          @rm.load_font(content[1], content[2], content[3].to_i)
        when "spritesheet"
          @rm.load_spritesheet(content[1], content[2], content[3].to_i, content[4].to_i)
      end
    end
  end
end