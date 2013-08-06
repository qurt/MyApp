class DropTableTasksUsers < ActiveRecord::Migration
  def change
    drop_table :tasks_users
  end
end
