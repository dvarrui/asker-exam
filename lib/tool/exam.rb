
require_relative '../export/txt_exporter'

module CreateExam
  def self.run(id, filename, questions, indexes)
    puts Rainbow("[#{format('%02d', id)}]").bright
    exam_questions = []
    indexes.each { |i| exam_questions << questions[i] }
    TXTExporter.run("#{format('%02d',id)}-#{filename}",
                    exam_questions)
  end
end
