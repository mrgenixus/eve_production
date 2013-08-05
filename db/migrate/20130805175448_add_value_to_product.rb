class AddValueToProduct < ActiveRecord::Migration
  def change
    add_column :products, :value, :float
  end
end
