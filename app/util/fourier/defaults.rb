module Fourier
  class Defaults
    include Math

    def self.function
      lambda { |x| Math.sin(3 * x) + Math.cos(3 * x) }
    end

    def self.period
      2 * PI / 3
    end

    def self.intervals
      32
    end
  end
end
