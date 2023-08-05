require_relative "export2md"
require_relative "export2txt"

class ExportFactory
  ##
  # Create exam/solution file.
  # @param id [Integer] Exam ID number
  # @param filename [String] Exam file name
  # @param questions [Array] Array of questions
  def self.get(format)
    case format
    when "md"
      Export2md.new
    when "txt"
      Export2txt.new
    else
      puts "[ERROR] Unkown output format #{format}"
      puts "        Available formats: txt, md"
    end
  end
end
