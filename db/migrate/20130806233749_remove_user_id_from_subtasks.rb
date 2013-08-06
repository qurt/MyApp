class RemoveUserIdFromSubtasks < ActiveRecord::Migration
  def up
    remove_column :subtasks, :user_id
  end

  def down
    add_column :subtasks, :user_id, :integer
  end
end
