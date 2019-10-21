
require_relative '../application'

module CreateExam
  def self.run(args={})
    show_inputs args
    puts Application.instance.get(:selected_q_indexes).size
  end

  def self.show_inputs(args)
    puts "[INFO] Creating exam"
  end
end
