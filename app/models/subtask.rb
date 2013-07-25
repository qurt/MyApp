class Subtask < ActiveRecord::Base
  attr_accessible :active, :task_id, :title, :user_id
  belongs_to :task
end
