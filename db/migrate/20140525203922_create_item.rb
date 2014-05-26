class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :item_id
      t.integer :build_plan_id
      t.integer :qty
      t.string :type
    end
  end
end
