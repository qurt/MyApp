class Subtask < ActiveRecord::Base
  attr_accessible :active, :task_id, :title
  belongs_to :task
end
