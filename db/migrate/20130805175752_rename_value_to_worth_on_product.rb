class RenameValueToWorthOnProduct < ActiveRecord::Migration
  def up
  	rename_column :products, :value, :worth
  end

  def down
  	rename_column :products, :worth, :value
  end
end
