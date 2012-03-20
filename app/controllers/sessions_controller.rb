# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    
    if (user && user.try(:authenticate, params[:password]))
      logger.debug "User authenticated"
      session[:user_id] = user.id
    else
      logger.debug "Login failed"
      @message = "Login Failed"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => "Logged out!"
  end
end
