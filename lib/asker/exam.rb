require_relative "exam/cli"
require_relative "exam/create"

module Asker
  module Exam
    def self.create(filename, options)
      Create.call(filename, options)
    end
  end
end
