# frozen_string_literal: true

require 'singleton'

# Global parameters
class Application
  include Singleton

  attr_reader :config
  attr_reader :name, :version, :default

  def initialize
    reset
  end

  def reset
    @name = 'quizz'
    @version = '0.0.0'
    @default = { questions_number: 10,
                 exams_number: 1,
                 exams_format: :txt}
  end
end
