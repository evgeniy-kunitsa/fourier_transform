class HomeController < ApplicationController
  include Math

  before_action :initialize_manager, only: [:fast_fourier_transform, :discrete_fourier_transform]

  def index
  end

  def discrete_fourier_transform
    @manager.transformation = Fourier::Discrete::Transformation.new
    transform_and_get_result
    @direct_conversion_result = {
        :indexes => (0..@direct_conversion.size - 1).collect {|i| i},
        :values => @direct_conversion.collect { |unit| unit[1][:value][:abs] }
    }
    @reverse_conversion_result = {
        :indexes => (0..@reverse_conversion.size - 1).collect {|i| i},
        :values => @reverse_conversion.collect { |unit| unit[1][:value][:complex].real }
    }
    @original_plot_points = @manager.original_function_plot_points
  end

  def fast_fourier_transform
    @manager.transformation = Fourier::Fast::Transformation.new
    transform_and_get_result
    @direct_conversion_result = {
        :indexes => (0..@direct_conversion.size - 1).collect {|i| i},
        :values => @direct_conversion.collect { |unit| unit[1][:value][:complex].arg }
    }

    @reverse_conversion_result = {
        :indexes => (0..@reverse_conversion.size - 1).collect {|i| i},
        :values => @reverse_conversion.collect { |unit| unit[1][:value][:complex].real }
    }
    @original_plot_points = @manager.original_function_plot_points
  end

  private

  def initialize_manager
    @fourier_params = Fourier::Params.new(2 * PI / 3, 32.0) { |x| sin(3 * x) + cos(3 * x) }
    @manager = Fourier::FourierTransformManager.new(@fourier_params)
  end

  def transform_and_get_result
    @conversion_result = @manager.perform_transformation
    @direct_conversion = @conversion_result[:direct]
    @reverse_conversion = @conversion_result[:reverse]
  end
end
