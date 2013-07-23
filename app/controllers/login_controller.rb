class LoginController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    error = ''

    if params[:login] == ''
      error = 'Empty login!'
    end
    if params[:pass] == ''
      error = 'Empty password!'
    end
    if error == ''
      user = User.find_by_login(params[:login])
      if user and user.authenticate(params[:pass])
        session[:user_id] = user.id
      else
        error = 'Wrong username or password'
      end
    end
    flash[:error] = error
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
