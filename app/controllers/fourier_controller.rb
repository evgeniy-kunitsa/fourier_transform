class FourierController < ApplicationController
  include Math

  def index
    @fourier_function = FourierFunction.new
  end

  def show
    @fourier_function = FourierFunction.new(function_property_params)
    fourier_params = Fourier::Params.new(
      {
        sin_multiplier: @fourier_function.sin_multiplier,
        cos_multiplier: @fourier_function.cos_multiplier,
        sign: @fourier_function.sign
      },
      @fourier_function.intervals
    )

    manager = Fourier::TransformManager.new(fourier_params)
    @original_plot_points = manager.original_function_plot_points
    @conversion = manager.full_transformation

    respond_to do |format|
      format.js
    end
  end

  private

  def function_property_params
    params
      .require(:fourier_function)
        .permit(:sin_multiplier,
                :cos_multiplier,
                :sign,
                :intervals,
                :period)
  end
end
