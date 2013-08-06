class CreateStages < ActiveRecord::Migration
  def change
    create_table :stages do |t|
      t.integer :project_id
      t.datetime :deadline
      t.string :title

      t.timestamps
    end
  end
end
