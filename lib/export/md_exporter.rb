
module MDExporter
  def self.run(filename, questions, indexes)
    puts "  ├── Exam     : exam-#{filename}.md"
    puts "  └── Solution : solu-#{filename}.md"
    export_exam("exam-#{filename}.md", questions, indexes)
    export_solu("solu-#{filename}.md", questions, indexes)
  end

  def self.export_exam(filename, questions, indexes)
    f = File.open(File.join('output', filename), 'w')
    t = "```\nFilename : #{filename}\nDate     : #{Time.now}\n```"
    t << "\n---\n"
    f.write(t)
    indexes.each do |i|
      f.write("**Question.#{i}**\n\n")
      f.write("#{questions[i][:text]}\n\n")
    end
    f.close
  end

  def self.export_solu(filename, questions, indexes)
  end
end
