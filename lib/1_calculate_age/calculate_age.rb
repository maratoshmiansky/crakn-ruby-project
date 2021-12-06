# frozen_string_literal: true

class CalculateAge
  def self.calculate(age_at_birth, age_at_death)
    return "death date must be greater than birth date" if age_at_birth > age_at_death

    # 1) subtract birth year from death year to get initial value
    # 2) subtract 1 from initial value IF death month < birth month OR (death month = birth month AND death day < birth day) to get correct age (yrs)
    # 3) return correct age
    age_at_death.year - age_at_birth.year - ((age_at_death.mon < age_at_birth.mon) || (age_at_death.mon == age_at_birth.mon && age_at_death.mday < age_at_birth.mday) ? 1 : 0)
  end
end
