class FourierController < ApplicationController
  include Math

  def index

  end

  def show
    manager = Fourier::TransformManager.new(Fourier::Params.new, params[:mode])
    @original_plot_points = manager.original_function_plot_points
    @mode = params[:mode]
    @conversion = manager.perform_transformation
  end
end
