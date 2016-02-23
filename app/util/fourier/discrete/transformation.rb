module Fourier
  module Discrete
    class Transformation
      include Math

      def transform(rate, direction, variables, components, intervals)
        (0...intervals).each do |m|
          (0...intervals).each do |n|
            component = variables[n] *
              Complex(cos(2 * PI * n * m / intervals), direction * sin(2 * PI * n * m / intervals))
            components[m][:components].push(component)
            components[m][:value][:complex] += component
          end
          components[m][:value][:complex] *= rate
          components[m][:value][:abs] = components[m][:value][:complex].abs
        end
        components
      end

      def parse_result(direct_conversion, reverse_conversion)
        {
          :direct => {
            :indexes => (0..direct_conversion.size - 1).collect {|i| i},
            :values => direct_conversion.collect { |unit| unit[1][:value][:abs] }
          },
          :reverse => {
            :indexes => (0..reverse_conversion.size - 1).collect {|i| i},
            :values => reverse_conversion.collect { |unit| unit[1][:value][:complex].real }
          }
        }
      end
    end
  end
end
