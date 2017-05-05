class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :check_user_permission
  
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
  
  def check_user_permission(id)
    blog = Blog.find(id)
    if current_user
      if current_user.id == blog.user_id
        true
      else
        false
      end
    end
  end
end
