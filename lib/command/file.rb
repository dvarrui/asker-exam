# frozen_string_literal: true

require 'rainbow'
require_relative '../tool/create_exams'

# Quizz#file
class Quizz < Thor
  map ['f', '-f', '--file'] => 'file'
  desc 'file NAME', 'Build exams, from YAML input file.'
  option :color, type: :boolean
  long_desc <<-LONGDESC
  Create exams, from questions input file (YAML format).

  LONGDESC
  def file(filename)
    Rainbow.enabled = false if options['color'] == false
    CreateExams.debug(filename)
  end

  def method_missing(method, *_args, &_block)
    file(method.to_s)
  end
end
