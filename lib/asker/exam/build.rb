require_relative "export/exam"

class Build
  def call(project)
    project.show
    # create_exams_with(input[:questions], options["format"] || "txt")
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
