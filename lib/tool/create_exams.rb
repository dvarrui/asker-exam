require_relative 'read_yaml'

module CreateExams
  def self.debug(filename)
    puts "[INFO] Creating exams from #{Rainbow(filename).green}"
    questions = ReadYAML.read_questions_from_yaml(filename)
    puts questions.count    
  end
end
