
module TXTExporter
  def self.run(filename, questions)
    puts "  ├── Exam     : exam-#{filename}.txt"
    puts "  └── Solution : solu-#{filename}.txt"
  end

  def self.export_exam(filename, questions)
  end

  def self.export_solution(filename, questions)
  end
end
