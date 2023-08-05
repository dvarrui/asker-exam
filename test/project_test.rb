require "test/unit"
require_relative "../lib/asker/exam/project"

class ProjectTest < Test::Unit::TestCase
  def test_value
    project = Project.new
    assert_equal 3, project.value[:default][:enumber]
    assert_equal 10, project.value[:default][:qnumber]
    assert_equal :txt, project.value[:default][:format]
    assert_equal ({}), project.value[:params]
  end

  def test_get
    project = Project.new
    assert_equal 3, project.get(:enumber)
    assert_equal 10, project.get(:qnumber)
    assert_equal :txt, project.get(:format)
  end
end
