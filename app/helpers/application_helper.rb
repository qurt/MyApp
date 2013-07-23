module ApplicationHelper
  def current_user
    user = User.find_by_id(session[:user_id])
    user_name = user.login
    user_name
  end
end
