require_relative "../version"

class Export2txt
  def call(name, id, questions)
    filename1 = format("%s-exam-%02d.txt", name, id)
    filename2 = format("%s-solu-%02d.txt", name, id)
    puts "==> asker-exam: #{filename1}, #{filename2}"
    questions.shuffle!
    export_exam(filename1, questions)
    export_solu(filename2, questions)
  end

  private

  def export_exam(filename, questions)
    file = File.open(File.join("output", filename), "w")
    file.write("-" * 50 + "\n")
    file.write("  AskerExam : #{Asker::Exam::VERSION}\n")
    file.write("  Filename  : #{filename}\n")
    file.write("  Datetime  : #{Time.new}\n")
    file.write("-" * 50 + "\n\n")
    export_questions(file, questions)
    file.close
  end

  def export_solu(filename, questions)
    file = File.open(File.join("output", filename), "w")
    file.write("-" * 50 + "\n")
    file.write("  AskerExam : #{Asker::Exam::VERSION}\n")
    file.write("  Filename  : #{filename}\n")
    file.write("  Datetime  : #{Time.new}\n")
    file.write("-" * 50 + "\n\n")
    export_solutions(file, questions)
    file.close
  end

  def export_questions(file, questions)
    questions.each_with_index do |question, index|
      file.write(format("%2d) ", index + 1))
      if question[:type] == :boolean
        file.write("#{question[:text]}\n")
        file.write("    (True/False)\n")
      elsif question[:type] == :choice
          file.write("#{question[:text]}\n")
          question[:options].each_with_index do |option, index|
            letter = %w[a b c d][index]
            file.write("    #{letter}) #{option}\n")
          end
          file.write("    (Choose option)\n")
        elsif %i[match ddmatch].include? question[:type]
            file.write("#{question[:text]}\n")
            list1 = []
            list2 = []
            question[:answer].each do
              list1 << _1
              list2 << _2
            end
            file.write("    List1: #{list1.shuffle}\n")
            file.write("    List2: #{list2.shuffle}\n")
            file.write("    (Match)\n")
      elsif question[:type] == :ordering
          file.write("#{question[:type]}\n")
          file.write("   #{question[:text]}\n")
          question[:answer].shuffle.each do
            file.write(" " * 4 + "#{_1}\n")
          end
          file.write("    (Order)\n")
      elsif question[:type] == :short
        file.write("#{question[:text]}\n")
        file.write("    (Write your answer)\n")
      else
        file.write("#{question[:type]}\n")
        file.write("   #{question[:text]}\n")
      end
      file.write("\n")
    end
  end

  def export_solutions(file, questions)
    questions.each_with_index do |question, index|
      file.write(format("%2d) ", index + 1))
      if %i[match ddmatch].include? question[:type]
        file.write("#{question[:type].to_s.rjust(8)}:\n")
        question[:answer].each do
          file.write("#{_1.rjust(15)} <-> #{_2}\n")
        end
      elsif question[:type] == :choice
        letter_index = question[:options].index question[:answer]
        letter = %w[a b c d][letter_index]
        file.write("  choice: #{letter} -> #{question[:answer]}\n")
      elsif question[:type] == :ordering
          file.write("#{question[:type].to_s.rjust(8)}:\n")
          question[:answer].each do
            file.write(" " * 14 + "#{_1}\n")
          end
      else
        file.write("#{question[:type].to_s.rjust(8)}: #{question[:answer]}\n")
      end
    end
  end
end
