
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
      f.write(formatter_qexam(q))
    end
    f.close
  end

  def self.formatter_qexam(question)
    if question[:type] == :choice
      t = "#{question[:text]}\n\nChoose option:\n"
      question[:options].each_with_index do |v,i|
        t += "#{(i+1)}. #{v}\n"
      end
      return t
    elsif question[:type] == :match
        t = "#{question[:text]}\n\nAssociate columns:\n" +
            "| Column A | Column B |\n" +
            "| -------- | -------- |\n"
        question[:matching].each do |v|
          t += "| #{v[0]} | #{v[1]} |\n"
        end
        return t
    elsif question[:type] == :short
      return "#{question[:text]}\n\nWrite your answer:\n\n"
    end
  end

  def self.export_solu(filename, questions)
  end
end
