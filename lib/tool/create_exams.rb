require_relative '../application'
require_relative 'input_reader'
require_relative 'exam'

module CreateExams
  def self.run(filepath, options = {})
    process_input_params(filepath, options)
    questions = read_input
    show_inputs(Application.instance)
    create_exams_with(questions)
  end

  def self.process_input_params(filepath, options)
    app = Application.instance
    app.params[:filepath] = filepath
    app.params.merge!(options)
  end

  def self.show_inputs(app)
    puts "[INFO] Creating exams... input configurations."
    puts "  ├── Input filepath   : #{Rainbow(app.get(:filepath)).blue}"
    puts "  ├── Questions count  : #{app.get(:questions_count)}"
    puts "  ├── Required exams   : #{Rainbow(app.get(:required_exams)).blue}"
    puts "  ├── Required Q x E   : #{Rainbow(app.get(:required_qxe)).blue}"
    puts "  └── Questions used   : #{app.get(:questions_used_number)}"
  end

  def self.read_input
    app = Application.instance
    questions = InputReader.read_yaml(app.get(:filepath))
    app.params[:questions_count] = questions.count
    questions_used_number = app.get(:required_exams).to_i * app.get(:required_qxe).to_i
    app.params[:questions_used_number] = questions_used_number
    indexes = (0..questions.count).to_a.shuffle!
    while indexes.count < questions_used_number do
      indexes << (0..questions.count).to_a.shuffle!
    end
    indexes.flatten!
    app.params[:selected_q_indexes] = indexes[0, questions_used_number]
    questions
  end

  def self.create_exams_with(questions)
    app = Application.instance
    filename = File.basename(app.get(:filepath), ".*")
    indexes = app.get(:selected_q_indexes)
    first = 0
    (1..app.get(:required_exams)).each do |i|
      CreateExam.run(i, filename, questions, indexes[first, app.get(:required_qxe)])
      first += app.get(:required_qxe)
    end
  end
end
