module Fourier
  class DiscreteFourierTransformManager
    include Math

    FUNCTION_PERIOD = 2*PI/3
    N = 32

    def initialize()
      @dft_components = {}
    end

    def direct_conversion
      initialize_components(1.0/32.0, -1)
      @dft_components
    end

    def reverse_conversion
      initialize_components(1, 1)
      @dft_components
    end

    def original_function_plot_points
      plot_points = { x: [], y: [] }
      ( -FUNCTION_PERIOD..FUNCTION_PERIOD ).step( FUNCTION_PERIOD * 2 / (N - 1) ) do |argument|
        plot_points[:x].push argument.round(2)
        plot_points[:y].push original_function(argument)
      end
      plot_points
    end

    def original_function(argument)
      cos(3 * argument) + sin(3 * argument)
    end

    private

    def initialize_components(rate, dir)
      (0...32).each do |m|
        @dft_components[m] = {}
        @dft_components[m][:components] = []
        @dft_components[m][:value] = {}
        @dft_components[m][:value][:complex] = 0
        @dft_components[m][:value][:abs] = 0
        (0...32).each do |n|
          component = (cos(3*n) + sin(3*n)) *
            Complex(cos(2*PI*n*m/32), dir*sin(2*PI*n*m/32))
          @dft_components[m][:components].push(component)
          @dft_components[m][:value][:complex] += component
        end
        @dft_components[m][:value][:complex] *= rate
        @dft_components[m][:value][:abs] = @dft_components[m][:value][:complex].abs
      end
      @dft_components
    end
  end
end
