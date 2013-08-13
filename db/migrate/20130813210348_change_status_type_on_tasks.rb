class ChangeStatusTypeOnTasks < ActiveRecord::Migration
  def change
    change_column(:tasks, :status, :integer, :default => 0)
  end
end
