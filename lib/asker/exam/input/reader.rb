require 'yaml'

module InputReader
  def self.read(filename)
    YAML.load(File.read(filename))
  end
end
