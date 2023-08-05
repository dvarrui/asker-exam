require "yaml"

class Settings
  def self.load
    @settings = {}
    @settings[:default] = {
      enumber: 3,
      qnumber: 10,
      format: :txt
    }
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
