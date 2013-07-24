class ChangeTypeColumnTask < ActiveRecord::Migration
  def change
  	change_column(:tasks, :performer_id, :string)
  end
end
