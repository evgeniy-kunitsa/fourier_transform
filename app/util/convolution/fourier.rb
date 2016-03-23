module Convolution
  class Fourier
    include FourierTransform

    DIRECT = -1
    REVERSE = 1

    def initialize(first_function_points, second_function_points, interval)
      @first_function_points = first_function_points
      @second_function_points = second_function_points
      @interval = interval
    end

    def calculate
      first_components = initialize_components(@first_function_points)
      second_components = initialize_components(@second_function_points)
      result_variables = multiply(first_components, second_components)
      FourierTransform::Fast.reverse(result_variables).map { |v| v / @first_function_points.size}
    end

    private

    def multiply(first_components, second_components)
      result_components = []
      (0...@interval).each do |i|
        value = first_components[i] * second_components[i]
        result_components[i] = value
      end
      result_components
    end

    def initialize_components(points)
      FourierTransform::Fast.direct(points)
    end
  end
end
