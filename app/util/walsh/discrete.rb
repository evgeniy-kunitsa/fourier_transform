module Walsh
  class Discrete
    include Common

    #TODO: fix (works incorrectly)

    def self.transform(rate, values, intervals = values.size)
      r = Math.log2(intervals)

      (0...intervals).map do |m|
        rate * inner_loop(values, r, m)
      end
    end

    def self.inner_loop(values, r, m)
      (0...r).reduce(0) do |value, n|
        value + values[n] * Common::walsh(m, n, r)
      end
    end
  end
end
