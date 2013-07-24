class RenameColumnTasksUsersPerformerId < ActiveRecord::Migration
  def change
  	change_table :tasks_users do |t|
  	  t.rename :performer_id, :user_id
  	end
  end
end
