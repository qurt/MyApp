class Task < ActiveRecord::Base
  attr_accessible :active, :content, :owner_id, :performer_id, :project_id, :publish, :title
  belongs_to :project
end
