module Fourier
  class FastFourierTransformManager
    include Math

    FUNCTION_PERIOD = 2*PI/3
    N = 32.0

    def initialize
      @direct_components = initialize_components
      initialize_direct_variables
      @direct_variables = transform(
        N, -1, @direct_variables
      )
      @direct_components = hash_initialize(
        1.0 / N, @direct_variables, @direct_components
      )

      @reverse_components = initialize_components
      initialize_reverse_variables
      @reverse_variables = transform(
        N, 1, @reverse_variables
      )
      @reverse_components = hash_initialize(
        1, @reverse_variables, @reverse_components
      )
    end

    def hash_initialize(rate, variables, components)
      variables.each_with_index do |v, i|
        index = binary_reverse(i)
        components[index][:value][:complex] = rate * v
        components[index][:value][:abs] = (rate * v).abs
      end
      return components
    end

    def binary_reverse (number)
      initial_bin = number.to_s(2)
      (5-initial_bin.length).times { initial_bin.prepend('0') }
      initial_bin.reverse!.to_i(2)
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
        @direct_variables.push Complex(original_function(argument), 0)
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

    def transform(rate, dir, variables)
      if(variables.size == 1)
        return variables
      end
      wn = Complex(Math.cos(2*PI/rate), dir*Math.sin(2*PI/rate))
      w = Complex(1.0, 0.0)
      b = []
      c = []
      (0...rate/2).each do |j|
        b.push (variables[j] + variables[j + rate / 2])
        c.push (variables[j] - variables[j + rate / 2]) * w
        w = w * wn
      end
      b = transform(rate/2, dir, b)
      c = transform(rate/2, dir, c)
      result = b + c
      return result
    end
  end
end
