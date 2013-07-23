class Project < ActiveRecord::Base
  attr_accessible :name, :owner_id
  has_many :tasks, dependent: :destroy
  has_and_belongs_to_many :users
end
