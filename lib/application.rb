# frozen_string_literal: true

require 'singleton'

# Global parameters
class Application
  include Singleton

  attr_reader :config, :name, :version

  def initialize
    reset
  end

  def reset
    @name = 'quizz'
    @version = '0.0.0'
  end
end
