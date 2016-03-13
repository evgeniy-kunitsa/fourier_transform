module Fourier
  module Discrete
    class Transformation
      include Math

      def transform(rate, direction, variables, components, intervals)
        (0...intervals).each do |m|
          (0...intervals).each do |n|
            real = cos(2 * PI * n * m / intervals)
            imaginary = direction * sin(2 * PI * n * m / intervals)
            component = variables[n] * Complex(real, imaginary)
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
          direct: {
            indices: (0..direct_conversion.size - 1).map { |i| i },
            values: direct_conversion.map do |unit|
              unit[1][:value][:abs]
            end
          },
          reverse: {
            indices: (0..reverse_conversion.size - 1).map { |i| i },
            values: reverse_conversion.map do |unit|
              unit[1][:value][:complex].real
            end
          }
        }
      end
    end
  end
end
