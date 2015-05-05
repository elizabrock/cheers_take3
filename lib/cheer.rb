require_relative 'birthday_parser'

class Cheer
  AN_LETTERS = "HALFNORSEMIX"

  def self.for_birthday(birthday)
    today = Date.today
    next_birthday = BirthdayParser.parse(birthday)
    difference = next_birthday - today
    case difference
    when 0
      # Today is their birthday
    when 1
      #Use the singular?
    else
      #Use the plural?
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
