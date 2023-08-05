require "yaml"
require "colorize"

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
    puts "    projectname : #{get(:projectname)}"
    puts "    enumber     : #{get(:enumber)}"
    puts "    qnumber     : #{get(:qnumber)}"
    min = get(:qnumber)
    max = get(:enumber) * get(:qnumber)
    if get(:questions).size <= min
      puts "    Questions   : #{get(:questions).size}".colorize(:light_yellow)
    elsif get(:questions).size > max
      puts "    Questions   : #{get(:questions).size}".colorize(:green)
    else
      puts "    Questions   : #{get(:questions).size}".colorize(:white)
    end
  end
end
