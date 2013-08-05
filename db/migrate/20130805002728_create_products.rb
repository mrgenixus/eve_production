class CreateProducts < ActiveRecord::Migration
  def up
  	create_table :products do | t |
  		t.string :name
  		t.string :source

  		t.timestamps
  	end
  end

  def down
  end
end
