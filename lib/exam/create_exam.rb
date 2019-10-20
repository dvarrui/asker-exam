
require_relative '../application'

module CreateExam
  def self.run(args={})
    show_inputs args
    indexes, questions = select_indexes(args[:questions])
    puts indexes
  end

  def self.show_inputs(args)
    puts "[INFO] Creating 1 exam"
    args.each_pair do |key, value|
      if value.class == Array
        puts " * #{key} => count=#{value.count}"
      else
        puts " * #{key} => #{value}"
      end
    end
  end

  def self.select_indexes(questions)
    app = Application.instance
    max_indexes = app.get(:questions_number).to_i *
                  app.get(:exams_number).to_i
    indexes = (0..questions.count).to_a.shuffle![0,max_indexes]
    questions.shuffle!
    return indexes, questions
  end
end
