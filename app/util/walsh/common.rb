module Walsh
  module Common
    include Math
    include Sign

    DIRECT = 1
    REVERSE = -1

    def self.included(base)
      base.class.send(:define_method, :direct) do |values|
        transform(1.0 / values.size, values)
      end

      base.class.send(:define_method, :reverse) do |values|
        transform(values.size, values)
      end

      base.class.send(:define_method, :complete) do |values|
        direct_result = transform(1.0 / values.size, values)
        reverse_result = transform(values.size, direct_result)

        {
          direct: direct_result,
          reverse: reverse_result
        }
      end

      base.class.send(:define_method, :complete_abs) do |values|
        direct_result = transform(1.0 / values.size, values)
        reverse_result = transform(values.size, direct_result)

        {
          direct: direct_result.map { |v| v.abs },
          reverse: reverse_result.map { |v| v.real }
        }
      end

      base.class.send(:define_method, :complete_arg) do |values|
        direct_result = transform(1.0 / values.size, values)
        reverse_result = transform(values.size, direct_result)

        {
          direct: direct_result.map { |v| v.arg },
          reverse: reverse_result.map { |v| v.real }
        }
      end
    end

    def self.rademacher(k, n)
      Sign::detect(Math.sin(2 ** k) * PI * n)
    end

    def self.power(k, n, r)
      n = ("0" + n.to_s(2))
      byebug
      n[r - k + 1].to_i ^ n[r - k].to_i
    end

    def self.walsh(n, t, r)
      (0...r).reduce(1) do |value, i|
        value * (rademacher(i, t) ** power(i, n, r))
      end
    end
  end
end
