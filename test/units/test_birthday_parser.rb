require_relative '../test_helper'
require_relative '../../lib/birthday_parser'

class TestBirthdayParser < Minitest::Test
  def test_parse_feb_29
    expected = Date.civil(2016,02,29)
    actual = BirthdayParser.parse("02/29")
    assert_equal actual, expected
  end

  def test_parse_yesterday
    expected = (Date.today - 1).next_year
    actual = BirthdayParser.parse("#{expected.month}/#{expected.day}")
    assert_equal actual, expected
  end

  def test_parse_today
    expected = Date.today
    actual = BirthdayParser.parse("#{expected.month}/#{expected.day}")
    assert_equal actual, expected
  end

  def test_parse_tommorrow
    expected = Date.today + 1
    actual = BirthdayParser.parse("#{expected.month}/#{expected.day}")
    assert_equal actual, expected
  end

  def test_parse_sept_31st
    assert_nil BirthdayParser.parse("09/31")
  end

  def test_parse_poor_reading_comprehension
    assert_nil BirthdayParser.parse("August 6th")
  end

  def test_parse_non_birthday
    assert_nil BirthdayParser.parse("Anne/*")
  end

  def test_parse_backwards_day
    assert_nil BirthdayParser.parse("25/05")
  end

  def test_parse_non_existant_day
    assert_nil BirthdayParser.parse("02/31")
  end

  def test_parse_whitespace_instead_of_day
    assert_nil BirthdayParser.parse("  ")
  end

  def test_parse_blank_instead_of_day
    assert_nil BirthdayParser.parse("")
  end
end
