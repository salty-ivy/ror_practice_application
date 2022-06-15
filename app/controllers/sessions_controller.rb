class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:session][:email.downcase])
    if @user && @user.authenticated(params[:session][:password])
      login @user
      redirect_back_or user_path(@user.id)
    else
      flash.now[:danger] = "Invalid email/password"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end
end
