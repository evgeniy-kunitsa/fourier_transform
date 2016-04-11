module BinaryReverse
  def self.reverse(number, intervals)
    initial_bin = number.to_s(2)
    (Math.log(intervals, 2) - initial_bin.length).to_i.times do
      initial_bin.prepend("0")
    end
    initial_bin.reverse!.to_i(2)
  end
end
