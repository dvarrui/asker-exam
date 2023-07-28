require "tty-config"

class Settings
  def self.load
    filepath = File.join(File.dirname(__FILE__), "..", "files", "settings.yaml")
    @settings = {}
    @settings = TTY::Config.new.read(filepath)
  end

  def self.value
    @settings
  end

  load
end
