module Fourier
  module Fast
    class Transformation
      include Math

      def transform(rate, direction, variables, components, intervals)
        variables = initial_transform(direction, variables, intervals)
        Helpers.hash_initialize(rate, variables, components, intervals)
      end

      def parse_result(direct_conversion, reverse_conversion)
        {
          :direct => {
            :indexes => (0..direct_conversion.size - 1).collect {|i| i},
            :values => direct_conversion.collect { |unit| unit[1][:value][:complex].arg }
          },
          :reverse => {
            :indexes => (0..reverse_conversion.size - 1).collect {|i| i},
            :values => reverse_conversion.collect { |unit| unit[1][:value][:complex].real }
          }
        }
      end

      private

      def initial_transform(dir, variables, intervals)
        return variables if variables.size == 1

        wn = Complex(cos(2 * PI / intervals), dir * sin(2 * PI / intervals))
        w = Complex(1.0, 0.0)
        b = []
        c = []

        (0...intervals / 2).each do |j|
          b.push(variables[j] + variables[j + intervals / 2])
          c.push((variables[j] - variables[j + intervals / 2]) * w)
          w = w * wn
        end

        b = initial_transform(dir, b, intervals / 2)
        c = initial_transform(dir, c, intervals / 2)
        b + c
      end
    end
  end
end