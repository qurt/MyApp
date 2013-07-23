class FeedController < ApplicationController
  def index
    @projects = Array.new
    user_id = session[:user_id]
    projects_list = Project.all
    projects_list.each do |item|
      if item.users.find_by_id(user_id)
        @projects << item
      end
    end
  end
end
