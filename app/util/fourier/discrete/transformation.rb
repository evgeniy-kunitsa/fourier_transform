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
    end
  end
end
