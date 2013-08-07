class AddDeadlineToStages < ActiveRecord::Migration
  def change
    add_column :stages, :deadline, :datetime
  end
end
