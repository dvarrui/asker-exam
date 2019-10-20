
require 'yaml'
module InputReader
  def self.read_yaml(filename)
    YAML.load_file(filename)
  end
end
