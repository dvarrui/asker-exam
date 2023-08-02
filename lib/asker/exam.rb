require_relative "exam/cli"
require_relative "exam/create"

module Asker
  module Exam
    def self.create(filename)
      Create.new.call(filename)
    end
  end
end
