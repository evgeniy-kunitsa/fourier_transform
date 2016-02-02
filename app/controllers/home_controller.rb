class HomeController < ApplicationController
  def index
    manager = Fourier::DiscreteFourierTransformManager.new
    @direct_conversion = manager.direct_conversion
    @reverse_conversion = manager.reverse_conversion

    @direct_conversion_result = {}
    @direct_conversion_result[:indexes] = (0..@direct_conversion.size - 1).collect {|i| i}
    @direct_conversion_result[:values] = @direct_conversion.collect do |conversion_unit|
      conversion_unit[1][:value][:abs]
    end

    @reverse_conversion_result = {}
    @reverse_conversion_result[:indexes] = (0..@reverse_conversion.size - 1).collect {|i| i}
    @reverse_conversion_result[:values] = @reverse_conversion.collect do |conversion_unit|
      conversion_unit[1][:value][:abs]
    end

    @original_plot_points = manager.original_function_plot_points
  end
end
