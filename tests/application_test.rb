#!/usr/bin/ruby

require 'minitest/autorun'
require_relative '../lib/application'

# Test Application singleton
class ApplicationTest < Minitest::Test
  def test_params
    app = Application.instance
    app.reset
    assert_equal 'quizzer', app.name
    assert_equal '0.0.0', app.version
    assert_equal Hash.new, app.params
  end

  def test_get
    app = Application.instance
    app.reset

    assert_equal 3, app.get(:required_exams)
    assert_equal 10, app.get(:required_qxe)
    assert_equal :txt, app.get(:exams_format)
    assert_nil app.get(:filepath)
    assert_nil app.get(:projectname)

    inputs = { required_exams: 1, required_qxe: 50, projectname: 'foo' }
    app.params.merge! inputs
    assert_equal 1, app.get(:required_exams)
    assert_equal 50, app.get(:required_qxe)
    assert_equal 'foo', app.get(:projectname)

    app.reset
    assert_equal 3, app.get(:required_exams)
    assert_equal 10, app.get(:required_qxe)
    assert_nil app.get(:projectname)
  end
end
