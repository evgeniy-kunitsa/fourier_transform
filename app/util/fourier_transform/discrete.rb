module FourierTransform
  class Discrete
    include FourierTransform::Common

    def self.transform(direction, rate, values, intervals = values.size)
      (0...intervals).map do |m|
        rate * inner_loop(direction, Complicator.run(values), intervals, m)
      end
    end

    def self.inner_loop(direction, values, intervals, m)
      (0...intervals).reduce(0) do |value, n|
        real = Math.cos(2 * PI * n * m / intervals)
        imaginary = direction * Math.sin(2 * PI * n * m / intervals)
        value + values[n] * Complex(real, imaginary)
      end
    end
  end
end
