class Task < ActiveRecord::Base
  attr_accessible :active, :content, :owner_id, :performer_id, :project_id, :publish, :title
  belongs_to :project
  has_and_belongs_to_many :tasks, :foreign_key => 'performer_id'
end
