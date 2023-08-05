require "test/unit"
require_relative "../lib/asker/exam/settings"

class SettingsTest < Test::Unit::TestCase
  def test_value
    Settings.load
    assert_equal 3, Settings.value[:default][:enumber]
    assert_equal 10, Settings.value[:default][:qnumber]
    assert_equal :txt, Settings.value[:default][:format]
    assert_equal ({}), Settings.value[:params]
  end

  def test_get
    Settings.load
    assert_equal 3, Settings.get(:enumber)
    assert_equal 10, Settings.get(:qnumber)
    assert_equal :txt, Settings.get(:format)
  end

  def test_set
    Settings.load
    assert_equal 3, Settings.get(:enumber)
    Settings.set(:enumber, 1)
    assert_equal 1, Settings.get(:enumber)
    assert_equal 3, Settings.value[:default][:enumber]
    assert_equal 1, Settings.value[:params][:enumber]
  end
end
