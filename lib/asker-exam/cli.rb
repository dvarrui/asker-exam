require 'thor'

module Asker
  module Exam
    class Quizz < Thor
      map ['h', '-h', '--help'] => 'help'
    end
  end
end
