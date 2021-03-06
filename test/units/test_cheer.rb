require_relative '../test_helper'
require_relative '../../lib/cheer'

class TestCheer < Minitest::Test
  def test_happy_path_name
    actual = Cheer.for_person("Ed")
    expected = "Give me an.. E!\n" +
               "Give me a... D!\n" +
               "Ed's just GRAND!"
    assert_equal expected, actual
  end

  def test_name_thats_blank
    assert_raises(ArgumentError) do
      Cheer.for_person("")
    end
  end

  def test_name_thats_all_whitespace
    assert_raises(ArgumentError) do
      Cheer.for_person("  ")
    end
  end

  def test_name_that_has_no_word_characters
    assert_raises(ArgumentError) do
      Cheer.for_person("*!?")
    end
  end

  def test_birthday_instead_of_name
    assert_raises(ArgumentError) do
      Cheer.for_person("08/25")
    end
  end

  def test_name_with_spaces
    actual = Cheer.for_person("Mary Jane")
    expected = "Give me an.. M!\n" +
               "Give me an.. A!\n" +
               "Give me an.. R!\n" +
               "Give me a... Y!\n" +
               "Give me a... J!\n" +
               "Give me an.. A!\n" +
               "Give me an.. N!\n" +
               "Give me an.. E!\n" +
               "Mary Jane's just GRAND!"
    assert_equal expected, actual
  end

  def test_name_with_hyphens
    actual = Cheer.for_person("Mary-Jane")
    expected = "Give me an.. M!\n" +
               "Give me an.. A!\n" +
               "Give me an.. R!\n" +
               "Give me a... Y!\n" +
               "Give me a... J!\n" +
               "Give me an.. A!\n" +
               "Give me an.. N!\n" +
               "Give me an.. E!\n" +
               "Mary-Jane's just GRAND!"
    assert_equal expected, actual
  end

  def test_all_an_letters
    actual = Cheer.for_person("AEFHILMNORSX")
    expected = "Give me an.. A!\n" +
               "Give me an.. E!\n" +
               "Give me an.. F!\n" +
               "Give me an.. H!\n" +
               "Give me an.. I!\n" +
               "Give me an.. L!\n" +
               "Give me an.. M!\n" +
               "Give me an.. N!\n" +
               "Give me an.. O!\n" +
               "Give me an.. R!\n" +
               "Give me an.. S!\n" +
               "Give me an.. X!\n" +
               "AEFHILMNORSX's just GRAND!"
    assert_equal expected, actual
  end

  def test_birthday_today
    today = Date.today
    actual = Cheer.for_birthday("#{today.month}/#{today.day}")
    expected = "Awesome! Your birthday is today! Happy Birthday!"
    assert_equal actual, expected
  end

  def test_birthday_tomorrow
    tommorrow = Date.today + 1
    actual = Cheer.for_birthday("#{tommorrow.month}/#{tommorrow.day}")
    expected = "Awesome! Your birthday is in 1 day! Happy Birthday in advance!"
    assert_equal actual, expected
  end

  def test_birthday_yesterday
    yesterday = Date.today - 1
    actual = Cheer.for_birthday("#{yesterday.month}/#{yesterday.day}")
    expected = "Awesome! Your birthday is in 365 days! Happy Birthday in advance!"
    assert_equal actual, expected
  end

  def test_birthday_in_near_future
    near_future = Date.today + 28
    actual = Cheer.for_birthday("#{near_future.month}/#{near_future.day}")
    expected = "Awesome! Your birthday is in 28 days! Happy Birthday in advance!"
    assert_equal actual, expected
  end

  def test_backwards_day
    assert_raises(ArgumentError) do
      Cheer.for_birthday("25/05")
    end
  end
end
