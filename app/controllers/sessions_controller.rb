class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: params[:email]) and @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = "Sign in successfully"
      redirect_to blogs_path
    else
      flash.now[:error] = "Invalid username or password"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Singout successfully"
    redirect_to root_path
  end
end
