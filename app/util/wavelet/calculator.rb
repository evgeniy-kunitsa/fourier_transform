module Wavelet
  class Calculator
    attr_reader :direct_results, :reverse_results, :intermed_results

    def initialize(points)
      @intermed_results = []
      @direct_results = direct(points)
      @reverse_results = reverse(@direct_results)
    end

    def direct(points)
      n = points.size

      if n == 1
        return points
      end

      high = []
      low = []

      (0...n / 2).each do |i|
        high.push((points[i * 2] - points[i * 2 + 1]) / 2.0)
        low.push((points[i * 2] + points[i * 2 + 1]) / 2.0)
      end

      @intermed_results.push low

      high + direct(low)
    end

    def reverse(points)
      n = points.size

      if n == 1
        return points
      end

      res = []
      temp = reverse(points[(n / 2)...n])

      (0...n / 2).each do |i|
        j = i * 2
        res[j] = temp[i] + points[i]
        res[j + 1] = temp[i] - points[i]
      end

      res
    end
  end
end
