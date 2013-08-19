class Project < ActiveRecord::Base
  attr_accessible :name, :owner_id, :user_tokens
  has_many :tasks, dependent: :destroy
  has_many :stages, dependent: :destroy
  has_and_belongs_to_many :users
  attr_reader :user_tokens

  def user_tokens=(ids)
    users = ids.split(',')
    users.each do |user|
      self.users << User.find(user)
    end
  end
end
