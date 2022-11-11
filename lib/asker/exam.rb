require_relative 'exam/cli'
require_relative 'exam/create_exams'

module Asker
  module Exam
    def self.create_exams(filename, options)
      CreateExams.call(filename, options)
    end
  end
end
