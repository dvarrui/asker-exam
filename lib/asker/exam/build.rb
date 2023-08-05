require_relative "export/factory"

class Build
  def call(project)
    project.show
    create_exams(project)
  end

  def create_exams(project)
    puts "==> asker-exam: Creating exams..."
    qxe = project.get(:enumber) * project.get(:qnumber)
    questions = project.get(:questions).clone
    qselected = []
    exam_id = 0
    questions.shuffle.cycle.take(qxe).each do |question|
      qselected << question if qselected.size < project.get(:qnumber)
      if qselected.size == project.get(:qnumber)
        exam_id += 1
        export_selected_questions(project, exam_id, qselected)
        qselected.clear
      end
    end
  end

  def export_selected_questions(project, id, questions)
    filename = project.get(:projectname)
    format = project.get(:format)
    export = ExportFactory.get(format)
    export.call(filename, id, questions)
  end
end
