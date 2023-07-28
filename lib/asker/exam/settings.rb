require "yaml"

class Settings
  def self.load
    filepath = File.join(File.dirname(__FILE__), "settings.yaml")
    @settings = {}
    @settings = YAML.safe_load(
      File.read(filepath),
      permitted_classes: [Array, Hash, Symbol]
    )
  end

  def self.value
    @settings
  end

  load
end
