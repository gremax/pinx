module SessionsHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  private

  def signed_in?
    redirect_to user_path(session[:user_id]) if logged_in?
  end
end