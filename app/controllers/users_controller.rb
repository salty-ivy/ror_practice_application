class UsersController < ApplicationController
  before_action :require_login, only: [:edit,:update,:show]
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "@#{@user.username} successfully created"
      login(@user)
      redirect_to users_path(@user.id)
    else
      flash[:alert] = "Something went wrong please try again"
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password_digest, :confirm_password)
  end
end
