class FourierController < ApplicationController
  include Math

  def index
    fourier_params = Fourier::Params.new(2 * PI / 3, 32.0) { |x| sin(3 * x) + cos(3 * x) }
    manager = Fourier::FourierTransformManager.new(fourier_params)
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
