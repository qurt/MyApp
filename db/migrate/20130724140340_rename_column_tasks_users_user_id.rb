class RenameColumnTasksUsersUserId < ActiveRecord::Migration
  def change
  	change_table :tasks_users do |t|
  	  t.rename :user_id, :performer_id
  	end
  end
end
