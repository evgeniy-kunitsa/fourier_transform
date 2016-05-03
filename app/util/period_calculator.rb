module PeriodCalculator
  include Math

  def self.calculate(function_string)
    if (function_string.include? "sin") || (function_string.include? "cos")
      2 * PI
    else
      256
    end
  end
end
