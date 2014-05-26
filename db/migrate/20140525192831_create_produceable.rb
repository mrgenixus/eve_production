class CreateProduceable < ActiveRecord::Migration
  def change
    create_table :produceables do |t|
      t.string :name
      t.float :value
    end
  end
end
