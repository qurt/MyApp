class ChangePerformerIdTointegerInTasks < ActiveRecord::Migration
  def change
    change_column(:tasks, :performer_id, :integer)
  end
end
