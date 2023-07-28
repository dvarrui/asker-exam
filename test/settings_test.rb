require "test/unit"
require_relative "../lib/asker/exam/settings"

class SettingsTest < Test::Unit::TestCase
  def test_read_yaml
    assert_equal 3, Settings.value[:exams]
    assert_equal 10, Settings.value[:qxe]
    assert_equal :txt, Settings.value[:format]
  end
end
