
module TXTExporter
  def self.run(filename, questions)
    puts "  ├── Exam     : exam-#{filename}.txt"
    puts "  └── Solution : solu-#{filename}.txt"
  end

  def self.export_exam(filename, questions)
   f = File.open(File.join('output', filename, 'w')
   f.write('=' * 50 + "\n")
   f.write("Created by : #{Application.instance.name}")
   f.write(" (version #{Application.instance.version})\n")
   f.write("File       : #{get(:logname)}\n")
   f.write("Time       : #{Time.new}\n")
   f.write("Author     : David Vargas\n")
   f.write('=' * 50 + "\n\n")
   f.close
  end

  def self.export_solution(filename, questions)
  end
end
