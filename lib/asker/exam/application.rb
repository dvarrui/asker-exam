# frozen_string_literal: true

require 'singleton'

# Global parameters
class Application
  include Singleton

  attr_reader :params

  def initialize
    reset
  end

  def reset
    @default = { required_exams: 3,
                 required_qxe: 10,
                 exams_format: :txt }
    @params = {}
  end

  def get(key)
    return @params[key] if @params[key]

    @default[key]
  end
end
