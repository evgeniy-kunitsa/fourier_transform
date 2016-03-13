module Fourier
  class Defaults
    include Math

    def self.params
      {
        sin_multiplier: 3,
        cos_multiplier: 3,
        sign: 1
      }
    end

    def self.period
      2 * PI / 3
    end

    def self.intervals
      32
    end
  end
end
