require "yaml"

module InputReader
  def self.read(filename)
    # YAML.load(File.read(filename))
    YAML.safe_load(
      File.read(filename),
      permitted_classes: [Array, Hash, Symbol]
    )
  end
end
