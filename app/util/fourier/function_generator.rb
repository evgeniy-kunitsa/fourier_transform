module Fourier
  class FunctionGenerator
    include Math

    def self.create(params)
      sign = define_sign(params[:sign_literal])
      sin_multiplier = params[:sin_multiplier]
      cos_multiplier = params[:cos_multiplier]
      lambda do |x|
        Math.sin(sin_multiplier * x) + sign * Math.cos(cos_multiplier * x)
      end
    end

    def self.define_sign(sign_literal)
      sign_literal == "+" ? 1 : -1
    end
  end
end
