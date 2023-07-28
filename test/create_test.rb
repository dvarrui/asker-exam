require "test/unit"
require_relative "../lib/asker/exam/create"

class CreateTest < Test::Unit::TestCase
  def test_proces_input_params
    app = Application.instance
    app.reset

    filepath = "foo.yaml"
    options = {op1: "op1", op2: "op2"}
    params = {param1: "param1", param2: "param2"}
    Create.process_input_params(filepath, options, params)
    assert_equal filepath, app.get(:filepath)
    assert_equal options[:op1], app.get(:op1)
    assert_equal options[:op2], app.get(:op2)
    assert_equal params[:param1], app.get(:param1)
    assert_equal params[:param2], app.get(:param2)
  end
end
