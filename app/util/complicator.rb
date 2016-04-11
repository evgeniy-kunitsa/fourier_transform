module Complicator
  def self.run(data)
    data.is_a?(Array) ? complicate_values(data) : complicate(data)
  end

  def self.complicate_values(args)
    args.map { |arg| complicate(arg)}
  end

  def self.complicate(arg)
    arg.is_a?(Complex) ? arg : Complex(arg, 0)
  end
end
