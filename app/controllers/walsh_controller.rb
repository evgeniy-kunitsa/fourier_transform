class WalshController < ApplicationController
  include Math

  def index
  end

  def show
    function = params[:function]
    @intervals = params[:intervals].to_i
    period = PeriodCalculator.calculate(function) / @intervals

    function_runner = FunctionRunner.new(function)
    original_args = (0...@intervals).map { |interval| period * interval}
    original_values = original_args.map do |arg|
      function_runner.run(arg).round(2)
    end

    @original_plot_points = {
        x: original_args,
        y: original_values
    }

    @conversion = {
        discrete: Walsh::Discrete.complete_abs(original_values),
        fast: Walsh::Fast.complete_arg(original_values)
    }

    respond_to do |format|
      format.js
    end
  end
end
