class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  protect_from_forgery

  def current_user
  	session[:user]    
  end

  def logged_in?
  	!!current_user
  end

  def require_user
  	if !logged_in?
  		flash[:alert] = "You must log in to do this "
      redirect_to login_path
    end
  end

end
