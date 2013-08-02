class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.integer :user_id
      t.integer :task_id
      t.string :message

      t.timestamps
    end
  end
end
