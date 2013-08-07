class AddStageIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :stage_id, :integer, default: nil
  end
end
