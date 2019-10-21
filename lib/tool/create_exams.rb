require_relative '../application'
require_relative 'input_reader'
require_relative '../exam/create_exam'

module CreateExams
  def self.run(filename, options = {})
    process_input_params(filename, options)
    questions = read_input
    show_inputs
    create_exams_with(questions)
  end

  def self.process_input_params(filename, options)
    app = Application.instance
    app.params[:filename] = filename
    app.params.merge!(options)
  end

  def self.show_inputs
    app = Application.instance
    puts "[INFO] Creating exams... input configurations."
    puts "  ├── Input filename   : #{Rainbow(app.get(:filename)).blue}"
    puts "  ├── Questions count  : #{Rainbow(app.get(:questions_count)).blue}"
    puts "  ├── Required exams   : #{Rainbow(app.get(:required_exams)).blue}"
    puts "  ├── Required Q x E   : #{Rainbow(app.get(:required_qxe)).blue}"
    puts "  └── Questions used   : #{Rainbow(app.get(:questions_used_number)).blue}"
  end

  def self.read_input
    app = Application.instance
    questions = InputReader.read_yaml(app.get(:filename))
    app.params[:questions_count] = questions.count
    questions_used_number = app.get(:required_exams).to_i * app.get(:required_qxe).to_i
    app.params[:questions_used_number] = questions_used_number
    indexes = (0..questions.count).to_a.shuffle!
    while indexes.count < questions_used_number do
      indexes << (0..questions.count).to_a.shuffle!
    end
    app.params[:selected_q_indexes] = indexes[0, questions_used_number]
    questions
  end

  def self.create_exams_with(questions)
    app = Application.instance
    (1..app.get(:required_exams)).each do |i|
      puts "[INFO] Creating exam nº #{i}"
      CreateExam.run(questions)
    end
  end
end
