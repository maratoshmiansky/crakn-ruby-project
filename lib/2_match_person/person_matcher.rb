# frozen_string_literal: true

class PersonMatcher
  attr_reader :people

  def initialize(*people)
    @people = people
  end

  def find_match(first_name: "", middle_name: "", last_name: "")
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
    # return empty array if no name data passed
    return [] if first_name.empty? && middle_name.empty? && last_name.empty?

    # only select people with matching first, middle and/or last name(s) and return the array
    @people.select do |person|
      first_name_condition(person) && middle_name_condition(person) && last_name_condition(person)
    end
  end

  def first_name_condition(person)
    person[:first_name] == @first_name || @first_name.empty? # was a first name passed to find_match?
  end

  def middle_name_condition(person)
    person[:middle_name] == @middle_name || @middle_name.empty? # was a middle name passed to find_match?
  end

  def last_name_condition(person)
    person[:last_name] == @last_name || @last_name.empty? # was a last name passed to find_match?
  end
end
