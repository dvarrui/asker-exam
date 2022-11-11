require 'thor'
require 'rainbow'
require_relative 'create_exams'
require_relative 'version'

module AskerExam
  class Quizz < Thor
    map ['h', '-h', '--help'] => 'help'

    map ['v', '-v', '--version'] => 'version'
    desc 'version', 'show the program version'
    def version
      puts "#{Version::NAME} (version #{Version::VERSION})"
    end

    map ['f', '-f', '--file'] => 'file'
    desc 'file NAME', 'Build exams, from YAML input file.'
    option :color, type: :boolean
    long_desc <<-LONGDESC
    Create exams, from questions input file (YAML format).
    LONGDESC

    ##
    # Read questions from YAML filename and creates exams.
    # @param filename [String] File path to YAML questions file.
    def file(filename)
      Rainbow.enabled = false if options['color'] == false
      CreateExams.run(filename, options)
    end

    def method_missing(method, *_args, &_block)
      file(method.to_s)
    end
  end
end
