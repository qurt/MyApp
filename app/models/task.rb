class Task < ActiveRecord::Base
  attr_accessible :active, :content, :owner_id, :performer_id, :project_id, :title
  belongs_to :project
  has_many :subtasks, dependent: :destroy, autosave: true
  has_many :discussions, dependent: :destroy 
end
