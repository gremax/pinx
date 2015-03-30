class SessionsController < ApplicationController
  before_action :signed_in?, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Welcome back, #{user.username}!"
      session[:user_id] = user.id
      redirect_to user
    else
      flash.now[:error] = "Invalid combination Email/Password"
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to signin_path
  end
end