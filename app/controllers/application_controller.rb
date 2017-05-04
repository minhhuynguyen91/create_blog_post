class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def signed_in?
    !current_user.nil?
  end

  def require_signin
    unless signed_in?
      flash[:error] = "You must sign in"
      redirect_to root_path
    end
  end

end
