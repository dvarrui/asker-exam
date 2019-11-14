require 'thor'
require_relative 'quizzer/command/main'

# Command Line User Interface
class Quizz < Thor
  map ['h', '-h', '--help'] => 'help'
end
