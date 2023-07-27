require "thor"
require_relative '../exam'
require_relative 'version'
require "debug"

class CLI < Thor
  map ['h', '-h', '--help'] => 'help'

  map ['v', '-v', '--version'] => 'version'
  desc 'version', 'show the program version'
  def version
    puts "#{Version::NAME} (version #{Version::VERSION})"
  end

  map ['f', '-f', '--file'] => 'file'
  desc 'file NAME', 'Build exams, from Asker questions YAML file.'
  option :format, type: :string
  long_desc <<-LONGDESC
  Create exams, from Asker questions YAML file.
  LONGDESC

  ##
  # Read questions from filename and creates exams.
  # @param filename [String] File path to YAML questions file.
  def file(filename)
    Asker::Exam.create(filename, options)
  end

  def method_missing(method, *_args, &_block)
    file(method.to_s)
  end
end
