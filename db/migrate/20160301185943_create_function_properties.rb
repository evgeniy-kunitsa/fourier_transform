class CreateFunctionProperties < ActiveRecord::Migration
  def change
    create_table :function_properties do |t|
      t.integer :sin_multiplier
      t.integer :cos_multiplier
      t.integer :sign
      t.integer :intervals
      t.float :period

      t.timestamps null: false
    end
  end
end
