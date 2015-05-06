class BirthdayParser
  def self.parse(birthday)
    year = Date.today.year
    month, day = birthday.split("/").map(&:to_i)

    return nil if month.nil? or day.nil?
    if Date.valid_civil?(year, month, day)
      next_birthday = Date.civil(year, month.to_i, day.to_i)
      if next_birthday < Date.today
        next_birthday = next_birthday.next_year
      end
      next_birthday
    elsif Date.valid_civil?(year + 1, month, day)
      next_birthday = Date.civil(year + 1, month.to_i, day.to_i)
    end
  end
end
