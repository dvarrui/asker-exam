#!/usr/bin/env ruby

require 'minitest/autorun'

# MiniTest Rubocop
class RubocopTest < Minitest::Test
  def setup
    @files = {}

    @files[:lib] = []
    @files[:lib] << 'Rakefile'
    @files[:lib] << 'lib/application.rb'
  end

  def test_rubocop_lib
    @files[:lib].each do |file|
      output = `rubocop #{file}`
      lines = output.split("\n")
      assert_equal true, lines.any?(/file inspected, no offenses detected/)
    end
  end
end
