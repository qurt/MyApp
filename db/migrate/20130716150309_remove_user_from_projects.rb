class RemoveUserFromProjects < ActiveRecord::Migration
  def up
    remove_column :projects, :users
  end

  def down
    add_column :projects, :users, :string
  end
end
