# frozen_string_literal: true

class PersonMatcher
  attr_reader :people

  def initialize(*people)
    @people = people
  end

  # set each keyword parameter value in find_match to "" by default
  def find_match(first_name: "", middle_name: "", last_name: "")
    # return empty array if no name data passed
    return [] if first_name.empty? && middle_name.empty? && last_name.empty?

    # select all people with matching name arguments only (filtering out missing name argument(s))
    @people.select do |person|
      first_name_condition = person[:first_name] == first_name || first_name.empty?
      middle_name_condition = person[:middle_name] == middle_name || middle_name.empty?
      last_name_condition = person[:last_name] == last_name || last_name.empty?

      first_name_condition && middle_name_condition && last_name_condition
    end
  end
end
