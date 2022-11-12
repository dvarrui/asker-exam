
require_relative 'md_exporter'

module ExportExam
  ##
  # Create exam/solution file.
  # @param id [Integer] Exam ID number
  # @param filename [String] Exam file name
  # @param questions [Array] Array of questions
  def self.call(id, name, questions)
    MDExporter.call(id, name, questions)
  end
end
