module ApplicationHelper
  def current_user
    user = User.find_by_id(session[:user_id])
    user_name = user.name
    user_name
  end
  def if_superuser
    user = User.find(session[:user_id])
    if user.superuser
      return true
    else
      return false
    end
  end
  def check_task_count
    count = Task.where('owner_id = ? AND status = ?', session[:user_id], 1).size
    count
  end
end
