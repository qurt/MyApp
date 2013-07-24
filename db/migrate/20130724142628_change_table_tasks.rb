class ChangeTableTasks < ActiveRecord::Migration
  def change
  	change_column(:tasks, :active, :boolean, {:default => true})
  	remove_column(:tasks, :publish)
  end
end
