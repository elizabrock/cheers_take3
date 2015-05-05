require_relative '../test_helper'

class TestCheers < Minitest::Test

  def test_happy_path
    shell_output = ""
    expected = ""
    IO.popen('./cheers', 'r+') do |pipe|
      expected << "Hello, what's your name?\n"
      pipe.puts "Ed"
      expected << "Give me an.. E!\n"
      expected << "Give me a... D!\n"
      expected << "Ed's just GRAND!\n"
      expected << "Hey Ed, what's your birthday? (mm/dd)\n"
      pipe.puts "05/06"
      expected << "Awesome! Your birthday is in 1 day! Happy Birthday in advance!\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_happy_path2
    shell_output = ""
    expected = ""
    IO.popen('./cheers', 'r+') do |pipe|
      expected << "Hello, what's your name?\n"
      pipe.puts "Bo"
      expected << "Give me a... B!\n"
      expected << "Give me an.. O!\n"
      expected << "Bo's just GRAND!\n"
      expected << "Hey Bo, what's your birthday? (mm/dd)\n"
      pipe.puts "05/04"
      expected << "Awesome! Your birthday is in 364 days! Happy Birthday in advance!\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_no_input
    shell_output = ""
    expected = ""
    IO.popen('./cheers', 'r+') do |pipe|
      expected << "Hello, what's your name?\n"
      pipe.puts ""
      expected << "I'm sorry, what was your name again?"
      pipe.puts ""
      expected << "I'm sorry, what was your name again?"
      pipe.puts "Ed"
      expected << "Give me an.. E!\n"
      expected << "Give me a... D!\n"
      expected << "Ed's just GRAND!\n"
      expected << "Hey Ed, what's your birthday? (mm/dd)\n"
      pipe.puts "25/05"
      expected << "I'm sorry, I don't understand :( Try again next time.\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end

  def test_bad_birthday_format
    shell_output = ""
    expected = ""
    IO.popen('./cheers', 'r+') do |pipe|
      expected << "Hello, what's your name?\n"
      pipe.puts "Ed"
      expected << "Give me an.. E!\n"
      expected << "Give me a... D!\n"
      expected << "Ed's just GRAND!\n"
      expected << "Hey Ed, what's your birthday? (mm/dd)\n"
      pipe.puts "25/05"
      expected << "I couldn't understand that. Could you give that to me in mm/dd format?\n"
      pipe.puts "12/2001"
      expected << "I couldn't understand that. Could you give that to me in mm/dd format?\n"
      pipe.puts "05/25"
      expected << "Awesome! Your birthday is in 20 days! Happy Birthday in advance!\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected, shell_output
  end
end
