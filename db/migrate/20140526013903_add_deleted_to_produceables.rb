class AddDeletedToProduceables < ActiveRecord::Migration
  def change
    add_column :produceables, :deleted, :string
  end
end
