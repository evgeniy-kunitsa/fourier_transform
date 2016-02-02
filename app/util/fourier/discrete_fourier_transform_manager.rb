module Fourier
  class DiscreteFourierTransformManager
    include Math

    def initialize()
      @dft_components = {}
    end

    def direct_conversion
      initialize_components(1, -1)
      @dft_components
    end

    def reverse_conversion
      initialize_components(1/32, 1)
      @dft_components
    end

    private

    def initialize_components(rate, dir)
      (0...32).each do |m|
        @dft_components[m] = {}
        @dft_components[m][:components] = []
        @dft_components[m][:value] = 0
        (0...32).each do |n|
          component = (cos(3*n) + sin(3*n)) *
            Complex(cos(2*PI*n*m/32), dir*sin(2*PI*n*m/32))
          @dft_components[m][:components].push(component)
          @dft_components[m][:value] += component
        end
        @dft_components[m][:value] *= rate
      end
      @dft_components
    end
  end
end
