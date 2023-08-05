require_relative "exam/cli"
require_relative "exam/build"
require_relative "exam/project"

module Asker
  module Exam
    def self.build(filename, options)
      project = Project.new
      project.load(filename, options)
      Build.new.call(project)
    end
  end
end
