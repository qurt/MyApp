class Stage < ActiveRecord::Base
  attr_accessible :deadline, :project_id, :title

  has_many :tasks, dependent: :destroy
  has_many :group, dependent: :destroy
  belongs_to :project
end
