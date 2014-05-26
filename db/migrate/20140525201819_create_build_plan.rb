class CreateBuildPlan < ActiveRecord::Migration
  def change
    create_table :build_plans do |t|
      t.timestamps
    end
  end
end
