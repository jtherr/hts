class UsersController < ApplicationController
  before_filter :login_required
  
  def encrypt_password
    render BCrypt::Password.create(params[:password])
  end
  
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
    @user = User.new(user_params)
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
    if @user.update_attributes(user_params)
      
    else
      @title = "Add User"
      render :action => 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
