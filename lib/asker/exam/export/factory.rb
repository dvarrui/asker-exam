require_relative "md_exporter"
require_relative "txt_exporter"

module ExportExam
  ##
  # Create exam/solution file.
  # @param id [Integer] Exam ID number
  # @param filename [String] Exam file name
  # @param questions [Array] Array of questions
  def self.call(id, name, questions, format)
    case format
    when "md"
      MDExporter.call(id, name, questions)
    when "txt"
      TXTExporter.call(id, name, questions)
    else
      puts "[ERROR] Unkown output format #{format}"
      puts "        Available formats: txt, md"
    end
  end
end
