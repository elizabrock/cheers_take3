require_relative 'birthday_parser'

class Cheer
  AN_LETTERS = "HALFNORSEMIX"

  def self.for_birthday(birthday)
    today = Date.today
    next_birthday = BirthdayParser.parse(birthday)
    raise ArgumentError if next_birthday.nil?
    difference = next_birthday - today
    case difference
    when 0
      "Awesome! Your birthday is today! Happy Birthday!"
    when 1
      "Awesome! Your birthday is in 1 day! Happy Birthday in advance!"
    else
      "Awesome! Your birthday is in #{difference.to_i} days! Happy Birthday in advance!"
    end
  end

  def self.for_person(name)
    name.chomp!
    adjusted_name = name.upcase.gsub(/[^A-Z]*/,'')
    raise ArgumentError if adjusted_name.empty?
    output = ""
    adjusted_name.each_char do |char|
      article = (AN_LETTERS.include? char) ? "an.." : "a..."
      output << "Give me #{article} #{char}!\n"
    end
    output + "#{name}'s just GRAND!"
  end
end
