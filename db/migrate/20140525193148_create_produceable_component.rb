class CreateProduceableComponent < ActiveRecord::Migration
  def change
    create_table :produceable_components do |t|
      t.integer :product_id
      t.integer :component_id
      t.integer :qty
    end
  end
end
