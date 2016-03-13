module Fourier
  class Params
    include Math

    attr_accessor :function_period, :intervals, :function_interval, :function

    def initialize(function_params = Defaults.params,
                   intervals = Defaults.intervals)
      @function_period = calculate_period(function_params)
      @intervals = intervals
      @function_interval = function_period / intervals
      @function = FunctionGenerator.create(function_params)
    end

    def calculate_period(function_params)
      sin_multiplier = function_params[:sin_multiplier]
      cos_multiplier = function_params[:cos_multiplier]
      if sin_multiplier == cos_multiplier
        2 * PI / sin_multiplier
      elsif sin_multiplier.odd? || cos_multiplier.odd?
        2 * PI
      else
        PI
      end
    end

    def run_function(argument)
      function.call(argument)
    end
  end
end
