require_relative '../application'
require_relative 'input_reader'
require_relative '../exam/create_exam'

module CreateExams
  def self.run(filename, options = {})
    process_input_params(filename, options)
    show_inputs
    questions = read_input
    create_output(questions)
  end

  def self.process_input_params(filename, options)
    app = Application.instance
    app.params[:filename] = filename
    app.params.merge!(options)
  end

  def self.show_inputs
    app = Application.instance
    puts "[INFO] Creating exams..."
    puts "  ├── Input filename   : #{Rainbow(app.get(:filename)).blue}"
    puts "  ├── Questions number : #{Rainbow(app.get(:questions_number)).blue}"
    puts "  └── Exams number     : #{Rainbow(app.get(:exams_number)).blue}"
  end

  def self.read_input
    app = Application.instance
    questions = InputReader.read_yaml(app.get(:filename))
    questions
  end

  def self.create_output(questions)
    CreateExam.run({ questions: questions} )
  end
end
