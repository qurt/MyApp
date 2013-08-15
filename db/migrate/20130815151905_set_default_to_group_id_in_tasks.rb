class SetDefaultToGroupIdInTasks < ActiveRecord::Migration
  def change
    change_column(:tasks, :group_id, :integer, :default => 0)
  end
end
