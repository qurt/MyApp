class Group < ActiveRecord::Base
  attr_accessible :title

  has_many :task
  belongs_to :project
end
