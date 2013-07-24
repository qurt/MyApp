class CreateProjectsTasksJoinTable < ActiveRecord::Migration
  def change
    create_table :projects_tasks, id: false do |t|
      t.integer :project_id
      t.integer :user_id
    end
  end
end
