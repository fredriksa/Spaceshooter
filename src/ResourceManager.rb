class ResourceManager
  def initialize(window)
  	@window = window
    @resources = {}
  end

  def load_image(key, path)
    raise IOError, 'path must point to a existing file!' if !File.file?(path)
    @resources[key] = Gosu::Image.new(@window, path, false) if @resources[key].nil?
  end

  def get(*keys)
    @resources[keys[0]] if keys.size == 1
    
    acquired_resources = []
    keys.each do |key|
      acquired_resources << @resources[key]
    end

    return acquired_resources
  end
end