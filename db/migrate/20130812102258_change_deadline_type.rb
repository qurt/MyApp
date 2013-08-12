class ChangeDeadlineType < ActiveRecord::Migration
  def change
    change_column(:tasks, :deadline, :date)
  end
end
