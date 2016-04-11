module Walsh
  class Fast
    include Common

    def self.transform(rate, values, intervals = values.size)
      primary_result = inner_loop(values, intervals)
      result = []
      primary_result.each_with_index do |value, index|
        index = BinaryReverse.reverse(index, intervals)
        result[index] = rate * value
      end
      result
    end

    def self.inner_loop(values, intervals)
      return values if intervals == 1

      b = []
      c = []

      (0...intervals / 2).each do |j|
        b.push(values[j] + values[j + intervals / 2])
        c.push((values[j] - values[j + intervals / 2]))
      end

      intervals /= 2

      b = inner_loop(b, intervals)
      c = inner_loop(c, intervals)
      b + c
    end
  end
end
