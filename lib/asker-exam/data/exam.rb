
require_relative '../export/md_exporter'

##
# Create exam file.
module Exam
  ##
  # Create exam file.
  # @param id [Integer] Exam ID number
  # @param filename [String] Exam file name
  # @param questions [Array] Array of questions
  def self.create(id, filename, questions)
    MDExporter.run("#{format('%02d',id)}-#{filename}",
                   questions)
  end
end
