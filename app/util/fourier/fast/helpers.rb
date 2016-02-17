module Fourier
  module Fast
    class Helpers
      include Math

      def self.hash_initialize(rate, variables, components, intervals)
        variables.each_with_index do |v, i|
          index = binary_reverse(i, intervals)
          components[index][:value][:complex] = rate * v
          components[index][:value][:abs] = (rate * v).abs
        end

        components
      end

      def self.binary_reverse (number, intervals)
        initial_bin = number.to_s(2)
        (Math.log(intervals, 2) - initial_bin.length).to_i.times { initial_bin.prepend('0') }
        initial_bin.reverse!.to_i(2)
      end
    end
  end
end
