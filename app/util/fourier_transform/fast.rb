module FourierTransform
  class Fast
    include Common

    def self.transform(direction, rate, values, intervals = values.size)
      primary_result = inner_loop(direction, Complicator.run(values), intervals)

      result = []
      primary_result.each_with_index do |value, index|
        index = BinaryReverse.reverse(index, intervals)
        result[index] = rate * value
      end
      result
    end

    def self.inner_loop(direction, values, intervals)
      return values if intervals == 1

      real = Math.cos(2 * PI / intervals)
      imaginary = direction * Math.sin(2 * PI / intervals)
      wn = Complex(real, imaginary)
      w = Complex(1.0, 0.0)
      b = []
      c = []

      (0...intervals / 2).each do |j|
        b.push(values[j] + values[j + intervals / 2])
        c.push((values[j] - values[j + intervals / 2]) * w)
        w *= wn
      end

      intervals /= 2

      b = inner_loop(direction, b, intervals)
      c = inner_loop(direction, c, intervals)
      b + c
    end
  end
end
