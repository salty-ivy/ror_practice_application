class HomeController < ApplicationController
  def home
    @user = User.first
    # puts @user
    session[:user_id] = @user.id
    puts session[:user_id]
    puts "test"
  end

  def timeline
  end
end
