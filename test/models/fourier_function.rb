# == Schema Information
#
# Table name: fourier_functions
#
#  id             :integer          not null, primary key
#  sin_multiplier :integer
#  cos_multiplier :integer
#  sign           :integer
#  intervals      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class FourierFunction < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
