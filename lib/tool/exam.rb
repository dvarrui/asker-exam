
require_relative '../export/md_exporter'

module Exam
  def self.create(id, filename, questions, indexes)
    puts Rainbow("[#{format('%02d', id)}]").bright
    MDExporter.run("#{format('%02d',id)}-#{filename}",
                   questions, indexes)
  end
end
