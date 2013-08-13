class Task < ActiveRecord::Base
  attr_accessible :active, :content, :owner_id, :performer_id, :project_id, :title, :deadline, :status
  belongs_to :project
  belongs_to :stage
  belongs_to :user, foreign_key: "performer_id"
  has_many :subtasks, dependent: :destroy, autosave: true
  has_many :discussions, dependent: :destroy 
end
