require_relative "../version"

module TXTExporter
  def self.call(id, name, questions)
    filename1 = format("%s-exam-%02d.txt", name, id)
    filename2 = format("%s-solu-%02d.txt", name, id)
    puts "==> asker-exam: #{filename1}, #{filename2}"
    export_exam(filename1, questions)
    export_solu(filename2, questions)
  end

  def self.export_exam(filename, questions)
    f = File.open(File.join("output", filename), "w")
    f.write("=" * 50 + "\n")
    f.write("Created by : #{Asker::Exam::NAME}")
    f.write(" (version #{Asker::Exam::VERSION})\n")
    f.write("File       : #{filename}\n")
    f.write("Time       : #{Time.new}\n")
    f.write("=" * 50 + "\n\n")
    f.close
  end

  def self.export_solu(filename, questions)
    puts "[TODO] Export solutions"
  end
end
