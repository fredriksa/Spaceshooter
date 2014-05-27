class ResourceManager
  def initialize(window)
  	@window = window
    @resources = {}
  end

  def load_image(key, path)
    raise IOError, 'path must point to a existing file!' if !File.file?(path)
    @resources[key] = Gosu::Image.new(@window, path, false) if @resources[key].nil?
  end

  def load_font(key, path, height)
    raise IOError, 'path must point to a existing file!' if !File.file?(path)
    @resources[key] = Gosu::Font.new(@window, path, height)
  end

  def load_spritesheet(key, path, width, height)
    raise IOError, 'path must point to a existing file!' if !File.file?(path)
    @resources[key] = Gosu::Image::load_tiles(@window, path, width, height, true)
  end

  def get(*keys)
    return @resources[keys[0]] if keys.size == 1
    
    acquired_resources = []
    keys.each do |key|
      acquired_resources << @resources[key]
    end

    return acquired_resources
  end
end