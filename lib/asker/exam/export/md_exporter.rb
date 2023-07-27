##
# Export questions to filename
module MDExporter
  ##
  # Export 1 exam and his solution
  # @param filename [String] File name
  # @param questions [Array] Array of questions
  def self.call(id, name, questions)
    filename1 = format("%s-exam-%02d.md", name, id)
    filename2 = format("%s-solu-%02d.md", name, id)
    puts "    asker-exam: #{filename1}, #{filename2}"
    export_exam(filename1, questions)
    export_solu(filename2, questions)
  end

  def self.export_exam(filename, questions)
    f = File.open(File.join("output", filename), "w")
    t = "```\nFilename : #{filename}\nDate     : #{Time.now}\n```\n\n"
    f.write(t)
    questions.each_with_index do |q, i|
      f.write("---\n")
      f.write("**Question #{i + 1}**\n\n")
      f.write(formatter_qexam(q))
    end
    f.close
  end

  def self.formatter_qexam(question)
    if question.nil?
      puts "[WARN] question.nil?"
    elsif question[:type] == :choice
      t = "#{question[:text]}\n\nChoose option:\n"
      question[:options].each_with_index do |v, i|
        t += "#{i + 1}. #{v}\n"
      end
      t
    elsif question[:type] == :match
      t = "#{question[:text]}\n\nAssociate columns:\n\n" \
        "| Column A | Column B |\n" \
        "| -------- | -------- |\n"
      question[:matching].each do |v|
        t += "| #{v[0]} | #{v[1]} |\n"
      end
      t + "\n"
    elsif question[:type] == :short
      "#{question[:text]}\n\nWrite your answer:\n\n"
    end
  end

  def self.export_solu(filename, questions)
    f = File.open(File.join("output", filename), "w")
    t = "```\nFilename : #{filename}\nDate     : #{Time.now}\n```\n\n"
    f.write(t)
    questions.each_with_index do |q, i|
      f.write("---\n")
      f.write("**Question #{i + 1}**: ")
      f.write(formatter_qsolu(q))
    end
    f.close
  end

  def self.formatter_qsolu(question)
    if question.nil?
      "[WARN] question.nil?"
    elsif question[:type] == :boolean
      "#{question[:answer]}\n"
    elsif question[:type] == :choice
      "#{question[:answer]}\n"
    elsif question[:type] == :short
      a = question[:answer]
      a = question[:answer].join(", ") if a.instance_of?(Array)
      "#{a}\n"
    elsif question[:type] == :match
      t = "\n\n| Column A | Column B |\n" \
        "| -------- | -------- |\n"
      question[:answer].each do |v|
        t += "| #{v[0]} | #{v[1]} |\n"
      end
      t
    else
      "[ERROR] #{question[:type]} not found!\n"
    end
  end
end
