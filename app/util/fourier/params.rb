module Fourier
  class Params
    include Math

    attr_accessor :function_period, :intervals, :function_interval, :function

    def initialize(function_period = Defaults.period,
                   intervals = Defaults.intervals,
                   function = Defaults.function)
      @function_period = function_period
      @intervals = intervals
      @function_interval = function_period / intervals
      @function = function
    end

    def run_function(argument)
      function.call(argument)
    end
  end
end
