# frozen_string_literal: true

class CalculateAge
  def self.calculate(age_at_birth, age_at_death)
    return "death date must be greater than birth date" if age_at_birth > age_at_death

    years_diff = age_at_death.year - age_at_birth.year
    months_diff_condition = age_at_death.mon < age_at_birth.mon
    months_equal_condition = age_at_death.mon == age_at_birth.mon
    days_diff_condition = age_at_death.mday < age_at_birth.mday
    # 1) subtract birth year from death year to get initial value
    # 2) subtract 1 from initial value IF death month < birth month OR (death month = birth month AND death day < birth day) to get correct age (yrs)
    # 3) return correct age
    years_diff - (months_diff_condition || (months_equal_condition && days_diff_condition) ? 1 : 0)
  end
end
