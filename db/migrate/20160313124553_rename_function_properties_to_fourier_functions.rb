class RenameFunctionPropertiesToFourierFunctions < ActiveRecord::Migration
  def change
    rename_table :function_properties, :fourier_functions
  end
end
