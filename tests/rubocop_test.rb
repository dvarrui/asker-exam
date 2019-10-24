#!/usr/bin/env ruby

require 'minitest/autorun'

# MiniTest Rubocop
class RubocopTest < Minitest::Test
  def setup
    @files = {}

    @files[:lib] = []
    @files[:lib] << 'Rakefile'
    @files[:lib] << 'lib/application.rb'
#    @files[:lib] << 'lib/project.rb'
    @files[:lib] << 'lib/tool.rb'

    @files[:ai] = []
#   @files[:ai] << 'lib/ai/concept_ai.rb'
    @files[:ai] << 'lib/ai/stages/main.rb'

    @files[:command] = []
    @files[:command] << 'lib/command/main.rb'
    @files[:command] << 'lib/command/create.rb'
    @files[:command] << 'lib/command/delete.rb'
    @files[:command] << 'lib/command/download.rb'
    @files[:command] << 'lib/command/editor.rb'
#    @files[:command] << 'lib/command/file.rb'
    @files[:command] << 'lib/command/version.rb'

    @files[:data] = []
#    @files[:data] << 'lib/data/column.rb'
#    @files[:data] << 'lib/data/concept.rb'

    @files[:exporter] = []
    @files[:exporter] << 'lib/exporter/code_gift_exporter.rb'

    @files[:lang] = []
    @files[:lang] << 'lib/lang/lang_factory.rb'
#    @files[:lang] << 'lib/lang/lang.rb'

    @files[:loader] = []
#    @files[:data] << 'lib/loader/project_loader.rb'

    @files[:sinatra] = []
    @files[:sinatra] << 'lib/sinatra/formatter/concept_haml_formatter.rb'
    @files[:sinatra] << 'lib/sinatra/formatter/table_haml_formatter.rb'
  end

  def test_rubocop_lib
    @files[:lib].each do |file|
      output = `rubocop #{file}`
      lines = output.split("\n")
      assert_equal true, lines.any?(/file inspected, no offenses detected/)
    end
  end

  def test_rubocop_ai
    @files[:ai].each do |file|
      output = `rubocop #{file}`
      lines = output.split("\n")
      assert_equal true, lines.any?(/file inspected, no offenses detected/)
    end
  end

  def test_rubocop_command
    @files[:command].each do |file|
      output = `rubocop #{file}`
      lines = output.split("\n")
      assert_equal true, lines.any?(/file inspected, no offenses detected/)
    end
  end

  def test_rubocop_data
    @files[:data].each do |file|
      output = `rubocop #{file}`
      lines = output.split("\n")
      assert_equal true, lines.any?(/file inspected, no offenses detected/)
    end
  end

  def test_rubocop_exporter
    @files[:exporter].each do |file|
      output = `rubocop #{file}`
      lines = output.split("\n")
      assert_equal true, lines.any?(/file inspected, no offenses detected/)
    end
  end

  def test_rubocop_lang
    @files[:lang].each do |file|
      output = `rubocop #{file}`
      lines = output.split("\n")
      assert_equal true, lines.any?(/file inspected, no offenses detected/)
    end
  end

  def test_rubocop_loader
    @files[:loader].each do |file|
      output = `rubocop #{file}`
      lines = output.split("\n")
      assert_equal true, lines.any?(/file inspected, no offenses detected/)
    end
  end

  def test_rubocop_sinatra
    @files[:sinatra].each do |file|
      output = `rubocop #{file}`
      lines = output.split("\n")
      assert_equal true, lines.any?(/file inspected, no offenses detected/)
    end
  end
end
