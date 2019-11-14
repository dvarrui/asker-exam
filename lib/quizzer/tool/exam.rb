
require_relative '../export/md_exporter'

module Exam
  def self.create(id, filename, questions)
    MDExporter.run("#{format('%02d',id)}-#{filename}",
                   questions)
  end
end
