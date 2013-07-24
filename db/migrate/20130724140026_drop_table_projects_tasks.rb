class DropTableProjectsTasks < ActiveRecord::Migration
  def change
  	drop_table :projects_tasks
  end
end
