module Fourier
  class FourierTransformManager
    include Math

    attr_writer :params, :transformation

    DIRECT = -1
    REVERSE = 1

    def initialize(fourier_params)
      @fourier_params = fourier_params
      @transformation = nil
    end

    def perform_transformation
      direct_components = @transformation.transform(
          1.0 / @fourier_params.intervals,
          DIRECT,
          initialize_direct_variables,
          initialize_components,
          @fourier_params.intervals
      )
      reverse_components = @transformation.transform(
          1,
          REVERSE,
          initialize_reverse_variables(direct_components),
          initialize_components,
          @fourier_params.intervals
      )
      parsed_result = @transformation.parse_result(direct_components, reverse_components)
      {
        :direct => direct_components,
        :reverse => reverse_components,
        :result => parsed_result
      }
    end

    def original_function_plot_points
      plot_points = { x: [], y: [] }
      (0...@fourier_params.intervals).each do |i|
        argument = (@fourier_params.function_period / @fourier_params.intervals) * i
        plot_points[:x].push argument.round(2)
        plot_points[:y].push @fourier_params.run_function(argument)
      end
      plot_points
    end

    private

    def initialize_components
      components = {}
      (0...@fourier_params.intervals).each do |i|
        components[i] = {}
        components[i][:components] = []
        components[i][:value] = {}
        components[i][:value][:complex] = 0
        components[i][:value][:abs] = 0
      end
      components
    end

    def initialize_direct_variables
      direct_variables = []
      (0...@fourier_params.intervals).each do |i|
        argument = (@fourier_params.function_period / @fourier_params.intervals) * i
        direct_variables.push Complex(@fourier_params.run_function(argument), 0)
      end
      direct_variables
    end

    def initialize_reverse_variables(direct_components)
      reverse_variables = []
      (0...@fourier_params.intervals).each do |i|
        reverse_variables.push direct_components[i][:value][:complex]
      end
      reverse_variables
    end
  end
end
