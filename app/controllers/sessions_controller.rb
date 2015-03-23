class SessionsController < ApplicationController
  def new

  end

  def create
    @user = User.authenticate(params[:name], params[:password])
    if @user
      flash[:notice] = "You have successfully logged in."
      session[:user_id] = @user.id
      redirect_to users_path
    else
      flash[:alert] = "There was a problem logging you in."
      redirect_to log_in_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to users_path
  end
end
