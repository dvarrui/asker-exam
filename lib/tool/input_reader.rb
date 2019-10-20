
require 'yaml'
module InputReader
  def self.read_yaml(filename)
    questions = YAML.load_file(filename)
    puts questions.count
  end
end
