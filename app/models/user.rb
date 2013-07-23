class User < ActiveRecord::Base
  attr_accessible :login, :password, :password_confirmation
  validates :login, presence: true, uniqueness: true
  has_secure_password
  has_and_belongs_to_many :projects
end
