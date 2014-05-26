class AddBlueprintCostToProduceable < ActiveRecord::Migration
  def change
    add_column :produceables, :blueprint_cost, :float
  end
end
