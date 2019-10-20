require_relative '../application'
require_relative 'input_reader'

module CreateExams
  def self.debug(filename)
    app = Application.instance
    puts "[INFO] Creating exams from : #{Rainbow(filename).green}"
    puts "       * Questions number  : #{app.get(:questions_number)}"
    puts "       * Exams number      : #{app.get(:exams_number)}"
    questions = InputReader.read_yaml(filename)
    questions
  end
end
