class UsersController < ApplicationController
  before_filter :login_required
  
  def new
    @user = User.new
    @title = "Add User"
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "User Added"
    else
      @title = "Add User"
      render :action => 'new'
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      
    else
      @title = "Add User"
      render :action => 'new'
    end
  end

end
