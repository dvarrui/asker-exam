require_relative 'exam/cli'
require_relative 'exam/create_exams'

module Asker
  module Exam
    def self.create(filename, options)
      CreateExams.call(filename, options)
    end
  end
end
