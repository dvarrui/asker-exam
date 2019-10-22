
require_relative '../export/md_exporter'

module CreateExam
  def self.run(id, filename, questions, indexes)
    puts Rainbow("[#{format('%02d', id)}]").bright
    MDExporter.run("#{format('%02d',id)}-#{filename}",
                   questions, indexes)
  end
end
