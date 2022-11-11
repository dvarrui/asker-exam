require 'thor'
require_relative 'version'

module AskerExam
  class Quizz < Thor
    map ['h', '-h', '--help'] => 'help'

    map ['v', '-v', '--version'] => 'version'
    desc 'version', 'show the program version'
    def version
      puts "#{Version::NAME} (version #{Version::VERSION})"
    end
  end
end
