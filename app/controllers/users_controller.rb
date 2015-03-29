class UsersController < ApplicationController
  before_action :signed_in?, only: [:new, :create]

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome aboard, #{@user.username}!"
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:error] = "Form contains some errors"
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password,
                                                    :password_confirmation)
  end
end