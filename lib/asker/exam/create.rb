require_relative "application"
require_relative "export/exam"
require_relative "input/reader"

module Create
  def self.call(filepath, options = {})
    input = read_input(filepath)
    process_input_params(filepath, options, input[:params])
    show_inputs(Application.instance)
    create_exams_with(input[:questions], options["format"] || "txt")
  end

  def self.process_input_params(filepath, options, params)
    app = Application.instance
    app.params[:filepath] = filepath
    app.params.merge!(options)
    app.params.merge!(params)
  end

  def self.show_inputs(app)
    puts "==> asker-exam: Show configuration"
    puts "    Project name     : #{app.get(:projectname)}"
    puts "    Input filepath   : #{app.get(:filepath)}"
    puts "    Questions count  : #{app.get(:questions_count)}"
    puts "    Required exams   : #{app.get(:required_exams)}"
    puts "    Required Q x E   : #{app.get(:required_qxe)}"
    puts "    Questions used   : #{app.get(:questions_used_number)}"
  end

  def self.read_input(filepath)
    input = InputReader.read(filepath)
    questions = input[:questions]
    app = Application.instance
    app.params[:questions_count] = questions.count
    questions_used_number = app.get(:required_exams).to_i * app.get(:required_qxe).to_i
    app.params[:questions_used_number] = questions_used_number
    indexes = (0..(questions.count - 1)).to_a.shuffle!
    while indexes.count < questions_used_number
      indexes << (0..questions.count).to_a.shuffle!
    end
    indexes.flatten!
    app.params[:selected_q_indexes] = indexes[0, questions_used_number]
    input
  end

  def self.create_exams_with(questions, format = "txt")
    puts "==> asker-exam: Exporting files..."
    app = Application.instance
    filename = app.get(:projectname)
    indexes = app.get(:selected_q_indexes)
    first = 0
    (1..app.get(:required_exams)).each do |i|
      selected_questions = []
      indexes[first, app.get(:required_qxe)].each do |i|
        index = i
        if index >= questions.size
          index = index % questions.size
        end
        selected_questions << questions[index]
      end
      ExportExam.call(i, filename, selected_questions, format)
      first += app.get(:required_qxe)
    end
  end
end
