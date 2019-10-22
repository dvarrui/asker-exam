
module MDExporter
  def self.run(filename, questions)
    f1 = "exam-#{filename}.md"
    f2 = "solu-#{filename}.md"
    puts "  => #{f1}, #{f2}"
    export_exam(f1, questions)
    export_solu(f2, questions)
  end

  def self.export_exam(filename, questions)
    f = File.open(File.join('output', filename), 'w')
    t = "```\nFilename : #{filename}\nDate     : #{Time.now}\n```\n\n"
    f.write(t)
    questions.each_with_index do |q,i|
      f.write("---\n")
      f.write("**Question #{(i+1)}**\n\n")
      f.write("#{q[:text]}\n\n")
    end
    f.close
  end

  def self.export_solu(filename, questions)
  end
end
