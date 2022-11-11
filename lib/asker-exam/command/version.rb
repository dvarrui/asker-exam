# frozen_string_literal: true

require 'rainbow'
require_relative '../application'

# Command Line User Interface
class Quizz < Thor
  map ['v', '-v', '--version'] => 'version'
  desc 'version', 'show the program version'
  ##
  # Show application version
  def version
    print Rainbow(Application::NAME).bright.blue
    puts  ' (version ' + Rainbow(Application::VERSION).green + ')'
  end
end
