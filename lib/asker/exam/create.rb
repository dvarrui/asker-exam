require "yaml"
require_relative "settings"
require_relative "export/exam"

class Create
  def call(filepath)
    input = read_input(filepath)
    show_params
    create_exams_with(input[:questions], options["format"] || "txt")
  end

  def show_params
    puts "==> asker-exam: Show configuration"
    puts "    Project name     : #{Settings.get(:projectname)}"
    puts "    Input filepath   : #{app.get(:filepath)}"
    puts "    Questions count  : #{app.get(:questions_count)}"
    puts "    Required exams   : #{Settings.get(:enumber)}"
    puts "    Required Q x E   : #{Settings.get(:qnumber)}"
    puts "    Questions used   : #{app.get(:questions_used_number)}"
  end

  def read_input(filepath)
    input = YAML.safe_load(
      File.read(filename),
      permitted_classes: [Array, Hash, Symbol]
    )
    questions = input[:questions]

    Settings.value[:inputfile][:filepath] = filepath
    Settings.value[:inputfile][:lang] = input[:lang]
    Settings.value[:inputfile][:projectname] = input[:projectname]

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

  def create_exams_with(questions)
    puts "==> asker-exam: Exporting files..."
    input = Settings.value[:input]
    filename = input[:projectname]
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
