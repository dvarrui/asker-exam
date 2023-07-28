require "test/unit"
require_relative "../lib/asker/exam/application"
require_relative "../lib/asker/exam/version"

class ApplicationTest < Test::Unit::TestCase
  def test_params
    app = Application.instance
    app.reset
    assert_equal "asker-exam", Asker::Exam::NAME
    cond = app.params == {}
    assert_equal true, cond
  end

  def test_get
    app = Application.instance
    app.reset

    assert_equal 3, app.get(:required_exams)
    assert_equal 10, app.get(:required_qxe)
    assert_equal :txt, app.get(:exams_format)
    assert_nil app.get(:filepath)
    assert_nil app.get(:projectname)

    inputs = {required_exams: 1, required_qxe: 50, projectname: "foo"}
    app.params.merge! inputs
    assert_equal 1, app.get(:required_exams)
    assert_equal 50, app.get(:required_qxe)
    assert_equal "foo", app.get(:projectname)

    app.reset
    assert_equal 3, app.get(:required_exams)
    assert_equal 10, app.get(:required_qxe)
    assert_nil app.get(:projectname)
  end
end
