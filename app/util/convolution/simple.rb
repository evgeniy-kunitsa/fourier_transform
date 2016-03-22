module Convolution
  class Simple
    attr_reader :first_points, :second_points, :result

    def initialize(first_function_params, second_function_params, interval)
      @first_points = Fourier::TransformManager
        .new(first_function_params)
        .original_function_plot_points
      @second_points = Fourier::TransformManager
        .new(second_function_params)
        .original_function_plot_points
      @interval = interval
      initialize_result
      calculate
    end

    private

    def initialize_result
      @result = {}
      @result[:x] = @first_points[:x]
      @result[:y] = []
    end

    def calculate
      (0...@interval).each do |m|
        temp = 0
        (0...@interval).each do |h|
          temp += @first_points[:y][h]*@second_points[:y][index(m-h)]
        end
        @result[:y].push(temp / @interval)
      end
    end

    def index(number)
      return number if number >= 0
      @interval + number
    end
  end
end
