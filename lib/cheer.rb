class Cheer
  AN_LETTERS = "HALFNORSEMIX"

  def self.for_birthday(birthday)
    "Awesome! Your birthday is in 1 day! Happy Birthday in advance!"
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
