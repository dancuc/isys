class SessionsController < ApplicationController
  def new
    render :layout => 'login'
  end
  
  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in successfully!"
    else
      flash.now.alert = "Invalid login data!"
      render "new", :layout => 'login'
    end
  end
  
  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_url, :layout => login, notice: "Logget out!"
  end
end
