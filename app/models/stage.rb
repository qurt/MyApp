class Stage < ActiveRecord::Base
  attr_accessible :deadline, :project_id, :title

  has_many :tasks

  belongs_to :project
end
