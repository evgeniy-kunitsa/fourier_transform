# == Schema Information
#
# Table name: function_properties
#
#  id             :integer          not null, primary key
#  sin_multiplier :integer
#  cos_multiplier :integer
#  sign           :integer
#  intervals      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class FunctionProperty < ActiveRecord::Base
end
