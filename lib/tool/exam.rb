
require_relative '../export/exam_txt_exporter'

module CreateExam
  def self.run(id, filename, questions, indexes)
    puts "[INFO] Creating exam nº #{id}"
    exam_questions = []
    indexes.each { |i| exam_questions << questions[i] }
    ExamTXTExporter.run("#{filename}-#{format('%02d',id)}.txt",
                        exam_questions)
  end
end
