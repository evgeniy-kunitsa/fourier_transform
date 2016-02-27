class FourierController < ApplicationController
  include Math

  def index
    manager = Fourier::FourierTransformManager.new(Fourier::Params.new)
    @original_plot_points = manager.original_function_plot_points
    @mode = params[:mode]
    set_transform_mode(manager)
    @conversion = manager.perform_transformation
  end

  private

  def set_transform_mode(manager)
    case @mode
    when 'discrete'
      manager.transformation = Fourier::Discrete::Transformation.new
    when 'fast'
      manager.transformation = Fourier::Fast::Transformation.new
    else
      redirect_to root_path
    end
  end
end
