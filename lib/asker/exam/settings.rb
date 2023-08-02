require "yaml"

class Settings
  def self.load
    filepath = File.join(File.dirname(__FILE__), "settings.yaml")
    @settings = {}
    @settings = YAML.safe_load(
      File.read(filepath),
      permitted_classes: [Array, Hash, Symbol]
    )
    @settings[:params] = {}
    @settings[:inputfile] = {}
  end

  def self.value
    @settings
  end

  def self.set(key, value)
    @settings[:params][key] = value
  end

  def self.get(key)
    return @settings[:params][key] if @settings[:params][key]

    @settings[:default][key] || "UNKOWN"
  end

  load
end
