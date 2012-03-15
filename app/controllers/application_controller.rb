class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def login_required
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_url
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    current_user != nil
  end
  
  helper_method :current_user, :logged_in?

end
