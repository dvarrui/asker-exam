require_relative '../application'
require_relative 'input_reader'

module CreateExams
  def self.run(filename, options = {})
    process_input_params(filename, options)
    debug
    questions = read_input
  end

  def self.process_input_params(filename, options)
    app = Application.instance
    app.params[:filename] = filename
    app.params.merge!(options)
  end

  def self.debug
    app = Application.instance
    puts "[INFO] Creating exams from : #{Rainbow(app.get(:filename)).blue}"
    puts "       * Questions number  : #{Rainbow(app.get(:questions_number)).blue}"
    puts "       * Exams number      : #{Rainbow(app.get(:exams_number)).blue}"
  end

  def self.read_input
    app = Application.instance
    questions = InputReader.read_yaml(app.get(:filename))
    questions
  end
end
