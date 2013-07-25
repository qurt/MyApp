class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :title
      t.integer :user_id
      t.boolean :active, default: true
      t.integer :task_id

      t.timestamps
    end
  end
end
