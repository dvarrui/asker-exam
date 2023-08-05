require "yaml"

class Project
  def initialize
    @project = {}
    @project[:default] = {
      enumber: 3,
      qnumber: 10,
      format: :txt
    }
    @project[:params] = {}
    @project[:inputfile] = {}
  end

  def get(key)
    return @project[:params][key] if @project[:params][key]
    return @project[:inputfile][key] if @project[:inputfile][key]
    return @project[:default][key] if @project[:default][key]

    raise "[ERROR] Project: Unknown param (#{key})!"
  end

  def load(filepath)
    @project[:params][:filepath] = filepath
    @project[:inputfile] = YAML.safe_load(
     File.read(filepath),
    permitted_classes: [Array, Hash, Symbol]
    )
  end

  def value
    @project
  end

  def show
    puts "==> Project configuration"
    puts "    Project name     : #{get(:projectname)}"
    puts "    Questions count  : #{get(:questions).size}"
    puts "    Required exams   : #{get(:enumber)}"
    puts "    Required Q x E   : #{get(:qnumber)}"
  end
end
