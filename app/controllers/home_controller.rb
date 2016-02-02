class HomeController < ApplicationController
  def index
    manager = Fourier::DiscreteFourierTransformManager.new
    @direct_conversion = manager.direct_conversion
    @reverse_conversion = manager.reverse_conversion 
  end
end
