module SessionsHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  private

  def signed_in?
    redirect_to root_path if logged_in?
  end

  def not_signed_in?
    redirect_to signin_path unless logged_in?
  end
end