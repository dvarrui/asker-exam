
require_relative 'md_exporter'

##
# Create 1 exam file.
module ExportExam
  ##
  # Create exam file.
  # @param id [Integer] Exam ID number
  # @param filename [String] Exam file name
  # @param questions [Array] Array of questions
  def self.call(id, filename, questions)
    MDExporter.run("#{format('%02d',id)}-#{filename}",
                   questions)
  end
end
