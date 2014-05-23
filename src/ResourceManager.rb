class ResourceManager
  def initialize(window)
  	@window = window
    @resources = {}
  end

  def load_image(key, path)
    @resources[key] = Gosu::Image.new(@window, path, false) if @resources[key].nil?
  end
end