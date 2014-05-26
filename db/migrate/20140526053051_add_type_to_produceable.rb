class AddTypeToProduceable < ActiveRecord::Migration
  def change
    add_column :produceables, :type, :string
  end
end
