module Correlation
  class Simple

    def initialize(first_function_points, second_function_points, interval)
      @first_function_points = first_function_points
      @second_function_points = second_function_points
      @interval = interval
      @result = []
    end

    def calculate
      (0...@interval).each do |m|
        temp = 0
        (0...@interval).each do |h|
          temp += @first_function_points[h] * @second_function_points[index(m + h)]
        end
        @result.push(temp / @interval)
      end
      @result
    end

    private

    def index(number)
      return number if number < @interval
      number - @interval
    end
  end
end
