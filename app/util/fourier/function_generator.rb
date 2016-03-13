module Fourier
  class FunctionGenerator
    include Math

    def self.create(params)
      sin_multiplier = params[:sin_multiplier]
      cos_multiplier = params[:cos_multiplier]
      sign = params[:sign]
      lambda do |x|
        Math.sin(sin_multiplier * x) + sign * Math.cos(cos_multiplier * x)
      end
    end
  end
end
