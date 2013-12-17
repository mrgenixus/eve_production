class AddQuantityToBlueprintsComponents < ActiveRecord::Migration
  def change
    add_column :blueprints_components, :quantity, :integer
  end
end
