module Fourier
  class DiscreteFourierTransformManager
    include Math

    FUNCTION_PERIOD = 2*PI/3
    N = 32

    def initialize
      @direct_components = initialize_components
      initialize_direct_variables
      @direct_components = transform(
        1.0/32.0,
        -1,
        @direct_variables,
        @direct_components
      )

      @reverse_components = initialize_components
      initialize_reverse_variables
      @reverse_components = transform(
        1,
        1,
        @reverse_variables,
        @reverse_components
      )
    end

    def original_function_plot_points
      plot_points = { x: [], y: [] }
      (0...N).each do |i|
        argument = (FUNCTION_PERIOD / N) * i
        plot_points[:x].push argument.round(2)
        plot_points[:y].push original_function(argument)
      end
      plot_points
    end

    def direct
      @direct_components
    end

    def reverse
      @reverse_components
    end

    private

    def initialize_components
      components = {}
      (0...N).each do |i|
        components[i] = {}
        components[i][:components] = []
        components[i][:value] = {}
        components[i][:value][:complex] = 0
        components[i][:value][:abs] = 0
      end
      components
    end

    def initialize_direct_variables
      @direct_variables = []
      (0...N).each do |i|
        argument = (FUNCTION_PERIOD / N) * i
        @direct_variables.push original_function(argument)
      end
    end

    def initialize_reverse_variables
      @reverse_variables = []
      (0...N).each do |i|
        @reverse_variables.push @direct_components[i][:value][:complex]
      end
    end

    def original_function(argument)
      cos(3 * argument) + sin(3 * argument)
    end

    def transform(rate, dir, variables, components)
      (0...N).each do |m|
        (0...N).each do |n|
          component = variables[n] *
            Complex(cos(2*PI*n*m/N), dir*sin(2*PI*n*m/N))
          components[m][:components].push(component)
          components[m][:value][:complex] += component
        end
        components[m][:value][:complex] *= rate
        components[m][:value][:abs] = components[m][:value][:complex].abs
      end
      components
    end
  end
end
