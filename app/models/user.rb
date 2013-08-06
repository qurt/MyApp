class User < ActiveRecord::Base
  attr_accessible :login, :name, :password, :password_confirmation, :superuser
  validates :login, presence: true, uniqueness: true
  has_secure_password
  has_and_belongs_to_many :projects
  has_many :discussions, dependent: :destroy
end
