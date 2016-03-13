class RemovePeriodFromFunctionProperties < ActiveRecord::Migration
  def change
    remove_column :function_properties, :period, :float
  end
end
