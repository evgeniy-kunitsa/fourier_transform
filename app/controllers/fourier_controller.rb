class FourierController < ApplicationController
  include Math

  def index
    @function_property = FunctionProperty.new
  end

  def show
    @function_property = FunctionProperty.new(function_property_params)
    fourier_params = Fourier::Params.new(
      {
          sin_multiplier: @function_property.sin_multiplier,
          cos_multiplier: @function_property.cos_multiplier,
          sign: @function_property.sign
      },
      @function_property.intervals
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
      .require(:function_property)
        .permit(:sin_multiplier,
                :cos_multiplier,
                :sign,
                :intervals,
                :period)
  end
end
