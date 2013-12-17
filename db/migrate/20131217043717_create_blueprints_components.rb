class CreateBlueprintsComponents < ActiveRecord::Migration
  def change
    create_table :blueprints_components, id: false do |t|
      t.integer :blueprint_id
      t.integer :component_id
    end
  end
end
