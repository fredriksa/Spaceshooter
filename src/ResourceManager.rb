class ResourceManager
  def initialize(window)
  	@window = window
    @resources = {}
  end

  def load_image(key, path)
    @resources = Gosu::Image.new()
  end
end