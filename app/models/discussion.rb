class Discussion < ActiveRecord::Base
  attr_accessible :message, :task_id, :user_id
  
  belongs_to :users
  belongs_to :tasks 
end
