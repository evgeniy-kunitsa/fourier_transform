module Fourier
  class Params
    include Math

    attr_accessor :function_period, :intervals, :function

    def initialize(function_period, intervals, &function)
      @function_period = function_period
      @intervals = intervals
      @function = function
    end

    def run_function(argument)
      function.call(argument)
    end
  end
end
