
require 'yaml'
require "debug"

module InputReader
  ##
  # Read YAML filename
  # @param filename [String] YAML file name.
  # @return [Hash]
  def self.read(filename)
    binding.break
    YAML.load_file(File.read(filename))
  end
end
