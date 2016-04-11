class FunctionRunner
  def initialize(function_string)
    @function_string = function_string
    @calculator = Dentaku::Calculator.new
  end

  def run(data)
    data.is_a?(Array) ? evaluate_array(data) : evaluate(data)
  end

  private

  def evaluate_array(arguments)
    arguments.map do |argument|
      evaluate(argument)
    end
  end

  def evaluate(argument)
    @calculator.evaluate(@function_string, x: argument).to_f
  end
end
