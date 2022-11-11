
require 'yaml'

##
# Read input
module InputReader
  ##
  # Read YAML filename
  # @param filename [String] YAML file name.
  # @return [Hash]
  def self.read_yaml(filename)
    YAML.load_file(filename)
  end
end
