class ConvolutionCorrelationController < ApplicationController
  def index
  end

  def show
    function_first = params[:function_first]
    function_second = params[:function_second]
    @intervals = params[:intervals].to_i

    period = PeriodCalculator.calculate(function_first) / (@intervals - 1)

    original_args = (0...@intervals).map { |interval| period * interval}

    function_runner = FunctionRunner.new(function_first)
    original_values_first = original_args.map do |arg|
      function_runner.run(arg).round(2)
    end

    function_runner = FunctionRunner.new(function_second)
    original_values_second = original_args.map do |arg|
      function_runner.run(arg).round(2)
    end

    @convolution = {
        x: (0...@intervals).to_a,
        y: Convolution::Fourier.new(original_values_first, original_values_second, @intervals).calculate
    }

    @correlation = {
        x: (0...@intervals).to_a,
        y: Correlation::Fourier.new(original_values_first, original_values_second, @intervals).calculate
    }

    respond_to do |format|
      format.js
    end
  end
end
