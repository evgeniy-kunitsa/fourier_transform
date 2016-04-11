module FourierTransform
  module Common
    include Math

    DIRECT = 1
    REVERSE = -1

    def self.included(base)
      base.class.send(:define_method, :direct) do |values|
        transform(DIRECT, 1.0 / values.size, values)
      end
      base.class.send(:define_method, :reverse) do |values|
        transform(REVERSE, values.size, values)
      end

      base.class.send(:define_method, :complete) do |values|
        direct_result = transform(DIRECT, 1.0 / values.size, values)
        reverse_result = transform(REVERSE, direct_result.size, direct_result)

        {
          direct: direct_result,
          reverse: reverse_result
        }
      end

      base.class.send(:define_method, :complete_abs) do |values|
        direct_result = transform(DIRECT, 1.0 / values.size, values)
        reverse_result = transform(REVERSE, direct_result.size, direct_result)

        p reverse_result

        {
          direct: direct_result.map { |v| v.abs },
          reverse: reverse_result.map { |v| v.real }
        }
      end

      base.class.send(:define_method, :complete_arg) do |values|
        direct_result = transform(DIRECT, 1.0 / values.size, values)
        reverse_result = transform(REVERSE, direct_result.size, direct_result)

        p reverse_result

        {
            direct: direct_result.map { |v| v.arg },
            reverse: reverse_result.map { |v| v.real }
        }
      end
    end
  end
end
