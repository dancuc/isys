class SessionsController < ApplicationController
  def new
    render :layout => 'login'
  end
  
  def create
    user = User.find.by.username(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in successfully!"
    else
      flash.now.alert = "Username or password is invalid"
      render "new"
    end
  end
end
