module Convolution
  class Fourier
    include FourierTransform

    def initialize(first_function_points, second_function_points, interval)
      @first_function_points = first_function_points
      @second_function_points = second_function_points
      @interval = interval
    end

    def calculate
      first_components = initialize_components(@first_function_points)
      second_components = initialize_components(@second_function_points)
      result_variables = multiply(first_components, second_components)

      FourierTransform::Fast.reverse(result_variables)
    end

    private

    def multiply(first_components, second_components)
      (0...@interval).map do |i|
        first_components[i] * second_components[i]
      end
    end

    def initialize_components(points)
      FourierTransform::Fast.direct(points)
    end
  end
end
