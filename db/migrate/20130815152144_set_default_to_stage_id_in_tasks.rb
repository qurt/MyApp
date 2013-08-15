class SetDefaultToStageIdInTasks < ActiveRecord::Migration
  def change
    change_column(:tasks, :stage_id, :integer, :default => 0)
  end
end
