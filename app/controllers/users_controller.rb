class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You were successful in creating a new user."
      redirect_to questions_path
    else
      flash[:alert] = "There was a problem creating your account."
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
