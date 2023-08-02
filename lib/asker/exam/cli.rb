require "thor"
require_relative "../exam"
require_relative "version"

class CLI < Thor
  map ["h", "-h", "--help"] => "help"

  map ["v", "-v", "--version"] => "version"
  desc "version", "show the program version"
  def version
    puts "#{Asker::Exam::NAME} (version #{Asker::Exam::VERSION})"
  end

  map ["b", "-b", "--build"] => "build"
  desc "build FILENAME.yaml", "Build exams, from Asker questions YAML file."
  option :enumber, type: :numeric
  option :qnumber, type: :numeric
  option :format, type: :string
  long_desc <<-LONGDESC
  Build exams, from Asker questions YAML file.

    enumber : number of exams

    qnumber : number of questions for each exam

    format  : output format (txt, md)
  LONGDESC

  ##
  # Read questions from filename and creates exams.
  # @param filename [String] File path to YAML questions file.
  def build(filename)
    options.each_pair { |key, value| Settings.set(key.to_sym, value) }
    Asker::Exam.create(filename)
  end

  def method_missing(method, *_args, &_block)
    file(method.to_s)
  end

  def respond_to_missing?(_method_name)
    true
  end

  def self.exit_on_failure?
    true
  end
end
